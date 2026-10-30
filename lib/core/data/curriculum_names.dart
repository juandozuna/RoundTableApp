import 'package:injectable/injectable.dart';

import '../network/postgrest/postgrest.dart';
import 'paged_read.dart';
import 'records/records.dart';

/// Names of curriculum modules and values in the content language in use,
/// with the Spanish base text as fallback when a translation (or its name) is
/// missing (ADR 0017).
class CurriculumNames {
  CurriculumNames({
    required Iterable<CurriculumModuleRecord> modules,
    required Iterable<CurriculumValueRecord> values,
    Iterable<CurriculumTranslationRecord> translations = const [],
  }) : modules = (modules.toList()
         ..sort((a, b) => a.number.compareTo(b.number))),
       _values = {for (final value in values) value.id: value},
       _translatedNames = {
         for (final t in translations)
           if (t.name?.trim().isNotEmpty ?? false)
             (t.entityType, t.entityId): t.name!.trim(),
       };

  /// Modules in program order.
  final List<CurriculumModuleRecord> modules;
  final Map<String, CurriculumValueRecord> _values;
  final Map<(String, String), String> _translatedNames;

  Iterable<CurriculumValueRecord> get values => _values.values;

  CurriculumValueRecord? value(String? id) => id == null ? null : _values[id];

  String? valueName(String? id) {
    final record = value(id);
    if (record == null) return null;
    return _translatedNames[(CurriculumTranslationTypes.value, record.id)] ??
        record.name;
  }

  String moduleName(CurriculumModuleRecord module) =>
      _translatedNames[(CurriculumTranslationTypes.module, module.id)] ??
      module.name;

  CurriculumModuleRecord? moduleOf(String? valueId) {
    final moduleId = value(valueId)?.moduleId;
    if (moduleId == null) return null;
    return modules.where((m) => m.id == moduleId).firstOrNull;
  }
}

/// `curriculum_translations.entity_type` values this reader resolves.
abstract final class CurriculumTranslationTypes {
  static const String module = 'module';
  static const String value = 'value';
}

/// Reads the curriculum reference data (three small tables, readable by every
/// signed-in user) for features that show value and module names.
@lazySingleton
class CurriculumNamesReader {
  CurriculumNamesReader(this._client);

  final TableReadsClient _client;

  /// [locale] is the translation language in use; null means the Spanish base
  /// text, so no translation is read.
  Future<CurriculumNames> load({String? locale}) async {
    final results = await Future.wait([
      readAllPages(
        _client.curriculumModules,
        order: [PostgrestOrder.asc(PostgrestColumns.number)],
      ),
      readAllPages(
        _client.curriculumValues,
        order: [PostgrestOrder.asc(PostgrestColumns.sequence)],
      ),
      if (locale != null)
        readAllPages(
          _client.curriculumTranslations,
          filters: {
            PostgrestColumns.locale: PostgrestFilter.eq(locale),
            PostgrestColumns.entityType: PostgrestFilter.inList([
              CurriculumTranslationTypes.module,
              CurriculumTranslationTypes.value,
            ]),
          },
          order: [PostgrestOrder.asc(PostgrestColumns.id)],
        ),
    ]);
    return CurriculumNames(
      modules: results[0].cast<CurriculumModuleRecord>(),
      values: results[1].cast<CurriculumValueRecord>(),
      translations: locale == null
          ? const []
          : results[2].cast<CurriculumTranslationRecord>(),
    );
  }
}
