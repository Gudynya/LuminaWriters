import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import 'catalunya_senyera_flag.dart';

/// Banderas Unicode estándar (es / en). Catalán: [SenyeraFlag] (cas puntual, ver archivo).
const String kFlagEmojiEs = '🇪🇸';
const String kFlagEmojiEn = '🇬🇧';

/// Diámetro visual del chip circular (emoji / senyera).
const double _kFlagChipDiameter = 36;

/// Coincide con [AppLocalizations.supportedLocales] usando solo el código de idioma.
Locale supportedLocaleFromContext(BuildContext context) {
  final loc = Localizations.localeOf(context);
  for (final l in AppLocalizations.supportedLocales) {
    if (l.languageCode == loc.languageCode) {
      return Locale(loc.languageCode);
    }
  }
  return const Locale('es');
}

/// Selector compacto: mismos chips circulares para ES, EN y CA.
class LanguageFlagSelector extends StatelessWidget {
  const LanguageFlagSelector({
    super.key,
    required this.l10n,
    this.onLocaleChanged,
    this.expandWidth = false,
    this.removeBackground = false,
  });

  final AppLocalizations l10n;
  final ValueChanged<Locale>? onLocaleChanged;
  final bool expandWidth;
  final bool removeBackground;

  @override
  Widget build(BuildContext context) {
    final current = supportedLocaleFromContext(context);
    final onLightSurface = removeBackground;

    final row = Row(
      mainAxisSize: expandWidth ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment:
          expandWidth ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.start,
      children: [
        _LocaleChip(
          locale: const Locale('es'),
          emoji: kFlagEmojiEs,
          tooltip: l10n.localeSpanishDisplay,
          selected: current.languageCode == 'es',
          onSelected: onLocaleChanged,
          onLightSurface: onLightSurface,
        ),
        if (!expandWidth) const SizedBox(width: 4),
        _LocaleChip(
          locale: const Locale('en'),
          emoji: kFlagEmojiEn,
          tooltip: l10n.localeEnglishDisplay,
          selected: current.languageCode == 'en',
          onSelected: onLocaleChanged,
          onLightSurface: onLightSurface,
        ),
        if (!expandWidth) const SizedBox(width: 4),
        _LocaleChip(
          locale: const Locale('ca'),
          customFlag: const SenyeraFlag(size: 26),
          tooltip: l10n.localeCatalanDisplay,
          selected: current.languageCode == 'ca',
          onSelected: onLocaleChanged,
          onLightSurface: onLightSurface,
        ),
      ],
    );

    final padded = Padding(
      padding: EdgeInsets.symmetric(
        horizontal: expandWidth ? 0 : 6,
        vertical: 4,
      ),
      child: expandWidth ? SizedBox(width: double.infinity, child: row) : row,
    );

    return Tooltip(
      message: l10n.languageSelectorLabel,
      child: removeBackground
          ? padded
          : Material(
              color: Colors.black.withValues(alpha: 0.42),
              borderRadius: BorderRadius.circular(28),
              clipBehavior: Clip.antiAlias,
              child: padded,
            ),
    );
  }
}

class _LocaleChip extends StatelessWidget {
  const _LocaleChip({
    required this.locale,
    required this.tooltip,
    required this.selected,
    this.onSelected,
    this.emoji,
    this.customFlag,
    this.onLightSurface = false,
  }) : assert(
          (emoji != null) ^ (customFlag != null),
          'Provide exactly one of emoji or customFlag',
        );

  final Locale locale;
  final String tooltip;
  final bool selected;
  final ValueChanged<Locale>? onSelected;
  final String? emoji;
  final Widget? customFlag;
  final bool onLightSurface;

  @override
  Widget build(BuildContext context) {
    final Color borderColor;
    final double borderWidth;
    if (onLightSurface) {
      final scheme = Theme.of(context).colorScheme;
      borderColor = selected ? scheme.primary : scheme.outline.withValues(alpha: 0.55);
      borderWidth = selected ? 2.5 : 1.0;
    } else {
      borderColor = selected
          ? Colors.white
          : Colors.white.withValues(alpha: 0.4);
      borderWidth = selected ? 2.5 : 1.0;
    }

    return Tooltip(
      message: tooltip,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onSelected == null ? null : () => onSelected!(locale),
          child: SizedBox(
            width: _kFlagChipDiameter,
            height: _kFlagChipDiameter,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: borderColor,
                  width: borderWidth,
                ),
                boxShadow: onLightSurface
                    ? null
                    : [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.25),
                          blurRadius: 3,
                          offset: const Offset(0, 1),
                        ),
                      ],
              ),
              child: ClipOval(
                child: Padding(
                  padding: const EdgeInsets.all(2.5),
                  child: Center(
                    child: emoji != null
                        ? Text(
                            emoji!,
                            style: const TextStyle(
                              fontSize: 22,
                              height: 1.0,
                            ),
                            textAlign: TextAlign.center,
                          )
                        : customFlag!,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
