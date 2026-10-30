import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../admin/data/services/saved_views_service_impl.dart';
import '../../../settings/data/datasources/content_language_local_data_source.dart';
import '../../domain/services/local_data_service.dart';

/// The app keeps no replica of server data; what a device holds for a person
/// is device-local preferences (saved views, content language).
@LazySingleton(as: LocalDataService)
class LocalDataServiceImpl implements LocalDataService {
  LocalDataServiceImpl(this._prefs);

  final SharedPreferencesAsync _prefs;

  @override
  Future<void> eraseLocalData() async {
    final keys = await _prefs.getKeys();
    for (final key in keys) {
      if (_isEraseable(key)) await _prefs.remove(key);
    }
  }

  static bool _isEraseable(String key) =>
      key.startsWith(SavedViewsServiceImpl.keyPrefix) ||
      key == ContentLanguageLocalDataSource.selectedKey;
}
