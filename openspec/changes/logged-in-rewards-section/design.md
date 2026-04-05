# Diseño: logged-in-rewards-section

## Context

El shell autenticado (`MainShellPage`) usa un `IndexedStack` indexado por sección y un drawer con tres ítems en lista scrollable (Inicio, Proyectos, Comunidad), **Ajustes** en el pie fijo (antes de cerrar sesión) y el mismo patrón de placeholder que `_MainSectionBody` + `shellSectionPlaceholder` para secciones sin contenido propio.

## Goals / Non-Goals

**Goals:**

- Añadir una sección **Recompensas** accesible solo en el área logada, con la misma UX base que Inicio/Comunidad (icono, título localizado, mensaje de próximo contenido).
- Mantener el índice de **Proyectos** estable (sigue en posición 1) para no romper el FAB ni tests que asumen esa sección.
- Documentar en specs el comportamiento mínimo y la posible evolución (datos remotos).

**Non-Goals:**

- Motor de puntos, logros, API o persistencia de recompensas.
- Nueva ruta con nombre distinta de `/home` (la sección sigue siendo navegación interna del shell).

## Decisions

1. **Colocación en el stack y drawer:** Insertar Recompensas **después de Comunidad** y **antes de Ajustes** (orden: Inicio → Proyectos → Comunidad → Recompensas → [pie] Ajustes). Así las secciones “de contenido” quedan agrupadas y Ajustes permanece en el pie como hoy.

2. **Implementación UI:** Reutilizar `_MainSectionBody` (o equivalente) con icono tipo `Icons.card_giftcard` / `Icons.workspace_premium_outlined` para coherencia visual con Material; texto vía nueva clave ARB `shellRewardsTab` (y mensaje placeholder existente `shellSectionPlaceholder`).

3. **i18n:** Añadir claves en `app_en.arb` (plantilla), `app_es.arb`, `app_ca.arb`; ejecutar generación de localizaciones para mantener `AppLocalizations` al día.

4. **Tests:** Los tests actuales usan `shellProjectsTab` y rutas; no deben asumir un número fijo de filas en el drawer salvo que se actualicen explícitamente. Preferible no añadir fragilidad: si un test enumera secciones, incluir Recompensas solo si el test lo requiere.

## Risks / Trade-offs

- [Índices de sección cambian para todo lo que estaba después de Comunidad] → Mitigación: actualizar referencias a índice 3 (antes Ajustes) a índice 4 donde existan literales; el FAB de Proyectos sigue en índice 1.

- [Drawer más largo en pantallas pequeñas] → Mitigación: la lista ya es scrollable; una entrada más es aceptable en MVP.

## Migration Plan

- Despliegue como actualización de app; sin datos migrables. Rollback: revertir commit que añade la sección.

## Open Questions

- Criterios concretos de recompensas (reglas de negocio) cuando exista backend.
- Si en el futuro Recompensas requiere sub-rutas o deep links, valorar `GoRouter` u otra estrategia (fuera de este cambio).
