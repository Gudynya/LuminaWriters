# Delta: client (project-management-shell)

## ADDED Requirements

### Requirement: MainShellPage con drawer e i18n en sesión

El cliente SHALL mostrar `MainShellPage` en `/home` con `IndexedStack`, drawer con secciones Inicio/Proyectos/Comunidad, pie con Ajustes, cerrar sesión y selector de idioma, y SHALL propagar `onLocaleChanged` desde `MyApp`.

#### Scenario: Cambio de idioma en drawer

- **WHEN** el usuario elige otra bandera en el pie del drawer
- **THEN** el `locale` de `MaterialApp` se actualiza y los textos visibles usan el nuevo idioma

### Requirement: Lista y editor de obras literarias

El cliente SHALL listar obras desde estado en memoria, abrir `LiteraryWorkEditorPage` en pantalla completa para crear o editar, y SHALL usar Markdown para descripción con vista previa.

#### Scenario: Vista previa de descripción

- **WHEN** el usuario está en la pestaña de vista previa del editor
- **THEN** el contenido se renderiza con `flutter_markdown` coherente con el Markdown exportado desde el documento Quill

### Requirement: Editor de descripción tipo rich text (Quill)

El cliente SHALL permitir editar la descripción con `QuillEditor` y barra `QuillSimpleToolbar`, SHALL serializar a Markdown para el modelo con `markdown_quill`, y SHALL registrar `FlutterQuillLocalizations.delegate` en `MaterialApp`.

#### Scenario: Guardar descripción formateada

- **WHEN** el usuario aplica negrita u otros estilos y guarda
- **THEN** el campo `descriptionMarkdown` del resultado contiene la sintaxis Markdown equivalente generada por `DeltaToMarkdown`

## MODIFIED Requirements

_(El documento canónico `openspec/specs/client/spec.md` incorpora la descripción completa; este archivo resume el delta del cambio.)_
