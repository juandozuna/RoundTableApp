import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/models/user_role.dart';
import 'package:gold_roundtables/core/services/session_context/session_context.dart';
import 'package:gold_roundtables/core/services/session_context/session_context_service.dart';
import 'package:gold_roundtables/core/services/session_context/watch_session_context_use_case.dart';
import 'package:gold_roundtables/features/calendar/domain/models/upcoming_sessions.dart';
import 'package:gold_roundtables/features/calendar/domain/services/upcoming_sessions_service.dart';
import 'package:gold_roundtables/features/calendar/domain/use_cases/watch/watch_upcoming_sessions_use_case.dart';

class _FakeContextService implements SessionContextService {
  final controller = StreamController<SessionContext?>();

  @override
  SessionContext? get current => null;

  @override
  Stream<SessionContext?> watch() => controller.stream;

  @override
  Future<void> select(SessionContext context) async => controller.add(context);

  @override
  Future<void> clear() async => controller.add(null);
}

class _FakeService implements UpcomingSessionsService {
  final List<UserRole> requested = [];

  @override
  Stream<UpcomingSessions> watch(SessionContext context) {
    requested.add(context.role);
    return Stream.value(
      UpcomingSessions(
        scope: context.role == UserRole.facilitator
            ? UpcomingScope.facilitator
            : UpcomingScope.manager,
      ),
    );
  }
}

void main() {
  test(
    'follows the active context and reports no context as unavailable',
    () async {
      final contexts = _FakeContextService();
      final service = _FakeService();
      final useCase = WatchUpcomingSessionsUseCase(
        WatchSessionContextUseCase(contexts),
        service,
      );
      final scopes = <UpcomingScope>[];
      final subscription = useCase().listen((s) => scopes.add(s.scope));

      await contexts.select(const SessionContext(role: UserRole.coordinator));
      await pumpEventQueue();
      await contexts.select(
        const SessionContext(role: UserRole.facilitator, tableId: 't1'),
      );
      await pumpEventQueue();
      await contexts.clear();
      await pumpEventQueue();

      expect(service.requested, [UserRole.coordinator, UserRole.facilitator]);
      expect(scopes, [
        UpcomingScope.manager,
        UpcomingScope.facilitator,
        UpcomingScope.unavailable,
      ]);
      await subscription.cancel();
    },
  );
}
