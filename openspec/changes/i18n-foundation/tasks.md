# Tareas: i18n-foundation

- [x] Añadir `flutter_localizations` e `intl` en `app/pubspec.yaml` y ejecutar `flutter pub get`.
- [x] Crear `l10n.yaml` y directorio ARB; definir `template-arb-file` (p. ej. inglés o español como plantilla según decisión).
- [x] Poblar `app_en.arb` y `app_es.arb` con las cadenas de la primera oleada de pantallas.
- [x] Ejecutar `flutter gen-l10n` (o dejar que el build lo genere) y verificar que `AppLocalizations` se genera en `app/.dart_tool` / `lib/generated` según configuración.
- [x] Configurar `MaterialApp` en `main.dart` con delegados y `supportedLocales`.
- [x] Migrar strings en `landing_page.dart` (y rutas relacionadas según alcance).
- [x] Migrar strings en `login_page.dart`, `sign_up_page.dart`, `password_recovery_page.dart`.
- [x] Migrar strings en `main_shell_page.dart` y textos del drawer/bottom nav.
- [x] Actualizar `test/widget_test.dart` (y otros tests) para locales y aserciones.
- [x] Actualizar `openspec/specs/client/spec.md` con sección i18n y convención ARB.
- [x] Selector de idioma en el landing (estado en `MyApp`, locale inicial desde navegador/dispositivo, UI con banderas en esquina inferior derecha).
- [x] Unificar nombre visible **LuminaWriter** en ARB, plataformas y documentación; revisión de copy en inglés.
- [x] Sincronizar OpenSpec (propuesta, diseño, `client/spec.md`, producto) con el comportamiento implementado.
- [x] `flutter analyze` y `flutter test` en verde.
