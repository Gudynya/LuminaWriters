# Delta: client (entity-repositories-foundation)

Cambios respecto a `openspec/specs/client/spec.md` para alinear el cliente con la capa `entity-repositories`.

## ADDED Requirements

### Requirement: Acceso a datos solo a través de repositorios

El cliente SHALL obtener y modificar obras literarias, el estado de sesión relevante para la navegación autenticada y la preferencia de idioma de la UI únicamente a través de los contratos definidos en la capacidad **entity-repositories**, utilizando las implementaciones concretas inyectadas desde el punto de composición de la aplicación (p. ej. `main.dart` / `MyApp`).

#### Scenario: Lista de obras en Proyectos

- **WHEN** el usuario visualiza o modifica la lista de obras en la sección Proyectos
- **THEN** las operaciones de listado, creación, edición y borrado usan el repositorio de obras, no una persistencia paralela no tipada en el estado del widget

#### Scenario: Cambio de idioma en sesión autenticada

- **WHEN** el usuario cambia el idioma mediante el selector del drawer
- **THEN** el locale aplicado a `MaterialApp` se coordina con el repositorio de preferencia de idioma según el diseño del cambio (p. ej. lectura inicial y escritura al seleccionar)

### Requirement: Composición de dependencias en el arranque

El cliente SHALL crear o recibir las implementaciones de repositorios en el arranque de la aplicación y SHALL propagarlas a `MainShellPage`, la sección de obras y otras pantallas que las necesiten mediante constructores o mecanismo explícito documentado en el diseño del cambio, evitando instancias globales ocultas no justificadas.

#### Scenario: Tests de widget

- **WHEN** se ejecutan pruebas que montan `MyApp` o el shell con repositorios falsos o en memoria
- **THEN** es posible sustituir repositorios sin modificar las implementaciones de las pantallas

## MODIFIED Requirements

_(No se modifican requisitos existentes por bloque completo en este delta; la integración futura descrita en la spec canónica queda satisfecha por los requisitos ADDED anteriores.)_
