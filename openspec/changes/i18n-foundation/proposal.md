# Propuesta: i18n-foundation

## Qué

Establecer las **bases de internacionalización (i18n)** en el cliente Flutter (`app/`): configuración oficial de Flutter (`flutter_localizations`, `intl`), **gen-l10n** con archivos **ARB**, y sustitución progresiva de cadenas visibles en pantalla por claves localizadas.

## Por qué

- Hoy los textos están **hardcodeados** (principalmente en español) en `main.dart`, landing, auth, recuperación y shell; eso impide servir **varios idiomas** sin duplicar widgets ni ramas.
- Un único mecanismo (ARB + `AppLocalizations`) reduce errores, permite revisión de copy y encaja con **Material** y **tests** de forma predecible.

## Alcance (v1 de este cambio)

- **Idiomas iniciales:** `es` (español) y `en` (inglés), como `supportedLocales`.
- **Resolución de locale:** locale inicial desde el **sistema** / **navegador** (`platformDispatcher.locale`); fallback documentado en `design.md` y `localeResolutionCallback` en `MaterialApp`.
- **Selector de idioma en UI:** implementado en el **landing**: esquina inferior derecha, selección por **banderas** (emoji). La persistencia del idioma entre sesiones (**`shared_preferences`** u otro) sigue siendo **opcional** y no forma parte de la entrega mínima.
- **Nombre de producto:** cadena visible unificada como **LuminaWriter** (ARB, web, Android `label`, documentación).
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
