# Propuesta: i18n-foundation

## Qué

Establecer las **bases de internacionalización (i18n)** en el cliente Flutter (`app/`): configuración oficial de Flutter (`flutter_localizations`, `intl`), **gen-l10n** con archivos **ARB**, y sustitución progresiva de cadenas visibles en pantalla por claves localizadas.

## Por qué

- Hoy los textos están **hardcodeados** (principalmente en español) en `main.dart`, landing, auth, recuperación y shell; eso impide servir **varios idiomas** sin duplicar widgets ni ramas.
- Un único mecanismo (ARB + `AppLocalizations`) reduce errores, permite revisión de copy y encaja con **Material** y **tests** de forma predecible.

## Alcance (v1 de este cambio)

- **Idiomas iniciales:** `es` (español) y `en` (inglés), como `supportedLocales`.
- **Resolución de locale:** seguir al **sistema** (`localeListResolutionCallback` / comportamiento por defecto de Flutter) salvo que el diseño decida otra cosa en `design.md`.
- **Selector de idioma en UI:** **fuera de alcance** en la primera entrega de este cambio, salvo decisión explícita en diseño; se puede añadir después con persistencia (`shared_preferences` u otro).
- **Contenido remoto** (API, CMS): fuera de alcance; solo strings de la app.

## No-objetivos

- Traducción de contenido generado por usuarios o servidor.
- RTL completo como requisito (se puede dejar preparado el pipeline sin garantizar QA árabe/hebreo en v1).
- Sustituir **todos** los strings en un solo PR si el volumen es alto: se acepta migración por pantallas con tareas explícitas.

## Criterios de éxito

- `flutter analyze` y `flutter test` pasan con locale fijo o delegados configurados en tests.
- Documentación en `openspec/specs/client/spec.md` actualizada con convención i18n.
- Al menos **landing + flujo auth** o equivalente acordado en `tasks.md` usando `AppLocalizations`.

## Riesgos

- Tests que hoy buscan **strings literales** deben actualizarse.
- Ramas paralelas con texto en otro idioma: convención de **claves ARB en inglés** y textos por locale en ARB para evitar conflictos.
