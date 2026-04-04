# LuminaWriters

Aplicación **Flutter** para acompañar el proceso de escritura creativa: landing público, flujo de autenticación (inicio de sesión, registro, recuperación de contraseña) y un shell principal para el área autenticada.

## Requisitos

- [Flutter](https://docs.flutter.dev/get-started/install) (canal stable recomendado)
- [Dart](https://dart.dev/get-dart) (incluido con Flutter; el proyecto usa SDK `^3.11.4` según `app/pubspec.yaml`)

## Estructura del repositorio

| Ruta | Descripción |
|------|-------------|
| `app/` | Proyecto Flutter **lumina_writers** (código, tests, `android/`, `web/`) |
| `openspec/` | **OpenSpec:** `config.yaml`, `README.md`, `specs/{product,client}/spec.md`, `changes/` |
| `.cursor/` | Comandos y skills de Cursor/OpenSpec (proponer, aplicar, explorar, archivar) |
| `.vscode/` | Configuraciones de depuración para Chrome, Windows y Android (`launch.json`) |

La aplicación vive en **`app/`**: el `pubspec.yaml` y `lib/main.dart` están ahí, no en la raíz.

## Stack técnico

- **Framework:** Flutter con **Material 3** (`useMaterial3: true`, tema semilla `Colors.deepPurple`)
- **Lenguaje:** Dart
- **Plataformas previstas:** **Android** y **web** (Chrome u otros navegadores soportados)
- **Calidad:** `flutter_lints`, tests en `app/test/`

Dependencias habituales del paquete (ver `app/pubspec.yaml`): por ejemplo `cupertino_icons`; otras dependencias (p. ej. enlaces externos o iconos de marcas) pueden añadirse según la rama o versión.

## Cómo ejecutar el proyecto

```bash
cd app
flutter pub get
flutter run -d chrome   # web
# o
flutter run -d android  # dispositivo o emulador Android
```

Análisis y tests:

```bash
cd app
flutter analyze
flutter test
```

## Rutas principales (`MaterialApp`)

| Ruta | Pantalla |
|------|----------|
| `/` | Landing |
| `/login` | Inicio de sesión |
| `/signup` | Registro |
| `/recover-password` | Recuperación de contraseña |
| `/home` | Shell principal (tras flujo de auth de demostración) |

El flujo de autenticación real puede conectarse más adelante a un backend (p. ej. Supabase u otro proveedor); las pantallas actuales sirven como UI y navegación.

## Desarrollo con Cursor / VS Code

En la raíz del repo hay `launch.json` para depurar con **`cwd`** en `app/` cuando el workspace es la carpeta `LuminaWriters`. Si abres solo la carpeta `app/`, existe también `app/.vscode/launch.json` con rutas relativas a ese proyecto.

## OpenSpec

El repositorio usa un flujo **spec-driven** con OpenSpec. Resumen en [`openspec/README.md`](openspec/README.md): contexto en [`openspec/config.yaml`](openspec/config.yaml), especificaciones en [`openspec/specs/`](openspec/specs/) y cambios propuestos en [`openspec/changes/`](openspec/changes/). Las herramientas bajo `.cursor/commands/` (`opsx-*`) encajan con ese flujo.

## Ramas y evolución

El trabajo en curso (p. ej. landing ampliado, iconos sociales, ajustes de UI) puede estar en ramas **`feature/*`**. La rama **`main`** refleja la línea base integrada en el remoto.

## Licencia y publicación

El paquete Flutter está marcado como `publish_to: 'none'` en `app/pubspec.yaml` (proyecto privado / no publicado en pub.dev).

---

*Documentación generada para describir el estado general del repositorio; ajusta rutas, dependencias y ramas según tu despliegue.*
