# Cuentas de Moto

Aplicación web progresiva (PWA) para registrar ingresos, gastos, finanzas personales y mantenimiento de motocicletas. La ficha admite cualquier marca, línea, cilindraje, año de modelo y fecha de matrícula.

## Instalar en iPhone

1. Abre la URL publicada en Safari.
2. Toca **Compartir → Añadir a pantalla de inicio**.
3. Abre la app desde el icono. Después de la primera carga, sus archivos principales quedan disponibles sin conexión.

## Datos y privacidad

Los registros se guardan primero en el almacenamiento local del navegador. Para sincronizarlos entre dispositivos, configura Supabase siguiendo [SUPABASE.md](SUPABASE.md) y entra con la misma cuenta en cada dispositivo. La clave `publishable` es apta para la app web; las políticas RLS protegen los datos de cada cuenta. Nunca incluyas una clave `secret` o `service_role`. Haz copias desde **Más → Ajustes y copias de seguridad**. El código es público; los registros personales no se guardan en GitHub.

## Obligaciones vehiculares

La tarifa SOAT de 2026 se estima por cilindraje. La fecha inicial de tecnomecánica se calcula a partir de la matrícula y el usuario puede registrar el vencimiento exacto consultado en RUNT. El impuesto se estima con el avalúo oficial y la tarifa que indique Hacienda. Precios de CDA y seguros voluntarios se ingresan manualmente.

## Publicar con GitHub Pages

En el repositorio, abre **Settings → Pages**, selecciona **Deploy from a branch**, elige `main` y la carpeta `/ (root)`, y guarda. Espera a que GitHub muestre la URL publicada; luego ábrela en Safari.

## Sincronización entre dispositivos

La pantalla **Más → Ajustes y copias de seguridad → Sincronizar mis datos** permite crear una cuenta y sincronizar registros. Antes de usarla, crea un proyecto de Supabase, ejecuta `supabase-schema.sql`, y coloca el Project URL y la clave pública `anon` en `supabase-config.js`. La app conserva los datos locales y pide resolver cualquier diferencia entre copias.

