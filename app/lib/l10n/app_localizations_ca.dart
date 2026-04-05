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
  String get shellLibraryTab => 'Comunitat';

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

  @override
  String get projectsEmptyTitle => 'Encara no hi ha obres';

  @override
  String get projectsAddNewWorkButton => 'Afegir nova';

  @override
  String get projectsAddFabTooltip => 'Afegir obra';

  @override
  String get projectsNewWorkTitle => 'Obra literària nova';

  @override
  String get projectsEditWorkTitle => 'Edita l\'obra literària';

  @override
  String get projectsEditTooltip => 'Edita';

  @override
  String get projectsProjectNameField => 'Nom del projecte';

  @override
  String get projectsPublicNameField => 'Nom públic';

  @override
  String get projectsWorkLanguageLabel => 'Idioma de l\'obra';

  @override
  String get projectsTagsLabel => 'Etiquetes';

  @override
  String get projectsTagsHint => 'Escriu i prem Enter, o separa amb comes';

  @override
  String get projectsDescriptionMarkdownLabel => 'Descripció';

  @override
  String get projectsMarkdownEditTab => 'Escriure';

  @override
  String get projectsMarkdownPreviewTab => 'Vista prèvia';

  @override
  String get projectsSaveButton => 'Desa';

  @override
  String get projectsCancelButton => 'Cancel·la';

  @override
  String get projectsDeleteButton => 'Elimina';

  @override
  String get projectsDeleteConfirmTitle => 'Vols eliminar l\'obra?';

  @override
  String projectsDeleteConfirmBody(String title) {
    return 'S\'eliminarà «$title». Aquesta acció no es pot desfer.';
  }

  @override
  String get projectsProjectNameRequiredError =>
      'Introdueix un nom de projecte';

  @override
  String get projectsPublicNameRequiredError => 'Introdueix un nom públic';
}
