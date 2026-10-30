import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/services/connectivity/connectivity_service.dart';
import 'package:gold_roundtables/core/services/connectivity/watch_connectivity_use_case.dart';
import 'package:gold_roundtables/core/sync/domain/sync_snapshot.dart';
import 'package:gold_roundtables/core/sync/domain/sync_status_service.dart';
import 'package:gold_roundtables/core/sync/domain/watch_sync_status_use_case.dart';
import 'package:gold_roundtables/features/auth/domain/models/auth_failure.dart';
import 'package:gold_roundtables/features/auth/domain/models/auth_provider.dart';
import 'package:gold_roundtables/features/auth/domain/models/signed_in_user.dart';
import 'package:gold_roundtables/features/auth/domain/services/auth_service.dart';
import 'package:gold_roundtables/features/auth/domain/services/local_data_service.dart';
import 'package:gold_roundtables/features/auth/domain/use_cases/sign_out/sign_out_and_erase_local_data_use_case.dart';
import 'package:gold_roundtables/features/auth/domain/use_cases/sign_out/sign_out_use_case.dart';
import 'package:gold_roundtables/features/auth/presentation/pages/sign_out/cubit/sign_out_cubit.dart';
import 'package:gold_roundtables/features/auth/presentation/pages/sign_out/cubit/sign_out_state.dart';

class FakeSync implements SyncStatusService {
  FakeSync(this.snapshots);

  final Stream<SyncSnapshot> snapshots;

  @override
  Stream<SyncSnapshot> watch() => snapshots;
}

class FakeConnectivity implements ConnectivityService {
  FakeConnectivity({this.online = true});

  final bool online;

  @override
  Future<bool> isOnline() async => online;

  @override
  Stream<bool> watchOnline() => Stream.value(online);
}

class FakeAuth implements AuthService {
  final List<String> calls;
  FakeAuth(this.calls);

  @override
  SignedInUser? get currentUser => null;

  @override
  Stream<AuthFailure> get failures => const Stream.empty();

  @override
  Future<void> signInWithProvider(
    AuthProvider provider, {
    String? returnPath,
  }) async {}

  @override
  Future<void> signOut() async => calls.add('signOut');

  @override
  Stream<SignedInUser?> watchUser() => const Stream.empty();
}

class FakeLocalData implements LocalDataService {
  final List<String> calls;
  FakeLocalData(this.calls);

  @override
  Future<void> eraseLocalData() async => calls.add('erase');
}

SyncSnapshot snapshot(int pending) =>
    SyncSnapshot(connection: SyncConnection.connected, pendingCount: pending);

void main() {
  late List<String> calls;

  SignOutCubit build(Stream<SyncSnapshot> sync, {bool online = true}) {
    final auth = FakeAuth(calls);
    return SignOutCubit(
      WatchSyncStatusUseCase(FakeSync(sync)),
      WatchConnectivityUseCase(FakeConnectivity(online: online)),
      SignOutUseCase(auth),
      SignOutAndEraseLocalDataUseCase(auth, FakeLocalData(calls)),
    );
  }

  setUp(() => calls = []);

  blocTest<SignOutCubit, SignOutState>(
    'nothing pending: asks once, then signs out and keeps local data',
    build: () => build(Stream.value(snapshot(0))),
    act: (cubit) async {
      await cubit.load();
      await cubit.signOut();
    },
    expect: () => [
      const SignOutState.checking(),
      const SignOutState.confirm(pendingCount: 0, online: true),
      const SignOutState.signingOut(),
      const SignOutState.done(),
    ],
    verify: (_) => expect(calls, ['signOut']),
  );

  blocTest<SignOutCubit, SignOutState>(
    'online-only status: offline with nothing pending never blocks sign-out',
    build: () => build(
      Stream.value(const SyncSnapshot(connection: SyncConnection.offline)),
      online: false,
    ),
    act: (cubit) async {
      await cubit.load();
      await cubit.signOut();
    },
    expect: () => [
      const SignOutState.checking(),
      const SignOutState.confirm(pendingCount: 0, online: false),
      const SignOutState.signingOut(),
      const SignOutState.done(),
    ],
    verify: (_) => expect(calls, ['signOut']),
  );

  blocTest<SignOutCubit, SignOutState>(
    'warns about unsynced changes and whether syncing first is possible',
    build: () => build(Stream.value(snapshot(3)), online: false),
    act: (cubit) => cubit.load(),
    expect: () => [
      const SignOutState.checking(),
      const SignOutState.confirm(pendingCount: 3, online: false),
    ],
  );

  blocTest<SignOutCubit, SignOutState>(
    'signing out and erasing wipes local data before leaving',
    build: () => build(Stream.value(snapshot(2))),
    act: (cubit) async {
      await cubit.load();
      await cubit.signOutAndErase();
    },
    verify: (_) => expect(calls, ['erase', 'signOut']),
  );

  blocTest<SignOutCubit, SignOutState>(
    'sync then sign out waits until the queue is empty',
    build: () {
      final controller = StreamController<SyncSnapshot>();
      // Emits what the cubit reads first, then the drained queue.
      Future<void>.delayed(const Duration(milliseconds: 5), () {
        controller.add(snapshot(2));
        controller.add(snapshot(0));
      });
      return build(controller.stream);
    },
    seed: () => const SignOutState.confirm(pendingCount: 2, online: true),
    act: (cubit) => cubit.syncThenSignOut(),
    expect: () => [
      const SignOutState.syncing(),
      const SignOutState.signingOut(),
      const SignOutState.done(),
    ],
    verify: (_) => expect(calls, ['signOut']),
  );
}
