import 'package:injectable/injectable.dart';

import '../../../../core/models/health_reason.dart';
import '../../../../core/network/api_guard.dart';
import '../../domain/models/home_kpi_summary.dart';
import '../../domain/models/home_table_alert.dart';
import '../client/home_client.dart';

/// Server-computed reads of the manager home (KPI strip, alerts, invite count).
@lazySingleton
class HomeRemoteDataSource {
  HomeRemoteDataSource(this._client);

  final HomeClient _client;

  Future<HomeKpiSummary> fetchKpis(String? organizationId) => guardApiCall(
    () => _client.kpiSummary({'p_organization_id': ?organizationId}),
  );

  /// Active tables of the scope that need attention (low attendance, fewer
  /// than 3 people), most urgent first.
  Future<List<HomeTableAlert>> fetchTableAlerts(String? organizationId) async {
    final rows = await _rows(
      () => _client.kpiTables({'p_organization_id': ?organizationId}),
    );
    final alerts = [
      for (final row in rows)
        HomeTableAlert(
          tableId: row['round_table_id'] as String,
          code: row['code'] as String,
          name: row['name'] as String,
          reasons: HealthReason.listFromJson(row['health_reasons']),
        ),
    ].where((a) => a.reasons.isNotEmpty).toList();
    alerts.sort((a, b) => b.reasons.length.compareTo(a.reasons.length));
    return alerts;
  }

  Future<int> countPendingInvites(String? organizationId) async {
    final rows = await _rows(
      () => _client.invites(
        'eq.pending',
        'id',
        organizationId == null ? null : 'eq.$organizationId',
      ),
    );
    return rows.length;
  }

  Future<List<Map<String, dynamic>>> _rows(
    Future<dynamic> Function() call,
  ) async => ((await guardApiCall(call)) as List<dynamic>)
      .cast<Map<String, dynamic>>();
}
