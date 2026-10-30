import 'package:injectable/injectable.dart';

import '../../../../core/data/data_scope.dart';
import '../../../../core/data/remote_watch.dart';
import '../../../settings/domain/models/content_language.dart';
import '../../../settings/domain/services/selected_content_language_service.dart';
import '../../domain/models/history_builder.dart';
import '../../domain/models/member_history.dart';
import '../../domain/models/table_history.dart';
import '../../domain/services/history_service.dart';
import '../datasources/history_remote_data_source.dart';

/// History refetches when a session write, a closed session or a
/// content-language change signals, when the app returns to the foreground or
/// reconnects, and every [slowPollInterval] while open and in the foreground,
/// so other people's changes show up.
@LazySingleton(as: HistoryService)
class HistoryServiceImpl implements HistoryService {
  HistoryServiceImpl(this._remote, this._language, this._watch);

  final HistoryRemoteDataSource _remote;
  final SelectedContentLanguageService _language;
  final RemoteWatch _watch;

  static const Set<DataScope> _scopes = {
    DataScope.history,
    DataScope.session,
    DataScope.contentLanguage,
  };

  @override
  Stream<MemberHistory> watchMemberHistory({
    required String tableId,
    required String personId,
  }) => _watch<MemberHistory>(
    () async => HistoryBuilder.member(
      await _remote.fetchSnapshot(
        tableId,
        personId: personId,
        locale: await _translationLocale(),
      ),
      personId,
    ),
    scopes: _scopes,
    pollInterval: slowPollInterval,
  );

  @override
  Stream<TableHistory> watchTableHistory(String tableId) =>
      _watch<TableHistory>(
        () async => HistoryBuilder.table(
          await _remote.fetchSnapshot(
            tableId,
            locale: await _translationLocale(),
          ),
        ),
        scopes: _scopes,
        pollInterval: slowPollInterval,
      );

  /// The chosen content language, or null for the Spanish base text. Read
  /// from the device, so a failed language list never changes it.
  Future<String?> _translationLocale() async {
    final selected = await _language.readCode();
    return selected == ContentLanguageChoice.baseCode ? null : selected;
  }
}
