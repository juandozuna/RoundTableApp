import 'package:json_annotation/json_annotation.dart';

part 'notification_kind.g.dart';

/// Notification types of ADR 0009. `unsynced_data` is raised on the device;
/// the others arrive as pushes (`notification_kind` in the API contract).
@JsonEnum(alwaysCreate: true)
enum NotificationKind {
  @JsonValue('session_reminder')
  sessionReminder,
  @JsonValue('commitment_nudge')
  commitmentNudge,
  @JsonValue('stage_opened')
  stageOpened,
  @JsonValue('unsynced_data')
  unsyncedData;

  String get wireValue => _$NotificationKindEnumMap[this]!;

  static NotificationKind? tryParse(String? raw) => $enumDecodeNullable(
    _$NotificationKindEnumMap,
    raw,
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  );
}
