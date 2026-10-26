import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/network/api_exception.dart';
import '../../../../../admin/domain/use_cases/scope/watch_admin_scope_use_case.dart';
import '../../../../domain/export/report_csv.dart';
import '../../../../domain/models/csv_document.dart';
import '../../../../domain/models/drill_level.dart';
import '../../../../domain/models/report_filters.dart';
import '../../../../domain/use_cases/export/export_csv_use_case.dart';
import '../../../../domain/use_cases/report/load_drill_level_use_case.dart';
import '../../../../domain/use_cases/report/load_report_options_use_case.dart';
import '../../../../domain/use_cases/report/load_report_use_case.dart';
import 'reports_state.dart';

@injectable
class ReportsCubit extends Cubit<ReportsState> {
  ReportsCubit(
    this._loadReport,
    this._loadOptions,
    this._loadDrill,
    this._export,
    this._watchScope,
  ) : super(const ReportsState());

  final LoadReportUseCase _loadReport;
  final LoadReportOptionsUseCase _loadOptions;
  final LoadDrillLevelUseCase _loadDrill;
  final ExportCsvUseCase _export;
  final WatchAdminScopeUseCase _watchScope;

  /// First load, optionally limited to a country, organization or table
  /// (coming from the Explorador's selection).
  Future<void> load({
    String? country,
    String? organizationId,
    String? tableId,
  }) async {
    emit(
      state.copyWith(
        status: ReportsStatus.loading,
        error: null,
        filters: ReportFilters(
          country: country,
          organizationId: organizationId,
          roundTableId: tableId,
        ),
      ),
    );
    try {
      final scope = await _watchScope().first;
      final locked = scope != null && !scope.isAdministrator
          ? scope.organizationId
          : null;
      final options = await _loadOptions();
      emit(
        state.copyWith(
          options: options,
          lockedOrganizationId: locked,
          drillPath: locked == null
              ? const []
              : [
                  DrillStep(
                    kind: DrillKind.organization,
                    id: locked,
                    label: scope?.organizationName ?? '',
                  ),
                ],
          drillGroup: locked == null
              ? DrillKind.country
              : DrillKind.organization,
        ),
      );
      await _reload();
    } on ApiException catch (error) {
      emit(state.copyWith(status: ReportsStatus.failure, error: error));
    }
  }

  Future<void> refresh() async {
    if (state.status == ReportsStatus.loading) return;
    await _reload();
  }

  Future<void> _reload() async {
    emit(state.copyWith(refreshing: true));
    try {
      final data = await _loadReport(state.filters);
      emit(
        state.copyWith(
          status: ReportsStatus.ready,
          refreshing: false,
          data: data,
          error: null,
        ),
      );
    } on ApiException catch (error) {
      emit(
        state.copyWith(
          status: state.data == null
              ? ReportsStatus.failure
              : ReportsStatus.ready,
          refreshing: false,
          error: error,
        ),
      );
    }
    await _loadDrillLevel();
  }

  Future<void> _loadDrillLevel() async {
    emit(state.copyWith(drillLoading: true, drillError: null));
    try {
      final level = await _loadDrill(
        filters: state.filters,
        group: state.drillGroup,
        path: state.drillPath,
      );
      emit(state.copyWith(drillLoading: false, drillLevel: level));
    } on ApiException catch (error) {
      emit(state.copyWith(drillLoading: false, drillError: error));
    }
  }

  Future<void> setPeriod(int weeks) =>
      _applyFilters(state.filters.copyWith(periodWeeks: weeks));

  /// Changing a parent filter drops the ones that depended on it.
  Future<void> setCountry(String? country) => _applyFilters(
    state.filters.copyWith(
      country: country,
      organizationId: null,
      locationId: null,
      roundTableId: null,
      facilitatorPersonId: null,
    ),
  );

  Future<void> setOrganization(String? organizationId) => _applyFilters(
    state.filters.copyWith(
      organizationId: organizationId,
      locationId: null,
      roundTableId: null,
      facilitatorPersonId: null,
    ),
  );

  Future<void> setLocation(String? locationId) => _applyFilters(
    state.filters.copyWith(locationId: locationId, roundTableId: null),
  );

  Future<void> setTable(String? tableId) =>
      _applyFilters(state.filters.copyWith(roundTableId: tableId));

  Future<void> setFacilitator(String? personId) =>
      _applyFilters(state.filters.copyWith(facilitatorPersonId: personId));

  Future<void> setModule(String? moduleId) =>
      _applyFilters(state.filters.copyWith(moduleId: moduleId));

  Future<void> clearFilters() => _applyFilters(const ReportFilters());

  Future<void> _applyFilters(ReportFilters filters) async {
    emit(state.copyWith(filters: filters, drillPath: _rootPath()));
    await _reload();
  }

  List<DrillStep> _rootPath() {
    final path = state.drillPath;
    final locked = state.lockedOrganizationId;
    return locked != null && path.isNotEmpty ? [path.first] : const [];
  }

  void toggleChartView(ReportChart chart) {
    final next = Set.of(state.tableViews);
    if (!next.remove(chart)) next.add(chart);
    emit(state.copyWith(tableViews: next));
  }

  Future<void> setDrillGroup(DrillKind group) async {
    emit(state.copyWith(drillGroup: group, drillPath: _rootPath()));
    await _loadDrillLevel();
  }

  Future<void> drillInto(DrillRow row) async {
    final kind = state.drillLevel?.next;
    if (kind == null) return;
    // Rows of the current level become the next step of the path.
    final step = DrillStep(
      kind: state.drillLevel!.kind,
      id: row.id,
      label: row.label,
    );
    emit(state.copyWith(drillPath: [...state.drillPath, step]));
    await _loadDrillLevel();
  }

  /// Back to the root (index 0) or to the step at [depth] of the path.
  Future<void> drillTo(int depth) async {
    final floor = state.lockedOrganizationId == null ? 0 : 1;
    final keep = depth < floor ? floor : depth;
    emit(state.copyWith(drillPath: state.drillPath.take(keep).toList()));
    await _loadDrillLevel();
  }

  Future<void> exportCsv(CsvDocument document) => _export(document);

  /// CSV of the current drill level.
  CsvDocument? drillCsv(List<String> headers, String filename) {
    final level = state.drillLevel;
    if (level == null) return null;
    return ReportCsv.drill(filename: filename, headers: headers, level: level);
  }
}
