import 'package:injectable/injectable.dart';

import '../../../../core/models/health_status.dart';
import '../../../../core/network/api_guard.dart';
import '../../../../core/network/auth_token_provider.dart';
import '../../domain/models/home_commitment.dart';
import '../../domain/models/home_kpi_summary.dart';
import '../../domain/models/home_progress.dart';
import '../client/home_client.dart';
import '../models/home_records.dart';

@lazySingleton
class HomeRemoteDataSource {
  HomeRemoteDataSource(this._client, this._tokens);

  final HomeClient _client;
  final AuthTokenProvider _tokens;

  Future<HomeTableRecord?> fetchTable(String tableId) async {
    final rows = await _rows(
      () => _client.tables(
        'eq.$tableId',
        'id,name,status,active_people,pending_session_id,'
            'pending_session_status,pending_session_at,'
            'pending_session_kind,pending_session_original_at,'
            'current_value_sequence,current_value_name',
      ),
    );
    if (rows.isEmpty) return null;
    final row = rows.first;
    final kpi = await _rows(
      () => _client.kpiTables({'p_round_table_id': tableId}),
    );
    final kpiRow = kpi.isEmpty ? null : kpi.first;
    return HomeTableRecord(
      tableId: row['id'] as String,
      tableName: row['name'] as String,
      tableIsActive: row['status'] == 'active',
      seats: (row['active_people'] as num?)?.toInt() ?? 0,
      lastClosedAt: _date(kpiRow?['last_session_at']),
      sessionId: row['pending_session_id'] as String?,
      sessionIsOpen: row['pending_session_status'] == 'open',
      scheduledAt: _date(row['pending_session_at']),
      sessionIsExtraordinary: row['pending_session_kind'] == 'extraordinary',
      rescheduledFrom: _date(row['pending_session_original_at']),
      valueName: row['current_value_name'] as String?,
      valueSequence: (row['current_value_sequence'] as num?)?.toInt(),
      health: HealthStatus.tryParse(kpiRow?['health'] as String?),
    );
  }

  /// The member's last commitment and progress for the home fallback.
  Future<HomeMemberRecord> fetchMember(String tableId) async {
    final table = await fetchTable(tableId);
    final userId = _tokens.userId;
    final people = userId == null
        ? const <Map<String, dynamic>>[]
        : await _rows(() => _client.people('eq.$userId', 'id'));
    if (people.isEmpty) return HomeMemberRecord(table: table);
    final personFilter = 'in.(${people.map((p) => p['id']).join(',')})';

    final commitments = await _rows(
      () => _client.commitments(
        personFilter,
        'action_text,measure_text,follow_up_status,value_id',
        'device_created_at.desc',
        1,
      ),
    );
    final assessments = await _rows(
      () => _client.assessments(personFilter, 'eq.initial', 'value_id'),
    );
    final values = await _rows(() => _client.values('id,module_id,name'));
    final modules = await _rows(
      () => _client.modules('id,number,name,value_count', 'number'),
    );

    final scoredValueIds = {for (final a in assessments) a['value_id']};
    final valueNames = {for (final v in values) v['id']: v['name'] as String};
    final commitment = commitments.isEmpty ? null : commitments.first;
    return HomeMemberRecord(
      table: table,
      commitment: commitment == null
          ? null
          : HomeCommitment(
              actionText: commitment['action_text'] as String,
              measureText: commitment['measure_text'] as String?,
              valueName: valueNames[commitment['value_id']],
              outcome: CommitmentOutcome.tryParse(
                commitment['follow_up_status'] as String?,
              ),
            ),
      progress: HomeProgress(
        modules: [
          for (final module in modules)
            ModuleProgress(
              number: (module['number'] as num).toInt(),
              name: module['name'] as String,
              total: (module['value_count'] as num).toInt(),
              completed: values
                  .where(
                    (v) =>
                        v['module_id'] == module['id'] &&
                        scoredValueIds.contains(v['id']),
                  )
                  .length,
            ),
        ],
      ),
    );
  }

  Future<HomeKpiSummary> fetchKpis(String? organizationId) => guardApiCall(
    () => _client.kpiSummary({'p_organization_id': ?organizationId}),
  );

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

  static DateTime? _date(Object? raw) =>
      raw is String ? DateTime.tryParse(raw)?.toUtc() : null;
}
