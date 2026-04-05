## Context

El cliente Flutter (`app/`) gestiona obras con una lista en el estado de `LiteraryWorksSection` y el login navega a `/home` sin capa de datos. La spec de cliente ya apunta a encapsular autenticación y persistencia en **repositorios / servicios**; este cambio materializa esa frontera con contratos explícitos e implementación en memoria, alineado con la propuesta `entity-repositories-foundation`.

## Goals / Non-Goals

**Goals:**

- Definir **interfaces estables** (repositorios) para obras literarias, sesión/usuario actual y preferencia de idioma de la UI.
- Proveer **implementaciones en memoria** que repliquen el comportamiento observable del MVP actual.
- **Componer** las instancias en un único sitio (p. ej. `main.dart`) e inyectarlas por constructores hacia shell y secciones, evitando singletons globales ocultos salvo justificación en código.
- Mantener **analizador y tests** verdes; añadir pruebas focalizadas donde el coste sea bajo (repositorio en memoria o dobles).

**Non-Goals:**

- Backend real, Supabase, OAuth o persistencia durable de obras en esta iteración.
- Cambiar textos, rutas o flujos de usuario visibles salvo lo inevitable por refactor (misma UX).
- Introducir un framework de DI pesado si el equipo no lo necesita; la inyección manual basta para el alcance.

## Decisions

1. **Nombre y ubicación de la capa**  
   - **Decisión:** Carpeta bajo `app/lib/` dedicada a contratos e implementaciones, p. ej. `data/repositories/` (contratos `abstract class` + `in_memory/` o sufijo `InMemory`).  
   - **Alternativa considerada:** `services/` — rechazada para no confundir con lógica de dominio pesada; “repositorio” comunica acceso a datos.

2. **Tres contratos separados**  
   - **Decisión:** `LiteraryWorkRepository` (listar / crear / actualizar / eliminar por id), `SessionRepository` o nombre equivalente (estado de sesión: al menos “anónimo” vs “autenticado” y datos mínimos para la UI si hace falta), `LocalePreferenceRepository` (leer/escribir el `Locale` de UI preferido).  
   - **Alternativa:** Un solo “AppRepository” — rechazada para no crear un dios-objeto y facilitar sustitución parcial en tests.

3. **API síncrona vs asíncrona**  
   - **Decisión:** Métodos como `Future<…>` aunque la implementación en memoria sea inmediata, para no forzar un **BREAKING** cambio de firma al añadir E/S o red.  
   - **Alternativa:** API síncrona — rechazada por fricción futura con persistencia.

4. **Preferencia de idioma**  
   - **Decisión:** El repositorio de preferencia es la única fuente de verdad para “qué locale persistió el usuario”; `MyApp` arranca leyendo una vez (o vía `Future` en `initState`) y actualiza al cambiar. Primera implementación en memoria equivale al comportamiento actual (sin persistencia entre reinicios) salvo que se acuerde añadir `shared_preferences` en una tarea explícita.  
   - **Alternativa:** Mantener solo estado en `MyApp` sin repositorio — rechazada respecto al objetivo de abstracción.

5. **Inyección**  
   - **Decisión:** Instancias creadas en el árbol raíz (`main.dart` / `MyApp`) y pasadas como parámetros a `MainShellPage`, `LiteraryWorksSection`, páginas de auth si necesitan `SessionRepository` o `LocalePreferenceRepository`.  
   - **Alternativa:** `package:provider` — pospuesta; se puede añadir después sin romper contratos.

## Risks / Trade-offs

- **[Riesgo]** Más archivos y líneas de glue en `main.dart` → **Mitigación:** Mantener un pequeño “composition root” claro y nombres consistentes.  
- **[Riesgo]** Tests de widget existentes asumen rutas sin repositorios → **Mitigación:** Valores por defecto en tests (`MyApp` con repositorios in-memory) o helpers de test.  
- **[Trade-off]** `Future` en todas partes añade ruido en llamadas locales → aceptado por estabilidad de API hacia E/S real.

## Migration Plan

1. Añadir contratos + implementaciones en memoria sin cambiar pantallas.  
2. Conectar `LiteraryWorksSection` al repositorio de obras; eliminar lista como única fuente de verdad.  
3. Conectar sesión y preferencia de locale según tasks.  
4. Ejecutar `flutter analyze` y `flutter test`; corregir roturas.  
5. **Rollback:** revertir el merge del cambio; no hay migración de datos de usuario (no hay persistencia previa).

## Open Questions

- ¿El `SessionRepository` debe exponer solo `bool get isSignedIn` o también email/identificador para futura UI? (Dejar mínimo viable alineado con login simulado.)  
- ¿Persistir preferencia de locale con `shared_preferences` en esta misma entrega o en un cambio posterior? (Por defecto: memoria en esta entrega salvo consenso en implementación.)
