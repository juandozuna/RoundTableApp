import 'package:freezed_annotation/freezed_annotation.dart';

import 'invite_role_kind.dart';
import 'person_draft.dart';

part 'new_invite.freezed.dart';
part 'new_invite.g.dart';

/// Body of `POST /invites`.
@freezed
abstract class NewInvite with _$NewInvite {
  const factory NewInvite({
    required InviteRoleKind roleKind,

    /// Coordinator invites.
    String? organizationId,

    /// Facilitator and member invites.
    String? roundTableId,
    required PersonDraft person,
    int? expiresInDays,
  }) = _NewInvite;

  factory NewInvite.fromJson(Map<String, dynamic> json) =>
      _$NewInviteFromJson(json);
}
