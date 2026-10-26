import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/models/user_role.dart';
import 'package:gold_roundtables/core/services/session_context/session_context.dart';
import 'package:gold_roundtables/core/services/session_context/session_context_service.dart';
import 'package:gold_roundtables/core/services/session_context/watch_session_context_use_case.dart';
import 'package:gold_roundtables/features/shell/presentation/cubit/context_chip_cubit.dart';
import 'package:gold_roundtables/features/shell/presentation/cubit/context_chip_state.dart';

class _FakeContextService implements SessionContextService {
  final controller = StreamController<SessionContext?>();

  @override
  SessionContext? get current => null;

  @override
  Stream<SessionContext?> watch() => controller.stream;

  @override
  Future<void> select(SessionContext context) async {}

  @override
  Future<void> clear() async {}
}

void main() {
  late _FakeContextService contexts;
  const coordinator = SessionContext(
    role: UserRole.coordinator,
    organizationName: 'Fundación Luz',
  );

  setUp(() => contexts = _FakeContextService());

  blocTest<ContextChipCubit, ContextChipState>(
    'follows context changes, including sign-out',
    build: () => ContextChipCubit(WatchSessionContextUseCase(contexts)),
    act: (_) {
      contexts.controller.add(coordinator);
      contexts.controller.add(null);
    },
    expect: () => const [
      ContextChipState(context: coordinator),
      ContextChipState(),
    ],
  );
}
