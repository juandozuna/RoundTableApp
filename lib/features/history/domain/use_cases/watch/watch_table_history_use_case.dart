import 'package:injectable/injectable.dart';

import '../../models/table_history.dart';
import '../../services/history_service.dart';

@injectable
class WatchTableHistoryUseCase {
  const WatchTableHistoryUseCase(this._history);

  final HistoryService _history;

  Stream<TableHistory> call(String tableId) =>
      _history.watchTableHistory(tableId);
}
