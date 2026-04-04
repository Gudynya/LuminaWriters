import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.auto_stories_rounded,
                    size: 56,
                    color: colorScheme.primary,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    l10n.landingHeadline,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      height: 1.35,
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed('/login'),
                      child: Text(l10n.authLogIn),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed('/signup'),
                      child: Text(l10n.authSignUp),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () => Navigator.of(context)
                        .pushNamed('/recover-password'),
                    child: Text(l10n.authForgotPassword),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
