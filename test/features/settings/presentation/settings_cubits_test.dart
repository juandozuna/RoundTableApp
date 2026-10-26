import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/models/user_role.dart';
import 'package:gold_roundtables/core/network/api_exception.dart';
import 'package:gold_roundtables/core/services/connectivity/connectivity_service.dart';
import 'package:gold_roundtables/core/services/connectivity/watch_connectivity_use_case.dart';
import 'package:gold_roundtables/core/services/session_context/session_context.dart';
import 'package:gold_roundtables/core/services/session_context/session_context_service.dart';
import 'package:gold_roundtables/core/services/session_context/watch_session_context_use_case.dart';
import 'package:gold_roundtables/core/sync/domain/sync_snapshot.dart';
import 'package:gold_roundtables/core/sync/domain/sync_status_service.dart';
import 'package:gold_roundtables/core/sync/domain/watch_sync_status_use_case.dart';
import 'package:gold_roundtables/features/settings/domain/models/app_info.dart';
import 'package:gold_roundtables/features/settings/domain/models/profile_update.dart';
import 'package:gold_roundtables/features/settings/domain/models/user_profile.dart';
import 'package:gold_roundtables/features/settings/domain/use_cases/account/sign_out_use_case.dart';
import 'package:gold_roundtables/features/settings/domain/use_cases/profile/load_app_info_use_case.dart';
import 'package:gold_roundtables/features/settings/domain/use_cases/profile/load_profile_use_case.dart';
import 'package:gold_roundtables/features/settings/domain/use_cases/profile/update_profile_use_case.dart';
import 'package:gold_roundtables/features/settings/presentation/pages/profile_edit/cubit/profile_edit_cubit.dart';
import 'package:gold_roundtables/features/settings/presentation/pages/profile_edit/cubit/profile_edit_state.dart';
import 'package:gold_roundtables/features/settings/presentation/pages/settings/cubit/settings_cubit.dart';
import 'package:gold_roundtables/features/settings/presentation/pages/settings/cubit/settings_state.dart';
import 'package:mocktail/mocktail.dart';

class _MockLoadProfile extends Mock implements LoadProfileUseCase {}

class _MockUpdateProfile extends Mock implements UpdateProfileUseCase {}

class _MockLoadAppInfo extends Mock implements LoadAppInfoUseCase {}

class _MockSignOut extends Mock implements SignOutUseCase {}

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

class _FakeConnectivity implements ConnectivityService {
  final controller = StreamController<bool>();

  @override
  Future<bool> isOnline() async => true;

  @override
  Stream<bool> watchOnline() => controller.stream;
}

class _FakeSync implements SyncStatusService {
  final controller = StreamController<SyncSnapshot>();

  @override
  Stream<SyncSnapshot> watch() => controller.stream;
}

class _FakeProfileUpdate extends Fake implements ProfileUpdate {}

