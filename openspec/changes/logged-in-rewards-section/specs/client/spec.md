# Delta: client (logged-in-rewards-section)

## ADDED Requirements

### Requirement: Shell con sección Recompensas

El cliente SHALL incluir **Recompensas** como sección del `MainShellPage`, con entrada en el drawer y panel en el `IndexedStack`, en el orden: Inicio, Proyectos, Comunidad, Recompensas, y el pie del drawer con Ajustes, Cerrar sesión y bloque de idioma como hasta ahora.

#### Scenario: Navegación a Recompensas desde el drawer

- **WHEN** el usuario toca la entrada de Recompensas en el drawer
- **THEN** el `AppBar` muestra el título localizado de Recompensas y el cuerpo muestra el contenido de esa sección

#### Scenario: Placeholder localizado en Recompensas

- **WHEN** la sección Recompensas está visible
- **THEN** los textos visibles de la cabecera y del placeholder provienen de `AppLocalizations` (ARB) y no están hardcodeados en castellano único

### Requirement: Claves i18n para Recompensas

El cliente SHALL definir una clave ARB dedicada al nombre corto de la sección (p. ej. `shellRewardsTab`) en la plantilla en inglés y en las traducciones soportadas (`es`, `ca`), alineada con la convención de otras pestañas del shell (`shellHomeTab`, …).

#### Scenario: Cambio de idioma afecta el título de Recompensas

- **WHEN** el usuario cambia el idioma desde el selector del drawer estando en la sección Recompensas
- **THEN** el título de la sección refleja el nuevo idioma
