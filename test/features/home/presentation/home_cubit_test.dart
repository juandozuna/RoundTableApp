import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/models/user_role.dart';
import 'package:gold_roundtables/core/network/api_exception.dart';
import 'package:gold_roundtables/core/services/connectivity/connectivity_service.dart';
import 'package:gold_roundtables/core/services/connectivity/watch_connectivity_use_case.dart';
import 'package:gold_roundtables/core/services/session_context/session_context.dart';
import 'package:gold_roundtables/core/sync/domain/sync_snapshot.dart';
import 'package:gold_roundtables/core/sync/domain/sync_status_service.dart';
import 'package:gold_roundtables/core/sync/domain/watch_sync_status_use_case.dart';
import 'package:gold_roundtables/features/home/domain/models/home_overview.dart';
import 'package:gold_roundtables/features/home/domain/use_cases/overview/watch_home_overview_use_case.dart';
import 'package:gold_roundtables/features/home/presentation/pages/home/cubit/home_cubit.dart';
import 'package:gold_roundtables/features/home/presentation/pages/home/cubit/home_state.dart';
import 'package:mocktail/mocktail.dart';

class _MockWatchOverview extends Mock implements WatchHomeOverviewUseCase {}

class _FakeConnectivity implements ConnectivityService {
  final controller = StreamController<bool>();

  @override
  Future<bool> isOnline() async => true;

  @override
  Stream<bool> watchOnline() => controller.stream;
}

class _FakeSyncStatus implements SyncStatusService {
  final controller = StreamController<SyncSnapshot>();

  @override
  Stream<SyncSnapshot> watch() => controller.stream;
}

void main() {
  const member = SessionContext(role: UserRole.member, tableId: 't');
  const overview = HomeOverview.member(context: member);

  late _MockWatchOverview watchOverview;
  late _FakeConnectivity connectivity;
  late _FakeSyncStatus sync;
  late StreamController<HomeOverview> overviews;

  setUp(() {
    watchOverview = _MockWatchOverview();
    connectivity = _FakeConnectivity();
    sync = _FakeSyncStatus();
    overviews = StreamController<HomeOverview>.broadcast();
    when(() => watchOverview()).thenAnswer((_) => overviews.stream);
  });

  HomeCubit build() => HomeCubit(
    watchOverview,
    WatchConnectivityUseCase(connectivity),
    WatchSyncStatusUseCase(sync),
  );

  blocTest<HomeCubit, HomeState>(
    'load shows loading, then the overview',
    build: build,
    act: (cubit) async {
      await cubit.load();
      overviews.add(overview);
    },
    expect: () => const [
      HomeState(),
      HomeState(status: HomeStatus.ready, overview: overview),
    ],
  );

  blocTest<HomeCubit, HomeState>(
    'a failed overview becomes a failure state and Reintentar reloads',
    build: build,
    act: (cubit) async {
      await cubit.load();
      overviews.addError(const ApiException(kind: ApiErrorKind.network));
      await pumpEventQueue();
      await cubit.load();
    },
    verify: (cubit) => verify(() => watchOverview()).called(2),
    expect: () => [
      const HomeState(),
      const HomeState(
        status: HomeStatus.failure,
        error: ApiException(kind: ApiErrorKind.network),
      ),
      const HomeState(),
    ],
  );

  blocTest<HomeCubit, HomeState>(
    'a failed refresh keeps the loaded overview and the next data recovers',
    build: build,
    act: (cubit) async {
      await cubit.load();
      overviews.add(overview);
      await pumpEventQueue();
      overviews.addError(const ApiException(kind: ApiErrorKind.network));
      await pumpEventQueue();
      overviews.add(const HomeOverview.noContext());
    },
    expect: () => const [
      HomeState(),
      HomeState(status: HomeStatus.ready, overview: overview),
      HomeState(status: HomeStatus.ready),
    ],
  );

  blocTest<HomeCubit, HomeState>(
    'tracks connectivity and sync status',
    build: build,
    act: (_) {
      connectivity.controller.add(false);
      sync.controller.add(
        const SyncSnapshot(connection: SyncConnection.offline, pendingCount: 2),
      );
    },
    expect: () => const [
      HomeState(online: false),
      HomeState(
        online: false,
        sync: SyncSnapshot(connection: SyncConnection.offline, pendingCount: 2),
      ),
    ],
  );
}
