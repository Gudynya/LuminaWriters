import '../../models/literary_work.dart';
import 'literary_work_repository.dart';

class InMemoryLiteraryWorkRepository implements LiteraryWorkRepository {
  final List<LiteraryWork> _works = [];

  String _newId() => '${DateTime.now().microsecondsSinceEpoch}';

  @override
  Future<List<LiteraryWork>> listWorks() async {
    return List<LiteraryWork>.unmodifiable(_works);
  }

  @override
  Future<LiteraryWork> create({
    required String projectName,
    required String publicName,
    String descriptionMarkdown = '',
    List<String> tags = const [],
    String languageCode = 'es',
  }) async {
    final work = LiteraryWork(
      id: _newId(),
      projectName: projectName,
      publicName: publicName,
      descriptionMarkdown: descriptionMarkdown,
      tags: List<String>.from(tags),
      languageCode: languageCode,
    );
    _works.add(work);
    return work;
  }

  @override
  Future<void> update(LiteraryWork work) async {
    final i = _works.indexWhere((w) => w.id == work.id);
    if (i >= 0) {
      _works[i] = work;
    }
  }

  @override
  Future<void> deleteWork(String id) async {
    _works.removeWhere((w) => w.id == id);
  }
}
