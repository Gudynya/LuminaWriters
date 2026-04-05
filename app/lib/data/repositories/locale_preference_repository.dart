import 'package:flutter/material.dart';

/// Preferencia de idioma de la UI (`ca` / `en` / `es`); `null` = usar resolución por dispositivo.
abstract class LocalePreferenceRepository {
  Future<Locale?> getPreferredLocale();

  Future<void> setPreferredLocale(Locale locale);
}
