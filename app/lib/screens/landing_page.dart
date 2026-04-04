import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../l10n/app_localizations.dart';

/// Imagen de hero (libre de uso vía Unsplash; sustituye por asset local si prefieres offline).
const String kLandingHeroImageUrl =
    'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?auto=format&fit=crop&w=1400&q=80';

/// Enlaces sociales (ajusta a las cuentas reales de LuminaWriter).
const String kSocialInstagramUrl = 'https://www.instagram.com/luminawriters/';
const String kSocialXUrl = 'https://x.com/luminawriters';
const String kSocialThreadsUrl = 'https://www.threads.net/@luminawriters';

/// Banderas como secuencias Unicode (español / inglés).
const String kFlagEmojiEs = '🇪🇸';
const String kFlagEmojiEn = '🇬🇧';

/// Ancho reservado en la franja inferior del hero para no solapar el lema con las banderas.
const double _kLanguageFlagsReserveWidth = 104;

Future<void> _openExternalUrl(String url) async {
  final uri = Uri.parse(url);
  await launchUrl(uri, mode: LaunchMode.externalApplication);
}

/// Coincide con [AppLocalizations.supportedLocales] usando solo el código de idioma.
Locale _supportedLocaleFrom(BuildContext context) {
  final loc = Localizations.localeOf(context);
  for (final l in AppLocalizations.supportedLocales) {
    if (l.languageCode == loc.languageCode) {
      return Locale(loc.languageCode);
    }
  }
  return const Locale('es');
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key, this.onLocaleChanged});

  final ValueChanged<Locale>? onLocaleChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context);
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SafeArea(
                bottom: false,
                child: _LandingHeader(
                  colorScheme: colorScheme,
                  l10n: l10n,
                ),
              ),
              Expanded(
                child: _HeroImage(
                  colorScheme: colorScheme,
                  theme: theme,
                  l10n: l10n,
                ),
              ),
            ],
          ),
          Positioned(
            right: 16,
            bottom: 16 + bottomInset,
            child: _LanguageFlagSelector(
              l10n: l10n,
              onLocaleChanged: onLocaleChanged,
            ),
          ),
        ],
      ),
    );
  }
}

/// Selector compacto con banderas (emoji) en la esquina inferior derecha.
class _LanguageFlagSelector extends StatelessWidget {
  const _LanguageFlagSelector({
    required this.l10n,
    this.onLocaleChanged,
  });

  final AppLocalizations l10n;
  final ValueChanged<Locale>? onLocaleChanged;

  @override
  Widget build(BuildContext context) {
    final current = _supportedLocaleFrom(context);

    return Tooltip(
      message: l10n.languageSelectorLabel,
      child: Material(
        color: Colors.black.withValues(alpha: 0.42),
        borderRadius: BorderRadius.circular(28),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _FlagButton(
                locale: const Locale('es'),
                emoji: kFlagEmojiEs,
                tooltip: l10n.localeSpanishDisplay,
                selected: current.languageCode == 'es',
                onSelected: onLocaleChanged,
              ),
              const SizedBox(width: 4),
              _FlagButton(
                locale: const Locale('en'),
                emoji: kFlagEmojiEn,
                tooltip: l10n.localeEnglishDisplay,
                selected: current.languageCode == 'en',
                onSelected: onLocaleChanged,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FlagButton extends StatelessWidget {
  const _FlagButton({
    required this.locale,
    required this.emoji,
    required this.tooltip,
    required this.selected,
    this.onSelected,
  });

  final Locale locale;
  final String emoji;
  final String tooltip;
  final bool selected;
  final ValueChanged<Locale>? onSelected;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onSelected == null ? null : () => onSelected!(locale),
          borderRadius: BorderRadius.circular(22),
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: selected
                      ? Colors.white
                      : Colors.white.withValues(alpha: 0.35),
                  width: selected ? 2 : 1,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Text(
                  emoji,
                  style: const TextStyle(fontSize: 26, height: 1.1),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LandingHeader extends StatelessWidget {
  const _LandingHeader({
    required this.colorScheme,
    required this.l10n,
  });

  final ColorScheme colorScheme;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final narrow = constraints.maxWidth < 420;
        final brand = Row(
          children: [
            Icon(
              Icons.auto_stories_rounded,
              size: 32,
              color: colorScheme.primary,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                l10n.appTitle,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.3,
                    ),
              ),
            ),
          ],
        );
        final actions = Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () => Navigator.of(context).pushNamed('/login'),
              child: Text(l10n.authLogIn),
            ),
            const SizedBox(width: 4),
            FilledButton(
              onPressed: () => Navigator.of(context).pushNamed('/signup'),
              child: Text(l10n.authSignUp),
            ),
          ],
        );

        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 16, 8),
          child: narrow
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    brand,
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerRight,
                      child: actions,
                    ),
                  ],
                )
              : Row(
                  children: [
                    Expanded(child: brand),
                    const SizedBox(width: 12),
                    actions,
                  ],
                ),
        );
      },
    );
  }
}

