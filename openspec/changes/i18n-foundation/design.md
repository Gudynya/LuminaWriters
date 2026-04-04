# Diseño: i18n-foundation

## Enfoque técnico

1. **Dependencias** (`app/pubspec.yaml`):
   - `flutter_localizations` (SDK, `sdk: flutter`).
   - `intl` (versión acordada con la restricción del `pubspec` de Flutter).
   - `font_awesome_flutter`, `url_launcher` (landing: iconos sociales y enlaces externos).

2. **Generación de código**:
   - `l10n.yaml` en `app/` con `arb-dir`, `template-arb-file`, `output-localization-file` / `output-class` según convención del equipo.
   - Ficheros `app_en.arb`, `app_es.arb` (o nombres unificados) en `lib/l10n/` o ruta estándar.

3. **`MaterialApp`** (`lib/main.dart`):
   - `MyApp` como **`StatefulWidget`**: mantiene el `Locale` activo y lo pasa a `MaterialApp(locale: …)`.
   - Inicialización: si el constructor recibe `locale` (tests), se usa; si no, **`WidgetsBinding.instance.platformDispatcher.locale`** (en web, alineado con el idioma del navegador). Normalizar a `es` / `en` por código de idioma.
   - `localizationsDelegates`: `AppLocalizations.localizationsDelegates` (incluye `AppLocalizations.delegate`, delegados globales Material/Cupertino/Widgets).
   - `supportedLocales: AppLocalizations.supportedLocales` (o lista explícita equivalente).

4. **Resolución de locale (v1)**:
   - Por defecto: **locale del dispositivo / navegador** si el código de idioma está en `supportedLocales`; si no, **fallback a `es`**, documentado en ARB `@@locale` y en `localeResolutionCallback`.

5. **Selector en el landing**:
   - **`LandingPage`** recibe `ValueChanged<Locale>? onLocaleChanged` desde la ruta en `main.dart` para actualizar el estado de `MyApp`.
   - UI: **banderas emoji** (🇪🇸 / 🇬🇧) en **esquina inferior derecha** (`Stack` + `Positioned`), con tooltips desde ARB (`languageSelectorLabel`, `localeSpanishDisplay`, `localeEnglishDisplay`).
   - El hero reserva ancho en la franja inferior para que el lema no quede bajo el selector.

6. **Pantallas**:
   - Sustituir `Text('…')`, `InputDecoration.labelText`, `AppBar.title`, etc. por getters de `AppLocalizations.of(context)!`.
   - Widgets que no tengan `context`: pasar strings ya resueltos desde el padre o usar `Builder`.

7. **Tests**:
   - Envolver con `MaterialApp` con `localizationsDelegates` y `locale` explícito en tests que aserten textos visibles, o usar claves estables documentadas.

## Convención de claves ARB

- Nombres descriptivos en **lowerCamelCase** con prefijo por dominio si ayuda: `landingWelcome`, `authEmailLabel`, `shellProjectsTab`.

## Relación con specs

- Tras validar el cambio, sincronizar delta si aplica → `openspec/specs/client/spec.md` (sección i18n).
