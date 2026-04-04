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

class MyApp extends StatefulWidget {
  const MyApp({super.key, this.locale});

  /// For tests: force a [Locale] (e.g. `Locale('es')`). In production use `null`
  /// to follow the device / browser locale on first frame.
  final Locale? locale;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Locale _locale;

  static Locale _resolveToSupported(Locale? deviceLocale) {
    if (deviceLocale == null) return const Locale('es');
    for (final l in AppLocalizations.supportedLocales) {
      if (l.languageCode == deviceLocale.languageCode) {
        return Locale(deviceLocale.languageCode);
      }
    }
    return const Locale('es');
  }

  @override
  void initState() {
    super.initState();
    if (widget.locale != null) {
      _locale = _resolveToSupported(widget.locale);
    } else {
      _locale = _resolveToSupported(
        WidgetsBinding.instance.platformDispatcher.locale,
      );
    }
  }

  @override
  void didUpdateWidget(MyApp oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.locale != null && widget.locale != oldWidget.locale) {
      _locale = _resolveToSupported(widget.locale);
    }
  }

  void _setLocale(Locale locale) {
    setState(() {
      _locale = _resolveToSupported(locale);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      locale: _locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      localeResolutionCallback: (deviceLocale, supported) {
        if (deviceLocale == null) return const Locale('es');
        for (final l in supported) {
          if (l.languageCode == deviceLocale.languageCode) {
            return Locale(deviceLocale.languageCode);
          }
        }
        return const Locale('es');
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LandingPage(onLocaleChanged: _setLocale),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/recover-password': (context) => const PasswordRecoveryPage(),
        '/home': (context) => const MainShellPage(),
      },
    );
  }
}
