import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/sync/data/sync_schema.dart';
import 'package:gold_roundtables/core/sync/domain/sync_snapshot.dart';
import 'package:gold_roundtables/core/sync/domain/sync_status_service.dart';
import 'package:gold_roundtables/features/history/data/datasources/history_local_data_source.dart';
import 'package:gold_roundtables/features/home/data/datasources/home_local_data_source.dart';
import 'package:gold_roundtables/features/session/data/datasources/session_local_data_source.dart';
import 'package:gold_roundtables/features/session/data/services/live_session_service_impl.dart';
import 'package:gold_roundtables/features/settings/data/datasources/content_language_local_data_source.dart';
import 'package:gold_roundtables/features/settings/data/services/content_language_service_impl.dart';

import '../support/session_fixture.dart';
import '../support/session_test_database.dart';

class _Connected implements SyncStatusService {
  @override
  Stream<SyncSnapshot> watch() =>
      Stream.value(const SyncSnapshot(connection: SyncConnection.connected));
}

/// ADR 0017: curriculum text follows the content language chosen on the
/// device, falling back to the Spanish base text field by field.
void main() {
  late SessionTestDatabase db;

  setUp(() async {
    db = await SessionTestDatabase.open();
    await SessionFixture.seed(db);
    await db.seedSynced('content_locales', 'loc-es', {
      'code': 'es',
      'name': 'Español',
      'is_default': 1,
      'status': 'active',
    });
    await db.seedSynced('content_locales', 'loc-en', {
      'code': 'en',
      'name': 'English',
      'is_default': 0,
      'status': 'active',
    });
    await db.seedSynced('curriculum_translations', 'tr-value', {
      'locale': 'en',
      'entity_type': 'value',
      'entity_id': Ids.value4,
      'name': 'Responsibility',
    });
    await db.seedSynced('curriculum_translations', 'tr-q1', {
      'locale': 'en',
      'entity_type': 'question',
      'entity_id': Ids.q1,
      'question_text': 'Who is an example of this value for you?',
    });
    // Blank translated fields count as missing.
    await db.seedSynced('curriculum_translations', 'tr-value3', {
      'locale': 'en',
      'entity_type': 'value',
      'entity_id': Ids.value3,
      'name': '   ',
    });
  });

  tearDown(() => db.close());

  Future<void> chooseLocale(String code) =>
      ContentLanguageLocalDataSource(db.sync).saveSelected(code);

  LiveSessionServiceImpl liveService() => LiveSessionServiceImpl(
    SessionLocalDataSource(db.drift, db.sync),
    _Connected(),
    FixedClock(DateTime.utc(2026, 10, 29, 22, 30)),
  );

  test(
    'the session shows the translation, Spanish where it is missing',
    () async {
      await chooseLocale('en');
      final session = (await liveService().watch().firstWhere(
        (s) => s != null,
      ))!;
      expect(session.value.name, 'Responsibility');
      expect(
        session.questions.first.text,
        'Who is an example of this value for you?',
      );
      // Untranslated question and blank translated name fall back to Spanish.
      expect(session.questions.last.text, '¿Por qué te diste ese puntaje?');
      expect(session.followUpValue?.name, 'Honestidad');
    },
  );

  test(
    'no translations for the chosen language: everything is Spanish',
    () async {
      await chooseLocale('fr');
      final session = (await liveService().watch().firstWhere(
        (s) => s != null,
      ))!;
      expect(session.value.name, 'Responsabilidad');
      expect(
        session.questions.first.text,
        '¿Quién es para ti un ejemplo de este valor?',
      );
    },
  );

  test('changing the language re-emits the session', () async {
    await chooseLocale('es');
    final names = <String>[];
    final subscription = liveService().watch().listen(
      (s) => names.add(s!.value.name),
    );
    await Future<void>.delayed(const Duration(milliseconds: 300));
    await chooseLocale('en');
    await Future<void>.delayed(const Duration(milliseconds: 500));
    await subscription.cancel();
    expect(names.first, 'Responsabilidad');
    expect(names.last, 'Responsibility');
  });

  test('home and history resolve the same way', () async {
    await db.seedSynced('curriculum_modules', 'mod-1', {
      'number': 1,
      'name': 'Carácter',
      'status': 'active',
    });
    await db.seedSynced('curriculum_translations', 'tr-mod', {
      'locale': 'en',
      'entity_type': 'module',
      'entity_id': 'mod-1',
      'name': 'Character',
    });
    await db.seedSynced('curriculum_values', Ids.value4, {
      'module_id': 'mod-1',
      'name': 'Responsabilidad',
      'sequence': 4,
      'status': 'active',
    });
    await chooseLocale('en');
    final home = await HomeLocalDataSource(
      db.sync,
    ).watchFacilitatorTable(Ids.table).firstWhere((r) => r != null);
    expect(home!.valueName, 'Responsibility');
    expect(home.followUpValueName, 'Honestidad');

    final history = await HistoryLocalDataSource(
      db.sync,
    ).watchSnapshot(Ids.table).first;
    expect(history.values[Ids.value4]?.name, 'Responsibility');
    expect(history.values[Ids.value4]?.moduleName, 'Character');
  });

  test(
    'the language setting lists active languages and falls back to Spanish',
    () async {
      final service = ContentLanguageServiceImpl(
        ContentLanguageLocalDataSource(db.sync),
      );
      var choice = await service.watch().first;
      expect(choice.available.map((l) => l.code), ['es', 'en']);
      expect(choice.canChoose, isTrue);
      expect(choice.selected, 'es');

      await service.select('en');
      choice = await service.watch().first;
      expect(choice.selected, 'en');

      // A stored language the curriculum does not offer is shown as Spanish.
      await service.select('fr');
      choice = await service.watch().first;
      expect(choice.selected, 'es');
      expect(
        CoreSyncTables.contentLocaleKey,
        'content_locale',
        reason: 'the SQL fragments and the setting share this key',
      );
    },
  );
}