void main() {
  setUpAll(() => registerFallbackValue(_FakeProfileUpdate()));

  const profile = UserProfile(
    id: 'p1',
    firstName: 'Sofía',
    lastName: 'Herrera',
    email: 'facil@dev.local',
    phone: '+18095550101',
  );
  const info = AppInfo(
    appName: 'Gold Roundtables',
    version: '1.0.0',
    buildNumber: '1',
  );

  group('SettingsCubit', () {
    late _MockLoadProfile loadProfile;
    late _MockLoadAppInfo loadAppInfo;
    late _MockSignOut signOut;
    late _FakeContextService contexts;
    late _FakeConnectivity connectivity;
    late _FakeSync sync;

    setUp(() {
      loadProfile = _MockLoadProfile();
      loadAppInfo = _MockLoadAppInfo();
      signOut = _MockSignOut();
      contexts = _FakeContextService();
      connectivity = _FakeConnectivity();
      sync = _FakeSync();
      when(() => loadAppInfo()).thenAnswer((_) async => info);
    });

    SettingsCubit build() => SettingsCubit(
      WatchSessionContextUseCase(contexts),
      WatchConnectivityUseCase(connectivity),
      WatchSyncStatusUseCase(sync),
      loadProfile,
      loadAppInfo,
      signOut,
    );

    blocTest<SettingsCubit, SettingsState>(
      'load shows the profile and app info',
      setUp: () => when(() => loadProfile()).thenAnswer((_) async => profile),
      build: build,
      act: (cubit) => cubit.load(),
      expect: () => const [
        SettingsState(),
        SettingsState(appInfo: info),
        SettingsState(
          appInfo: info,
          profile: profile,
          profileStatus: ProfileStatus.ready,
        ),
      ],
    );

    blocTest<SettingsCubit, SettingsState>(
      'an offline profile read leaves the page usable',
      setUp: () => when(
        () => loadProfile(),
      ).thenThrow(const ApiException(kind: ApiErrorKind.network)),
      build: build,
      act: (cubit) => cubit.load(),
      expect: () => const [
        SettingsState(),
        SettingsState(appInfo: info),
        SettingsState(appInfo: info, profileStatus: ProfileStatus.unavailable),
      ],
    );

    blocTest<SettingsCubit, SettingsState>(
      'follows the active context',
      build: build,
      act: (_) => contexts.controller.add(
        const SessionContext(role: UserRole.coordinator),
      ),
      expect: () => const [
        SettingsState(context: SessionContext(role: UserRole.coordinator)),
      ],
    );

    blocTest<SettingsCubit, SettingsState>(
      'sign-out reports success',
      setUp: () => when(() => signOut()).thenAnswer((_) async {}),
      build: build,
      act: (cubit) => cubit.signOut(),
      expect: () => const [
        SettingsState(signOutStatus: SignOutStatus.inProgress),
        SettingsState(signOutStatus: SignOutStatus.done),
      ],
    );

    blocTest<SettingsCubit, SettingsState>(
      'sign-out reports failure',
      setUp: () => when(() => signOut()).thenThrow(StateError('boom')),
      build: build,
      act: (cubit) => cubit.signOut(),
      expect: () => const [
        SettingsState(signOutStatus: SignOutStatus.inProgress),
        SettingsState(signOutStatus: SignOutStatus.failed),
      ],
    );
  });

  group('ProfileEditCubit', () {
    late _MockLoadProfile loadProfile;
    late _MockUpdateProfile updateProfile;

    setUp(() {
      loadProfile = _MockLoadProfile();
      updateProfile = _MockUpdateProfile();
    });

    ProfileEditCubit build() => ProfileEditCubit(loadProfile, updateProfile);

    const update = ProfileUpdate(
      firstName: 'Sofía',
      lastName: 'Herrera',
      phone: '+18095550102',
    );

    blocTest<ProfileEditCubit, ProfileEditState>(
      'load shows the editable profile',
      setUp: () => when(() => loadProfile()).thenAnswer((_) async => profile),
      build: build,
      act: (cubit) => cubit.load(),
      expect: () => const [
        ProfileEditState.loading(),
        ProfileEditState.editing(profile: profile),
      ],
    );

    blocTest<ProfileEditCubit, ProfileEditState>(
      'a sign-in without a person is unavailable',
      setUp: () => when(() => loadProfile()).thenAnswer((_) async => null),
      build: build,
      act: (cubit) => cubit.load(),
      expect: () => const [
        ProfileEditState.loading(),
        ProfileEditState.unavailable(),
      ],
    );

    blocTest<ProfileEditCubit, ProfileEditState>(
      'save sends the update and ends saved',
      setUp: () {
        when(() => loadProfile()).thenAnswer((_) async => profile);
        when(
          () => updateProfile(any()),
        ).thenAnswer((_) async => profile.copyWith(phone: '+18095550102'));
      },
      build: build,
      act: (cubit) async {
        await cubit.load();
        await cubit.save(update);
      },
      verify: (_) => verify(() => updateProfile(update)).called(1),
      expect: () => [
        const ProfileEditState.loading(),
        const ProfileEditState.editing(profile: profile),
        const ProfileEditState.editing(profile: profile, saving: true),
        ProfileEditState.saved(profile.copyWith(phone: '+18095550102')),
      ],
    );

    blocTest<ProfileEditCubit, ProfileEditState>(
      'a failed save keeps the form and exposes the error',
      setUp: () {
        when(() => loadProfile()).thenAnswer((_) async => profile);
        when(() => updateProfile(any())).thenThrow(
          const ApiException(
            kind: ApiErrorKind.validation,
            code: 'validation_failed',
          ),
        );
      },
      build: build,
      act: (cubit) async {
        await cubit.load();
        await cubit.save(update);
      },
      expect: () => [
        const ProfileEditState.loading(),
        const ProfileEditState.editing(profile: profile),
        const ProfileEditState.editing(profile: profile, saving: true),
        const ProfileEditState.editing(
          profile: profile,
          error: ApiException(
            kind: ApiErrorKind.validation,
            code: 'validation_failed',
          ),
        ),
      ],
    );
  });
}
