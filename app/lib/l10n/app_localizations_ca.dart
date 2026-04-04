// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Catalan Valencian (`ca`).
class AppLocalizationsCa extends AppLocalizations {
  AppLocalizationsCa([String locale = 'ca']) : super(locale);

  @override
  String get appTitle => 'LuminaWriter';

  @override
  String get languageSelectorLabel => 'Idioma';

  @override
  String get localeSpanishDisplay => 'Castellà';

  @override
  String get localeEnglishDisplay => 'Anglès';

  @override
  String get localeCatalanDisplay => 'Català';

  @override
  String get landingHeadline =>
      'Benvingut a LuminaWriter, el teu assistent d\'escriptura';

  @override
  String get landingHeroSubtitle =>
      'El teu company d\'escriptura creativa: redacta, polimenta i brilla.';

  @override
  String get landingFooterMotto => 'Escriu amb llum.';

  @override
  String get authLoginWelcomeHeadline => 'Benvingut de nou';

  @override
  String get authSignUpWelcomeHeadline => 'Benvingut a LuminaWriter';

  @override
  String get authLoginIntro => 'Inicia la sessió per continuar escrivint.';

  @override
  String get authSignUpIntro =>
      'Uneix-te a la comunitat i comença la teva pròxima història.';

  @override
  String get authNewUserPrompt => 'Nou aquí?';

  @override
  String get authCreateAccountLink => 'Crea un compte';

  @override
  String get authExistingUserPrompt => 'Ja tens compte?';

  @override
  String get tooltipBack => 'Enrere';

  @override
  String get socialTooltipInstagram => 'Instagram';

  @override
  String get socialTooltipX => 'X';

  @override
  String get socialTooltipThreads => 'Threads';

  @override
  String get authLogIn => 'Inicia la sessió';

  @override
  String get authSignUp => 'Crea un compte';

  @override
  String get authForgotPassword => 'Has oblidat la contrasenya?';

  @override
  String get authLoginTitle => 'Inicia la sessió';

  @override
  String get authEmailLabel => 'Correu electrònic';

  @override
  String get authPasswordLabel => 'Contrasenya';

  @override
  String get authSignInButton => 'Entra';

  @override
  String get authCreateAccountTitle => 'Crea un compte';

  @override
  String get authRegisterButton => 'Registra\'t';

  @override
  String get authRecoverPasswordTitle => 'Restableix la contrasenya';

  @override
  String get authRecoveryInstructions =>
      'Introdueix el correu del teu compte i t\'enviarem un enllaç per restablir la contrasenya.';

  @override
  String get authSendLinkButton => 'Envia l\'enllaç';

  @override
  String get shellHomeTab => 'Inici';

  @override
  String get shellProjectsTab => 'Projectes';

  @override
  String get shellLibraryTab => 'Biblioteca';

  @override
  String get shellSettingsTab => 'Configuració';

  @override
  String get appBrandNameShort => 'LuminaWriter';

  @override
  String get shellDrawerSubtitle => 'El teu espai d\'escriptura';

  @override
  String get shellSignOut => 'Tanca la sessió';

  @override
  String shellSectionPlaceholder(String sectionName) {
    return 'El contingut de «$sectionName» estarà disponible aviat.';
  }
}
