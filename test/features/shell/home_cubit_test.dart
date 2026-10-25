import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/services/connectivity/connectivity_service.dart';
import 'package:gold_roundtables/core/services/connectivity/watch_connectivity_use_case.dart';
import 'package:gold_roundtables/core/sync/domain/sync_snapshot.dart';
import 'package:gold_roundtables/core/sync/domain/sync_status_service.dart';
import 'package:gold_roundtables/core/sync/domain/watch_sync_status_use_case.dart';
import 'package:gold_roundtables/features/shell/presentation/pages/home/cubit/home_cubit.dart';
import 'package:gold_roundtables/features/shell/presentation/pages/home/cubit/home_state.dart';

class FakeConnectivity implements ConnectivityService {
  final controller = StreamController<bool>();

  @override
  Future<bool> isOnline() async => true;

  @override
  Stream<bool> watchOnline() => controller.stream;
}

class FakeSyncStatus implements SyncStatusService {
  final controller = StreamController<SyncSnapshot>();

  @override
  Stream<SyncSnapshot> watch() => controller.stream;
}

void main() {
  late FakeConnectivity connectivity;
  late FakeSyncStatus sync;
  const pending = SyncSnapshot(
    connection: SyncConnection.offline,
    pendingCount: 3,
  );

  setUp(() {
    connectivity = FakeConnectivity();
    sync = FakeSyncStatus();
  });

  blocTest<HomeCubit, HomeState>(
    'maps connectivity and sync status into state',
    build: () => HomeCubit(
      WatchConnectivityUseCase(connectivity),
      WatchSyncStatusUseCase(sync),
    ),
    act: (_) {
      connectivity.controller.add(false);
      sync.controller.add(pending);
    },
    expect: () => const [
      HomeState(online: false),
      HomeState(online: false, sync: pending),
    ],
  );
}
