import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/models/user_role.dart';
import 'package:gold_roundtables/core/services/session_context/session_context.dart';
import 'package:gold_roundtables/features/auth/data/services/persisted_session_context_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';

void main() {
  const context = SessionContext(
    role: UserRole.coordinator,
    personId: 'p1',
    organizationId: 'org',
    organizationName: 'Fundación Luz',
  );

  setUp(() {
    SharedPreferencesAsyncPlatform.instance =
        InMemorySharedPreferencesAsync.empty();
  });

  test('a selected context survives a restart', () async {
    final first = PersistedSessionContextService(SharedPreferencesAsync());
    await first.select(context);

    final second = PersistedSessionContextService(SharedPreferencesAsync());
    final restored = await second.watch().firstWhere((value) => value != null);

    expect(restored, context);
    expect(second.current, context);
  });

  test('clearing forgets it and tells listeners', () async {
    final service = PersistedSessionContextService(SharedPreferencesAsync());
    await service.select(context);
    final emitted = <SessionContext?>[];
    final subscription = service.watch().listen(emitted.add);
    await Future<void>.delayed(Duration.zero);

    await service.clear();
    await Future<void>.delayed(Duration.zero);
    await subscription.cancel();

    expect(emitted, [context, null]);
    final fresh = PersistedSessionContextService(SharedPreferencesAsync());
    await Future<void>.delayed(Duration.zero);
    expect(fresh.current, isNull);
  });
}
