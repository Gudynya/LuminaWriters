import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ca.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ca'),
    Locale('en'),
    Locale('es'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'LuminaWriter'**
  String get appTitle;

  /// No description provided for @languageSelectorLabel.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageSelectorLabel;

  /// No description provided for @localeSpanishDisplay.
  ///
  /// In en, this message translates to:
  /// **'Español'**
  String get localeSpanishDisplay;

  /// No description provided for @localeEnglishDisplay.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get localeEnglishDisplay;

  /// No description provided for @localeCatalanDisplay.
  ///
  /// In en, this message translates to:
  /// **'Catalan'**
  String get localeCatalanDisplay;

  /// No description provided for @landingHeadline.
  ///
  /// In en, this message translates to:
  /// **'Welcome to LuminaWriter, your writing assistant'**
  String get landingHeadline;

  /// No description provided for @landingHeroSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your creative writing companion — draft, refine, and shine.'**
  String get landingHeroSubtitle;

  /// No description provided for @landingFooterMotto.
  ///
  /// In en, this message translates to:
  /// **'Write with light.'**
  String get landingFooterMotto;

  /// No description provided for @authLoginWelcomeHeadline.
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get authLoginWelcomeHeadline;

  /// No description provided for @authSignUpWelcomeHeadline.
  ///
  /// In en, this message translates to:
  /// **'Welcome to LuminaWriter'**
  String get authSignUpWelcomeHeadline;

  /// No description provided for @authLoginIntro.
  ///
  /// In en, this message translates to:
  /// **'Sign in to continue writing.'**
  String get authLoginIntro;

  /// No description provided for @authSignUpIntro.
  ///
  /// In en, this message translates to:
  /// **'Join the community and start your next story.'**
  String get authSignUpIntro;

  /// No description provided for @authNewUserPrompt.
  ///
  /// In en, this message translates to:
  /// **'New here?'**
  String get authNewUserPrompt;

  /// No description provided for @authCreateAccountLink.
  ///
  /// In en, this message translates to:
  /// **'Create an account'**
  String get authCreateAccountLink;

  /// No description provided for @authExistingUserPrompt.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get authExistingUserPrompt;

  /// No description provided for @tooltipBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get tooltipBack;

  /// No description provided for @socialTooltipInstagram.
  ///
  /// In en, this message translates to:
  /// **'Instagram'**
  String get socialTooltipInstagram;

  /// No description provided for @socialTooltipX.
  ///
  /// In en, this message translates to:
  /// **'X'**
  String get socialTooltipX;

  /// No description provided for @socialTooltipThreads.
  ///
  /// In en, this message translates to:
  /// **'Threads'**
  String get socialTooltipThreads;

  /// No description provided for @authLogIn.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get authLogIn;

  /// No description provided for @authSignUp.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get authSignUp;

  /// No description provided for @authForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get authForgotPassword;

  /// No description provided for @authLoginTitle.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get authLoginTitle;

  /// No description provided for @authEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get authEmailLabel;

  /// No description provided for @authPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get authPasswordLabel;

  /// No description provided for @authSignInButton.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get authSignInButton;

  /// No description provided for @authCreateAccountTitle.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get authCreateAccountTitle;

  /// No description provided for @authRegisterButton.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get authRegisterButton;

  /// No description provided for @authRecoverPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get authRecoverPasswordTitle;

  /// No description provided for @authRecoveryInstructions.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address and we\'ll send you a link to reset your password.'**
  String get authRecoveryInstructions;

  /// No description provided for @authSendLinkButton.
  ///
  /// In en, this message translates to:
  /// **'Send link'**
  String get authSendLinkButton;

  /// No description provided for @shellHomeTab.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get shellHomeTab;

  /// No description provided for @shellProjectsTab.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get shellProjectsTab;

  /// No description provided for @shellLibraryTab.
  ///
  /// In en, this message translates to:
  /// **'Library'**
  String get shellLibraryTab;

  /// No description provided for @shellSettingsTab.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get shellSettingsTab;

  /// No description provided for @appBrandNameShort.
  ///
  /// In en, this message translates to:
  /// **'LuminaWriter'**
  String get appBrandNameShort;

  /// No description provided for @shellDrawerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your writing space'**
  String get shellDrawerSubtitle;

  /// No description provided for @shellSignOut.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get shellSignOut;

  /// No description provided for @shellSectionPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Content for {sectionName} is coming soon.'**
  String shellSectionPlaceholder(String sectionName);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ca', 'en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ca':
      return AppLocalizationsCa();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
