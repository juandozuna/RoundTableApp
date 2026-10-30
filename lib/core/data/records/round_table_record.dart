import 'package:freezed_annotation/freezed_annotation.dart';

part 'round_table_record.freezed.dart';
part 'round_table_record.g.dart';

/// Row of `round_tables`. `startTime` is the local `HH:mm:ss` wall-clock time in
/// `timezone`; `weekday` is 1 (Monday) to 7 (Sunday).
@freezed
abstract class RoundTableRecord with _$RoundTableRecord {
  const factory RoundTableRecord({
    required String id,
    required String organizationId,
    required String locationId,
    required String name,
    required String code,
    required int weekday,
    required String startTime,
    required String timezone,
    required int durationMinutes,
    required String status,
    String? currentValueId,
  }) = _RoundTableRecord;

  factory RoundTableRecord.fromJson(Map<String, dynamic> json) =>
      _$RoundTableRecordFromJson(json);
}
