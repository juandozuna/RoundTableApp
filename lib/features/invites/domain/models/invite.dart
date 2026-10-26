import 'package:freezed_annotation/freezed_annotation.dart';

import 'invite_person.dart';
import 'invite_role_kind.dart';
import 'invite_status.dart';

part 'invite.freezed.dart';
part 'invite.g.dart';

/// An invite as listed and created by `/functions/v1/invites`.
@freezed
abstract class Invite with _$Invite {
  const factory Invite({
    required String id,
    required String code,
    required InviteRoleKind roleKind,
    @JsonKey(unknownEnumValue: InviteStatus.pending)
    required InviteStatus status,
    required String organizationId,
    String? organizationName,
    String? roundTableId,
    String? roundTableName,
    String? roundTableCode,
    required InvitePerson person,
    String? invitedByPersonId,
    String? invitedByName,
    required DateTime expiresAt,
    DateTime? acceptedAt,
    DateTime? revokedAt,
    DateTime? createdAt,
    String? inviteUrl,
  }) = _Invite;

  const Invite._();

  factory Invite.fromJson(Map<String, dynamic> json) => _$InviteFromJson(json);

  /// Table name, or the organization for a coordinator invite.
  String get scopeName => roundTableName ?? organizationName ?? '';

  /// The link people open: `<app origin>/#/invitacion/<code>`. The server's
  /// `invite_url` only tells us the app origin.
  String? get shareLink {
    final url = inviteUrl;
    if (url == null) return null;
    final origin = Uri.tryParse(url);
    if (origin == null || !origin.hasAuthority) return null;
    return '${origin.scheme}://${origin.authority}/#/invitacion/$code';
  }
}
