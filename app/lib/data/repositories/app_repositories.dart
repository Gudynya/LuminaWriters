import 'in_memory_literary_work_repository.dart';
import 'in_memory_locale_preference_repository.dart';
import 'in_memory_session_repository.dart';
import 'literary_work_repository.dart';
import 'locale_preference_repository.dart';
import 'session_repository.dart';

/// Punto de composición: repositorios concretos inyectados desde [main].
class AppRepositories {
  const AppRepositories({
    required this.literaryWorks,
    required this.session,
    required this.localePreference,
  });

  final LiteraryWorkRepository literaryWorks;
  final SessionRepository session;
  final LocalePreferenceRepository localePreference;

  /// Implementaciones en memoria (MVP).
  factory AppRepositories.memory() {
    return AppRepositories(
      literaryWorks: InMemoryLiteraryWorkRepository(),
      session: InMemorySessionRepository(),
      localePreference: InMemoryLocalePreferenceRepository(),
    );
  }
}
