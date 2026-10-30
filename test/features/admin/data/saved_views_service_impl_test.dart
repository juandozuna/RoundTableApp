import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/network/auth_token_provider.dart';
import 'package:gold_roundtables/features/admin/data/services/saved_views_service_impl.dart';
import 'package:gold_roundtables/features/admin/domain/models/saved_explorer_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';

class _Auth implements AuthTokenProvider {
  @override
  String? userId;

  @override
  String? get accessToken => userId == null ? null : 'token';

  @override
  Future<String?> refreshAccessToken() async => accessToken;
}

void main() {
  late _Auth auth;
  late SavedViewsServiceImpl service;

  SavedExplorerView view(String id) =>
      SavedExplorerView.fromJson({'id': id, 'name': 'Vista $id'});

  setUp(() {
    SharedPreferencesAsyncPlatform.instance =
        InMemorySharedPreferencesAsync.empty();
    auth = _Auth()..userId = 'user-a';
    service = SavedViewsServiceImpl(SharedPreferencesAsync(), auth);
  });

  test('views survive a restart for the same user', () async {
    await service.save([view('1'), view('2')]);

    final restarted = SavedViewsServiceImpl(SharedPreferencesAsync(), auth);
    expect((await restarted.load()).map((v) => v.id), ['1', '2']);
  });

  test('another user on the device never sees them', () async {
    await service.save([view('1')]);

    auth.userId = 'user-b';
    expect(await service.load(), isEmpty);

    await service.save([view('9')]);
    auth.userId = 'user-a';
    expect((await service.load()).map((v) => v.id), ['1']);
  });

  test('with nobody signed in views live in memory only', () async {
    auth.userId = null;
    await service.save([view('1')]);

    expect((await service.load()).map((v) => v.id), ['1']);
    final stored = await SharedPreferencesAsync().getKeys();
    expect(stored, isEmpty);
  });
}
