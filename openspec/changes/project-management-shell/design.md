# Diseño: project-management-shell

## Context

El cliente Flutter ya tenía **MaterialApp** con i18n, landing y flujo auth que navega a `/home`. Faltaba definir el **contenido** del shell y un primer dominio de producto (**obras en Proyectos**) sin acoplarse aún a API.

## Goals / Non-Goals

**Goals:**

- Un solo **layout** (drawer + `IndexedStack`) para las secciones principales.
- **CRUD** de obras con modelo claro y formulario en **pantalla completa** (`Navigator.push`).
- **Markdown** como formato de almacenamiento de la descripción; vista previa con `flutter_markdown`.
- **Selector de idioma** en el drawer para usuarios autenticados (sin duplicar el widget flotante de landing/login).

**Non-Goals:**

- Persistencia de obras en disco o nube.

**Rama `feature/markdownexperimentaleditor` (y posteriores):**

- **Editor WYSIWYG** con **`flutter_quill`**: barra de herramientas compacta (sin familia/tamaño de fuente ni colores por defecto en toolbar), conversión **Delta ↔ Markdown** vía **`markdown_quill`**, y delegados **`FlutterQuillLocalizations`** en `MaterialApp`.

## Decisions

| Decisión | Alternativas | Motivo |
|----------|----------------|--------|
| Estado de obras en **lista en memoria** en el widget de sección | Provider/Repository global | Menor complejidad para MVP; fácil de sustituir después. |
| **Drawer** con secciones 0–2 arriba y **Ajustes + cierre + idiomas** abajo | Bottom bar | Más espacio para lista; patrón Material familiar en tablet/web. |
| Descripción como **Markdown** en string | HTML o solo Delta | **Export** desde Quill con `DeltaToMarkdown`; import con `MarkdownToDelta` y `markdown` Document (GFM, `encodeHtml: false`). |
| **Quill** para edición | Solo `TextField` + Markdown crudo | Mejor UX para usuarios no técnicos; coste: más dependencias y cuidado con delta vacío. |
| **LanguageFlagSelector** con `expandWidth` / `removeBackground` solo en drawer | Mismo widget que landing | Legibilidad sobre fondo claro del drawer. |
| Pestaña **Comunidad** (antes Biblioteca) | Mantener "Biblioteca" | Copy alineado con visión de comunidad (solo texto i18n). |

## Risks / Trade-offs

- **Pérdida de datos al recargar** (RAM) → aceptado para demo; documentado en spec de producto.
- **Listas largas** en web/móvil → scroll y altura de editor acotadas; mejorable con paginación más adelante.

## Migration Plan

- No aplica migración de datos (no hay store previo de obras).

## Open Questions

- Persistencia local (`shared_preferences` / Isar) y sincronización cuando exista API.
