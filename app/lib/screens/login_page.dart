import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colorScheme.surface,
              colorScheme.primaryContainer.withValues(alpha: 0.35),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 4),
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: IconButton(
                    tooltip: l10n.tooltipBack,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(
                      minWidth: 48,
                      minHeight: 48,
                    ),
                    onPressed: () => Navigator.of(context).maybePop(),
                    icon: const Icon(Icons.arrow_back_rounded),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 420),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            l10n.authLoginWelcomeHeadline,
                            style: theme.textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.4,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            l10n.authLoginIntro,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(height: 32),
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
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () => Navigator.of(context)
                                  .pushNamed('/recover-password'),
                              child: Text(l10n.authForgotPassword),
                            ),
                          ),
                          const SizedBox(height: 8),
                          FilledButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('/home');
                            },
                            child: Text(l10n.authSignInButton),
                          ),
                          const SizedBox(height: 16),
                          Wrap(
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 4,
                            children: [
                              Text(
                                l10n.authNewUserPrompt,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushReplacementNamed('/signup');
                                },
                                child: Text(l10n.authCreateAccountLink),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
