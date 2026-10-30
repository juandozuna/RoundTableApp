import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/data/curriculum_names.dart';
import 'package:gold_roundtables/core/data/data_scope.dart';
import 'package:gold_roundtables/core/models/assessment_kind.dart';
import 'package:gold_roundtables/core/models/commitment_follow_up_status.dart';
import 'package:gold_roundtables/core/models/user_role.dart';
import 'package:gold_roundtables/core/network/api_exception.dart';
import 'package:gold_roundtables/core/network/postgrest/postgrest.dart';
import 'package:gold_roundtables/features/history/data/datasources/history_remote_data_source.dart';
import 'package:gold_roundtables/features/history/data/services/history_service_impl.dart';
import 'package:gold_roundtables/features/history/domain/models/member_history.dart';

import '../../../core/data/support/online_data_stubs.dart';
import '../../../core/data/support/record_builders.dart';
import '../../../core/data/support/recording_table_reads_client.dart';
import '../../settings/support/stub_selected_language.dart';

/// History read through PostgREST: what the server holds for the table, the
/// filters sent, and when it refetches.
void main() {
  const table = 'table-1';
  const ana = 'person-ana';
  const luis = 'person-luis';
  const sofia = 'person-sofia';
  final week3 = DateTime.utc(2026, 10, 22, 23);
  final week4 = DateTime.utc(2026, 10, 29, 23);

  late RecordingTableReadsClient client;
  late StubSelectedLanguage language;
  late WatchHarness harness;
  late HistoryServiceImpl history;

  setUp(() {
    client = RecordingTableReadsClient()
      ..seed(PostgrestTables.roundTables, [RecordBuilders.table()])
      ..seed(PostgrestTables.curriculumModules, [RecordBuilders.module()])
      ..seed(PostgrestTables.curriculumValues, [
        RecordBuilders.value('v3', sequence: 3, name: 'Honestidad'),
        RecordBuilders.value('v4', sequence: 4, name: 'Responsabilidad'),
      ])
      ..seed(PostgrestTables.tableMembers, [
        RecordBuilders.member(
          sofia,
          first: 'Sofía',
          last: 'Herrera',
          role: UserRole.facilitator,
        ),
        RecordBuilders.member(ana, first: 'Ana Lucía', last: 'Méndez'),
        RecordBuilders.member(luis, first: 'Luis', last: 'Ferrer'),
      ])
      ..seed(PostgrestTables.sessions, [
        RecordBuilders.session('s3', at: week3, valueId: 'v3'),
        RecordBuilders.session('s4', at: week4, valueId: 'v4'),
      ])
      ..seed(PostgrestTables.sessionAttendance, [
        RecordBuilders.attendance('s3', ana, syncedLate: true),
        RecordBuilders.attendance('s3', luis),
      ])
      ..seed(PostgrestTables.memberAssessments, [
        RecordBuilders.assessment(
          's3',
          ana,
          'v3',
          6,
          justification: 'Me cuesta ser sincera',
        ),
        RecordBuilders.assessment('s3', luis, 'v3', 4),
        RecordBuilders.assessment(
          's4',
          ana,
          'v3',
          8,
          kind: AssessmentKind.followUp,
          justification: 'Ya hablo con ella',
        ),
      ])
      ..seed(PostgrestTables.memberCommitments, [
        RecordBuilders.commitment(
          's3',
          ana,
          'v3',
          status: CommitmentFollowUpStatus.kept,
        ),
      ]);
    language = StubSelectedLanguage();
    harness = WatchHarness();
    history = HistoryServiceImpl(
      HistoryRemoteDataSource(client, CurriculumNamesReader(client)),
      language,
      harness.watch,
    );
  });

  test('builds a member history from the table rows', () async {
    final result = await history
        .watchMemberHistory(tableId: table, personId: ana)
        .first;

    expect(result.name, 'Ana Lucía Méndez');
    final honesty = result.values.single;
    expect(honesty.name, 'Honestidad');
    expect(honesty.moduleName, 'Carácter');
    expect(honesty.initialScore, 6);
    expect(honesty.initialJustification, 'Me cuesta ser sincera');
    expect(honesty.followUpScore, 8);
    expect(honesty.improvement, 2);
    expect(honesty.commitment!.status, CommitmentFollowUpStatus.kept);
    expect(result.attendedSessions, 1);
    expect(result.sessions.any((s) => s.syncedLate), isTrue);
  });

  test('a person with no rows gets an empty history', () async {
    final stranger = await history
        .watchMemberHistory(tableId: table, personId: 'person-unknown')
        .first;

    expect(stranger.values, isEmpty);
  });

  test('the facilitator view averages the table', () async {
    final result = await history.watchTableHistory(table).first;

    expect(result.tableName, 'Mesa Esperanza 03');
    expect(result.values.single.averageInitial, 5);
    expect(result.members.map((m) => m.name), contains('Luis Ferrer'));
  });

  group('queries', () {
    test('every read is scoped to the table and skips archived rows', () async {
      await history.watchTableHistory(table).first;

      expect(
        client
            .readsOf(PostgrestTables.roundTables)
            .single
            .filter(PostgrestColumns.id),
        'eq.$table',
      );
      for (final name in [
        PostgrestTables.sessions,
        PostgrestTables.sessionAttendance,
        PostgrestTables.memberAssessments,
        PostgrestTables.memberCommitments,
      ]) {
        final read = client.readsOf(name).single;
        expect(read.filter(PostgrestColumns.roundTableId), 'eq.$table');
        expect(read.filter(PostgrestColumns.archivedAt), 'is.null');
      }
      final roster = client.readsOf(PostgrestTables.tableMembers).single;
      expect(roster.filter(PostgrestColumns.roundTableId), 'eq.$table');
    });

    test('the table view reads every person, a member view one', () async {
      await history.watchTableHistory(table).first;
      await history.watchMemberHistory(tableId: table, personId: ana).first;

      final reads = client.readsOf(PostgrestTables.memberAssessments);
      expect(reads.first.filter(PostgrestColumns.personId), isNull);
      expect(reads.last.filter(PostgrestColumns.personId), 'eq.$ana');
    });

    test('a refresh sends eight reads for a table, each page-sized', () async {
      await history.watchTableHistory(table).first;

      // table + modules + values + sessions + roster + 3 answer tables.
      expect(client.reads, hasLength(8));
      expect(
        client.reads
            .where((r) => r.table == PostgrestTables.sessions)
            .single
            .query[PostgrestParams.limit],
        '1000',
      );
    });
  });

  group('content language', () {
    setUp(() {
      client.seed(PostgrestTables.curriculumTranslations, [
        RecordBuilders.translation(
          CurriculumTranslationTypes.value,
          'v3',
          'Honesty',
        ),
        RecordBuilders.translation(
          CurriculumTranslationTypes.module,
          'module-1',
          'Character',
        ),
      ]);
    });

    test('the Spanish base text reads no translations', () async {
      await history.watchMemberHistory(tableId: table, personId: ana).first;

      expect(client.readsOf(PostgrestTables.curriculumTranslations), isEmpty);
    });

    test('the chosen language replaces value and module names', () async {
      language.selected = 'en';

      final result = await history
          .watchMemberHistory(tableId: table, personId: ana)
          .first;

      final honesty = result.values.single;
      expect(honesty.name, 'Honesty');
      expect(honesty.moduleName, 'Character');
      expect(
        client
            .readsOf(PostgrestTables.curriculumTranslations)
            .single
            .filter(PostgrestColumns.locale),
        'eq.en',
      );
    });
  });

  group('refresh', () {
    Future<List<MemberHistory>> listen(Future<void> Function() act) async {
      final emitted = <MemberHistory>[];
      final sub = history
          .watchMemberHistory(tableId: table, personId: ana)
          .listen(emitted.add);
      await pumpEventQueue();
      await act();
      await pumpEventQueue();
      await sub.cancel();
      return emitted;
    }

    test('refetches when the session or history changes', () async {
      final emitted = await listen(() async {
        client.seed(PostgrestTables.memberAssessments, [
          RecordBuilders.assessment('s3', ana, 'v3', 9),
        ]);
        harness.signal.notify(DataScope.session);
        await pumpEventQueue();
        client.seed(PostgrestTables.memberAssessments, [
          RecordBuilders.assessment('s3', ana, 'v3', 2),
        ]);
        harness.signal.notify(DataScope.history);
      });

      expect(emitted.map((h) => h.values.single.initialScore), [6, 9, 2]);
    });

    test('ignores signals of other areas and does not poll', () async {
      final emitted = await listen(() async {
        harness.signal.notify(DataScope.calendar);
        harness.signal.notify(DataScope.admin);
      });

      expect(emitted, hasLength(1));
      expect(client.readsOf(PostgrestTables.sessions), hasLength(1));
    });

    test('offline is a stream error that the next signal recovers', () async {
      client.failOffline();
      final errors = <Object>[];
      final emitted = <MemberHistory>[];
      final sub = history
          .watchMemberHistory(tableId: table, personId: ana)
          .listen(emitted.add, onError: errors.add);
      await pumpEventQueue();

      client.failure = null;
      harness.signal.notify(DataScope.history);
      await pumpEventQueue();
      await sub.cancel();

      expect(errors.single, isA<ApiException>());
      expect((errors.single as ApiException).kind, ApiErrorKind.network);
      expect(emitted, hasLength(1));
    });
  });
}
