# Activar sincronización en la nube

La app conserva una copia local y puede sincronizar los mismos datos entre dispositivos mediante Supabase Auth y PostgreSQL con RLS. La clave pública de Supabase no reemplaza las políticas RLS; no compartas nunca una clave `service_role`.

## 1. Crear el proyecto

1. Crea un proyecto en [Supabase](https://supabase.com/dashboard).
2. En el panel abre **SQL Editor** y ejecuta el contenido de `supabase-schema.sql`.
3. En el panel del proyecto, abre **Connect** y copia el **Project URL** y la **Publishable key**. También los encuentras en **Project Settings → API Keys**. En proyectos con la interfaz anterior, la clave equivalente puede aparecer como `anon` o `anon public`.
4. Completa `supabase-config.js` con esos dos valores y publica los cambios del repositorio.
5. En **Authentication → URL Configuration**, agrega como URL del sitio y redirección: `https://jzaratepinz.github.io/cuentas-de-moto/`.
6. En **Authentication → Providers → Email**, decide si quieres que Supabase pida confirmar el correo al crear una cuenta.

Ejemplo de configuración:

```js
window.CUENTASMOTO_CLOUD = {
  url: "https://TU-PROJECT-REF.supabase.co",
  anonKey: "TU-PUBLISHABLE-KEY"
};
```

La clave publishable es apta para el navegador; las políticas RLS siguen protegiendo las filas de cada usuario. No uses una contraseña de base de datos, `secret key` ni `service_role` en el navegador o en GitHub.

## 2. Iniciar sesión en la app

Abre la app, ve a **Más → Ajustes y copias de seguridad → Sincronizar mis datos**, crea tu cuenta e inicia sesión. Si este dispositivo ya tiene registros, la app los conserva y los sube al conectarse por primera vez. Cuando una cuenta ya tiene datos, la app permite elegir cuál copia conservar.

En otros dispositivos, abre la misma URL e inicia sesión con la misma cuenta. Los cambios se guardan localmente primero y se sincronizan al conectarse.

## Privacidad

La base guarda una fila por cuenta. Las políticas RLS y la función de sincronización comprueban la identidad autenticada; la clave pública sola no permite leer los registros de otra cuenta. La app nunca necesita la clave `service_role`.


