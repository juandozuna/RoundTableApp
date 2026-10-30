import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/data/records/records.dart';
import 'package:gold_roundtables/core/models/assessment_kind.dart';
import 'package:gold_roundtables/core/models/user_role.dart';
import 'package:gold_roundtables/core/network/api_exception.dart';
import 'package:gold_roundtables/core/network/auth_token_provider.dart';
import 'package:gold_roundtables/core/network/postgrest/postgrest.dart';
import 'package:gold_roundtables/features/session/data/datasources/session_reads_remote_data_source.dart';

import '../../../core/data/support/recording_table_reads_client.dart';
import '../support/fixed_clock.dart';
import '../support/session_fixture.dart';

class _Tokens implements AuthTokenProvider {
  _Tokens(this.userId);

  @override
  String? userId;

  @override
  String? get accessToken => 'jwt';

  @override
  Future<String?> refreshAccessToken() async => 'jwt';
}

void main() {
  late RecordingTableReadsClient client;
  late FixedClock clock;
  late _Tokens tokens;
  late SessionReadsRemoteDataSource reads;

  setUp(() {
    client = RecordingTableReadsClient();
    clock = FixedClock(DateTime.utc(2026, 10, 29, 22));
    tokens = _Tokens('user-a');
    reads = SessionReadsRemoteDataSource(client, tokens, clock);
  });

  group('my seat', () {
    test('asks for the signed-in user\'s active seats at the table', () async {
      client.seed(PostgrestTables.tableMembers, [
        SessionFixture.member('tm-ana', Ids.ana, UserRole.member, 'Ana', 'M'),
      ]);

      final seat = await reads.myMembership(tableId: Ids.table);

      expect(seat?.personId, Ids.ana);
      final read = client.readsOf(PostgrestTables.tableMembers).single;
      expect(read.filter(PostgrestColumns.authUserId), 'eq.user-a');
      expect(read.filter(PostgrestColumns.status), 'eq.active');
      expect(read.filter(PostgrestColumns.roundTableId), 'eq.${Ids.table}');
    });

    test('without a table, the facilitator seat wins', () async {
      client.seed(PostgrestTables.tableMembers, [
        SessionFixture.member('tm-1', Ids.ana, UserRole.member, 'Ana', 'M'),
        SessionFixture.member(
          'tm-2',
          Ids.sofia,
          UserRole.facilitator,
          'Sofía',
          'H',
        ),
      ]);

      final seat = await reads.myMembership();

      expect(seat?.role, UserRole.facilitator);
      expect(
        client
            .readsOf(PostgrestTables.tableMembers)
            .single
            .query
            .containsKey(PostgrestColumns.roundTableId),
        isFalse,
      );
    });

    test('a seat that was left does not count', () async {
      client.seed(PostgrestTables.tableMembers, [
        SessionFixture.member(
          'tm-1',
          Ids.ana,
          UserRole.member,
          'Ana',
          'M',
        ).copyWith(leftAt: DateTime.utc(2026, 9, 1)),
      ]);
      expect(await reads.myMembership(), isNull);
    });

    test('signed out: no seat and no request', () async {
      tokens.userId = null;
      expect(await reads.myMembership(), isNull);
      expect(client.reads, isEmpty);
    });

    test('the seat is remembered for a while, not forever', () async {
      client.seed(PostgrestTables.tableMembers, [
        SessionFixture.member('tm-1', Ids.ana, UserRole.member, 'Ana', 'M'),
      ]);

      await reads.myMembership();
      await reads.myMembership();
      expect(client.readsOf(PostgrestTables.tableMembers), hasLength(1));

      clock.now = clock.now.add(SessionReadsRemoteDataSource.referenceTtl);
      await reads.myMembership();
      expect(client.readsOf(PostgrestTables.tableMembers), hasLength(2));
    });

    test('clearing the cache makes the next read ask again', () async {
      client.seed(PostgrestTables.tableMembers, [
        SessionFixture.member('tm-1', Ids.ana, UserRole.member, 'Ana', 'M'),
      ]);
      await reads.myMembership();

      reads.clearReferenceCache();
      await reads.myMembership();

      expect(client.readsOf(PostgrestTables.tableMembers), hasLength(2));
    });

    test('another person never sees what the previous one read', () async {
      client.seed(PostgrestTables.roundTables, [
        const RoundTableRecord(
          id: Ids.table,
          organizationId: Ids.org,
          locationId: 'loc-1',
          name: 'Mesa Esperanza 03',
          code: 'LUZ-03',
          weekday: 4,
          startTime: '19:00:00',
          timezone: 'America/Santo_Domingo',
          durationMinutes: 30,
          status: 'active',
        ),
      ]);
      await reads.roundTable(Ids.table);
      await reads.roundTable(Ids.table);
      expect(client.readsOf(PostgrestTables.roundTables), hasLength(1));

      tokens.userId = 'user-b';
      await reads.roundTable(Ids.table);

      expect(client.readsOf(PostgrestTables.roundTables), hasLength(2));
    });

    test('no seat yet is asked again next time', () async {
      await reads.myMembership();
      await reads.myMembership();
      expect(client.readsOf(PostgrestTables.tableMembers), hasLength(2));
    });

    test('a failed read is not remembered', () async {
      client.failOffline();
      await expectLater(reads.myMembership(), throwsA(isA<ApiException>()));

      client
        ..failure = null
        ..seed(PostgrestTables.tableMembers, [
          SessionFixture.member('tm-1', Ids.ana, UserRole.member, 'Ana', 'M'),
        ]);
      expect((await reads.myMembership())?.personId, Ids.ana);
    });
  });

  group('sessions', () {
    test(
      'pending sessions: the table\'s scheduled and open, not archived',
      () async {
        await reads.pendingSessions(Ids.table);

        final read = client.readsOf(PostgrestTables.sessions).single;
        expect(read.filter(PostgrestColumns.roundTableId), 'eq.${Ids.table}');
        expect(read.filter(PostgrestColumns.status), 'in.(scheduled,open)');
        expect(read.filter(PostgrestColumns.archivedAt), 'is.null');
        expect(
          read.filter(PostgrestParams.order),
          contains('scheduled_at.asc'),
        );
      },
    );

    test('the last closed session is one row, newest ending first', () async {
      await reads.lastClosedSession(Ids.table);

      final read = client.readsOf(PostgrestTables.sessions).single;
      expect(read.filter(PostgrestColumns.status), 'eq.closed');
      expect(read.filter(PostgrestColumns.archivedAt), 'is.null');
      expect(read.filter(PostgrestParams.order), startsWith('ended_at.desc'));
      expect(read.filter(PostgrestParams.limit), '1');
    });
  });

  group('rows of one session', () {
    test('are always filtered by session and archive state', () async {
      await reads.attendance(Ids.session);
      await reads.assessments(Ids.session);
      await reads.answers(Ids.session);
      await reads.commitments(Ids.session);

      for (final table in [
        PostgrestTables.sessionAttendance,
        PostgrestTables.memberAssessments,
        PostgrestTables.memberAnswers,
        PostgrestTables.memberCommitments,
      ]) {
        final read = client.readsOf(table).single;
        expect(read.filter(PostgrestColumns.sessionId), 'eq.${Ids.session}');
        expect(read.filter(PostgrestColumns.archivedAt), 'is.null');
      }
    });

    test('previous commitments are filtered by table and value', () async {
      await reads.commitmentsOfValue(tableId: Ids.table, valueId: Ids.value3);

      final read = client.readsOf(PostgrestTables.memberCommitments).single;
      expect(read.filter(PostgrestColumns.roundTableId), 'eq.${Ids.table}');
      expect(read.filter(PostgrestColumns.valueId), 'eq.${Ids.value3}');
      expect(read.filter(PostgrestColumns.archivedAt), 'is.null');
    });

    test(
      'the row a write edits is found by session, person and kind',
      () async {
        await reads.myAssessment(
          sessionId: Ids.session,
          personId: Ids.ana,
          kind: AssessmentKind.followUp,
        );

        final read = client.readsOf(PostgrestTables.memberAssessments).single;
        expect(read.filter(PostgrestColumns.sessionId), 'eq.${Ids.session}');
        expect(read.filter(PostgrestColumns.personId), 'eq.${Ids.ana}');
        expect(read.filter(PostgrestColumns.kind), 'eq.follow_up');
      },
    );

    test('a failed read is an ApiException', () async {
      client.failOffline();
      await expectLater(
        reads.attendance(Ids.session),
        throwsA(
          isA<ApiException>().having(
            (e) => e.kind,
            'kind',
            ApiErrorKind.network,
          ),
        ),
      );
    });
  });

  group('curriculum', () {
    test('values, questions and translations are remembered', () async {
      client.seed(PostgrestTables.curriculumValues, [
        SessionFixture.value(Ids.value4, 4, 'Responsabilidad'),
      ]);

      final first = await reads.values([Ids.value4, Ids.value4]);
      await reads.values([Ids.value4]);
      await reads.questions(Ids.value4);
      await reads.questions(Ids.value4);
      await reads.translations(locale: 'en', entityIds: [Ids.value4]);
      await reads.translations(locale: 'en', entityIds: [Ids.value4]);

      expect(first.keys, [Ids.value4]);
      expect(client.readsOf(PostgrestTables.curriculumValues), hasLength(1));
      expect(client.readsOf(PostgrestTables.valueQuestions), hasLength(1));
      expect(
        client.readsOf(PostgrestTables.curriculumTranslations),
        hasLength(1),
      );
    });

    test('questions are the active ones in answer order', () async {
      await reads.questions(Ids.value4);
      final read = client.readsOf(PostgrestTables.valueQuestions).single;
      expect(read.filter(PostgrestColumns.valueId), 'eq.${Ids.value4}');
      expect(read.filter(PostgrestColumns.status), 'eq.active');
      expect(read.filter(PostgrestParams.order), 'sort_order.asc');
    });

    test('translations are asked for one language and the given ids', () async {
      await reads.translations(locale: 'en', entityIds: ['b', 'a']);
      final read = client
          .readsOf(PostgrestTables.curriculumTranslations)
          .single;
      expect(read.filter(PostgrestColumns.locale), 'eq.en');
      expect(read.filter(PostgrestColumns.entityId), 'in.(a,b)');
    });

    test('no ids, no request', () async {
      expect(await reads.translations(locale: 'en', entityIds: []), isEmpty);
      expect(client.reads, isEmpty);
    });
  });
}
