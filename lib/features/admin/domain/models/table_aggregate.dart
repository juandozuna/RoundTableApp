import 'package:freezed_annotation/freezed_annotation.dart';

part 'table_aggregate.freezed.dart';

/// KPIs of a set of tables (the selection panel and "Vista actual").
@freezed
abstract class TableAggregate with _$TableAggregate {
  const factory TableAggregate({
    @Default(0) int tables,
    @Default(0) int people,
    @Default(0) int valuesCompleted,
    double? attendancePct,
    double? improvementAvg,
    @Default(0) int syncedLateRows,
    @Default(0) int active,
    @Default(0) int delayed,
    @Default(0) int inactive,
    @Default(0) int lowAttendance,
  }) = _TableAggregate;
}
