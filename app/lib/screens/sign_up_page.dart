import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.authCreateAccountTitle),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              children: [
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: l10n.authEmailLabel,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: l10n.authPasswordLabel,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),
                FilledButton(
                  onPressed: () {
                    // Conectar registro cuando exista backend.
                  },
                  child: Text(l10n.authRegisterButton),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
