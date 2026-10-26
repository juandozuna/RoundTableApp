import 'package:freezed_annotation/freezed_annotation.dart';

import 'kpi_filters.dart';

part 'report_filters.freezed.dart';

/// Filters the user picks in the Informes tab.
@freezed
abstract class ReportFilters with _$ReportFilters {
  const ReportFilters._();

  const factory ReportFilters({
    @Default(ReportFilters.defaultPeriodWeeks) int periodWeeks,
    String? country,
    String? organizationId,
    String? locationId,
    String? roundTableId,
    String? facilitatorPersonId,
    String? moduleId,
  }) = _ReportFilters;

  static const int defaultPeriodWeeks = 12;
  static const List<int> periodOptions = [4, 12, 26];

  bool get hasDimensionFilters =>
      country != null ||
      organizationId != null ||
      locationId != null ||
      roundTableId != null ||
      facilitatorPersonId != null ||
      moduleId != null;

  /// [now] anchors the period: the last [periodWeeks] weeks up to today.
  KpiFilters toKpiFilters(DateTime now) => KpiFilters(
    from: now.subtract(Duration(days: periodWeeks * 7)),
    to: now,
    country: country,
    organizationId: organizationId,
    locationId: locationId,
    roundTableId: roundTableId,
    facilitatorPersonId: facilitatorPersonId,
    moduleId: moduleId,
  );
}
