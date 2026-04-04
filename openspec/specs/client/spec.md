# Especificación: cliente Flutter (`lumina_writers`)

## Resumen

El código de aplicación reside en **`app/`** (no en la raíz del monorepo). El paquete se llama **`lumina_writers`**, usa **Dart ^3.11.4**, **Flutter** con **Material 3** y apunta a **Android** y **web**.

## Estructura relevante

```
app/
  lib/
    main.dart                 # MaterialApp, rutas, tema
    screens/                  # Pantallas por archivo
  test/                       # widget_test y futuras pruebas
  pubspec.yaml
  android/ , web/             # Plataformas
```

## Rutas

Definidas en `lib/main.dart`:

| Ruta | Pantalla | Notas |
|------|----------|--------|
| `/` | `LandingPage` | Entrada pública |
| `/login` | `LoginPage` | Credenciales; puede sustituir por `/home` en demo |
| `/signup` | `SignUpPage` | Registro |
| `/recover-password` | `PasswordRecoveryPage` | Enlace de recuperación |
| `/home` | `MainShellPage` | Área autenticada (layout principal) |

## Convenciones

- **Nombres:** archivos `snake_case`, clases `UpperCamelCase`, constantes públicas para textos usados en tests (`kLanding…`, etc. cuando aplique).
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
