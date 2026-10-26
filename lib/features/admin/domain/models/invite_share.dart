import 'package:freezed_annotation/freezed_annotation.dart';

part 'invite_share.freezed.dart';
part 'invite_share.g.dart';

@freezed
abstract class InvitePerson with _$InvitePerson {
  const factory InvitePerson({
    String? id,
    @Default('') String firstName,
    @Default('') String lastName,
  }) = _InvitePerson;

  factory InvitePerson.fromJson(Map<String, dynamic> json) =>
      _$InvitePersonFromJson(json);
}

/// An invite just created, with what the admin needs to hand it over.
@freezed
abstract class InviteShare with _$InviteShare {
  const InviteShare._();

  const factory InviteShare({
    required String id,
    required String code,
    required String roleKind,
    String? status,
    String? organizationName,
    String? roundTableName,
    InvitePerson? person,
    DateTime? expiresAt,
    String? inviteUrl,
  }) = _InviteShare;

  factory InviteShare.fromJson(Map<String, dynamic> json) =>
      _$InviteShareFromJson(json);

  String get personName =>
      '${person?.firstName ?? ''} ${person?.lastName ?? ''}'.trim();
}
