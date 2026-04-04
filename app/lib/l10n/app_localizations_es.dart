// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'LuminaWriter';

  @override
  String get languageSelectorLabel => 'Idioma';

  @override
  String get localeSpanishDisplay => 'Español';

  @override
  String get localeEnglishDisplay => 'English';

  @override
  String get landingHeadline =>
      'Bienvenido a LuminaWriter, tu asistente de escritura';

  @override
  String get landingHeroSubtitle =>
      'Tu compañero de escritura creativa: redacta, pule y brilla.';

  @override
  String get landingFooterMotto => 'Escribe con luz.';

  @override
  String get authLoginWelcomeHeadline => 'Bienvenido de nuevo';

  @override
  String get authSignUpWelcomeHeadline => 'Bienvenido a LuminaWriter';

  @override
  String get authLoginIntro => 'Inicia sesión para seguir escribiendo.';

  @override
  String get authSignUpIntro =>
      'Únete a la comunidad y empieza tu próxima historia.';

  @override
  String get authNewUserPrompt => '¿Nuevo aquí?';

  @override
  String get authCreateAccountLink => 'Crear una cuenta';

  @override
  String get authExistingUserPrompt => '¿Ya tienes cuenta?';

  @override
  String get tooltipBack => 'Atrás';

  @override
  String get socialTooltipInstagram => 'Instagram';

  @override
  String get socialTooltipX => 'X';

  @override
  String get socialTooltipThreads => 'Threads';

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
    return 'El contenido de «$sectionName» estará disponible pronto.';
  }
}
