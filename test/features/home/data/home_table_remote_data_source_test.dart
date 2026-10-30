import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/data/curriculum_names.dart';
import 'package:gold_roundtables/core/models/assessment_kind.dart';
import 'package:gold_roundtables/core/models/commitment_follow_up_status.dart';
import 'package:gold_roundtables/core/models/session_status.dart';
import 'package:gold_roundtables/core/models/user_role.dart';
import 'package:gold_roundtables/core/network/postgrest/postgrest.dart';
import 'package:gold_roundtables/features/home/data/datasources/home_table_remote_data_source.dart';
import 'package:gold_roundtables/features/home/domain/models/home_commitment.dart';

import '../../../core/data/support/record_builders.dart';
import '../../../core/data/support/recording_table_reads_client.dart';

/// The home's table, commitment and progress as built from server rows.
void main() {
  const table = 'table-1';
  const ana = 'person-ana';

  late RecordingTableReadsClient client;
  late HomeTableRemoteDataSource source;

  setUp(() {
    client = RecordingTableReadsClient()
      ..seed(PostgrestTables.roundTables, [RecordBuilders.table()])
      ..seed(PostgrestTables.tableMembers, [
        RecordBuilders.member('f', role: UserRole.facilitator),
        RecordBuilders.member('a'),
        RecordBuilders.member('b'),
      ])
      ..seed(PostgrestTables.curriculumModules, [
        RecordBuilders.module(valueCount: 2),
        RecordBuilders.module(
          id: 'module-2',
          number: 2,
          name: 'Relaciones',
          valueCount: 1,
        ),
      ])
      ..seed(PostgrestTables.curriculumValues, [
        RecordBuilders.value('v3', sequence: 3, name: 'Honestidad'),
        RecordBuilders.value('v4', sequence: 4, name: 'Responsabilidad'),
        RecordBuilders.value(
          'v9',
          sequence: 9,
          name: 'Respeto',
          moduleId: 'module-2',
        ),
      ])
      ..seed(PostgrestTables.sessions, [
        // Newest first, as PostgREST returns them.
        RecordBuilders.session(
          's6',
          status: SessionStatus.scheduled,
          at: DateTime.utc(2026, 11, 3, 23),
          valueId: 'v9',
        ),
        RecordBuilders.session(
          's5',
          status: SessionStatus.scheduled,
          at: DateTime.utc(2026, 10, 27, 23),
          valueId: 'v4',
          followUpValueId: 'v3',
          kind: 'extraordinary',
          originalAt: DateTime.utc(2026, 10, 29, 23),
        ),
        RecordBuilders.session(
          's4',
          status: SessionStatus.cancelled,
          at: DateTime.utc(2026, 10, 24, 23),
          cancelledReason: 'table_closed',
        ),
        RecordBuilders.session(
          's3',
          status: SessionStatus.cancelled,
          at: DateTime.utc(2026, 10, 23, 23),
          cancelledReason: 'Feriado',
        ),
        RecordBuilders.session(
          's2',
          at: DateTime.utc(2026, 10, 20, 23),
          endedAt: DateTime.utc(2026, 10, 21, 1),
        ),
        RecordBuilders.session(
          's1',
          status: SessionStatus.cancelled,
          at: DateTime.utc(2026, 10, 14, 23),
          cancelledReason: 'Feriado',
        ),
      ]);
    source = HomeTableRemoteDataSource(client, CurriculumNamesReader(client));
  });

  group('fetchTable', () {
    test('builds the pending session, seats and exceptions', () async {
      final record = (await source.fetchTable(table))!;

      expect(record.tableName, 'Mesa Esperanza 03');
      expect(record.tableIsActive, isTrue);
      expect(record.seats, 3);
      expect(record.sessionId, 's5');
      expect(record.sessionIsOpen, isFalse);
      expect(record.scheduledAt, DateTime.utc(2026, 10, 27, 23));
      expect(record.valueName, 'Responsabilidad');
      expect(record.valueSequence, 4);
      expect(record.followUpValueName, 'Honestidad');
      expect(record.sessionIsExtraordinary, isTrue);
      expect(record.rescheduledFrom, DateTime.utc(2026, 10, 29, 23));
      expect(record.lastClosedAt, DateTime.utc(2026, 10, 21, 1));
    });

    test('shows only a cancelled slot an admin cancelled since the last '
        'closed session', () async {
      final record = (await source.fetchTable(table))!;

      // s4 is a table closure and s1 predates the closed session.
      expect(record.cancelledNoticeFor, DateTime.utc(2026, 10, 23, 23));
    });

    test('an open session is reported as open', () async {
      client.seed(PostgrestTables.sessions, [
        RecordBuilders.session(
          's7',
          status: SessionStatus.open,
          at: DateTime.utc(2026, 10, 27, 23),
        ),
      ]);

      final record = (await source.fetchTable(table))!;

      expect(record.sessionIsOpen, isTrue);
      expect(record.lastClosedAt, isNull);
    });

    test('a table RLS does not show is null', () async {
      client.seed(PostgrestTables.roundTables, const []);

      expect(await source.fetchTable(table), isNull);
    });

    test('reads are scoped to the table, current rows, newest first', () async {
      await source.fetchTable(table);

      final sessions = client.readsOf(PostgrestTables.sessions).single;
      expect(sessions.filter(PostgrestColumns.roundTableId), 'eq.$table');
      expect(sessions.filter(PostgrestColumns.archivedAt), 'is.null');
      expect(sessions.query[PostgrestParams.order], 'scheduled_at.desc,id.asc');
      expect(sessions.query[PostgrestParams.limit], '100');
      final members = client.readsOf(PostgrestTables.tableMembers).single;
      expect(members.filter(PostgrestColumns.roundTableId), 'eq.$table');
      expect(members.filter(PostgrestColumns.status), 'eq.active');
      expect(
        client.readsOf(PostgrestTables.roundTables).single.filter('id'),
        'eq.$table',
      );
      // A facilitator's home reads no personal data.
      expect(client.readsOf(PostgrestTables.memberCommitments), isEmpty);
      expect(client.readsOf(PostgrestTables.memberAssessments), isEmpty);
    });

    test('names come from the translations of the chosen language', () async {
      client.seed(PostgrestTables.curriculumTranslations, [
        RecordBuilders.translation(
          CurriculumTranslationTypes.value,
          'v4',
          'Responsibility',
        ),
      ]);

      final record = (await source.fetchTable(table, locale: 'en'))!;

      expect(record.valueName, 'Responsibility');
      expect(record.followUpValueName, 'Honestidad');
    });
  });

  group('fetchMember', () {
    setUp(() {
      client
        ..seed(PostgrestTables.memberCommitments, [
          RecordBuilders.commitment(
            's2',
            ana,
            'v3',
            action: 'Hablar con ella',
            measure: 'Una vez por semana',
            status: CommitmentFollowUpStatus.partial,
          ),
        ])
        ..seed(PostgrestTables.memberAssessments, [
          RecordBuilders.assessment('s2', ana, 'v3', 6),
          RecordBuilders.assessment('s1', ana, 'v3', 7),
          RecordBuilders.assessment('s2', ana, 'v9', 8),
        ]);
    });

    test('carries the last commitment and progress by module', () async {
      final record = await source.fetchMember(table, personId: ana);

      expect(record.table?.sessionId, 's5');
      final commitment = record.commitment!;
      expect(commitment.actionText, 'Hablar con ella');
      expect(commitment.measureText, 'Una vez por semana');
      expect(commitment.valueName, 'Honestidad');
      expect(commitment.outcome, CommitmentOutcome.partial);
      final modules = record.progress.modules;
      expect(modules.map((m) => m.name), ['Carácter', 'Relaciones']);
      // v3 is scored twice but counts once; v9 belongs to module 2.
      expect(modules.map((m) => m.completed), [1, 1]);
      expect(modules.map((m) => m.total), [2, 1]);
    });

    test('personal reads are scoped to the person', () async {
      await source.fetchMember(table, personId: ana);

      final commitments = client.readsOf(PostgrestTables.memberCommitments);
      final latest = commitments.single;
      expect(latest.filter(PostgrestColumns.personId), 'eq.$ana');
      expect(latest.filter(PostgrestColumns.archivedAt), 'is.null');
      expect(
        latest.query[PostgrestParams.order],
        'device_created_at.desc,id.asc',
      );
      expect(latest.query[PostgrestParams.limit], '1');
      final assessments = client.readsOf(PostgrestTables.memberAssessments);
      final initial = assessments.single;
      expect(initial.filter(PostgrestColumns.personId), 'eq.$ana');
      expect(
        initial.filter(PostgrestColumns.kind),
        'eq.${AssessmentKind.initial.wireValue}',
      );
      expect(initial.filter(PostgrestColumns.archivedAt), 'is.null');
    });

    test('translated module names show in the progress', () async {
      client.seed(PostgrestTables.curriculumTranslations, [
        RecordBuilders.translation(
          CurriculumTranslationTypes.module,
          'module-1',
          'Character',
        ),
      ]);

      final record = await source.fetchMember(
        table,
        personId: ana,
        locale: 'en',
      );

      expect(record.progress.modules.first.name, 'Character');
      expect(record.progress.modules.last.name, 'Relaciones');
    });

    test('without a person the personal part is empty', () async {
      final record = await source.fetchMember(table);

      expect(record.table?.sessionId, 's5');
      expect(record.commitment, isNull);
      expect(record.progress.completed, 0);
      expect(record.progress.total, 3);
      expect(client.readsOf(PostgrestTables.memberCommitments), isEmpty);
      expect(client.readsOf(PostgrestTables.memberAssessments), isEmpty);
    });
  });
}
