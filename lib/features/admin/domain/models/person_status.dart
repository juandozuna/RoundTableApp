import 'package:json_annotation/json_annotation.dart';

part 'person_status.g.dart';

@JsonEnum(alwaysCreate: true)
enum PersonStatus {
  @JsonValue('invited')
  invited,
  @JsonValue('active')
  active,
  @JsonValue('inactive')
  inactive;

  String get wireValue => _$PersonStatusEnumMap[this]!;

  static PersonStatus? tryParse(String? raw) => $enumDecodeNullable(
    _$PersonStatusEnumMap,
    raw,
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  );
}
