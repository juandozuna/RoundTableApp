import 'package:freezed_annotation/freezed_annotation.dart';

part 'kpi_filters.freezed.dart';

/// Common filters of every KPI RPC. Null means "no filter".
@freezed
abstract class KpiFilters with _$KpiFilters {
  const KpiFilters._();

  const factory KpiFilters({
    DateTime? from,
    DateTime? to,
    String? country,
    String? organizationId,
    String? locationId,
    String? roundTableId,
    String? facilitatorPersonId,
    String? moduleId,
    String? valueId,
    String? health,
  }) = _KpiFilters;

  static const KpiFilters none = KpiFilters();

  /// Named parameters of the RPC body; absent filters are omitted.
  Map<String, dynamic> toParams() => {
    if (from != null) 'p_from': _date(from!),
    if (to != null) 'p_to': _date(to!),
    if (country != null) 'p_country': country,
    if (organizationId != null) 'p_organization_id': organizationId,
    if (locationId != null) 'p_location_id': locationId,
    if (roundTableId != null) 'p_round_table_id': roundTableId,
    if (facilitatorPersonId != null)
      'p_facilitator_person_id': facilitatorPersonId,
    if (moduleId != null) 'p_module_id': moduleId,
    if (valueId != null) 'p_value_id': valueId,
  };

  /// `kpi_tables` accepts a narrower set of parameters than the other RPCs.
  Map<String, dynamic> toTableParams() => {
    if (country != null) 'p_country': country,
    if (organizationId != null) 'p_organization_id': organizationId,
    if (locationId != null) 'p_location_id': locationId,
    if (roundTableId != null) 'p_round_table_id': roundTableId,
    if (facilitatorPersonId != null)
      'p_facilitator_person_id': facilitatorPersonId,
    if (health != null) 'p_health': health,
  };

  static String _date(DateTime value) {
    final utc = value.toUtc();
    final month = utc.month.toString().padLeft(2, '0');
    final day = utc.day.toString().padLeft(2, '0');
    return '${utc.year}-$month-$day';
  }
}
