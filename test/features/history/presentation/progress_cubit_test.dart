import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/models/user_role.dart';
import 'package:gold_roundtables/core/services/connectivity/watch_connectivity_use_case.dart';
import 'package:gold_roundtables/core/services/session_context/session_context.dart';
import 'package:gold_roundtables/core/services/session_context/watch_session_context_use_case.dart';
import 'package:gold_roundtables/features/history/domain/models/member_history.dart';
import 'package:gold_roundtables/features/history/domain/models/table_history.dart';
import 'package:gold_roundtables/features/history/domain/use_cases/watch/watch_member_history_use_case.dart';
import 'package:gold_roundtables/features/history/domain/use_cases/watch/watch_table_history_use_case.dart';
import 'package:gold_roundtables/features/history/presentation/pages/member_timeline/cubit/member_timeline_cubit.dart';
import 'package:gold_roundtables/features/history/presentation/pages/member_timeline/cubit/member_timeline_state.dart';
import 'package:gold_roundtables/features/history/presentation/pages/progress/cubit/progress_cubit.dart';
import 'package:gold_roundtables/features/history/presentation/pages/progress/cubit/progress_state.dart';
import 'package:mocktail/mocktail.dart';

class _MockContext extends Mock implements WatchSessionContextUseCase {}

class _MockMemberHistory extends Mock implements WatchMemberHistoryUseCase {}

class _MockTableHistory extends Mock implements WatchTableHistoryUseCase {}

class _MockConnectivity extends Mock implements WatchConnectivityUseCase {}

void main() {
  const memberContext = SessionContext(
    role: UserRole.member,
    personId: 'ana',
    tableId: 't1',
  );
  const facilitatorContext = SessionContext(
    role: UserRole.facilitator,
    personId: 'sofia',
    tableId: 't1',
  );
  const anaHistory = MemberHistory(personId: 'ana', name: 'Ana');
  const tableHistory = TableHistory(tableId: 't1', tableName: 'Esperanza');

  late StreamController<SessionContext?> contexts;
  late StreamController<bool> online;
  late _MockContext watchContext;
  late _MockMemberHistory watchMember;
  late _MockTableHistory watchTable;
  late _MockConnectivity watchConnectivity;
  late ProgressCubit cubit;

  setUp(() {
    contexts = StreamController<SessionContext?>.broadcast();
    online = StreamController<bool>.broadcast();
    watchContext = _MockContext();
    watchMember = _MockMemberHistory();
    watchTable = _MockTableHistory();
    watchConnectivity = _MockConnectivity();
    when(() => watchContext()).thenAnswer((_) => contexts.stream);
    when(() => watchConnectivity()).thenAnswer((_) => online.stream);
    when(
      () => watchMember(
        tableId: any(named: 'tableId'),
        personId: any(named: 'personId'),
      ),
    ).thenAnswer((_) => Stream.value(anaHistory));
    when(() => watchTable(any())).thenAnswer((_) => Stream.value(tableHistory));
    cubit = ProgressCubit(
      watchContext,
      watchMember,
      watchTable,
      watchConnectivity,
    );
  });

  tearDown(() async {
    await cubit.close();
    await contexts.close();
    await online.close();
  });

  Future<void> emitContext(SessionContext? context) async {
    contexts.add(context);
    await pumpEventQueue();
  }

  test('starts loading', () {
    expect(cubit.state.status, ProgressStatus.loading);
  });

  test('a member sees their own history of the active table', () async {
    await cubit.load();
    await emitContext(memberContext);

    expect(cubit.state.status, ProgressStatus.member);
    expect(cubit.state.member, anaHistory);
    verify(() => watchMember(tableId: 't1', personId: 'ana')).called(1);
    verifyNever(() => watchTable(any()));
  });

  test('a facilitator sees the history of the table they lead', () async {
    await cubit.load();
    await emitContext(facilitatorContext);

    expect(cubit.state.status, ProgressStatus.facilitator);
    expect(cubit.state.table, tableHistory);
    verify(() => watchTable('t1')).called(1);
  });

  test('switching context re-targets the history', () async {
    await cubit.load();
    await emitContext(memberContext);
    await emitContext(facilitatorContext);

    expect(cubit.state.status, ProgressStatus.facilitator);
    expect(cubit.state.member, isNull);
  });

  test('roles without a table have nothing to show', () async {
    await cubit.load();
    await emitContext(const SessionContext(role: UserRole.coordinator));
    expect(cubit.state.status, ProgressStatus.unavailable);

    await emitContext(null);
    expect(cubit.state.status, ProgressStatus.unavailable);
  });

  test('a failing stream reports a failure and load() retries', () async {
    when(
      () => watchMember(
        tableId: any(named: 'tableId'),
        personId: any(named: 'personId'),
      ),
    ).thenAnswer((_) => Stream.error(StateError('db')));
    await cubit.load();
    await emitContext(memberContext);
    expect(cubit.state.status, ProgressStatus.failure);

    when(
      () => watchMember(
        tableId: any(named: 'tableId'),
        personId: any(named: 'personId'),
      ),
    ).thenAnswer((_) => Stream.value(anaHistory));
    await cubit.load();
    await emitContext(memberContext);
    expect(cubit.state.status, ProgressStatus.member);
  });

  test('tracks connectivity for the offline banner', () async {
    await cubit.load();
    online.add(false);
    await pumpEventQueue();
    expect(cubit.state.online, isFalse);

    online.add(true);
    await pumpEventQueue();
    expect(cubit.state.online, isTrue);
  });

  group('MemberTimelineCubit', () {
    test('loads one member for the facilitator and retries', () async {
      final timeline = MemberTimelineCubit(watchMember, watchConnectivity);
      addTearDown(timeline.close);

      await timeline.load(tableId: 't1', personId: 'ana');
      await pumpEventQueue();
      expect(timeline.state.status, MemberTimelineStatus.ready);
      expect(timeline.state.history, anaHistory);

      await timeline.retry();
      await pumpEventQueue();
      verify(() => watchMember(tableId: 't1', personId: 'ana')).called(2);
    });

    test('reports a failure', () async {
      when(
        () => watchMember(
          tableId: any(named: 'tableId'),
          personId: any(named: 'personId'),
        ),
      ).thenAnswer((_) => Stream.error(StateError('db')));
      final timeline = MemberTimelineCubit(watchMember, watchConnectivity);
      addTearDown(timeline.close);

      await timeline.load(tableId: 't1', personId: 'ana');
      await pumpEventQueue();

      expect(timeline.state.status, MemberTimelineStatus.failure);
    });
  });
}
