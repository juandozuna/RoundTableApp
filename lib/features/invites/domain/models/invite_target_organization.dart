import 'package:freezed_annotation/freezed_annotation.dart';

part 'invite_target_organization.freezed.dart';
part 'invite_target_organization.g.dart';

@freezed
abstract class InviteTargetOrganization with _$InviteTargetOrganization {
  const factory InviteTargetOrganization({
    required String id,
    required String name,
  }) = _InviteTargetOrganization;

  factory InviteTargetOrganization.fromJson(Map<String, dynamic> json) =>
      _$InviteTargetOrganizationFromJson(json);
}
