import 'package:injectable/injectable.dart';

import '../../../../core/network/api_guard.dart';
import '../client/calendar_client.dart';
import '../models/upcoming_session_record.dart';

/// Reads upcoming sessions online. Serves the managers' calendar and the
/// facilitator's fallback when the table has not synced to the device yet.
@lazySingleton
class CalendarRemoteDataSource {
  CalendarRemoteDataSource(this._client);

  final CalendarClient _client;

  static const String _tableColumns =
      'id,name,location_id,location_name,timezone,facilitator_person_id,'
      'facilitator_name,pending_session_id,pending_session_status,'
      'pending_session_at,pending_session_kind,pending_session_original_at';

  static const String _cancelledColumns =
      'id,round_table_id,scheduled_at,kind,original_scheduled_at,'
      'cancelled_reason';

  /// Pending sessions of the active tables in [organizationId] (all the
  /// caller may see when null), or of [tableId] alone, plus the sessions
  /// cancelled for a slot that has not passed at [now].
  Future<List<UpcomingSessionRecord>> fetch({
    required DateTime now,
    String? organizationId,
    String? tableId,
  }) async {
    final tables = await _rows(
      () => _client.tables({
        'select': _tableColumns,
        'status': 'eq.active',
        'organization_id': ?(organizationId == null
            ? null
            : 'eq.$organizationId'),
        'id': ?(tableId == null ? null : 'eq.$tableId'),
      }),
    );
    final cancelled = await _rows(
      () => _client.sessions({
        'select': _cancelledColumns,
        'status': 'eq.cancelled',
        'archived_at': 'is.null',
        'scheduled_at': 'gte.${now.toUtc().toIso8601String()}',
        'round_table_id': ?(tableId == null ? null : 'eq.$tableId'),
      }),
    );
    final tablesById = {for (final t in tables) t['id'] as String: t};

    return [
      for (final table in tables)
        if (table['pending_session_id'] != null) _pending(table),
      for (final session in cancelled)
        if (_isSlotCancellation(session) &&
            tablesById[session['round_table_id']] != null)
          _cancelled(session, tablesById[session['round_table_id']]!),
    ];
  }

  /// A table closed or suspended cancels its pending session too; that is not
  /// a cancelled meeting worth showing.
  static bool _isSlotCancellation(Map<String, dynamic> session) =>
      !((session['cancelled_reason'] as String?) ?? '').startsWith('table_');

  UpcomingSessionRecord _pending(Map<String, dynamic> table) =>
      UpcomingSessionRecord(
        id: table['pending_session_id'] as String,
        roundTableId: table['id'] as String,
        tableName: table['name'] as String,
        status: table['pending_session_status'] as String,
        scheduledAt: _date(table['pending_session_at'])!,
        timezone: table['timezone'] as String,
        isExtraordinary: table['pending_session_kind'] == 'extraordinary',
        originalScheduledAt: _date(table['pending_session_original_at']),
        locationId: table['location_id'] as String?,
        locationName: table['location_name'] as String?,
        facilitatorId: table['facilitator_person_id'] as String?,
        facilitatorName: table['facilitator_name'] as String?,
      );

  UpcomingSessionRecord _cancelled(
    Map<String, dynamic> session,
    Map<String, dynamic> table,
  ) => UpcomingSessionRecord(
    id: session['id'] as String,
    roundTableId: table['id'] as String,
    tableName: table['name'] as String,
    status: 'cancelled',
    scheduledAt: _date(session['scheduled_at'])!,
    timezone: table['timezone'] as String,
    isExtraordinary: session['kind'] == 'extraordinary',
    originalScheduledAt: _date(session['original_scheduled_at']),
    locationId: table['location_id'] as String?,
    locationName: table['location_name'] as String?,
    facilitatorId: table['facilitator_person_id'] as String?,
    facilitatorName: table['facilitator_name'] as String?,
  );

  Future<List<Map<String, dynamic>>> _rows(
    Future<dynamic> Function() call,
  ) async => ((await guardApiCall(call)) as List<dynamic>)
      .cast<Map<String, dynamic>>();

  static DateTime? _date(Object? raw) =>
      raw is String ? DateTime.tryParse(raw)?.toUtc() : null;
}
