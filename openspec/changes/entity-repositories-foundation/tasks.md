## 1. Contratos y capa en memoria

- [x] 1.1 Crear en `app/lib/` la estructura acordada (p. ej. `data/repositories/`) con interfaces `LiteraryWorkRepository`, `SessionRepository` (o nombre alineado con diseño) y `LocalePreferenceRepository`, métodos asíncronos según `design.md`.
- [x] 1.2 Implementar variantes en memoria de los tres repositorios, con comportamiento equivalente al MVP actual para obras, sesión simulada y locale (sin persistencia entre reinicios salvo decisión explícita de añadir `shared_preferences`).
- [x] 1.3 Añadir pruebas unitarias mínimas para las implementaciones en memoria (CRUD de obras, transiciones de sesión, lectura/escritura de locale) si el coste es razonable.

## 2. Composición e inyección

- [x] 2.1 Instanciar los repositorios en el punto de composición (`main.dart` / `MyApp`) y propagarlos por constructores a `MainShellPage`, `LiteraryWorksSection` y demás pantallas que lo requieran.
- [x] 2.2 Ajustar `LiteraryWorksSection` para usar el repositorio de obras como fuente de verdad (cargar, crear, actualizar, eliminar) y eliminar la lista privada como único almacenamiento.
- [x] 2.3 Conectar `SessionRepository` al flujo de login/cierre de sesión según el diseño (navegación a `/home` y vuelta a `/` sin romper rutas existentes).
- [x] 2.4 Conectar `LocalePreferenceRepository` con `MyApp` y el selector de idioma (`onLocaleChanged`), manteniendo `AppLocalizations` y banderas actuales.

## 3. Calidad y regresiones

- [x] 3.1 Actualizar o añadir tests de widget según sea necesario para inyectar repositorios en memoria o dobles.
- [x] 3.2 Ejecutar `flutter analyze` y `flutter test` desde `app/` y corregir fallos.
