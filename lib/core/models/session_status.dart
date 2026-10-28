import 'package:json_annotation/json_annotation.dart';

part 'session_status.g.dart';

/// Lifecycle of a session row. `closed` and `cancelled` are final.
///
/// Wire values must match `docs/implementation/api-contract.md`.
@JsonEnum(alwaysCreate: true)
enum SessionStatus {
  @JsonValue('scheduled')
  scheduled,
  @JsonValue('open')
  open,
  @JsonValue('closed')
  closed,
  @JsonValue('cancelled')
  cancelled;

  String get wireValue => _$SessionStatusEnumMap[this]!;

  bool get isFinal => this == closed || this == cancelled;

  static SessionStatus? tryParse(String? raw) => $enumDecodeNullable(
    _$SessionStatusEnumMap,
    raw,
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  );
}
