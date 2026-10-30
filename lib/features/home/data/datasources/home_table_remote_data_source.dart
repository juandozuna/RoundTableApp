import 'package:injectable/injectable.dart';

import '../../../../core/data/curriculum_names.dart';
import '../../../../core/data/paged_read.dart';
import '../../../../core/data/records/records.dart';
import '../../../../core/data/wait_unwrapped.dart';
import '../../../../core/models/assessment_kind.dart';
import '../../../../core/network/api_guard.dart';
import '../../../../core/network/postgrest/postgrest.dart';
import '../mappers/home_record_mappers.dart';
import '../models/home_records.dart';

/// Reads a table's home through PostgREST under RLS (ADR 0019): its pending
/// session, seats and last closed session, plus a member's latest commitment
/// and progress. Every read is filtered by the table or the person, and
/// session-domain rows by `archived_at IS NULL` as the device's window was,
/// except progress: completed values count archived assessments too, so the
/// count does not drop when the nightly job archives old sessions.
@lazySingleton
class HomeTableRemoteDataSource {
  HomeTableRemoteDataSource(this._client, this._curriculum);

  final TableReadsClient _client;
  final CurriculumNamesReader _curriculum;

  /// Room for the sessions the home looks at: the pending one, the latest
  /// closed one and the cancellations since. Newest first, so older closed
  /// sessions fall outside it.
  static const int _recentSessions = 100;

  /// Null when RLS does not show the table. [locale] is the translation
  /// language, null for the Spanish base text.
  Future<HomeTableRecord?> fetchTable(String tableId, {String? locale}) async {
    final rows = await _readTable(tableId, locale: locale);
    return _toRecord(rows);
  }

  /// The member's table, last commitment and progress. [personId] null (no
  /// person in the context) leaves the personal part empty.
  Future<HomeMemberRecord> fetchMember(
    String tableId, {
    String? personId,
    String? locale,
  }) async {
    final (rows, commitments, assessments) = await (
      _readTable(tableId, locale: locale),
      _latestCommitment(personId),
      _initialAssessments(personId),
    ).waitUnwrapped;
    final names = rows.$4;
    return HomeMemberRecord(
      table: _toRecord(rows),
      commitment: commitments.firstOrNull?.toHomeCommitment(names),
      progress: names.toHomeProgress(assessments),
    );
  }

  HomeTableRecord? _toRecord(_TableRows rows) {
    final (tables, members, sessions, names) = rows;
    final table = tables.firstOrNull;
    if (table == null) return null;
    return HomeTableMapper.toRecord(
      table: table,
      members: members,
      sessions: sessions,
      names: names,
    );
  }

  Future<_TableRows> _readTable(String tableId, {String? locale}) async {
    final onTable = {
      PostgrestColumns.roundTableId: PostgrestFilter.eq(tableId),
    };
    return (
      guardApiCall(
        () => _client.roundTables(
          PostgrestQuery.of(
            filters: {PostgrestColumns.id: PostgrestFilter.eq(tableId)},
          ),
        ),
      ),
      readAllPages(
        _client.tableMembers,
        filters: {
          ...onTable,
          PostgrestColumns.status: PostgrestFilter.eq(
            PostgrestValues.activeStatus,
          ),
        },
        order: [PostgrestOrder.asc(PostgrestColumns.id)],
      ),
      guardApiCall(
        () => _client.sessions(
          PostgrestQuery.of(
            filters: {
              ...onTable,
              PostgrestColumns.archivedAt: PostgrestFilter.isNull(),
            },
            order: [
              PostgrestOrder.desc(PostgrestColumns.scheduledAt),
              PostgrestOrder.asc(PostgrestColumns.id),
            ],
            limit: _recentSessions,
          ),
        ),
      ),
      _curriculum.load(locale: locale),
    ).waitUnwrapped;
  }

  Future<List<MemberCommitmentRecord>> _latestCommitment(String? personId) =>
      personId == null
      ? Future.value(const [])
      : guardApiCall(
          () => _client.memberCommitments(
            PostgrestQuery.of(
              filters: {
                PostgrestColumns.personId: PostgrestFilter.eq(personId),
                PostgrestColumns.archivedAt: PostgrestFilter.isNull(),
              },
              order: [
                PostgrestOrder.desc(PostgrestColumns.deviceCreatedAt),
                PostgrestOrder.asc(PostgrestColumns.id),
              ],
              limit: 1,
            ),
          ),
        );

  Future<List<MemberAssessmentRecord>> _initialAssessments(String? personId) =>
      personId == null
      ? Future.value(const [])
      : readAllPages(
          _client.memberAssessments,
          filters: {
            PostgrestColumns.personId: PostgrestFilter.eq(personId),
            PostgrestColumns.kind: PostgrestFilter.eq(
              AssessmentKind.initial.wireValue,
            ),
          },
          order: [PostgrestOrder.asc(PostgrestColumns.id)],
        );
}

typedef _TableRows = (
  List<RoundTableRecord>,
  List<TableMemberRecord>,
  List<SessionRecord>,
  CurriculumNames,
);
