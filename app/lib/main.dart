import 'package:flutter/material.dart';

import 'l10n/app_localizations.dart';
import 'screens/landing_page.dart';
import 'screens/login_page.dart';
import 'screens/main_shell_page.dart';
import 'screens/password_recovery_page.dart';
import 'screens/sign_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.locale});

  /// For tests: force a [Locale] (e.g. `Locale('es')`). In production use `null` for device locale.
  final Locale? locale;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      locale: locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      localeResolutionCallback: (deviceLocale, supported) {
        if (deviceLocale == null) return const Locale('es');
        for (final l in supported) {
          if (l.languageCode == deviceLocale.languageCode) return l;
        }
        return const Locale('es');
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingPage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/recover-password': (context) => const PasswordRecoveryPage(),
        '/home': (context) => const MainShellPage(),
      },
    );
  }
}
