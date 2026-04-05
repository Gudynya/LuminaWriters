import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lumina_writers/data/repositories/app_repositories.dart';
import 'package:lumina_writers/l10n/app_localizations.dart';
import 'package:lumina_writers/main.dart';
import 'package:lumina_writers/screens/landing_page.dart';
import 'package:lumina_writers/screens/main_shell_page.dart';

void main() {
  testWidgets(
    'Landing muestra el título y navega a login y recuperación',
    (tester) async {
      await tester.pumpWidget(
        MyApp(
          locale: const Locale('es'),
          repositories: AppRepositories.memory(),
        ),
      );
      await tester.pumpAndSettle();

      final l10n = AppLocalizations.of(
        tester.element(find.byType(LandingPage)),
      );

      expect(find.text(l10n.landingHeadline), findsOneWidget);
      expect(find.text(l10n.authLogIn), findsOneWidget);
      expect(find.text(l10n.authSignUp), findsOneWidget);

      await tester.tap(find.text(l10n.authLogIn));
      await tester.pumpAndSettle();

      expect(find.text(l10n.authLoginWelcomeHeadline), findsOneWidget);
      expect(find.text(l10n.authForgotPassword), findsOneWidget);

      await tester.tap(find.text(l10n.authForgotPassword));
      await tester.pumpAndSettle();

      expect(find.text(l10n.authRecoverPasswordTitle), findsOneWidget);
      expect(find.text(l10n.authSendLinkButton), findsOneWidget);

      await tester.tap(find.byType(BackButton));
      await tester.pumpAndSettle();

      await tester.tap(find.text(l10n.authSignInButton));
      await tester.pumpAndSettle();

      final l10nShell = AppLocalizations.of(
        tester.element(find.byType(MainShellPage)),
      );
      expect(find.text(l10nShell.shellHomeTab), findsOneWidget);

      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();
      await tester.tap(find.text(l10nShell.shellProjectsTab));
      await tester.pumpAndSettle();

      expect(find.text(l10nShell.projectsEmptyTitle), findsOneWidget);
    },
  );
}
