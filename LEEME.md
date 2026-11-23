# Cuentas de Moto para iPhone

Paquete de aplicación web progresiva (PWA), en español. Guarda una copia local y puede sincronizarla entre dispositivos con Supabase cuando se configura la nube. Incluye registro de ingresos y gastos, finanzas, presupuestos, mantenimiento, saldos y exportación de copias.

## Instalar en iPhone

1. Publica **todo el contenido de esta carpeta** en un sitio web con HTTPS. Safari no instala una app desde un archivo HTML local; iPhone exige una dirección web segura para “Añadir a pantalla de inicio”.
2. Abre esa dirección en Safari y espera a que la app termine de cargar una vez con internet.
3. Toca **Compartir → Añadir a pantalla de inicio → Añadir**.
4. Abre “Cuentas Moto” desde el nuevo icono. Tras la primera carga, las pantallas principales funcionan sin conexión.

La app guarda primero los datos en el almacenamiento del navegador del iPhone. Para acceder desde otros dispositivos, configura Supabase con los pasos de `SUPABASE.md`, crea una cuenta en la app e inicia sesión con la misma cuenta en cada dispositivo. Usa **Más → Ajustes y copias de seguridad** para descargar una copia de tus registros.

## Archivos

- `index.html`: aplicación.
- `manifest.webmanifest`: nombre, iconos y modo de pantalla completa.
- `sw.js`: caché para uso sin conexión.
- `supabase-config.js`: URL del proyecto y clave pública para conectar la nube.
- `supabase-schema.sql`: tabla, protección por usuario y función de sincronización.
- `SUPABASE.md`: instrucciones para habilitar cuentas y sincronización.
- `icon-180.png`, `icon-192.png`, `icon-512.png`: iconos de iPhone y de instalación.
- `icon.svg`: icono vectorial alternativo.
## Alcance de las obligaciones para cualquier moto

- SOAT: calcula la tarifa 2026 por cilindraje: menos de 100 cc, 100 a 200 cc y más de 200 cc. La tabla cambia por año; en años posteriores consulta la SFC y registra el monto vigente.
- Tecnomecánica: estima la primera fecha a los 2 años de matrícula y luego cada año. Si RUNT muestra otro vencimiento, guarda la fecha exacta manualmente. El costo depende del CDA.
- Impuesto: con el avalúo oficial vigente de SIBGA y la tarifa que confirmes con Hacienda, calcula una estimación. Hasta 125 cc no se causa el impuesto nacional; pueden existir derechos locales.
- Seguro voluntario: registra el valor de una cotización de tu aseguradora.

La app no consulta datos de placa automáticamente. RUNT solicita también el documento del propietario y su verificación; la app no solicita ni transmite ese documento.

