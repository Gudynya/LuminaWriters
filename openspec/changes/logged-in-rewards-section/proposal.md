# Propuesta: logged-in-rewards-section

## Why

Los usuarios autenticados necesitan un lugar visible en el producto donde consultar **recompensas** (logros, incentivos o beneficios vinculados a su actividad). Hoy el shell solo expone Inicio, Proyectos, Comunidad y Ajustes; incorporar **Recompensas** alinea la navegación con una futura economía de incentivos sin obligar aún a backend ni reglas de negocio complejas.

## What Changes

- Nueva **sección «Recompensas»** en el área autenticada (`MainShellPage`): entrada en el **drawer**, título en **AppBar** y cuerpo coherente con el patrón de placeholders localizados del MVP.
- **Claves i18n** nuevas para el nombre de la pestaña/sección y textos de UI asociados (es / en / ca).
- **Especificaciones** de producto y cliente actualizadas para documentar la sección y el orden de navegación.

## Capabilities

### New Capabilities

- `rewards`: Comportamiento y alcance de la sección Recompensas para usuarios logados (MVP: pantalla accesible desde el shell, copy localizado; evolución futura: datos y reglas de recompensa).

### Modified Capabilities

- `client`: Shell autenticado — lista de secciones en drawer e `IndexedStack` incluye Recompensas; convenciones i18n para la nueva etiqueta.

## Impact

- Código principal: `app/lib/screens/main_shell_page.dart`, `app/lib/l10n/*.arb` y generados `app_localizations*.dart` (vía `flutter gen-l10n`).
- Sin nuevas dependencias obligatorias en el MVP; sin API hasta que exista integración real de recompensas.
