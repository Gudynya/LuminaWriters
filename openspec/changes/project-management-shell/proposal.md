# Propuesta: project-management-shell

## Why

Tras la base de **i18n** y el **landing/auth**, hacía falta un **espacio de trabajo** concreto: navegación clara en el área autenticada, una primera **gestión de obras literarias** (proyectos) en memoria y coherencia de **idioma** también dentro del shell, sin depender solo del landing.

## What Changes

- **Shell principal** (`MainShellPage`) con **drawer**: secciones Inicio, Proyectos, Comunidad y Biblioteca renombrada a **Comunidad** en copy (i18n).
- **Proyectos**: lista de **obras literarias** en RAM (CRUD): nombre de proyecto, nombre público, idioma de la obra, descripción en Markdown (editor con pestaña vista previa), tags.
- **Drawer (pie):** bloque inferior con **ajustes** (navega a la sección correspondiente), **cerrar sesión**, y **selector de idioma** (banderas a ancho completo, sin fondo oscuro) alineado con `MyApp` / `onLocaleChanged`.
- **FAB / añadir obra:** reglas de UX (lista ancha, botón contextual según número de obras).
- **Especificaciones OpenSpec** (`product`, `client`) actualizadas para reflejar el comportamiento anterior.

## Capabilities

### New Capabilities

- _(ninguna carpeta nueva bajo `openspec/specs/`; el alcance se incorpora en product y client.)_

### Modified Capabilities

- **`product`**: alcance MVP ampliado (shell con secciones, proyectos/obras, Comunidad).
- **`client`**: rutas y pantallas (`MainShellPage`, obras, editor, drawer, i18n en sesión, dependencias `flutter_markdown`).

## Impact

- Código en `app/lib/screens/` (`main_shell_page`, `literary_works_section`, `literary_work_editor_page`), `app/lib/models/literary_work.dart`, `app/lib/main.dart`, `l10n/`, `pubspec.yaml`.
- Sin backend obligatorio; datos de obras **en memoria** (demo).
