import 'package:injectable/injectable.dart';

import '../../../../core/sync/data/sync_database.dart';
import '../../domain/services/local_data_service.dart';

@LazySingleton(as: LocalDataService)
class LocalDataServiceImpl implements LocalDataService {
  LocalDataServiceImpl(this._database);

  final SyncDatabase _database;

  @override
  Future<void> eraseLocalData() => _database.disconnect(clearLocalData: true);
}
