# Capacidad: entity-repositories

Especificación de la capa de acceso a datos por contratos (repositorios) para sesión, obras literarias y preferencia de idioma de la UI.

## ADDED Requirements

### Requirement: Contratos de repositorio para datos de aplicación

El sistema SHALL exponer interfaces Dart (repositorios) para:

- **Obras literarias:** crear, leer (lista y por identificador si aplica), actualizar y eliminar obras compatibles con el modelo de dominio existente (`LiteraryWork` o evolución documentada).
- **Sesión de usuario:** representar el estado de sesión necesario para el flujo actual (p. ej. entrada al shell tras login simulado), sin exigir backend real en esta capacidad.
- **Preferencia de idioma de UI:** leer y escribir el locale de interfaz elegido por el usuario entre los soportados por la app (`ca`, `en`, `es`).

Las firmas SHALL usar tipos asíncronos (`Future` u otro patrón asíncrono unificado) donde haya posible E/S, aunque la implementación por defecto sea en memoria.

#### Scenario: Sustitución de implementación

- **WHEN** se sustituye la implementación en memoria por otra que cumple el mismo contrato (p. ej. persistencia local o remota)
- **THEN** el código de presentación que depende solo de las interfaces no requiere cambios distintos de la composición en el punto de arranque de la aplicación

### Requirement: Implementación por defecto en memoria

El sistema SHALL incluir implementaciones concretas de los repositorios que almacenen datos solo en memoria de proceso, preservando el comportamiento observable del MVP para demostración (sin persistencia entre ejecuciones de la app), salvo decisión explícita documentada para la preferencia de locale.

#### Scenario: Reinicio de la aplicación

- **WHEN** el usuario cierra y vuelve a abrir la aplicación sin capa de persistencia adicional
- **THEN** las obras y el estado de sesión se comportan según la política documentada en diseño (típicamente equivalente al MVP previo: sin persistencia de obras)

### Requirement: Sin duplicar persistencia ad-hoc en widgets

El código de pantallas y secciones SHALL NOT usar colecciones mutables de obras como única fuente de verdad para operaciones CRUD; las mutaciones SHALL realizarse a través del repositorio de obras (la UI puede mantener estado derivado o caché si no contradice este requisito).

#### Scenario: Alta de una obra desde Proyectos

- **WHEN** el usuario confirma una nueva obra en el editor
- **THEN** la obra queda registrada mediante el repositorio de obras, no solo mediante `setState` sobre una lista privada sin pasar por el contrato
