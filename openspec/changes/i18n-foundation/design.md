# Diseño: i18n-foundation

## Enfoque técnico

1. **Dependencias** (`app/pubspec.yaml`):
   - `flutter_localizations` (SDK, `sdk: flutter`).
   - `intl` (versión acordada con la restricción del `pubspec` de Flutter).

2. **Generación de código**:
   - `l10n.yaml` en `app/` con `arb-dir`, `template-arb-file`, `output-localization-file` / `output-class` según convención del equipo.
   - Ficheros `app_en.arb`, `app_es.arb` (o nombres unificados) en `lib/l10n/` o ruta estándar.

3. **`MaterialApp`** (`lib/main.dart`):
   - `localizationsDelegates`: `AppLocalizations.delegate`, `GlobalMaterialLocalizations.delegate`, `GlobalWidgetsLocalizations.delegate`, `GlobalCupertinoLocalizations.delegate`.
   - `supportedLocales: AppLocalizations.supportedLocales` (o lista explícita equivalente).

4. **Resolución de locale (v1)**:
   - Por defecto: **locale del dispositivo** si está en `supportedLocales`; si no, **fallback** documentado (p. ej. `es` o `en` — fijar en implementación y reflejar en ARB `@@locale`).

5. **Pantallas**:
   - Sustituir `Text('…')`, `InputDecoration.labelText`, `AppBar.title`, etc. por getters de `AppLocalizations.of(context)!`.
   - Widgets que no tengan `context`: pasar strings ya resueltos desde el padre o usar `Builder`.

6. **Tests**:
   - Envolver con `MaterialApp` con `localizationsDelegates` y `locale` explícito en tests que aserten textos visibles, o usar claves estables documentadas.

## Convención de claves ARB

- Nombres descriptivos en **lowerCamelCase** con prefijo por dominio si ayuda: `landingWelcome`, `authEmailLabel`, `shellProjectsTab`.

## Relación con specs

- Tras validar el cambio, sincronizar delta si aplica → `openspec/specs/client/spec.md` (sección i18n).
