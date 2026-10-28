import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../../core/models/user_role.dart';
import '../../../../core/services/clock/clock_service.dart';
import '../../../../core/services/logging/app_log.dart';
import '../../../../core/services/session_context/session_context.dart';
import '../../domain/models/upcoming_session.dart';
import '../../domain/models/upcoming_sessions.dart';
import '../../domain/services/upcoming_sessions_service.dart';
import '../datasources/calendar_local_data_source.dart';
import '../datasources/calendar_remote_data_source.dart';
import '../models/upcoming_session_record.dart';
import 'table_wall_clock.dart';

@LazySingleton(as: UpcomingSessionsService)
class UpcomingSessionsServiceImpl implements UpcomingSessionsService {
  UpcomingSessionsServiceImpl(
    this._local,
    this._remote,
    this._clock,
    this._wallClock,
  );

  final CalendarLocalDataSource _local;
  final CalendarRemoteDataSource _remote;
  final ClockService _clock;
  final TableWallClock _wallClock;

  @override
  Stream<UpcomingSessions> watch(SessionContext context) =>
      switch (context.role) {
        UserRole.facilitator => _watchFacilitator(context),
        UserRole.coordinator ||
        UserRole.administrator => Stream.fromFuture(_loadManager(context)),
        UserRole.member => Stream.value(
          const UpcomingSessions(scope: UpcomingScope.unavailable),
        ),
      };

  Stream<UpcomingSessions> _watchFacilitator(SessionContext context) async* {
    final tableId = context.tableId;
    if (tableId == null) {
      yield const UpcomingSessions(scope: UpcomingScope.facilitator);
      return;
    }
    final now = _clock.nowUtc();
    try {
      await for (final records in _local.watchTable(tableId, now: now)) {
        yield _facilitator(
          records.isEmpty ? await _remoteTableOrEmpty(tableId, now) : records,
        );
      }
    } on Object catch (error) {
      AppLog.warning('calendar', 'Local calendar failed; online', error);
      yield _facilitator(await _remote.fetch(now: now, tableId: tableId));
    }
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

  /// First-load convenience: a table that has not synced yet is read online.
  /// Offline or failing, the caller shows the empty state instead.
  Future<List<UpcomingSessionRecord>> _remoteTableOrEmpty(
    String tableId,
    DateTime now,
  ) async {
    try {
      return await _remote.fetch(now: now, tableId: tableId);
    } on Object catch (error) {
      AppLog.info('calendar', 'Online table read skipped: $error');
      return const [];
    }
  }

  UpcomingSessions _facilitator(List<UpcomingSessionRecord> records) =>
      UpcomingSessions(
        scope: UpcomingScope.facilitator,
        sessions: _toSessions(records),
      );

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
