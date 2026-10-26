import 'package:json_annotation/json_annotation.dart';

part 'round_table_status.g.dart';

@JsonEnum(alwaysCreate: true)
enum RoundTableStatus {
  @JsonValue('active')
  active,
  @JsonValue('paused')
  paused,
  @JsonValue('completed')
  completed,
  @JsonValue('closed')
  closed;

  String get wireValue => _$RoundTableStatusEnumMap[this]!;

  static RoundTableStatus? tryParse(String? raw) => $enumDecodeNullable(
    _$RoundTableStatusEnumMap,
    raw,
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  );
}
