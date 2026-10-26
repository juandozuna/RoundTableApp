import 'package:freezed_annotation/freezed_annotation.dart';

part 'drill_level.freezed.dart';

/// What a drill-down row represents. Drilling goes
/// country → organization → table → member.
enum DrillKind { country, organization, facilitator, table, member }

@freezed
abstract class DrillStep with _$DrillStep {
  const factory DrillStep({
    required DrillKind kind,
    required String id,
    required String label,
  }) = _DrillStep;
}

@freezed
abstract class DrillRow with _$DrillRow {
  const factory DrillRow({
    required String id,
    required String label,
    String? sublabel,
    int? tablesCount,
    double? attendancePct,
    @Default(0) int valuesCompleted,
    double? improvementAvg,
    @Default(0) int syncedLate,
  }) = _DrillRow;
}

@freezed
abstract class DrillLevel with _$DrillLevel {
  const DrillLevel._();

  const factory DrillLevel({
    required DrillKind kind,
    required List<DrillRow> rows,
  }) = _DrillLevel;

  /// The kind opened when a row is pressed; null for members (leaf).
  DrillKind? get next => switch (kind) {
    DrillKind.country => DrillKind.organization,
    DrillKind.organization || DrillKind.facilitator => DrillKind.table,
    DrillKind.table => DrillKind.member,
    DrillKind.member => null,
  };
}
