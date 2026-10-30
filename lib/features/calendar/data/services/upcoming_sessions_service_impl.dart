import 'package:injectable/injectable.dart';

import '../../../../core/data/data_scope.dart';
import '../../../../core/data/remote_watch.dart';
import '../../../../core/models/user_role.dart';
import '../../../../core/services/clock/clock_service.dart';
import '../../../../core/services/session_context/session_context.dart';
import '../../domain/models/upcoming_session.dart';
import '../../domain/models/upcoming_sessions.dart';
import '../../domain/services/upcoming_sessions_service.dart';
import '../datasources/calendar_remote_data_source.dart';
import '../models/upcoming_session_record.dart';
import 'table_wall_clock.dart';

/// The calendar refetches when a schedule or session write signals, when the
/// app returns to the foreground or reconnects, and every [slowPollInterval]
/// while open and in the foreground, so other people's changes show up.
@LazySingleton(as: UpcomingSessionsService)
class UpcomingSessionsServiceImpl implements UpcomingSessionsService {
  UpcomingSessionsServiceImpl(
    this._remote,
    this._clock,
    this._wallClock,
    this._watch,
  );

  final CalendarRemoteDataSource _remote;
  final ClockService _clock;
  final TableWallClock _wallClock;
  final RemoteWatch _watch;

  static const Set<DataScope> _scopes = {
    DataScope.calendar,
    DataScope.session,
    DataScope.admin,
  };

  @override
  Stream<UpcomingSessions> watch(SessionContext context) =>
      switch (context.role) {
        UserRole.facilitator => _watch<UpcomingSessions>(
          () => _loadFacilitator(context),
          scopes: _scopes,
          pollInterval: slowPollInterval,
        ),
        UserRole.coordinator ||
        UserRole.administrator => _watch<UpcomingSessions>(
          () => _loadManager(context),
          scopes: _scopes,
          pollInterval: slowPollInterval,
        ),
        UserRole.member => Stream.value(
          const UpcomingSessions(scope: UpcomingScope.unavailable),
        ),
      };

  Future<UpcomingSessions> _loadFacilitator(SessionContext context) async {
    final tableId = context.tableId;
    if (tableId == null) {
      return const UpcomingSessions(scope: UpcomingScope.facilitator);
    }
    final records = await _remote.fetch(now: _clock.nowUtc(), tableId: tableId);
    return UpcomingSessions(
      scope: UpcomingScope.facilitator,
      sessions: _toSessions(records),
    );
  }

  Future<UpcomingSessions> _loadManager(SessionContext context) async {
    final records = await _remote.fetch(
      now: _clock.nowUtc(),
      organizationId: context.organizationId,
    );
    return UpcomingSessions(
      scope: UpcomingScope.manager,
      sessions: _toSessions(records),
    );
  }

  List<UpcomingSession> _toSessions(List<UpcomingSessionRecord> records) =>
      [for (final record in records) _toSession(record)]
        ..sort((a, b) => a.scheduledAt.compareTo(b.scheduledAt));

  UpcomingSession _toSession(UpcomingSessionRecord record) {
    final original = record.originalScheduledAt;
    return UpcomingSession(
      id: record.id,
      roundTableId: record.roundTableId,
      tableName: record.tableName,
      state: switch (record.status) {
        'open' => UpcomingSessionState.open,
        'cancelled' => UpcomingSessionState.cancelled,
        _ => UpcomingSessionState.scheduled,
      },
      scheduledAt: record.scheduledAt,
      localStart: _wallClock.of(record.scheduledAt, record.timezone),
      timezone: record.timezone,
      locationId: record.locationId,
      locationName: record.locationName,
      facilitatorId: record.facilitatorId,
      facilitatorName: record.facilitatorName,
      isExtraordinary: record.isExtraordinary,
      rescheduledFromLocal: original == null
          ? null
          : _wallClock.of(original, record.timezone),
    );
  }
}
