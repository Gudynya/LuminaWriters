import '../../models/literary_work.dart';

/// Acceso a obras literarias; la implementación define persistencia (memoria, local, red).
abstract class LiteraryWorkRepository {
  Future<List<LiteraryWork>> listWorks();

  Future<LiteraryWork> create({
    required String projectName,
    required String publicName,
    String descriptionMarkdown = '',
    List<String> tags = const [],
    String languageCode = 'es',
  });

  Future<void> update(LiteraryWork work);

  Future<void> deleteWork(String id);
}
