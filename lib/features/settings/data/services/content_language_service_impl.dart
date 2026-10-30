import 'package:injectable/injectable.dart';

import '../../domain/models/content_language.dart';
import '../../domain/services/content_language_service.dart';
import '../datasources/content_language_local_data_source.dart';

@LazySingleton(as: ContentLanguageService)
class ContentLanguageServiceImpl implements ContentLanguageService {
  ContentLanguageServiceImpl(this._local);

  final ContentLanguageLocalDataSource _local;

  @override
  Stream<ContentLanguageChoice> watch() => _local.watchLanguages().map((rows) {
    final available = [
      for (final row in rows)
        ContentLanguage(
          code: row['code']! as String,
          name: row['name']! as String,
          isBase: row['is_default'] == 1,
        ),
    ];
    final stored = rows.isEmpty ? null : rows.first['selected'] as String?;
    // A stored language the curriculum does not offer is shown in Spanish.
    final selected = available.any((l) => l.code == stored)
        ? stored!
        : ContentLanguageChoice.baseCode;
    return ContentLanguageChoice(available: available, selected: selected);
  });

  @override
  Future<void> select(String code) => _local.saveSelected(code);
}
