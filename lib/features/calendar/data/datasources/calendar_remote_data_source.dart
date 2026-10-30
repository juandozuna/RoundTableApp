import 'package:injectable/injectable.dart';

import '../../../../core/data/paged_read.dart';
import '../../../../core/data/records/records.dart';
import '../../../../core/data/wait_unwrapped.dart';
import '../../../../core/models/session_status.dart';
import '../../../../core/models/user_role.dart';
import '../../../../core/network/postgrest/postgrest.dart';
import '../models/upcoming_session_record.dart';

/// Reads upcoming sessions through PostgREST under RLS (ADR 0019), for the
/// facilitator's table and the managers' organization.
///
/// Scoped by table or organization (RLS alone would let a coordinator read
/// more), session rows by `archived_at IS NULL`. Five reads per refresh:
/// tables first, then locations, active facilitators, pending sessions and
/// the sessions cancelled for a slot still ahead, in parallel.
@lazySingleton
class CalendarRemoteDataSource {
  CalendarRemoteDataSource(this._client);

  final TableReadsClient _client;

  /// Pending sessions of the active tables in [organizationId] or [tableId]
  /// (every table the caller may see when both are null), plus the sessions
  /// cancelled for a slot that has not passed at [now].
  Future<List<UpcomingSessionRecord>> fetch({
    required DateTime now,
    String? organizationId,
    String? tableId,
  }) async {
    final scope = {PostgrestColumns.organizationId: ?_eq(organizationId)};
    final tables = await readAllPages(
      _client.roundTables,
      filters: {
        ...scope,
        PostgrestColumns.id: ?_eq(tableId),
        PostgrestColumns.status: PostgrestFilter.eq('active'),
      },
      order: _byId,
    );
    if (tables.isEmpty) return const [];

    final onScope = {...scope, PostgrestColumns.roundTableId: ?_eq(tableId)};
    final current = {
      ...onScope,
      PostgrestColumns.archivedAt: PostgrestFilter.isNull(),
    };
    final (locations, facilitators, pending, cancelled) = await (
      readAllPages(
        _client.locations,
        filters: tableId == null
            ? scope
            : {
                PostgrestColumns.id: PostgrestFilter.inList([
                  for (final table in tables) table.locationId,
                ]),
              },
        order: _byId,
      ),
      readAllPages(
        _client.tableMembers,
        filters: {
          ...onScope,
          PostgrestColumns.role: PostgrestFilter.eq(
            UserRole.facilitator.wireValue,
          ),
          PostgrestColumns.status: PostgrestFilter.eq('active'),
        },
        order: _byId,
      ),
      readAllPages(
        _client.sessions,
        filters: {
          ...current,
          PostgrestColumns.status: PostgrestFilter.inList([
            SessionStatus.scheduled.wireValue,
            SessionStatus.open.wireValue,
          ]),
        },
        order: [PostgrestOrder.asc(PostgrestColumns.scheduledAt), ..._byId],
      ),
      readAllPages(
        _client.sessions,
        filters: {
          ...current,
          PostgrestColumns.status: PostgrestFilter.eq(
            SessionStatus.cancelled.wireValue,
          ),
          PostgrestColumns.scheduledAt: PostgrestFilter.gte(now),
        },
        order: [PostgrestOrder.asc(PostgrestColumns.scheduledAt), ..._byId],
      ),
    ).waitUnwrapped;

    final tablesById = {for (final table in tables) table.id: table};
    final locationNames = {for (final l in locations) l.id: l.name};
    final facilitatorByTable = <String, TableMemberRecord>{};
    for (final member in facilitators) {
      facilitatorByTable.putIfAbsent(member.roundTableId, () => member);
    }

    return [
      for (final session in [...pending, ...cancelled])
        if (tablesById[session.roundTableId] case final table?
            when _isSlot(session))
          _record(
            session,
            table,
            locationName: locationNames[table.locationId],
            facilitator: facilitatorByTable[table.id],
          ),
    ];
  }

  static final List<PostgrestOrder> _byId = [
    PostgrestOrder.asc(PostgrestColumns.id),
  ];

  static String? _eq(String? value) =>
      value == null ? null : PostgrestFilter.eq(value);

  /// A table closed or suspended cancels its pending session too; that is not
  /// a cancelled meeting worth showing.
  static bool _isSlot(SessionRecord session) =>
      !(session.cancelledReason ?? '').startsWith('table_');

  UpcomingSessionRecord _record(
    SessionRecord session,
    RoundTableRecord table, {
    required String? locationName,
    required TableMemberRecord? facilitator,
  }) {
    final facilitatorName = facilitator == null
        ? ''
        : '${facilitator.firstName} ${facilitator.lastName}'.trim();
    return UpcomingSessionRecord(
      id: session.id,
      roundTableId: table.id,
      tableName: table.name,
      status: session.status.wireValue,
      scheduledAt: session.scheduledAt.toUtc(),
      timezone: table.timezone,
      isExtraordinary: session.kind == 'extraordinary',
      originalScheduledAt: session.originalScheduledAt?.toUtc(),
      locationId: table.locationId,
      locationName: locationName,
      facilitatorId: facilitator?.personId,
      facilitatorName: facilitatorName.isEmpty ? null : facilitatorName,
    );
  }
}
