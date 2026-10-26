import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/features/notifications/data/datasources/notifications_local_data_source.dart';
import 'package:gold_roundtables/features/notifications/data/services/notification_preferences_service_impl.dart';
import 'package:gold_roundtables/features/notifications/domain/models/notification_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';

void main() {
  late NotificationPreferencesServiceImpl service;

  setUp(() {
    SharedPreferencesAsyncPlatform.instance =
        InMemorySharedPreferencesAsync.empty();
    service = NotificationPreferencesServiceImpl(
      NotificationsLocalDataSource(SharedPreferencesAsync()),
    );
  });

  test('defaults to everything on', () async {
    expect(await service.current(), const NotificationPreferences());
  });

  test('saved preferences persist and are re-emitted', () async {
    final emitted = <NotificationPreferences>[];
    final sub = service.watch().listen(emitted.add);
    await pumpEventQueue();
    const next = NotificationPreferences(
      pushEnabled: false,
      unsyncedAlert: false,
    );

    await service.save(next);
    await pumpEventQueue();

    expect(await service.current(), next);
    expect(emitted, [const NotificationPreferences(), next]);
    await sub.cancel();
  });
}
