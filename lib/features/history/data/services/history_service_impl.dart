import 'package:injectable/injectable.dart';

import '../../domain/models/history_builder.dart';
import '../../domain/models/member_history.dart';
import '../../domain/models/table_history.dart';
import '../../domain/services/history_service.dart';
import '../datasources/history_local_data_source.dart';

@LazySingleton(as: HistoryService)
class HistoryServiceImpl implements HistoryService {
  HistoryServiceImpl(this._local);

  final HistoryLocalDataSource _local;

  @override
  Stream<MemberHistory> watchMemberHistory({
    required String tableId,
    required String personId,
  }) => _local
      .watchSnapshot(tableId)
      .map((snapshot) => HistoryBuilder.member(snapshot, personId))
      .distinct();

  @override
  Stream<TableHistory> watchTableHistory(String tableId) =>
      _local.watchSnapshot(tableId).map(HistoryBuilder.table).distinct();
}
