import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/models/user_role.dart';
import 'package:gold_roundtables/core/services/session_context/session_context.dart';
import 'package:gold_roundtables/core/services/session_context/session_context_service.dart';
import 'package:gold_roundtables/core/services/session_context/watch_session_context_use_case.dart';
import 'package:gold_roundtables/features/home/domain/models/home_overview.dart';
import 'package:gold_roundtables/features/home/domain/services/home_service.dart';
import 'package:gold_roundtables/features/home/domain/use_cases/overview/watch_home_overview_use_case.dart';

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

class _FakeHomeService implements HomeService {
  final Map<UserRole, StreamController<HomeOverview>> controllers = {};
  final List<UserRole> requested = [];

  @override
  Stream<HomeOverview> watchOverview(SessionContext context) {
    requested.add(context.role);
    return (controllers[context.role] = StreamController<HomeOverview>())
        .stream;
  }
}

void main() {
  const facilitator = SessionContext(
    role: UserRole.facilitator,
    tableId: 'table-1',
  );
  const member = SessionContext(role: UserRole.member, tableId: 'table-1');

  late _FakeContextService contexts;
  late _FakeHomeService service;
  late WatchHomeOverviewUseCase useCase;

  setUp(() {
    contexts = _FakeContextService();
    service = _FakeHomeService();
    useCase = WatchHomeOverviewUseCase(
      WatchSessionContextUseCase(contexts),
      service,
    );
  });

  test('emits no-context overview when nobody is selected', () async {
    final emitted = <HomeOverview>[];
    final sub = useCase().listen(emitted.add);
    contexts.controller.add(null);
    await pumpEventQueue();
    expect(emitted, [const HomeOverview.noContext()]);
    await sub.cancel();
  });

  test('switching context drops the previous overview', () async {
    final emitted = <HomeOverview>[];
    final sub = useCase().listen(emitted.add);

    contexts.controller.add(facilitator);
    await pumpEventQueue();
    service.controllers[UserRole.facilitator]!.add(
      const HomeOverview.facilitator(context: facilitator),
    );
    contexts.controller.add(member);
    await pumpEventQueue();
    // The facilitator stream is cancelled; late events must not leak.
    expect(service.controllers[UserRole.facilitator]!.hasListener, isFalse);
    service.controllers[UserRole.member]!.add(
      const HomeOverview.member(context: member),
    );
    await pumpEventQueue();

    expect(service.requested, [UserRole.facilitator, UserRole.member]);
    expect(emitted, [
      const HomeOverview.facilitator(context: facilitator),
      const HomeOverview.member(context: member),
    ]);
    await sub.cancel();
  });

  test('forwards service errors', () async {
    final errors = <Object>[];
    final sub = useCase().listen((_) {}, onError: errors.add);
    contexts.controller.add(member);
    await pumpEventQueue();
    service.controllers[UserRole.member]!.addError(StateError('offline'));
    await pumpEventQueue();
    expect(errors, hasLength(1));
    await sub.cancel();
  });
}