class _HeroImage extends StatelessWidget {
  const _HeroImage({
    required this.colorScheme,
    required this.theme,
    required this.l10n,
  });

  final ColorScheme colorScheme;
  final ThemeData theme;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          kLandingHeroImageUrl,
          fit: BoxFit.cover,
          alignment: Alignment.center,
          filterQuality: FilterQuality.medium,
          width: double.infinity,
          height: double.infinity,
          errorBuilder: (context, error, stackTrace) =>
              _HeroFallback(colorScheme: colorScheme),
          loadingBuilder: (context, child, progress) {
            if (progress == null) return child;
            return _HeroFallback(
              colorScheme: colorScheme,
              showSpinner: true,
            );
          },
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withValues(alpha: 0.2),
                Colors.black.withValues(alpha: 0.45),
              ],
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  l10n.landingHeadline,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.5,
                    height: 1.2,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black.withValues(alpha: 0.55),
                        blurRadius: 16,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  l10n.landingHeroSubtitle,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.white.withValues(alpha: 0.92),
                    height: 1.45,
                    shadows: [
                      Shadow(
                        color: Colors.black.withValues(alpha: 0.45),
                        blurRadius: 12,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 16,
          right: 16 + _kLanguageFlagsReserveWidth,
          bottom: 16 + bottomInset,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _SocialIconLink(
                tooltip: l10n.socialTooltipInstagram,
                icon: FontAwesomeIcons.instagram,
                url: kSocialInstagramUrl,
              ),
              const SizedBox(width: 4),
              _SocialIconLink(
                tooltip: l10n.socialTooltipX,
                icon: FontAwesomeIcons.xTwitter,
                url: kSocialXUrl,
              ),
              const SizedBox(width: 4),
              _SocialIconLink(
                tooltip: l10n.socialTooltipThreads,
                icon: FontAwesomeIcons.threads,
                url: kSocialThreadsUrl,
              ),
              const Spacer(),
              Flexible(
                child: Text(
                  l10n.landingFooterMotto,
                  textAlign: TextAlign.end,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    shadows: [
                      Shadow(
                        color: Colors.black.withValues(alpha: 0.45),
                        blurRadius: 12,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SocialIconLink extends StatelessWidget {
  const _SocialIconLink({
    required this.tooltip,
    required this.icon,
    required this.url,
  });

  final String tooltip;
  final FaIconData icon;
  final String url;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: tooltip,
      onPressed: () => _openExternalUrl(url),
      style: IconButton.styleFrom(
        foregroundColor: Colors.white,
        padding: const EdgeInsets.all(10),
        minimumSize: const Size(44, 44),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      icon: FaIcon(
        icon,
        size: 22,
        shadows: [
          Shadow(
            color: Colors.black.withValues(alpha: 0.45),
            blurRadius: 8,
          ),
        ],
      ),
    );
  }
}

class _HeroFallback extends StatelessWidget {
  const _HeroFallback({
    required this.colorScheme,
    this.showSpinner = false,
  });

  final ColorScheme colorScheme;
  final bool showSpinner;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme.primaryContainer,
            colorScheme.secondaryContainer,
          ],
        ),
      ),
      child: Center(
        child: showSpinner
            ? CircularProgressIndicator(color: colorScheme.primary)
            : Icon(
                Icons.menu_book_rounded,
                size: 88,
                color: colorScheme.primary.withValues(alpha: 0.85),
              ),
      ),
    );
  }
}
