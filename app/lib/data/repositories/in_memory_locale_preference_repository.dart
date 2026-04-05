import 'package:flutter/material.dart';

import 'locale_preference_repository.dart';

class InMemoryLocalePreferenceRepository implements LocalePreferenceRepository {
  Locale? _locale;

  @override
  Future<Locale?> getPreferredLocale() async => _locale;

  @override
  Future<void> setPreferredLocale(Locale locale) async {
    _locale = locale;
  }
}
