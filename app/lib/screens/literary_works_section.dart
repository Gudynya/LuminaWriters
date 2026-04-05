import 'package:flutter/material.dart';

import '../data/repositories/literary_work_repository.dart';
import '../l10n/app_localizations.dart';
import '../models/literary_work.dart';
import 'literary_work_editor_page.dart';

/// Lista y CRUD de obras vía [literaryWorkRepository] (MVP: implementación en memoria).
///
/// Con **7 o más** obras el **+** lo pinta [MainShellPage] en un Stack encima del contenido
/// (sin encoger el ancho de la lista). Con **menos de 7** hay un botón «Añadir nueva» (sin +).
class LiteraryWorksSection extends StatefulWidget {
  const LiteraryWorksSection({
    super.key,
    required this.literaryWorkRepository,
    this.onWorkCountChanged,
  });

  final LiteraryWorkRepository literaryWorkRepository;

  /// Notifica el número de obras (p. ej. para el FAB en el shell).
  final ValueChanged<int>? onWorkCountChanged;

  @override
  LiteraryWorksSectionState createState() => LiteraryWorksSectionState();
}

class LiteraryWorksSectionState extends State<LiteraryWorksSection> {
  List<LiteraryWork> _works = [];

  /// Márgenes laterales mínimos (el [+] y los idiomas van en un Stack encima, sin reservar hueco).
  static double _contentHorizontalPadding(double maxWidth) {
    if (maxWidth < 360) return 8;
    if (maxWidth < 600) return 12;
    return 16;
  }

  /// Espacio bajo la lista cuando el shell muestra [+] + idiomas (no solapar contenido).
  static double _bottomScrollPadding(BuildContext context) {
    final safe = MediaQuery.paddingOf(context).bottom;
    // ~44 (botón) + 16 (hueco) + ~52 (banderas) + 16 (aire)
    return 128 + safe;
  }

  void _notifyCount() {
    widget.onWorkCountChanged?.call(_works.length);
  }

  Future<void> _refreshFromRepository() async {
    final list = await widget.literaryWorkRepository.listWorks();
    if (!mounted) return;
    setState(() => _works = list);
    _notifyCount();
  }

  @override
  void initState() {
    super.initState();
    _refreshFromRepository();
  }

  /// Abre el editor (usado desde el FAB del shell cuando hay ≥ 7 obras).
  void openEditor() => _openEditor();

  Future<void> _openEditor({LiteraryWork? existing}) async {
    final result = await Navigator.of(context).push<LiteraryWorkFormResult>(
      MaterialPageRoute(
        builder: (ctx) => LiteraryWorkEditorPage(existing: existing),
      ),
    );

    if (result == null || !mounted) return;

    if (existing == null) {
      await widget.literaryWorkRepository.create(
        projectName: result.projectName,
        publicName: result.publicName,
        descriptionMarkdown: result.descriptionMarkdown,
        tags: result.tags,
        languageCode: result.languageCode,
      );
    } else {
      await widget.literaryWorkRepository.update(
        LiteraryWork(
          id: existing.id,
          projectName: result.projectName,
          publicName: result.publicName,
          descriptionMarkdown: result.descriptionMarkdown,
          tags: result.tags,
          languageCode: result.languageCode,
        ),
      );
    }
    await _refreshFromRepository();
  }

  Future<void> _confirmDelete(LiteraryWork work) async {
    final l10n = AppLocalizations.of(context);
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.projectsDeleteConfirmTitle),
        content: Text(l10n.projectsDeleteConfirmBody(work.publicName)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(l10n.projectsCancelButton),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              foregroundColor: Theme.of(ctx).colorScheme.onError,
              backgroundColor: Theme.of(ctx).colorScheme.error,
            ),
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(l10n.projectsDeleteButton),
          ),
        ],
      ),
    );
    if (ok == true && mounted) {
      await widget.literaryWorkRepository.deleteWork(work.id);
      await _refreshFromRepository();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final n = _works.length;
    final showTextAdd = n < 7;

    return LayoutBuilder(
      builder: (context, constraints) {
        final maxW = constraints.maxWidth;
        final maxH = constraints.maxHeight;
        final hp = _contentHorizontalPadding(maxW);
        final bottomPad = n >= 7 ? _bottomScrollPadding(context) : hp;

        return SizedBox(
          width: maxW,
          height: maxH,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
                if (showTextAdd && n > 0)
                  Padding(
                    padding: EdgeInsets.fromLTRB(hp, hp, hp, 12),
                    child: FilledButton(
                      onPressed: () => _openEditor(),
                      child: Text(l10n.projectsAddNewWorkButton),
                    ),
                  ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      hp,
                      (showTextAdd && n > 0) ? 0 : hp,
                      hp,
                      bottomPad,
                    ),
                    child: n == 0
                        ? _EmptyState(
                            l10n: l10n,
                            theme: theme,
                            onAdd: () => _openEditor(),
                          )
                        : ListView.separated(
                            itemCount: n,
                            separatorBuilder: (context, _) =>
                                const SizedBox(height: 8),
                            itemBuilder: (context, index) {
                              final w = _works[index];
                              return Card(
                                margin: EdgeInsets.zero,
                                clipBehavior: Clip.antiAlias,
                                child: ListTile(
                                  title: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(child: Text(w.publicName)),
                                      Chip(
                                        label:
                                            Text(w.languageCode.toUpperCase()),
                                        padding: EdgeInsets.zero,
                                        visualDensity: VisualDensity.compact,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                    ],
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          w.projectName,
                                          style: theme.textTheme.labelMedium
                                              ?.copyWith(
                                            color: theme.colorScheme
                                                .onSurfaceVariant,
                                          ),
                                        ),
                                        if (w.tags.isNotEmpty)
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8),
                                            child: Wrap(
                                              spacing: 6,
                                              runSpacing: 4,
                                              children: w.tags
                                                  .map(
                                                    (t) => Chip(
                                                      label: Text(t),
                                                      visualDensity:
                                                          VisualDensity.compact,
                                                      materialTapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,
                                                    ),
                                                  )
                                                  .toList(),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  onTap: () => _openEditor(existing: w),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.edit_outlined),
                                        tooltip: l10n.projectsEditTooltip,
                                        onPressed: () =>
                                            _openEditor(existing: w),
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.delete_outline_rounded,
                                        ),
                                        tooltip: l10n.projectsDeleteButton,
                                        onPressed: () => _confirmDelete(w),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ),
              ],
            ),
        );
      },
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({
    required this.l10n,
    required this.theme,
    required this.onAdd,
  });

  final AppLocalizations l10n;
  final ThemeData theme;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.folder_open_rounded,
          size: 56,
          color: theme.colorScheme.primary.withValues(alpha: 0.75),
        ),
        const SizedBox(height: 16),
        Text(
          l10n.projectsEmptyTitle,
          textAlign: TextAlign.center,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        FilledButton(
          onPressed: onAdd,
          child: Text(l10n.projectsAddNewWorkButton),
        ),
      ],
    );
  }
}
