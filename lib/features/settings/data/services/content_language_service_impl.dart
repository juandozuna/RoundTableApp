import 'package:injectable/injectable.dart';

import '../../../../core/data/data_change_signal.dart';
import '../../../../core/data/data_scope.dart';
import '../../../../core/data/remote_watch.dart';
import '../../domain/models/content_language.dart';
import '../../domain/services/content_language_service.dart';
import '../datasources/content_language_local_data_source.dart';
import '../datasources/content_language_remote_data_source.dart';

@LazySingleton(as: ContentLanguageService)
class ContentLanguageServiceImpl implements ContentLanguageService {
  ContentLanguageServiceImpl(
    this._remote,
    this._local,
    this._watch,
    this._signal,
  );

  final ContentLanguageRemoteDataSource _remote;
  final ContentLanguageLocalDataSource _local;
  final RemoteWatch _watch;
  final DataChangeSignal _signal;

  @override
  Stream<ContentLanguageChoice> watch() =>
      _watch<ContentLanguageChoice>(_load, scopes: {DataScope.contentLanguage});

  @override
  Future<void> select(String code) async {
    await _local.saveSelected(code);
    _signal.notify(DataScope.contentLanguage);
  }

  Future<ContentLanguageChoice> _load() async {
    final records = await _remote.fetchActiveLocales();
    final stored = await _local.readSelected();
    final available = [
      for (final record in records)
        ContentLanguage(
          code: record.code,
          name: record.name,
          isBase: record.isDefault,
        ),
    ];
    // A stored language the curriculum does not offer is shown in Spanish.
    final selected = available.any((l) => l.code == stored)
        ? stored!
        : ContentLanguageChoice.baseCode;
    return ContentLanguageChoice(available: available, selected: selected);
  }
}
