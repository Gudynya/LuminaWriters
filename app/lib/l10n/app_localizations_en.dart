// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'LuminaWriter';

  @override
  String get languageSelectorLabel => 'Language';

  @override
  String get localeSpanishDisplay => 'Español';

  @override
  String get localeEnglishDisplay => 'English';

  @override
  String get localeCatalanDisplay => 'Catalan';

  @override
  String get landingHeadline =>
      'Welcome to LuminaWriter, your writing assistant';

  @override
  String get landingHeroSubtitle =>
      'Your creative writing companion — draft, refine, and shine.';

  @override
  String get landingFooterMotto => 'Write with light.';

  @override
  String get authLoginWelcomeHeadline => 'Welcome back';

  @override
  String get authSignUpWelcomeHeadline => 'Welcome to LuminaWriter';

  @override
  String get authLoginIntro => 'Sign in to continue writing.';

  @override
  String get authSignUpIntro => 'Join the community and start your next story.';

  @override
  String get authNewUserPrompt => 'New here?';

  @override
  String get authCreateAccountLink => 'Create an account';

  @override
  String get authExistingUserPrompt => 'Already have an account?';

  @override
  String get tooltipBack => 'Back';

  @override
  String get socialTooltipInstagram => 'Instagram';

  @override
  String get socialTooltipX => 'X';

  @override
  String get socialTooltipThreads => 'Threads';

  @override
  String get authLogIn => 'Log in';

  @override
  String get authSignUp => 'Sign up';

  @override
  String get authForgotPassword => 'Forgot password?';

  @override
  String get authLoginTitle => 'Log in';

  @override
  String get authEmailLabel => 'Email';

  @override
  String get authPasswordLabel => 'Password';

  @override
  String get authSignInButton => 'Sign in';

  @override
  String get authCreateAccountTitle => 'Create account';

  @override
  String get authRegisterButton => 'Sign up';

  @override
  String get authRecoverPasswordTitle => 'Reset password';

  @override
  String get authRecoveryInstructions =>
      'Enter your email address and we\'ll send you a link to reset your password.';

  @override
  String get authSendLinkButton => 'Send link';

  @override
  String get shellHomeTab => 'Home';

  @override
  String get shellProjectsTab => 'Projects';

  @override
  String get shellLibraryTab => 'Library';

  @override
  String get shellSettingsTab => 'Settings';

  @override
  String get appBrandNameShort => 'LuminaWriter';

  @override
  String get shellDrawerSubtitle => 'Your writing space';

  @override
  String get shellSignOut => 'Sign out';

  @override
  String shellSectionPlaceholder(String sectionName) {
    return 'Content for $sectionName is coming soon.';
  }

  @override
  String get projectsEmptyTitle => 'No literary works yet';

  @override
  String get projectsAddNewWorkButton => 'Add new';

  @override
  String get projectsAddFabTooltip => 'Add literary work';

  @override
  String get projectsNewWorkTitle => 'New literary work';

  @override
  String get projectsEditWorkTitle => 'Edit literary work';

  @override
  String get projectsEditTooltip => 'Edit';

  @override
  String get projectsProjectNameField => 'Project name';

  @override
  String get projectsPublicNameField => 'Public name';

  @override
  String get projectsWorkLanguageLabel => 'Language of the work';

  @override
  String get projectsTagsLabel => 'Tags';

  @override
  String get projectsTagsHint =>
      'Type and press Enter, or separate with commas';

  @override
  String get projectsDescriptionMarkdownLabel => 'Description (Markdown)';

  @override
  String get projectsMarkdownEditTab => 'Write';

  @override
  String get projectsMarkdownPreviewTab => 'Preview';

  @override
  String get projectsSaveButton => 'Save';

  @override
  String get projectsCancelButton => 'Cancel';

  @override
  String get projectsDeleteButton => 'Delete';

  @override
  String get projectsDeleteConfirmTitle => 'Delete literary work?';

  @override
  String projectsDeleteConfirmBody(String title) {
    return '“$title” will be removed. This cannot be undone.';
  }

  @override
  String get projectsProjectNameRequiredError => 'Enter a project name';

  @override
  String get projectsPublicNameRequiredError => 'Enter a public name';
}
