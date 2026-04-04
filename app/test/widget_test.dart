import 'package:flutter_test/flutter_test.dart';

import 'package:lumina_writers/main.dart';
import 'package:lumina_writers/screens/landing_page.dart';
import 'package:lumina_writers/screens/login_page.dart';

void main() {
  testWidgets('Landing muestra bienvenida y navega a login y recuperación', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text(kLandingWelcome), findsOneWidget);
    expect(find.text('Log in'), findsOneWidget);
    expect(find.text('Sign up'), findsOneWidget);

    await tester.tap(find.text('Log in'));
    await tester.pumpAndSettle();

    expect(find.text(kLoginWelcomeTitle), findsOneWidget);
    expect(find.text(kLoginForgotPasswordLabel), findsOneWidget);

    await tester.tap(find.text(kLoginForgotPasswordLabel));
    await tester.pumpAndSettle();

    expect(find.text('Recuperar contraseña'), findsOneWidget);
    expect(find.text('Enviar enlace'), findsOneWidget);

    await tester.pageBack();
    await tester.pumpAndSettle();

    expect(find.text('Sign in'), findsOneWidget);

    await tester.tap(find.text('Sign in'));
    await tester.pumpAndSettle();

    expect(find.text('Inicio'), findsOneWidget);
  });
}
