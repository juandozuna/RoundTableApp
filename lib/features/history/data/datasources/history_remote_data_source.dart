import 'package:injectable/injectable.dart';

import '../../../../core/data/curriculum_names.dart';
import '../../../../core/data/paged_read.dart';
import '../../../../core/data/wait_unwrapped.dart';
import '../../../../core/network/api_guard.dart';
import '../../../../core/network/postgrest/postgrest.dart';
import '../../domain/models/history_snapshot.dart';
import '../mappers/history_record_mappers.dart';

/// Reads a table's history through PostgREST under RLS (ADR 0019).
///
/// Rows are filtered by table (RLS also lets coordinators and administrators
/// read whole organizations) and by `archived_at IS NULL`: sessions archived
/// by `app.archive_old_session_data` were never part of the history the app
/// shows. A person's own view narrows attendance, assessments and commitments
/// to that person, which is all the member builder reads.
@lazySingleton
class HistoryRemoteDataSource {
  HistoryRemoteDataSource(this._client, this._curriculum);

  final TableReadsClient _client;
  final CurriculumNamesReader _curriculum;

  /// One refresh: seven reads in parallel, each paged past PostgREST's cap.
  /// [personId] limits the answer tables to one person (null reads the whole
  /// table's). [locale] is the translation language, null for the Spanish
  /// base text.
  Future<HistorySnapshot> fetchSnapshot(
    String tableId, {
    String? personId,
    String? locale,
  }) async {
    final onTable = {
      PostgrestColumns.roundTableId: PostgrestFilter.eq(tableId),
    };
    final current = {
      ...onTable,
      PostgrestColumns.archivedAt: PostgrestFilter.isNull(),
    };
    final answers = {
      ...current,
      if (personId != null)
        PostgrestColumns.personId: PostgrestFilter.eq(personId),
    };
    final byId = [PostgrestOrder.asc(PostgrestColumns.id)];

    final (
      table,
      names,
      sessions,
      roster,
      attendance,
      assessments,
      commitments,
    ) = await (
      guardApiCall(
        () => _client.roundTables(
          PostgrestQuery.of(
            filters: {PostgrestColumns.id: PostgrestFilter.eq(tableId)},
          ),
        ),
      ),
      _curriculum.load(locale: locale),
      readAllPages(_client.sessions, filters: current, order: byId),
      readAllPages(_client.tableMembers, filters: onTable, order: byId),
      readAllPages(_client.sessionAttendance, filters: answers, order: byId),
      readAllPages(_client.memberAssessments, filters: answers, order: byId),
      readAllPages(_client.memberCommitments, filters: answers, order: byId),
    ).waitUnwrapped;

    return HistorySnapshot(
      tableId: tableId,
      tableName: table.firstOrNull?.name ?? '',
      values: names.toHistoryValues(),
      sessions: [for (final row in sessions) row.toHistorySession()],
      roster: roster.toHistoryRoster(),
      attendance: [for (final row in attendance) row.toHistoryAttendance()],
      assessments: [for (final row in assessments) row.toHistoryAssessment()],
      commitments: [for (final row in commitments) row.toHistoryCommitment()],
    );
  }
}
