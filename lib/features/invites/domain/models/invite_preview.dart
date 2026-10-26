import 'package:freezed_annotation/freezed_annotation.dart';

import 'invite_role_kind.dart';
import 'invite_status.dart';

part 'invite_preview.freezed.dart';
part 'invite_preview.g.dart';

/// What the welcome card shows before anybody signs in (anonymous route).
@freezed
abstract class InvitePreview with _$InvitePreview {
  const factory InvitePreview({
    required String code,
    @JsonKey(unknownEnumValue: InviteStatus.pending)
    @Default(InviteStatus.pending)
    InviteStatus status,
    required InviteRoleKind roleKind,
    required String organizationName,
    String? roundTableName,
    String? personFirstName,
    String? invitedByName,
    DateTime? expiresAt,
  }) = _InvitePreview;

  const InvitePreview._();

  factory InvitePreview.fromJson(Map<String, dynamic> json) =>
      _$InvitePreviewFromJson(json);

  /// Table name, or the organization for a coordinator invite.
  String get scopeName => roundTableName ?? organizationName;
}
