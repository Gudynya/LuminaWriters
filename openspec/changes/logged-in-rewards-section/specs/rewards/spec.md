# Delta: rewards (logged-in-rewards-section)

## ADDED Requirements

### Requirement: Sección Recompensas visible para usuarios autenticados

El producto SHALL exponer una sección denominada **Recompensas** en el área de usuario tras el inicio de sesión, accesible desde la navegación principal del shell (misma sesión que el resto de secciones autenticadas).

#### Scenario: Usuario en shell abre Recompensas

- **WHEN** el usuario ha accedido al shell autenticado y elige la entrada de navegación correspondiente a Recompensas
- **THEN** el área de contenido principal muestra la sección Recompensas con título coherente con el idioma activo

### Requirement: MVP de contenido de Recompensas

Hasta existir datos de negocio o integración, la sección Recompensas SHALL mostrar un estado de **placeholder** informativo (mensaje localizado de contenido próximo), sin obligar a listados ni puntuaciones reales.

#### Scenario: Placeholder sin datos de recompensa

- **WHEN** el usuario visualiza la sección Recompensas en el MVP
- **THEN** se muestra un mensaje de placeholder localizado y no se exige conexión a backend para esa pantalla
