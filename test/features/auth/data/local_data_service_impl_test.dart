import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/features/admin/data/services/saved_views_service_impl.dart';
import 'package:gold_roundtables/features/auth/data/services/local_data_service_impl.dart';
import 'package:gold_roundtables/features/settings/data/datasources/content_language_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';

void main() {
  late SharedPreferencesAsync prefs;

  setUp(() {
    SharedPreferencesAsyncPlatform.instance =
        InMemorySharedPreferencesAsync.empty();
    prefs = SharedPreferencesAsync();
  });

  test('erases saved views of every user and the language choice', () async {
    await prefs.setString(SavedViewsServiceImpl.keyFor('a'), '[]');
    await prefs.setString(SavedViewsServiceImpl.keyFor('b'), '[]');
    await prefs.setString(ContentLanguageLocalDataSource.selectedKey, 'en');

    await LocalDataServiceImpl(prefs).eraseLocalData();

    expect(await prefs.getKeys(), isEmpty);
  });

  test('keeps unrelated preferences such as notification settings', () async {
    await prefs.setBool('notifications.push_enabled', true);
    await prefs.setString(SavedViewsServiceImpl.keyFor('a'), '[]');

    await LocalDataServiceImpl(prefs).eraseLocalData();

    expect(await prefs.getKeys(), {'notifications.push_enabled'});
  });
}
