// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrganizationInput _$OrganizationInputFromJson(Map<String, dynamic> json) =>
    _OrganizationInput(
      name: json['name'] as String?,
      kind: json['kind'] as String?,
      countryCode: json['country_code'] as String?,
      countryName: json['country_name'] as String?,
      region: json['region'] as String?,
      contactName: json['contact_name'] as String?,
      contactEmail: json['contact_email'] as String?,
      contactPhone: json['contact_phone'] as String?,
    );

Map<String, dynamic> _$OrganizationInputToJson(_OrganizationInput instance) =>
    <String, dynamic>{
      'name': ?instance.name,
      'kind': ?instance.kind,
      'country_code': ?instance.countryCode,
      'country_name': ?instance.countryName,
      'region': ?instance.region,
      'contact_name': ?instance.contactName,
      'contact_email': ?instance.contactEmail,
      'contact_phone': ?instance.contactPhone,
    };
