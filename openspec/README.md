# OpenSpec en LuminaWriters

Esta carpeta concentra la **especificación** del proyecto y el flujo **spec-driven** (OpenSpec). Sirve para que personas y herramientas (incluida la IA en Cursor) compartan la misma visión del producto y del código.

## Qué hay aquí

| Ruta | Rol |
|------|-----|
| [`config.yaml`](config.yaml) | Esquema (`spec-driven`) y **contexto del proyecto** inyectado al generar artefactos |
| [`specs/`](specs/) | Especificaciones **estables** por capacidad (`<capability>/spec.md`) |
| [`changes/`](changes/) | Cambios propuestos (`openspec new change <nombre>`). Vacío hasta que existan cambios activos |
| Este `README.md` | Mapa de la carpeta y enlaces |

## Especificaciones (`specs/`)

| Capacidad | Contenido |
|-----------|-----------|
| [`product`](specs/product/spec.md) | Visión, objetivos, alcance y no-objetivos |
| [`client`](specs/client/spec.md) | Cliente Flutter: rutas, pantallas, convenciones de código y calidad |

Tras archivar un cambio, los deltas pueden fusionarse con estos `spec.md` (ver comando de archivo en `.cursor/commands`).

## Flujo de trabajo (Cursor)

Los comandos bajo `.cursor/commands/` encajan con el CLI OpenSpec cuando está instalado:

| Comando | Propósito |
|---------|-----------|
| `/opsx:propose` | Nuevo cambio + artefactos (propuesta, diseño, tareas) |
| `/opsx:apply` | Implementar tareas del cambio |
| `/opsx:explore` | Explorar requisitos antes o durante un cambio |
| `/opsx:archive` | Archivar cambio y opcionalmente sincronizar specs |

Si no tienes el binario `openspec`, los skills siguen documentando el orden esperado de artefactos; el contenido de `specs/` y `config.yaml` es válido por sí solo.

## Convención de nombres

- **Cambios:** `kebab-case` (ej. `add-offline-sync`).
- **Capacidades en `specs/`:** una carpeta por dominio (`product`, `client`, …).
