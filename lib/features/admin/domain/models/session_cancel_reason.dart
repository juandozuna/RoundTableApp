import 'package:json_annotation/json_annotation.dart';

part 'session_cancel_reason.g.dart';

/// Why an administrator cancels a single session (RF-30).
@JsonEnum(alwaysCreate: true)
enum SessionCancelReason {
  @JsonValue('holiday')
  holiday,
  @JsonValue('force_majeure')
  forceMajeure,
  @JsonValue('other')
  other;

  String get wireValue => _$SessionCancelReasonEnumMap[this]!;
}
