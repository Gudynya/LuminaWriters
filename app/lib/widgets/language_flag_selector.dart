import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

/// Banderas como secuencias Unicode (español / inglés).
const String kFlagEmojiEs = '🇪🇸';
const String kFlagEmojiEn = '🇬🇧';

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

/// Selector compacto con banderas (emoji), típicamente en esquina inferior derecha.
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
