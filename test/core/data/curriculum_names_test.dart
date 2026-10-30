import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/data/curriculum_names.dart';
import 'package:gold_roundtables/core/network/postgrest/postgrest.dart';

import 'support/record_builders.dart';
import 'support/recording_table_reads_client.dart';

void main() {
  late RecordingTableReadsClient client;
  late CurriculumNamesReader reader;

  setUp(() {
    client = RecordingTableReadsClient()
      ..seed(PostgrestTables.curriculumModules, [
        RecordBuilders.module(id: 'm2', number: 2, name: 'Relaciones'),
        RecordBuilders.module(),
      ])
      ..seed(PostgrestTables.curriculumValues, [
        RecordBuilders.value('v3', sequence: 3, name: 'Honestidad'),
        RecordBuilders.value(
          'v9',
          sequence: 9,
          name: 'Respeto',
          moduleId: 'm2',
        ),
      ])
      ..seed(PostgrestTables.curriculumTranslations, [
        RecordBuilders.translation(
          CurriculumTranslationTypes.value,
          'v3',
          ' Honesty ',
        ),
        RecordBuilders.translation(
          CurriculumTranslationTypes.value,
          'v9',
          '  ',
        ),
        RecordBuilders.translation(
          CurriculumTranslationTypes.module,
          'module-1',
          'Character',
        ),
      ]);
    reader = CurriculumNamesReader(client);
  });

  test(
    'without a locale the Spanish text is used and nothing is translated',
    () async {
      final names = await reader.load();

      expect(names.valueName('v3'), 'Honestidad');
      expect(names.moduleName(names.modules.first), 'Carácter');
      expect(client.readsOf(PostgrestTables.curriculumTranslations), isEmpty);
    },
  );

  test('a translation replaces the name, a blank one falls back', () async {
    final names = await reader.load(locale: 'en');

    expect(names.valueName('v3'), 'Honesty');
    expect(names.valueName('v9'), 'Respeto');
    expect(names.moduleName(names.modules.first), 'Character');
    expect(names.moduleName(names.modules.last), 'Relaciones');
  });

  test('modules come in program order and values know their module', () async {
    final names = await reader.load();

    expect(names.modules.map((m) => m.number), [1, 2]);
    expect(names.moduleOf('v9')?.name, 'Relaciones');
    expect(names.moduleOf('unknown'), isNull);
    expect(names.valueName(null), isNull);
  });

  test('translations are requested for the locale and the two types', () async {
    await reader.load(locale: 'en');

    final read = client.readsOf(PostgrestTables.curriculumTranslations).single;
    expect(read.filter(PostgrestColumns.locale), 'eq.en');
    expect(read.filter(PostgrestColumns.entityType), 'in.(module,value)');
  });
}
