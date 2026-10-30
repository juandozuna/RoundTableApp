import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/config/injection.dart';
import 'package:gold_roundtables/core/routing/app_router.dart';
import 'package:gold_roundtables/core/routing/app_shell/cubit/app_shell_cubit.dart';
import 'package:gold_roundtables/core/services/auth_session/auth_state_source.dart';
import 'package:gold_roundtables/core/services/auth_session/auth_status.dart';
import 'package:gold_roundtables/core/services/session_context/session_context_service.dart';
import 'package:gold_roundtables/core/sync/domain/sync_status_service.dart';
import 'package:gold_roundtables/features/auth/data/services/persisted_session_context_service.dart';
import 'package:gold_roundtables/features/auth/domain/services/access_session_service.dart';
import 'package:gold_roundtables/features/auth/domain/services/auth_service.dart';
import 'package:gold_roundtables/features/auth/presentation/cubit/access_cubit.dart';
import 'package:gold_roundtables/features/auth/presentation/pages/sign_in/cubit/sign_in_cubit.dart';
import 'package:gold_roundtables/features/home/presentation/pages/home/cubit/home_cubit.dart';
import 'package:gold_roundtables/features/invites/domain/services/invite_service.dart';
import 'package:gold_roundtables/features/invites/presentation/pages/manager/cubit/invites_manager_cubit.dart';
import 'package:gold_roundtables/features/invites/presentation/pages/redeem/cubit/redeem_cubit.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    SharedPreferencesAsyncPlatform.instance =
        InMemorySharedPreferencesAsync.empty();
    configureDependencies();
  });
  tearDownAll(getIt.reset);

  test('the dependency graph resolves without configuration', () {
    expect(getIt<AppRouter>().config, isNotNull);
    expect(getIt<SyncStatusService>(), isNotNull);
    expect(getIt<AppShellCubit>(), isNotNull);
    expect(getIt.isRegistered<HomeCubit>(), isTrue);
  });

  test('the auth and invites features resolve', () {
    expect(getIt<AuthService>(), isNotNull);
    expect(getIt<AccessSessionService>(), isNotNull);
    expect(getIt<InviteService>(), isNotNull);
    expect(getIt<SignInCubit>(), isNotNull);
    expect(getIt<AccessCubit>(), isNotNull);
    expect(getIt<RedeemCubit>(), isNotNull);
    expect(getIt<InvitesManagerCubit>(), isNotNull);
    expect(
      getIt<SessionContextService>(),
      isA<PersistedSessionContextService>(),
    );
  });

  test('without Supabase the user is signed out', () {
    expect(getIt<AuthStateSource>().status, AuthStatus.unauthenticated);
  });
}
