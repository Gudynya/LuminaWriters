import 'package:flutter/material.dart';

import 'screens/landing_page.dart';
import 'screens/login_page.dart';
import 'screens/main_shell_page.dart';
import 'screens/password_recovery_page.dart';
import 'screens/sign_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LuminaWriters',
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
