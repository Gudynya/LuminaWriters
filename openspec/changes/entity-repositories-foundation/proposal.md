## Why

Hoy las obras y el “usuario” viven en estado de widgets o navegación simulada, sin contratos estables. Eso impide sustituir la persistencia o el origen de datos (API, local, memoria) sin reescribir pantallas. Se necesita una **capa de datos explícita** antes de acoplar backend o almacenamiento local.

## What Changes

- Introducir **contratos de repositorio** (interfaces Dart) para: **sesión / usuario actual**, **obras literarias (CRUD)** y **preferencia de idioma de la UI** (lectura/escritura del locale elegido, no el i18n en sí).
- Proporcionar **implementaciones en memoria** que conserven el comportamiento actual del MVP (demo sin persistencia entre sesiones de app, salvo lo que se defina para locale).
- **Refactorizar** `LiteraryWorksSection` (y puntos de login/shell relacionados) para depender de los contratos vía **inyección explícita** (constructores o equivalente acordado en diseño), no de listas locales en el `State`.
- Añadir **tests** donde aporte valor (p. ej. repositorio en memoria o fakes) sin romper `flutter analyze` / `flutter test`.

## Capabilities

### New Capabilities

- `entity-repositories`: Contratos de acceso a datos para usuario/sesión, obras literarias y preferencia de locale de UI; implementación por defecto en memoria; criterios de sustitución de implementación sin cambiar la UI.

### Modified Capabilities

- `client`: Los requisitos de estructura del cliente pasan a exigir que el acceso a obras, identidad de sesión y preferencia de idioma de UI se realice a través de la capa definida en `entity-repositories`, manteniendo rutas, copy y flujos de pantalla equivalentes al MVP salvo donde el delta lo detalle.

## Impact

- **Código:** `app/lib/` — nuevos ficheros bajo una convención de carpetas acordada en `design.md`; cambios en `main.dart`, `LiteraryWorksSection`, `LoginPage` / `MainShellPage` según inyección; modelo `LiteraryWork` puede permanecer o moverse según diseño.
- **Specs:** delta bajo `openspec/changes/entity-repositories-foundation/specs/client/spec.md`; spec nueva `specs/entity-repositories/spec.md`.
- **Dependencias:** posiblemente ninguna nueva en la primera iteración (solo Dart/Flutter); si la preferencia de locale usa `shared_preferences` u otra dependencia, se documentará en diseño y `pubspec.yaml`.
- **Producto:** sin cambio de alcance funcional del MVP (sigue siendo demo en memoria para obras; auth real sigue fuera de alcance) salvo acuerdo explícito de persistir solo el locale.
