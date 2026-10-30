import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/services/connectivity/watch_connectivity_use_case.dart';
import 'package:gold_roundtables/features/calendar/domain/models/upcoming_filter.dart';
import 'package:gold_roundtables/features/calendar/domain/models/upcoming_sessions.dart';
import 'package:gold_roundtables/features/calendar/domain/use_cases/watch/watch_upcoming_sessions_use_case.dart';
import 'package:gold_roundtables/features/calendar/presentation/pages/upcoming/cubit/upcoming_cubit.dart';
import 'package:gold_roundtables/features/calendar/presentation/pages/upcoming/cubit/upcoming_state.dart';
import 'package:mocktail/mocktail.dart';

import '../support/calendar_fixtures.dart';

class _MockWatch extends Mock implements WatchUpcomingSessionsUseCase {}

class _MockConnectivity extends Mock implements WatchConnectivityUseCase {}

void main() {
  final central = upcomingSession(id: 'a');
  final norte = upcomingSession(
    id: 'b',
    tableId: 't2',
    tableName: 'Mesa Norte',
    locationId: 'l2',
    locationName: 'Sede Norte',
    facilitatorId: 'f2',
  );
  late StreamController<UpcomingSessions> sessions;
  late StreamController<bool> online;
  late _MockWatch watch;
  late _MockConnectivity connectivity;
  late UpcomingCubit cubit;
  var subscriptions = 0;

  setUp(() {
    subscriptions = 0;
    sessions = StreamController<UpcomingSessions>.broadcast();
    online = StreamController<bool>.broadcast();
    watch = _MockWatch();
    connectivity = _MockConnectivity();
    when(() => watch()).thenAnswer((_) {
      subscriptions++;
      return sessions.stream;
    });
    when(() => connectivity()).thenAnswer((_) => online.stream);
    cubit = UpcomingCubit(watch, connectivity);
  });

  tearDown(() async {
    await cubit.close();
    await sessions.close();
    await online.close();
  });

  Future<void> emitManager() async {
    sessions.add(
      UpcomingSessions(
        scope: UpcomingScope.manager,
        sessions: [central, norte],
      ),
    );
    await pumpEventQueue();
  }

  test('starts loading, then shows the sessions', () async {
    expect(cubit.state.status, UpcomingStatus.loading);
    await cubit.load();
    await emitManager();

    expect(cubit.state.status, UpcomingStatus.ready);
    expect(cubit.state.isManager, isTrue);
    expect(cubit.state.visible, [central, norte]);
  });

  test('filters by location, facilitator and table, and clears', () async {
    await cubit.load();
    await emitManager();

    cubit.filterByLocation('l2');
    expect(cubit.state.visible, [norte]);

    cubit.filterByFacilitator('f1');
    expect(cubit.state.visible, isEmpty);

    cubit.filterByLocation(null);
    cubit.filterByFacilitator(null);
    cubit.filterByTable('t1');
    expect(cubit.state.visible, [central]);

    cubit.clearFilter();
    expect(cubit.state.filter, const UpcomingFilter());
    expect(cubit.state.visible, hasLength(2));
  });

  test('keeps the filter when the list refreshes', () async {
    await cubit.load();
    await emitManager();
    cubit.filterByLocation('l1');
    await emitManager();
    expect(cubit.state.visible, [central]);
  });

  test(
    'a stream error becomes a failure that "Reintentar" recovers from',
    () async {
      await cubit.load();
      sessions.addError(Exception('boom'));
      await pumpEventQueue();
      expect(cubit.state.status, UpcomingStatus.failure);

      await cubit.load();
      expect(cubit.state.status, UpcomingStatus.loading);
      await emitManager();
      expect(cubit.state.status, UpcomingStatus.ready);
    },
  );

  test(
    'a failed refresh keeps the loaded sessions until the next data',
    () async {
      await cubit.load();
      await emitManager();

      sessions.addError(Exception('boom'));
      await pumpEventQueue();
      expect(cubit.state.status, UpcomingStatus.ready);
      expect(cubit.state.visible, [central, norte]);

      sessions.add(
        UpcomingSessions(scope: UpcomingScope.manager, sessions: [central]),
      );
      await pumpEventQueue();
      expect(cubit.state.visible, [central]);
    },
  );

  test('a member context is reported as unavailable', () async {
    await cubit.load();
    sessions.add(const UpcomingSessions(scope: UpcomingScope.unavailable));
    await pumpEventQueue();
    expect(cubit.state.isUnavailable, isTrue);
  });

  test('reloads the online-only list when the connection returns', () async {
    await cubit.load();
    await emitManager();
    online
      ..add(false)
      ..add(true);
    await pumpEventQueue();
    expect(subscriptions, 2);
  });

  test('tracks connectivity without reloading a facilitator list', () async {
    await cubit.load();
    sessions.add(const UpcomingSessions(scope: UpcomingScope.facilitator));
    await pumpEventQueue();
    online
      ..add(false)
      ..add(true);
    await pumpEventQueue();
    expect(cubit.state.online, isTrue);
    expect(subscriptions, 1);
  });

  blocTest<UpcomingCubit, UpcomingState>(
    'emits the offline flag',
    build: () => cubit,
    act: (c) async {
      await c.load();
      online.add(false);
    },
    wait: const Duration(milliseconds: 20),
    verify: (c) => expect(c.state.online, isFalse),
  );
}
