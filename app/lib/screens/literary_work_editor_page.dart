import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../l10n/app_localizations.dart';
import '../models/literary_work.dart';

/// Resultado del formulario al guardar (se devuelve con [Navigator.pop]).
class LiteraryWorkFormResult {
  const LiteraryWorkFormResult({
    required this.projectName,
    required this.publicName,
    required this.languageCode,
    required this.descriptionMarkdown,
    required this.tags,
  });

  final String projectName;
  final String publicName;
  final String languageCode;
  final String descriptionMarkdown;
  final List<String> tags;
}

/// Pantalla completa para crear o editar una obra literaria (navegación con [Navigator.push]).
class LiteraryWorkEditorPage extends StatefulWidget {
  const LiteraryWorkEditorPage({super.key, this.existing});

  final LiteraryWork? existing;

  @override
  State<LiteraryWorkEditorPage> createState() => _LiteraryWorkEditorPageState();
}

class _LiteraryWorkEditorPageState extends State<LiteraryWorkEditorPage>
    with SingleTickerProviderStateMixin {
  late final TextEditingController _projectNameController;
  late final TextEditingController _publicNameController;
  late final TextEditingController _markdownController;
  late final TextEditingController _tagInputController;
  late final TabController _tabController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String _languageCode;
  final List<String> _tags = [];

  @override
  void initState() {
    super.initState();
    final w = widget.existing;
    _projectNameController = TextEditingController(text: w?.projectName ?? '');
    _publicNameController = TextEditingController(text: w?.publicName ?? '');
    _markdownController = TextEditingController(text: w?.descriptionMarkdown ?? '');
    _tagInputController = TextEditingController();
    _languageCode = w?.languageCode ?? 'es';
    if (w != null) {
      _tags.addAll(w.tags);
    }
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _projectNameController.dispose();
    _publicNameController.dispose();
    _markdownController.dispose();
    _tagInputController.dispose();
    super.dispose();
  }

  void _commitTagsFromInput() {
    final raw = _tagInputController.text.trim();
    if (raw.isEmpty) return;
    var changed = false;
    for (final part in raw.split(',')) {
      final s = part.trim();
      if (s.isNotEmpty && !_tags.contains(s)) {
        _tags.add(s);
        changed = true;
      }
    }
    _tagInputController.clear();
    if (changed) setState(() {});
  }

  void _removeTag(String tag) {
    setState(() => _tags.remove(tag));
  }

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    _commitTagsFromInput();
    Navigator.of(context).pop(
      LiteraryWorkFormResult(
        projectName: _projectNameController.text.trim(),
        publicName: _publicNameController.text.trim(),
        languageCode: _languageCode,
        descriptionMarkdown: _markdownController.text,
        tags: List<String>.from(_tags),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final isNew = widget.existing == null;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isNew ? l10n.projectsNewWorkTitle : l10n.projectsEditWorkTitle,
        ),
        actions: [
          TextButton(
            onPressed: _submit,
            child: Text(l10n.projectsSaveButton),
          ),
        ],
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 560),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _projectNameController,
                      decoration: InputDecoration(
                        labelText: l10n.projectsProjectNameField,
                      ),
                      textCapitalization: TextCapitalization.words,
                      autofocus: isNew,
                      validator: (v) {
                        if (v == null || v.trim().isEmpty) {
                          return l10n.projectsProjectNameRequiredError;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _publicNameController,
                      decoration: InputDecoration(
                        labelText: l10n.projectsPublicNameField,
                      ),
                      textCapitalization: TextCapitalization.words,
                      validator: (v) {
                        if (v == null || v.trim().isEmpty) {
                          return l10n.projectsPublicNameRequiredError;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        l10n.projectsWorkLanguageLabel,
                        style: theme.textTheme.labelLarge,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SegmentedButton<String>(
                      showSelectedIcon: false,
                      segments: [
                        ButtonSegment<String>(
                          value: 'es',
                          label: Text(l10n.localeSpanishDisplay),
                        ),
                        ButtonSegment<String>(
                          value: 'en',
                          label: Text(l10n.localeEnglishDisplay),
                        ),
                        ButtonSegment<String>(
                          value: 'ca',
                          label: Text(l10n.localeCatalanDisplay),
                        ),
                      ],
                      selected: {_languageCode},
                      onSelectionChanged: (Set<String> next) {
                        if (next.isNotEmpty) {
                          setState(() => _languageCode = next.first);
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                    Text(
                      l10n.projectsTagsLabel,
                      style: theme.textTheme.labelLarge,
                    ),
                    const SizedBox(height: 8),
                    if (_tags.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: _tags
                              .map(
                                (t) => InputChip(
                                  label: Text(t),
                                  onDeleted: () => _removeTag(t),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _tagInputController,
                            decoration: InputDecoration(
                              hintText: l10n.projectsTagsHint,
                              border: const OutlineInputBorder(),
                            ),
                            textCapitalization: TextCapitalization.none,
                            onSubmitted: (_) => _commitTagsFromInput(),
                          ),
                        ),
                        const SizedBox(width: 8),
                        IconButton.filledTonal(
                          onPressed: _commitTagsFromInput,
                          icon: const Icon(Icons.add_rounded),
                          tooltip: l10n.projectsTagsLabel,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      l10n.projectsDescriptionMarkdownLabel,
                      style: theme.textTheme.labelLarge,
                    ),
                    const SizedBox(height: 8),
                    TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      tabs: [
                        Tab(text: l10n.projectsMarkdownEditTab),
                        Tab(text: l10n.projectsMarkdownPreviewTab),
                      ],
                    ),
                    SizedBox(
                      height: 260,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          TextField(
                            controller: _markdownController,
                            maxLines: null,
                            expands: true,
                            textAlignVertical: TextAlignVertical.top,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              alignLabelWithHint: true,
                            ),
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontFamily: 'monospace',
                            ),
                          ),
                          AnimatedBuilder(
                            animation: _markdownController,
                            builder: (context, child) {
                              return SingleChildScrollView(
                                padding: const EdgeInsets.all(12),
                                child: MarkdownBody(
                                  data: _markdownController.text.isEmpty
                                      ? ' '
                                      : _markdownController.text,
                                  selectable: true,
                                  shrinkWrap: true,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
