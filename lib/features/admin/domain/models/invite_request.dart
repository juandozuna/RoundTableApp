import 'package:freezed_annotation/freezed_annotation.dart';

import 'person_input.dart';

part 'invite_request.freezed.dart';

enum InviteRoleKind {
  coordinator,
  facilitator,
  member;

  String get wireValue => name;
}

/// An invite to create: coordinators belong to an organization, facilitators
/// and members to a table.
@freezed
abstract class InviteRequest with _$InviteRequest {
  const factory InviteRequest({
    required InviteRoleKind roleKind,
    String? organizationId,
    String? roundTableId,
    required PersonRef person,
    int? expiresInDays,
  }) = _InviteRequest;
}
