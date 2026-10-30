import 'package:injectable/injectable.dart';

import '../../../../core/data/data_scope.dart';
import '../../../../core/data/remote_watch.dart';
import '../../../../core/services/logging/app_log.dart';
import '../../../settings/domain/models/content_language.dart';
import '../../../settings/domain/services/content_language_service.dart';
import '../../domain/models/history_builder.dart';
import '../../domain/models/member_history.dart';
import '../../domain/models/table_history.dart';
import '../../domain/services/history_service.dart';
import '../datasources/history_remote_data_source.dart';

/// History is not a live screen: it refetches when a session write, a closed
/// session or a content-language change signals, and when the app returns to
/// the foreground; there is no poll.
@LazySingleton(as: HistoryService)
class HistoryServiceImpl implements HistoryService {
  HistoryServiceImpl(this._remote, this._language, this._watch);

  final HistoryRemoteDataSource _remote;
  final ContentLanguageService _language;
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
      );

  /// The chosen content language, or null for the Spanish base text (also
  /// when the choice cannot be read, so the history still shows).
  Future<String?> _translationLocale() async {
    try {
      final selected = (await _language.watch().first).selected;
      return selected == ContentLanguageChoice.baseCode ? null : selected;
    } on Object catch (error) {
      AppLog.warning('history', 'Content language unreadable; Spanish', error);
      return null;
    }
  }
}
