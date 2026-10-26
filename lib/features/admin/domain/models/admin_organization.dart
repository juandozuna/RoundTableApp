import 'package:freezed_annotation/freezed_annotation.dart';

import 'organization_status.dart';

part 'admin_organization.freezed.dart';
part 'admin_organization.g.dart';

@freezed
abstract class AdminOrganization with _$AdminOrganization {
  const factory AdminOrganization({
    required String id,
    required String name,
    @Default('other') String kind,
    required String countryCode,
    required String countryName,
    String? region,
    String? contactName,
    String? contactEmail,
    String? contactPhone,
    @JsonKey(unknownEnumValue: OrganizationStatus.inactive)
    @Default(OrganizationStatus.active)
    OrganizationStatus status,
  }) = _AdminOrganization;

  factory AdminOrganization.fromJson(Map<String, dynamic> json) =>
      _$AdminOrganizationFromJson(json);
}
