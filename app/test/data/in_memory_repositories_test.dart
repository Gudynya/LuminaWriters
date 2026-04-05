import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lumina_writers/data/repositories/app_repositories.dart';
import 'package:lumina_writers/models/literary_work.dart';

void main() {
  group('InMemoryLiteraryWorkRepository', () {
    test('CRUD', () async {
      final repos = AppRepositories.memory();
      final w = repos.literaryWorks;

      expect(await w.listWorks(), isEmpty);

      final created = await w.create(
        projectName: 'p',
        publicName: 'pub',
        descriptionMarkdown: '# hi',
        tags: const ['a'],
        languageCode: 'ca',
      );
      expect(created.id, isNotEmpty);
      expect(created.projectName, 'p');

      final list = await w.listWorks();
      expect(list, hasLength(1));

      final updated = LiteraryWork(
        id: created.id,
        projectName: 'p2',
        publicName: 'pub2',
        descriptionMarkdown: 'x',
        tags: const [],
        languageCode: 'es',
      );
      await w.update(updated);
      final after = await w.listWorks();
      expect(after.single.projectName, 'p2');

      await w.deleteWork(created.id);
      expect(await w.listWorks(), isEmpty);
    });
  });

  group('InMemorySessionRepository', () {
    test('sign in / out', () async {
      final repos = AppRepositories.memory();
      final s = repos.session;

      expect(await s.isSignedIn(), false);
      await s.signIn();
      expect(await s.isSignedIn(), true);
      await s.signOut();
      expect(await s.isSignedIn(), false);
    });
  });

  group('InMemoryLocalePreferenceRepository', () {
    test('read / write', () async {
      final repos = AppRepositories.memory();
      final l = repos.localePreference;

      expect(await l.getPreferredLocale(), isNull);
      await l.setPreferredLocale(const Locale('en'));
      expect(await l.getPreferredLocale(), const Locale('en'));
    });
  });
}
