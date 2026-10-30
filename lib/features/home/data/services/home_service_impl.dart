import 'package:injectable/injectable.dart';

import '../../../../core/data/data_scope.dart';
import '../../../../core/data/remote_watch.dart';
import '../../../../core/data/wait_unwrapped.dart';
import '../../../../core/models/user_role.dart';
import '../../../../core/services/clock/clock_service.dart';
import '../../../../core/services/logging/app_log.dart';
import '../../../../core/services/session_context/session_context.dart';
import '../../../settings/domain/models/content_language.dart';
import '../../../settings/domain/services/content_language_service.dart';
import '../../domain/models/home_overview.dart';
import '../../domain/models/home_session.dart';
import '../../domain/models/table_health_rule.dart';
import '../../domain/services/home_service.dart';
import '../datasources/home_remote_data_source.dart';
import '../datasources/home_table_remote_data_source.dart';
import '../models/home_records.dart';

/// The home is not a live screen: it refetches when a write signals one of
/// the scopes it shows (the session, the schedule, administration, the
/// content language) and when the app returns to the foreground; no poll.
@LazySingleton(as: HomeService)
class HomeServiceImpl implements HomeService {
  HomeServiceImpl(
    this._tables,
    this._remote,
    this._language,
    this._clock,
    this._watch,
  );

  final HomeTableRemoteDataSource _tables;
  final HomeRemoteDataSource _remote;
  final ContentLanguageService _language;
  final ClockService _clock;
  final RemoteWatch _watch;

  static const Set<DataScope> _scopes = {
    DataScope.home,
    DataScope.session,
    DataScope.calendar,
    DataScope.admin,
    DataScope.contentLanguage,
  };

  @override
  Stream<HomeOverview> watchOverview(SessionContext context) =>
      _watch<HomeOverview>(() => _load(context), scopes: _scopes);

  Future<HomeOverview> _load(SessionContext context) => switch (context.role) {
    UserRole.facilitator => _loadFacilitator(context),
    UserRole.member => _loadMember(context),
    UserRole.coordinator || UserRole.administrator => _loadManager(context),
  };

  Future<HomeOverview> _loadFacilitator(SessionContext context) async {
    final tableId = context.tableId;
    if (tableId == null) return HomeOverview.facilitator(context: context);
    final record = await _tables.fetchTable(
      tableId,
      locale: await _translationLocale(),
    );
    return HomeOverview.facilitator(
      context: context,
      session: _toSession(record),
    );
  }

  Future<HomeOverview> _loadMember(SessionContext context) async {
    final tableId = context.tableId;
    if (tableId == null) return HomeOverview.member(context: context);
    final record = await _tables.fetchMember(
      tableId,
      personId: context.personId,
      locale: await _translationLocale(),
    );
    return _toMember(context, record);
  }

  Future<HomeOverview> _loadManager(SessionContext context) async {
    final organizationId = context.organizationId;
    final (kpis, invites, alerts) = await (
      _remote.fetchKpis(organizationId),
      _remote.countPendingInvites(organizationId),
      _remote.fetchTableAlerts(organizationId),
    ).waitUnwrapped;
    return HomeOverview.manager(
      context: context,
      kpis: kpis,
      pendingInvites: invites,
      alerts: alerts,
    );
  }

  /// The chosen content language, or null for the Spanish base text (also
  /// when the choice cannot be read, so the home still shows).
  Future<String?> _translationLocale() async {
    try {
      final selected = (await _language.watch().first).selected;
      return selected == ContentLanguageChoice.baseCode ? null : selected;
    } on Object catch (error) {
      AppLog.warning('home', 'Content language unreadable; Spanish', error);
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
      isExtraordinary: record.sessionIsExtraordinary,
      rescheduledFrom: record.rescheduledFrom,
      cancelledNoticeFor: record.cancelledNoticeFor,
      health: TableHealthRule.evaluate(
        now: _clock.nowUtc(),
        tableIsActive: record.tableIsActive,
        lastClosedAt: record.lastClosedAt,
        pendingScheduledAt: scheduledAt,
      ),
    );
  }
}
