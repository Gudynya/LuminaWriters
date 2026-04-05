/// Obra literaria gestionada en la sección Proyectos (demo en memoria).
class LiteraryWork {
  const LiteraryWork({
    required this.id,
    required this.projectName,
    required this.publicName,
    this.descriptionMarkdown = '',
    this.tags = const [],
    this.languageCode = 'es',
  });

  final String id;
  /// Nombre interno / de trabajo del proyecto.
  final String projectName;
  /// Nombre mostrado públicamente.
  final String publicName;
  final String descriptionMarkdown;
  final List<String> tags;
  /// Código de idioma de la obra: `es`, `en`, `ca`.
  final String languageCode;
}
