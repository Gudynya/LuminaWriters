# Cambios OpenSpec (`changes/`)

Aquí viven los **cambios activos** creados con el CLI OpenSpec:

```bash
openspec new change "<nombre-en-kebab-case>"
```

Cada cambio suele incluir (según el esquema del proyecto):

- `.openspec.yaml` — metadatos del cambio
- `proposal.md` — qué y por qué
- `design.md` — cómo
- `tasks.md` — pasos de implementación
- `specs/` opcional — deltas de especificación respecto a `openspec/specs/<capability>/spec.md`

Las carpetas archivadas suelen moverse a `changes/archive/YYYY-MM-DD-<nombre>/` al cerrar un cambio.

Esta carpeta puede estar vacía en el repositorio hasta que se cree el primer cambio.
