import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/models/user_role.dart';
import 'package:gold_roundtables/core/routing/app_shell/cubit/app_shell_cubit.dart';
import 'package:gold_roundtables/core/routing/app_shell/cubit/app_shell_state.dart';
import 'package:gold_roundtables/core/services/session_context/in_memory_session_context_service.dart';
import 'package:gold_roundtables/core/services/session_context/session_context.dart';
import 'package:gold_roundtables/core/services/session_context/watch_session_context_use_case.dart';

void main() {
  late InMemorySessionContextService service;

  setUp(() => service = InMemorySessionContextService());

  blocTest<AppShellCubit, AppShellState>(
    'follows the active role',
    build: () => AppShellCubit(WatchSessionContextUseCase(service)),
    act: (_) async {
      await service.select(
        const SessionContext(
          role: UserRole.facilitator,
          tableName: 'Mesa Esperanza 03',
        ),
      );
      await service.clear();
    },
    // The current (empty) context is emitted first on subscription.
    expect: () => const [
      AppShellState(),
      AppShellState(role: UserRole.facilitator),
      AppShellState(),
    ],
  );
}
