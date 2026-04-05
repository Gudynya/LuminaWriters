# Tareas: logged-in-rewards-section

## 1. Internacionalización

- [x] 1.1 Añadir `shellRewardsTab` en `app_en.arb`, `app_es.arb` y `app_ca.arb` (Rewards / Recompensas / Recompenses o equivalente coherente).
- [x] 1.2 Ejecutar `flutter gen-l10n` desde `app/` (o `flutter pub get`) y verificar que `AppLocalizations` incluye el nuevo getter.

## 2. Shell y UI

- [x] 2.1 Extender `_sectionIcons` y `_sectionTitles` en `main_shell_page.dart` con la quinta sección Recompensas (icono regalo/premio acorde a Material).
- [x] 2.2 Ajustar el drawer: cuatro ítems en la lista scrollable (índices 0–3) y pie con Ajustes en índice 4; actualizar `selected`/`onTap` y cierre del drawer.
- [x] 2.3 Añadir el hijo correspondiente en el `IndexedStack` usando `_MainSectionBody` con `titles[3]` para Recompensas y desplazar Ajustes a `titles[4]`; actualizar el `ListTile` de Ajustes para usar índice 4.
- [x] 2.4 Comprobar que el FAB de Proyectos sigue condicionado a `_sectionIndex == 1` y que no hay índices obsoletos (p. ej. antiguo `3` para Ajustes).

## 3. Calidad y documentación canónica

- [x] 3.1 Ejecutar `flutter analyze` y `flutter test` en `app/`.
- [x] 3.2 Tras implementación, actualizar `openspec/specs/client/spec.md` y `openspec/specs/product/spec.md` para reflejar la nueva sección (o dejarlo para la fase de archivo según flujo del equipo).
