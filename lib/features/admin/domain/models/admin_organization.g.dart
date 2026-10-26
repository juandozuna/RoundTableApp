// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_organization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminOrganization _$AdminOrganizationFromJson(Map<String, dynamic> json) =>
    _AdminOrganization(
      id: json['id'] as String,
      name: json['name'] as String,
      kind: json['kind'] as String? ?? 'other',
      countryCode: json['country_code'] as String,
      countryName: json['country_name'] as String,
      region: json['region'] as String?,
      contactName: json['contact_name'] as String?,
      contactEmail: json['contact_email'] as String?,
      contactPhone: json['contact_phone'] as String?,
      status:
          $enumDecodeNullable(
            _$OrganizationStatusEnumMap,
            json['status'],
            unknownValue: OrganizationStatus.inactive,
          ) ??
          OrganizationStatus.active,
    );

Map<String, dynamic> _$AdminOrganizationToJson(_AdminOrganization instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'kind': instance.kind,
      'country_code': instance.countryCode,
      'country_name': instance.countryName,
      'region': ?instance.region,
      'contact_name': ?instance.contactName,
      'contact_email': ?instance.contactEmail,
      'contact_phone': ?instance.contactPhone,
      'status': _$OrganizationStatusEnumMap[instance.status]!,
    };

const _$OrganizationStatusEnumMap = {
  OrganizationStatus.active: 'active',
  OrganizationStatus.paused: 'paused',
  OrganizationStatus.inactive: 'inactive',
};
