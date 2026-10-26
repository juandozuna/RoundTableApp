import 'package:json_annotation/json_annotation.dart';

/// What an invite grants (`invite_role_kind`). A platform administrator is
/// never invited; they are created by staff.
@JsonEnum()
enum InviteRoleKind {
  @JsonValue('coordinator')
  coordinator,
  @JsonValue('facilitator')
  facilitator,
  @JsonValue('member')
  member;

  /// Needs a table (and so a seat); a coordinator belongs to the organization.
  bool get needsTable => this != InviteRoleKind.coordinator;

  String get wireValue => name;
}
