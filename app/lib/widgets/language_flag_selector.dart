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
  });

  final AppLocalizations l10n;
  final ValueChanged<Locale>? onLocaleChanged;

  @override
  Widget build(BuildContext context) {
    final current = supportedLocaleFromContext(context);

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
              _LocaleChip(
                locale: const Locale('es'),
                emoji: kFlagEmojiEs,
                tooltip: l10n.localeSpanishDisplay,
                selected: current.languageCode == 'es',
                onSelected: onLocaleChanged,
              ),
              const SizedBox(width: 4),
              _LocaleChip(
                locale: const Locale('en'),
                emoji: kFlagEmojiEn,
                tooltip: l10n.localeEnglishDisplay,
                selected: current.languageCode == 'en',
                onSelected: onLocaleChanged,
              ),
              const SizedBox(width: 4),
              _LocaleChip(
                locale: const Locale('ca'),
                customFlag: const SenyeraFlag(size: 26),
                tooltip: l10n.localeCatalanDisplay,
                selected: current.languageCode == 'ca',
                onSelected: onLocaleChanged,
              ),
            ],
          ),
        ),
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

  @override
  Widget build(BuildContext context) {
    final borderColor = selected
        ? Colors.white
        : Colors.white.withValues(alpha: 0.4);
    final borderWidth = selected ? 2.5 : 1.0;

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
                boxShadow: [
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
