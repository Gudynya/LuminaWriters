// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'LuminaWriters';

  @override
  String get landingHeadline =>
      'Bienvenido a LuminaWriter, tu asistente de escritores';

  @override
  String get authLogIn => 'Iniciar sesión';

  @override
  String get authSignUp => 'Crear cuenta';

  @override
  String get authForgotPassword => '¿Olvidaste tu contraseña?';

  @override
  String get authLoginTitle => 'Iniciar sesión';

  @override
  String get authEmailLabel => 'Correo electrónico';

  @override
  String get authPasswordLabel => 'Contraseña';

  @override
  String get authSignInButton => 'Entrar';

  @override
  String get authCreateAccountTitle => 'Crear cuenta';

  @override
  String get authRegisterButton => 'Registrarse';

  @override
  String get authRecoverPasswordTitle => 'Recuperar contraseña';

  @override
  String get authRecoveryInstructions =>
      'Introduce el correo de tu cuenta y te enviaremos un enlace para elegir una contraseña nueva.';

  @override
  String get authSendLinkButton => 'Enviar enlace';

  @override
  String get shellHomeTab => 'Inicio';

  @override
  String get shellProjectsTab => 'Proyectos';

  @override
  String get shellLibraryTab => 'Biblioteca';

  @override
  String get shellSettingsTab => 'Ajustes';

  @override
  String get appBrandNameShort => 'LuminaWriter';

  @override
  String get shellDrawerSubtitle => 'Tu espacio de escritura';

  @override
  String get shellSignOut => 'Cerrar sesión';

  @override
  String shellSectionPlaceholder(String sectionName) {
    return 'Contenido de «$sectionName» próximamente.';
  }
}
