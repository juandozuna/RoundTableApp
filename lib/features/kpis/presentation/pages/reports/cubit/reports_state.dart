import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/network/api_exception.dart';
import '../../../../domain/models/drill_level.dart';
import '../../../../domain/models/report_data.dart';
import '../../../../domain/models/report_filters.dart';
import '../../../../domain/models/report_options.dart';

part 'reports_state.freezed.dart';

enum ReportsStatus { loading, ready, failure }

/// Charts that can switch between graph and table view.
enum ReportChart {
  valuesPerWeek,
  attendance,
  improvementByModule,
  tablesByStatus,
  syncedLate,
}

@freezed
abstract class ReportsState with _$ReportsState {
  const factory ReportsState({
    @Default(ReportsStatus.loading) ReportsStatus status,
    ApiException? error,

    /// Filters changed and the dashboards are reloading.
    @Default(false) bool refreshing,
    @Default(ReportFilters()) ReportFilters filters,
    @Default(ReportOptions()) ReportOptions options,
    ReportData? data,

    /// Charts currently shown as a table instead of a graph.
    @Default({}) Set<ReportChart> tableViews,

    // Drill-down: root grouping, steps taken and the rows of the level shown.
    @Default(DrillKind.country) DrillKind drillGroup,
    @Default([]) List<DrillStep> drillPath,
    DrillLevel? drillLevel,
    @Default(false) bool drillLoading,

    /// Failure of the drill level (the dashboards above stay usable).
    ApiException? drillError,

    /// The organization a coordinator is limited to; the drill starts there.
    String? lockedOrganizationId,
  }) = _ReportsState;
}
