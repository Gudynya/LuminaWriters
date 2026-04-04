# Especificación: cliente Flutter (`lumina_writers`)

## Resumen

El código de aplicación reside en **`app/`** (no en la raíz del monorepo). El paquete Dart se llama **`lumina_writers`**; el **nombre visible del producto** es **LuminaWriter**. Usa **Dart ^3.11.4**, **Flutter** con **Material 3** y apunta a **Android** y **web**.

## Estructura relevante

```
app/
  lib/
    main.dart                 # MaterialApp, rutas, tema, i18n
    l10n/                     # ARB + app_localizations*.dart (gen-l10n)
    screens/                  # Pantallas por archivo
  l10n.yaml                   # Configuración gen-l10n
  test/                       # widget_test y futuras pruebas
  pubspec.yaml
  android/ , web/             # Plataformas
```

## Internacionalización (i18n)

- **Locales soportados:** `es`, `en` (definidos en ARB y `AppLocalizations.supportedLocales`).
- **Plantilla:** `lib/l10n/app_en.arb`; traducciones: `app_es.arb` (y futuros idiomas como `app_<lang>.arb`).
- **Configuración:** `l10n.yaml` en `app/`; `flutter: generate: true` en `pubspec.yaml`.
- **Dependencias:** `flutter_localizations` (SDK), `intl`; en el landing también `font_awesome_flutter` y `url_launcher` (iconos sociales y enlaces externos).
- **Uso en código:** `AppLocalizations.of(context)` (o el patrón que genere `gen-l10n`); **no** duplicar cadenas visibles fuera de ARB salvo nombres de marca fijos.
- **Convención de claves:** `lowerCamelCase` descriptivo (`authEmailLabel`, `shellHomeTab`, `shellSectionPlaceholder`, `languageSelectorLabel`, …).
- **`MyApp` (`lib/main.dart`):** widget **con estado** que mantiene el `locale` activo. Si el constructor recibe `locale` explícito (p. ej. tests), se usa ese valor; si no, el locale inicial se obtiene de **`WidgetsBinding.instance.platformDispatcher.locale`** (en **web** suele coincidir con el idioma del **navegador**). El usuario puede cambiar el idioma desde el **landing**; el estado se actualiza con `setState` (no hay persistencia entre sesiones salvo que se añada después, p. ej. `shared_preferences`).
- **Selector en el landing (`LandingPage`):** esquina **inferior derecha** de la pantalla, banderas **emoji** (🇪🇸 español, 🇬🇧 inglés) con tooltips accesibles; la franja inferior del hero reserva ancho para no solapar el lema con el selector.
- **Resolución de locale:** además del locale guardado en `MaterialApp`, `localeResolutionCallback` mantiene el fallback a **español** si el idioma del sistema no está soportado.
- **Tests:** fijar `MyApp(locale: Locale('es'))` (u otro locale soportado) cuando se aserten textos localizados; usar `AppLocalizations` para obtener cadenas esperadas en lugar de literales sueltos.

## Rutas

Definidas en `lib/main.dart`:

| Ruta | Pantalla | Notas |
|------|----------|--------|
| `/` | `LandingPage` | Entrada pública; selector de idioma (banderas) y hero a pantalla completa |
| `/login` | `LoginPage` | Credenciales; puede sustituir por `/home` en demo |
| `/signup` | `SignUpPage` | Registro |
| `/recover-password` | `PasswordRecoveryPage` | Enlace de recuperación |
| `/home` | `MainShellPage` | Área autenticada (layout principal) |

## Convenciones

- **Nombres:** archivos `snake_case`, clases `UpperCamelCase`; textos de UI en **ARB** / `AppLocalizations` (no constantes `k…` salvo excepciones documentadas).
- **Navegación:** `Navigator.pushNamed` / `pushReplacementNamed` según si el flujo debe sustituir la pila.
- **Tema:** `ThemeData` con `ColorScheme.fromSeed` (semilla actual orientada a púrpura); mantener coherencia al añadir nuevas pantallas.
- **Dependencias:** declarar en `app/pubspec.yaml`; preferir paquetes mantenidos y revisar implicaciones en **web** (p. ej. fuentes de iconos o plugins).

## Calidad

- `flutter analyze` sin errores en cambios fusionados.
- `flutter test` en CI o antes de PR cuando existan pruebas.
- Evitar regresiones en textos o rutas cubiertos por tests existentes.

## Integración futura

- Autenticación real (REST, Firebase, Supabase, etc.) debe encapsularse en capas dedicadas (repositorios / servicios), no en los widgets de pantalla, salvo prototipos explícitos.

## Relación OpenSpec

- Los cambios que alteren rutas, flujos o dependencias del cliente deberían actualizar este documento o un delta bajo `openspec/changes/<nombre>/specs/` antes de archivar.
