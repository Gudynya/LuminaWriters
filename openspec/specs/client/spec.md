# Especificación: cliente Flutter (`lumina_writers`)

## Resumen

El código de aplicación reside en **`app/`** (no en la raíz del monorepo). El paquete Dart se llama **`lumina_writers`**; el **nombre visible del producto** es **LuminaWriter**. Usa **Dart ^3.11.4**, **Flutter** con **Material 3** y apunta a **Android** y **web**.

## Estructura relevante

```
app/
  lib/
    main.dart                 # MaterialApp, rutas, tema, i18n, onLocaleChanged → shell
    l10n/                     # ARB + app_localizations*.dart (gen-l10n)
    screens/                  # Pantallas por archivo
    models/                     # p. ej. literary_work.dart
    widgets/                    # p. ej. language_flag_selector, catalunya_senyera_flag
  l10n.yaml
  test/
  pubspec.yaml
  android/ , web/
```

## Internacionalización (i18n)

- **Locales soportados:** `ca` (catalán), `en`, `es` (definidos en ARB y `AppLocalizations.supportedLocales`).
- **Plantilla:** `lib/l10n/app_en.arb`; traducciones: `app_ca.arb`, `app_es.arb` (y futuros `app_<lang>.arb`).
- **Configuración:** `l10n.yaml` en `app/`; `flutter: generate: true` en `pubspec.yaml`.
- **Dependencias:** `flutter_localizations` (SDK), `intl`; landing: `font_awesome_flutter`, `url_launcher`; **Proyectos / descripción:** `flutter_markdown` para vista previa Markdown.
- **Uso en código:** `AppLocalizations.of(context)`; **no** duplicar cadenas visibles fuera de ARB salvo nombres de marca fijos.
- **Convención de claves:** `lowerCamelCase` descriptivo (`shellHomeTab`, `shellProjectsTab`, `shellLibraryTab` para la pestaña cuyo **texto** es «Comunidad» en español, `shellRewardsTab`, `projectsEmptyTitle`, `languageSelectorLabel`, …).
- **`MyApp` (`lib/main.dart`):** widget **con estado** que mantiene el `locale` activo y lo pasa a **`MainShellPage`** como `onLocaleChanged` para que el selector del drawer actualice el idioma de la app.
- **Selector de idioma**
  - **Landing, login, registro:** `LanguageFlagSelector` en esquina **inferior derecha** (estilo compacto con fondo oscuro).
  - **Usuario autenticado (drawer):** mismo componente con **`expandWidth: true`** y **`removeBackground: true`** (fila a ancho útil, bordes según tema), en el **pie** del drawer, **debajo** de Cerrar sesión (orden de la lista scrollable: Inicio → Proyectos → Comunidad → Recompensas; pie fijo: Ajustes → Cerrar sesión → [separador] → idiomas).
- **Resolución de locale:** `localeResolutionCallback` con fallback a **español** si el idioma del sistema no está soportado.
- **Tests:** fijar `MyApp(locale: Locale('es'))` cuando se aserten textos localizados; usar `AppLocalizations` para cadenas esperadas.

## Rutas

Definidas en `lib/main.dart`:

| Ruta | Pantalla | Notas |
|------|----------|-------|
| `/` | `LandingPage` | Entrada pública; selector de idioma (banderas) y hero |
| `/login` | `LoginPage` | Credenciales |
| `/signup` | `SignUpPage` | Registro |
| `/recover-password` | `PasswordRecoveryPage` | Recuperación |
| `/home` | `MainShellPage` | Área autenticada: **drawer**, secciones (Inicio, Proyectos, Comunidad, Recompensas, placeholders + Ajustes en pie) |

**Navegación interna (no ruta con nombre):** `LiteraryWorkEditorPage` se abre con **`Navigator.push`** desde la sección Proyectos (crear/editar obra).

## Shell principal (`MainShellPage`)

- **`IndexedStack`** para el cuerpo según índice de sección.
- **Drawer:** lista scrollable con **Inicio**, **Proyectos**, **Comunidad**, **Recompensas**; pie fijo con **Ajustes** (misma sección que el ítem «Ajustes» del stack), **Cerrar sesión** (vuelve a `/`), bloque de **idioma** al final.
- **Proyectos:** widget de sección con lista de obras, acciones editar/borrar, alta según reglas de UX (FAB/`+` o botón «Añadir nueva»).
- **Comunidad / Recompensas / Inicio / Ajustes (MVP):** placeholders localizados hasta que exista contenido.

## Modelo y formulario de obra (`LiteraryWork`, `LiteraryWorkEditorPage`)

- Campos: identificador interno, **nombre de proyecto**, **nombre público**, **idioma de la obra** (`es`/`en`/`ca`), **descripción** (texto Markdown), **tags** (chips).
- Editor: pestañas **Escribir** (campo de texto) y **Vista previa** (`MarkdownBody`).

## Convenciones

- **Nombres:** archivos `snake_case`, clases `UpperCamelCase`; textos de UI en **ARB** / `AppLocalizations`.
- **Navegación:** `Navigator.pushNamed` / `push` / `pushReplacementNamed` según flujo.
- **Tema:** `ThemeData` con `ColorScheme.fromSeed` (semilla actual orientada a púrpura).
- **Dependencias:** declarar en `app/pubspec.yaml`; revisar implicaciones en **web**.

## Calidad

- `flutter analyze` sin errores en cambios fusionados.
- `flutter test` en CI o antes de PR cuando existan pruebas.
- Evitar regresiones en textos o rutas cubiertos por tests existentes.

## Integración futura

- Autenticación real y **persistencia de obras** deben encapsularse en capas dedicadas (repositorios / servicios), no en los widgets de pantalla, salvo prototipos explícitos.

## Relación OpenSpec

- Los cambios que alteren rutas, flujos o dependencias del cliente deben actualizar este documento o un delta bajo `openspec/changes/<nombre>/specs/` antes de archivar.
