import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/health_reason.dart';

part 'home_table_alert.freezed.dart';

/// An active table that needs attention, from `kpi_tables.health_reasons`.
@freezed
abstract class HomeTableAlert with _$HomeTableAlert {
  const factory HomeTableAlert({
    required String tableId,
    required String code,
    required String name,
    required List<HealthReason> reasons,
  }) = _HomeTableAlert;
}
