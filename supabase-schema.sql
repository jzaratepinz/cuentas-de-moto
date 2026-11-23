-- Cuentas de Moto: una fila de datos por usuario autenticado.
create table if not exists public.cuentas (
  id uuid primary key references auth.users(id) on delete cascade,
  version bigint not null default 0,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.cuentas enable row level security;

drop policy if exists "cada usuario lee su propia cuenta" on public.cuentas;
create policy "cada usuario lee su propia cuenta"
  on public.cuentas for select to authenticated
  using ((select auth.uid()) = id);

drop policy if exists "cada usuario crea su propia cuenta" on public.cuentas;
create policy "cada usuario crea su propia cuenta"
  on public.cuentas for insert to authenticated
  with check ((select auth.uid()) = id);

drop policy if exists "cada usuario actualiza su propia cuenta" on public.cuentas;
create policy "cada usuario actualiza su propia cuenta"
  on public.cuentas for update to authenticated
  using ((select auth.uid()) = id)
  with check ((select auth.uid()) = id);

grant select, insert, update on public.cuentas to authenticated;
revoke all on public.cuentas from anon, public;

create or replace function public.sync_cuenta(p_version bigint, p_data jsonb)
returns jsonb
language plpgsql
security invoker
set search_path = public
as $$
declare
  current_version bigint;
  next_version bigint;
begin
  if auth.uid() is null then
    raise exception using errcode = '42501', message = 'Se requiere iniciar sesión';
  end if;

  -- Serializa la primera escritura y evita que dos dispositivos creen filas duplicadas.
  perform pg_advisory_xact_lock(hashtext(auth.uid()::text));
  select version into current_version
    from public.cuentas
    where id = auth.uid()
    for update;

  if not found then
    if p_version <> 0 then
      raise exception using errcode = '40001', message = 'La copia remota cambió';
    end if;
    insert into public.cuentas(id, version, data)
      values (auth.uid(), 1, p_data)
      returning version into next_version;
    return jsonb_build_object('version', next_version);
  end if;

  if current_version <> p_version then
    raise exception using errcode = '40001', message = 'La copia remota cambió';
  end if;

  update public.cuentas
    set version = current_version + 1,
        data = p_data,
        updated_at = now()
    where id = auth.uid()
    returning version into next_version;

  return jsonb_build_object('version', next_version);
end;
$$;

revoke all on function public.sync_cuenta(bigint, jsonb) from anon, public;
grant execute on function public.sync_cuenta(bigint, jsonb) to authenticated;


