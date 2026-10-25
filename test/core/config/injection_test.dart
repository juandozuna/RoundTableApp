import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/config/injection.dart';
import 'package:gold_roundtables/core/routing/app_router.dart';
import 'package:gold_roundtables/core/routing/app_shell/cubit/app_shell_cubit.dart';
import 'package:gold_roundtables/core/services/auth_session/auth_state_source.dart';
import 'package:gold_roundtables/core/services/auth_session/auth_status.dart';
import 'package:gold_roundtables/core/sync/data/sync_lifecycle.dart';
import 'package:gold_roundtables/core/sync/domain/sync_status_service.dart';
import 'package:gold_roundtables/features/shell/presentation/pages/home/cubit/home_cubit.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(configureDependencies);
  tearDownAll(getIt.reset);

  test('the dependency graph resolves without configuration', () {
    expect(getIt<AppRouter>().config, isNotNull);
    expect(getIt<SyncLifecycle>(), isNotNull);
    expect(getIt<SyncStatusService>(), isNotNull);
    expect(getIt<AppShellCubit>(), isNotNull);
    expect(getIt.isRegistered<HomeCubit>(), isTrue);
  });

  test('without Supabase the user is signed out', () {
    expect(getIt<AuthStateSource>().status, AuthStatus.unauthenticated);
  });
}
