import 'package:json_annotation/json_annotation.dart';

part 'organization_status.g.dart';

@JsonEnum(alwaysCreate: true)
enum OrganizationStatus {
  @JsonValue('active')
  active,
  @JsonValue('paused')
  paused,
  @JsonValue('inactive')
  inactive;

  String get wireValue => _$OrganizationStatusEnumMap[this]!;

  static OrganizationStatus? tryParse(String? raw) => $enumDecodeNullable(
    _$OrganizationStatusEnumMap,
    raw,
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  );
}
