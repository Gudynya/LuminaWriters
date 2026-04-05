import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../widgets/language_flag_selector.dart';
import 'literary_works_section.dart';

/// Pantalla principal tras el login: [Scaffold] con menú lateral y contenido por sección.
class MainShellPage extends StatefulWidget {
  const MainShellPage({super.key, this.onLocaleChanged});

  /// Igual que en landing/login: cambia el idioma de la app (MaterialApp).
  final ValueChanged<Locale>? onLocaleChanged;

  @override
  State<MainShellPage> createState() => _MainShellPageState();
}

class _MainShellPageState extends State<MainShellPage> {
  int _sectionIndex = 0;

  final GlobalKey<LiteraryWorksSectionState> _projectsSectionKey =
      GlobalKey<LiteraryWorksSectionState>();
  int _projectWorkCount = 0;

  static const List<_MainSectionIcons> _sectionIcons = [
    _MainSectionIcons(
      icon: Icons.home_outlined,
      selectedIcon: Icons.home_rounded,
    ),
    _MainSectionIcons(
      icon: Icons.folder_outlined,
      selectedIcon: Icons.folder_rounded,
    ),
    _MainSectionIcons(
      icon: Icons.menu_book_outlined,
      selectedIcon: Icons.menu_book_rounded,
    ),
    _MainSectionIcons(
      icon: Icons.settings_outlined,
      selectedIcon: Icons.settings_rounded,
    ),
  ];

  List<String> _sectionTitles(AppLocalizations l10n) => [
        l10n.shellHomeTab,
        l10n.shellProjectsTab,
        l10n.shellLibraryTab,
        l10n.shellSettingsTab,
      ];

  void _goToSection(int index) {
    setState(() => _sectionIndex = index);
    Navigator.of(context).pop();
  }

  void _logout() {
    Navigator.of(context).pop();
    Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final titles = _sectionTitles(l10n);
    final currentTitle = titles[_sectionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(currentTitle),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.auto_stories_rounded,
                      size: 40,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l10n.appBrandNameShort,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      l10n.shellDrawerSubtitle,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    for (var i = 0; i < _sectionIcons.length; i++)
                      ListTile(
                        leading: Icon(
                          _sectionIndex == i
                              ? _sectionIcons[i].selectedIcon
                              : _sectionIcons[i].icon,
                        ),
                        title: Text(titles[i]),
                        selected: _sectionIndex == i,
                        onTap: () => _goToSection(i),
                      ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.logout_rounded),
                      title: Text(l10n.shellSignOut),
                      onTap: _logout,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            IndexedStack(
              index: _sectionIndex,
              children: [
                _MainSectionBody(
                  sectionTitle: titles[0],
                  selectedIcon: _sectionIcons[0].selectedIcon,
                  l10n: l10n,
                ),
                LiteraryWorksSection(
                  key: _projectsSectionKey,
                  onWorkCountChanged: (n) =>
                      setState(() => _projectWorkCount = n),
                ),
                _MainSectionBody(
                  sectionTitle: titles[2],
                  selectedIcon: _sectionIcons[2].selectedIcon,
                  l10n: l10n,
                ),
                _MainSectionBody(
                  sectionTitle: titles[3],
                  selectedIcon: _sectionIcons[3].selectedIcon,
                  l10n: l10n,
                ),
              ],
            ),
            if (widget.onLocaleChanged != null)
              Positioned(
                right: 16,
                bottom: 16 + MediaQuery.paddingOf(context).bottom,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (_sectionIndex == 1 && _projectWorkCount >= 7) ...[
                      Material(
                        elevation: 2,
                        shadowColor: Colors.black26,
                        borderRadius: BorderRadius.circular(16),
                        clipBehavior: Clip.antiAlias,
                        child: IconButton.filled(
                          onPressed: () =>
                              _projectsSectionKey.currentState?.openEditor(),
                          tooltip: l10n.projectsAddFabTooltip,
                          icon: const Icon(Icons.add_rounded),
                          style: IconButton.styleFrom(
                            minimumSize: const Size(44, 44),
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                    LanguageFlagSelector(
                      l10n: l10n,
                      onLocaleChanged: widget.onLocaleChanged,
                    ),
                  ],
                ),
              )
            else if (_sectionIndex == 1 && _projectWorkCount >= 7)
              Positioned(
                right: 16,
                bottom: 16 + MediaQuery.paddingOf(context).bottom,
                child: Material(
                  elevation: 2,
                  shadowColor: Colors.black26,
                  borderRadius: BorderRadius.circular(16),
                  clipBehavior: Clip.antiAlias,
                  child: IconButton.filled(
                    onPressed: () =>
                        _projectsSectionKey.currentState?.openEditor(),
                    tooltip: l10n.projectsAddFabTooltip,
                    icon: const Icon(Icons.add_rounded),
                    style: IconButton.styleFrom(
                      minimumSize: const Size(44, 44),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _MainSectionIcons {
  const _MainSectionIcons({
    required this.icon,
    required this.selectedIcon,
  });

  final IconData icon;
  final IconData selectedIcon;
}

class _MainSectionBody extends StatelessWidget {
  const _MainSectionBody({
    required this.sectionTitle,
    required this.selectedIcon,
    required this.l10n,
  });

  final String sectionTitle;
  final IconData selectedIcon;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 560),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                selectedIcon,
                size: 64,
                color: theme.colorScheme.primary.withValues(alpha: 0.85),
              ),
              const SizedBox(height: 16),
              Text(
                l10n.shellSectionPlaceholder(sectionTitle),
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
