import 'package:json_annotation/json_annotation.dart';

part 'record_status.g.dart';

@JsonEnum(alwaysCreate: true)
enum RecordStatus {
  @JsonValue('active')
  active,
  @JsonValue('inactive')
  inactive;

  String get wireValue => _$RecordStatusEnumMap[this]!;

  static RecordStatus? tryParse(String? raw) => $enumDecodeNullable(
    _$RecordStatusEnumMap,
    raw,
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  );
}
