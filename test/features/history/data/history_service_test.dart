import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/models/assessment_kind.dart';
import 'package:gold_roundtables/features/history/data/datasources/history_local_data_source.dart';
import 'package:gold_roundtables/features/history/data/services/history_service_impl.dart';
import 'package:gold_roundtables/features/session/data/datasources/session_local_data_source.dart';
import 'package:gold_roundtables/features/session/data/services/responses_service_impl.dart';
import 'package:gold_roundtables/features/session/domain/models/commitment_follow_up_status.dart';
import 'package:gold_roundtables/features/session/domain/models/response_submissions.dart';

import '../../session/support/counter_id_generator.dart';
import '../../session/support/session_fixture.dart';
import '../../session/support/session_test_database.dart';

/// History read from a real PowerSync database: what a download wrote, what
/// the person captured offline, and the justification of RF-52.
void main() {
  late SessionTestDatabase db;
  late HistoryServiceImpl history;
  late ResponsesServiceImpl responses;

  setUp(() async {
    db = await SessionTestDatabase.open();
    await SessionFixture.seed(db, asFacilitator: false);
    await db.seedSynced('curriculum_modules', 'module-1', {
      'number': 1,
      'name': 'Carácter',
      'status': 'active',
    });
    await db.seedSynced('curriculum_values', Ids.value3, {
      'module_id': 'module-1',
      'name': 'Honestidad',
      'sequence': 3,
      'status': 'active',
    });
    await db.seedSynced('curriculum_values', Ids.value4, {
      'module_id': 'module-1',
      'name': 'Responsabilidad',
      'sequence': 4,
      'status': 'active',
    });
    // Session 3 closed last week; session 4 (fixture) is today's.
    await db.seedSynced('sessions', Ids.closedSession, {
      'organization_id': Ids.org,
      'round_table_id': Ids.table,
      'value_id': Ids.value3,
      'status': 'closed',
      'scheduled_at': DateTime.utc(2026, 10, 22, 23).toIso8601String(),
    });
    await db.seedSynced('session_attendance', 'att-ana-3', {
      'round_table_id': Ids.table,
      'session_id': Ids.closedSession,
      'person_id': Ids.ana,
      'status': 'present',
      'synced_late': 1,
    });
    await db.seedSynced('member_assessments', 'as-ana-3', {
      'round_table_id': Ids.table,
      'session_id': Ids.closedSession,
      'person_id': Ids.ana,
      'value_id': Ids.value3,
      'kind': 'initial',
      'score': 6,
      'justification': 'Me cuesta ser sincera',
    });
    await db.seedSynced('member_assessments', 'as-luis-3', {
      'round_table_id': Ids.table,
      'session_id': Ids.closedSession,
      'person_id': Ids.luis,
      'value_id': Ids.value3,
      'kind': 'initial',
      'score': 4,
    });
    history = HistoryServiceImpl(HistoryLocalDataSource(db.sync));
    responses = ResponsesServiceImpl(
      SessionLocalDataSource(db.drift, db.sync),
      FixedClock(DateTime.utc(2026, 10, 29, 22, 30)),
      CounterIdGenerator(),
    );
  });

  tearDown(() => db.close());

  test('reads the synced history of a member offline', () async {
    final ana = await history
        .watchMemberHistory(tableId: Ids.table, personId: Ids.ana)
        .first;

    expect(ana.name, 'Ana Lucía Méndez');
    final honesty = ana.values.single;
    expect(honesty.moduleName, 'Carácter');
    expect(honesty.initialScore, 6);
    expect(honesty.initialJustification, 'Me cuesta ser sincera');
    expect(ana.sessions.single.syncedLate, isTrue);
    expect(ana.attendedSessions, 1);
  });

  test('a person the device holds no rows for gets an empty history', () async {
    final stranger = await history
        .watchMemberHistory(tableId: Ids.table, personId: 'person-unknown')
        .first;
    expect(stranger.values, isEmpty);
  });

  test('facilitator view averages the table', () async {
    final table = await history.watchTableHistory(Ids.table).first;

    expect(table.tableName, 'Mesa Esperanza 03');
    expect(table.values.single.averageInitial, 5);
    expect(table.members.map((m) => m.name), contains('Luis Ferrer'));
  });

  test('re-emits when the person captures a follow-up offline', () async {
    final updated = history
        .watchMemberHistory(tableId: Ids.table, personId: Ids.ana)
        .firstWhere((h) => h.values.any((v) => v.followUpScore == 8))
        .timeout(const Duration(seconds: 5));

    await responses.submitFollowUp(
      const FollowUpSubmission(
        sessionId: Ids.session,
        previousCommitmentId: Ids.anaPrevious,
        status: CommitmentFollowUpStatus.kept,
        score: 8,
        note: 'Lo logré',
        justification: '  Ya hablo con ella cada semana ',
      ),
    );

    final honesty = (await updated).values.single;
    expect(honesty.followUpJustification, 'Ya hablo con ella cada semana');
    expect(honesty.improvement, 2);
    expect(honesty.commitment!.status, CommitmentFollowUpStatus.kept);
  });

  test('stores the justification with the assessment and queues it', () async {
    await responses.submitReflection(
      const ReflectionSubmission(
        sessionId: Ids.session,
        answers: {Ids.q1: 'Mi abuelo', Ids.q2: 'Cumplo casi siempre'},
        score: 8,
        justification: ' Porque cumplo ',
      ),
    );

    final row = await db.sync.powerSync.get(
      'SELECT justification, kind FROM member_assessments '
      'WHERE session_id = ? AND person_id = ?',
      [Ids.session, Ids.ana],
    );
    expect(row['kind'], AssessmentKind.initial.wireValue);
    expect(row['justification'], 'Porque cumplo');
    final queued = await db.queuedEntries();
    expect(
      queued.any(
        (e) => (e['data'] as Map?)?['justification'] == 'Porque cumplo',
      ),
      isTrue,
    );
  });

  test('a blank justification is stored as no justification', () async {
    await responses.submitReflection(
      const ReflectionSubmission(
        sessionId: Ids.session,
        answers: {Ids.q1: 'Mi abuelo', Ids.q2: 'Cumplo casi siempre'},
        score: 8,
        justification: '   ',
      ),
    );

    final row = await db.sync.powerSync.get(
      'SELECT justification FROM member_assessments WHERE session_id = ?',
      [Ids.session],
    );
    expect(row['justification'], isNull);
  });
}
