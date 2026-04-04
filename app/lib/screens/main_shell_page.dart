import 'package:flutter/material.dart';

/// Pantalla principal tras el login: [Scaffold] con menú lateral y contenido por sección.
class MainShellPage extends StatefulWidget {
  const MainShellPage({super.key});

  @override
  State<MainShellPage> createState() => _MainShellPageState();
}

class _MainShellPageState extends State<MainShellPage> {
  int _sectionIndex = 0;

  static const List<_MainSection> _sections = [
    _MainSection(
      title: 'Inicio',
      icon: Icons.home_outlined,
      selectedIcon: Icons.home_rounded,
    ),
    _MainSection(
      title: 'Proyectos',
      icon: Icons.folder_outlined,
      selectedIcon: Icons.folder_rounded,
    ),
    _MainSection(
      title: 'Biblioteca',
      icon: Icons.menu_book_outlined,
      selectedIcon: Icons.menu_book_rounded,
    ),
    _MainSection(
      title: 'Ajustes',
      icon: Icons.settings_outlined,
      selectedIcon: Icons.settings_rounded,
    ),
  ];

  void _goToSection(int index) {
    setState(() => _sectionIndex = index);
    Navigator.of(context).pop(); // Cierra el drawer
  }

  void _logout() {
    Navigator.of(context).pop(); // Cierra el drawer si sigue abierto
    Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final current = _sections[_sectionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(current.title),
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
                      'LuminaWriter',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Tu espacio de escritura',
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
                    for (var i = 0; i < _sections.length; i++)
                      ListTile(
                        leading: Icon(
                          _sectionIndex == i
                              ? _sections[i].selectedIcon
                              : _sections[i].icon,
                        ),
                        title: Text(_sections[i].title),
                        selected: _sectionIndex == i,
                        onTap: () => _goToSection(i),
                      ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.logout_rounded),
                      title: const Text('Cerrar sesión'),
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
        child: _MainSectionBody(section: current),
      ),
    );
  }
}

class _MainSection {
  const _MainSection({
    required this.title,
    required this.icon,
    required this.selectedIcon,
  });

  final String title;
  final IconData icon;
  final IconData selectedIcon;
}

class _MainSectionBody extends StatelessWidget {
  const _MainSectionBody({required this.section});

  final _MainSection section;

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
                section.selectedIcon,
                size: 64,
                color: theme.colorScheme.primary.withValues(alpha: 0.85),
              ),
              const SizedBox(height: 16),
              Text(
                'Contenido de «${section.title}» próximamente.',
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
