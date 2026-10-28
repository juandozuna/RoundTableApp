import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_version.freezed.dart';
part 'schedule_version.g.dart';

/// One entry of a table's schedule history (RF-23): the weekly slot that
/// applies from [effectiveFrom] (a local date in [timezone]) until the next
/// version takes over.
@freezed
abstract class ScheduleVersion with _$ScheduleVersion {
  const ScheduleVersion._();

  const factory ScheduleVersion({
    required String id,
    required int weekday,
    required String startTime,
    required String timezone,
    required int durationMinutes,
    required DateTime effectiveFrom,
  }) = _ScheduleVersion;

  factory ScheduleVersion.fromJson(Map<String, dynamic> json) =>
      _$ScheduleVersionFromJson(json);

  /// `HH:MM` of [startTime].
  String get startTimeShort =>
      startTime.length >= 5 ? startTime.substring(0, 5) : startTime;
}
