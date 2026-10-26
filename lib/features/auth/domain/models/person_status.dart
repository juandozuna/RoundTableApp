import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum PersonStatus {
  @JsonValue('invited')
  invited,
  @JsonValue('active')
  active,
  @JsonValue('inactive')
  inactive,
}
