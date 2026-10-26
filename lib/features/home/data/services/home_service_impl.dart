import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../../core/models/user_role.dart';
import '../../../../core/services/clock/clock_service.dart';
import '../../../../core/services/logging/app_log.dart';
import '../../../../core/services/session_context/session_context.dart';
import '../../domain/models/home_overview.dart';
import '../../domain/models/home_session.dart';
import '../../domain/models/table_health_rule.dart';
import '../../domain/services/home_service.dart';
import '../datasources/home_local_data_source.dart';
import '../datasources/home_remote_data_source.dart';
import '../models/home_records.dart';

@LazySingleton(as: HomeService)
class HomeServiceImpl implements HomeService {
  HomeServiceImpl(this._local, this._remote, this._clock);

  final HomeLocalDataSource _local;
  final HomeRemoteDataSource _remote;
  final ClockService _clock;

  @override
  Stream<HomeOverview> watchOverview(SessionContext context) =>
      switch (context.role) {
        UserRole.facilitator => _watchFacilitator(context),
        UserRole.member => _watchMember(context),
        UserRole.coordinator ||
        UserRole.administrator => Stream.fromFuture(_loadManager(context)),
      };

  Stream<HomeOverview> _watchFacilitator(SessionContext context) async* {
    final tableId = context.tableId;
    if (tableId == null) {
      yield HomeOverview.facilitator(context: context);
      return;
    }
    try {
      await for (final record in _local.watchFacilitatorTable(tableId)) {
        final resolved = record ?? await _remoteTableOrNull(tableId);
        yield HomeOverview.facilitator(
          context: context,
          session: _toSession(resolved),
        );
      }
    } on Object catch (error) {
      AppLog.warning('home', 'Local facilitator home failed; online', error);
      final record = await _remote.fetchTable(tableId);
      yield HomeOverview.facilitator(
        context: context,
        session: _toSession(record),
      );
    }
  }

  Stream<HomeOverview> _watchMember(SessionContext context) async* {
    final tableId = context.tableId;
    if (tableId == null) {
      yield HomeOverview.member(context: context);
      return;
    }
    try {
      await for (final record in _local.watchMember(tableId)) {
        var resolved = record;
        if (record.table == null) {
          final table = await _remoteTableOrNull(tableId);
          resolved = HomeMemberRecord(
            table: table,
            commitment: record.commitment,
            progress: record.progress,
          );
        }
        yield _toMember(context, resolved);
      }
    } on Object catch (error) {
      AppLog.warning('home', 'Local member home failed; online', error);
      yield _toMember(context, await _remote.fetchMember(tableId));
    }
  }

  Future<HomeOverview> _loadManager(SessionContext context) async {
    final organizationId = context.organizationId;
    final kpis = await _remote.fetchKpis(organizationId);
    final invites = await _remote.countPendingInvites(organizationId);
    return HomeOverview.manager(
      context: context,
      kpis: kpis,
      pendingInvites: invites,
    );
  }

  /// First-load convenience: a table that has not synced yet is read online.
  /// Offline or failing, the caller shows the empty state instead.
  Future<HomeTableRecord?> _remoteTableOrNull(String tableId) async {
    try {
      return await _remote.fetchTable(tableId);
    } on Object catch (error) {
      AppLog.info('home', 'Online table read skipped: $error');
      return null;
    }
  }

  HomeOverview _toMember(SessionContext context, HomeMemberRecord record) =>
      HomeOverview.member(
        context: context,
        session: _toSession(record.table),
        lastCommitment: record.commitment,
        progress: record.progress,
      );

  HomeSession? _toSession(HomeTableRecord? record) {
    final sessionId = record?.sessionId;
    final scheduledAt = record?.scheduledAt;
    if (record == null || sessionId == null || scheduledAt == null) {
      return null;
    }
    return HomeSession(
      id: sessionId,
      roundTableId: record.tableId,
      tableName: record.tableName,
      scheduledAt: scheduledAt,
      isOpen: record.sessionIsOpen,
      seatsTaken: record.seats,
      valueName: record.valueName,
      valueSequence: record.valueSequence,
      followUpValueName: record.followUpValueName,
      health:
          record.health ??
          TableHealthRule.evaluate(
            now: _clock.nowUtc(),
            tableIsActive: record.tableIsActive,
            lastClosedAt: record.lastClosedAt,
            pendingScheduledAt: scheduledAt,
          ),
    );
  }
}
