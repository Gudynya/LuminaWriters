import 'package:flutter_test/flutter_test.dart';

import 'package:lumina_writers/main.dart';
import 'package:lumina_writers/screens/landing_page.dart';

void main() {
  testWidgets('Landing muestra el título y navega a login', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text(kLandingHeadline), findsOneWidget);
    expect(find.text('Iniciar sesión'), findsOneWidget);
    expect(find.text('Crear cuenta'), findsOneWidget);
    expect(find.text('¿Olvidaste tu contraseña?'), findsOneWidget);

    await tester.tap(find.text('¿Olvidaste tu contraseña?'));
    await tester.pumpAndSettle();

    expect(find.text('Recuperar contraseña'), findsOneWidget);
    expect(find.text('Enviar enlace'), findsOneWidget);

    await tester.pageBack();
    await tester.pumpAndSettle();

    await tester.tap(find.text('Iniciar sesión'));
    await tester.pumpAndSettle();

    expect(find.text('Entrar'), findsOneWidget);

    await tester.tap(find.text('Entrar'));
    await tester.pumpAndSettle();

    expect(find.text('Inicio'), findsOneWidget);
  });
}
