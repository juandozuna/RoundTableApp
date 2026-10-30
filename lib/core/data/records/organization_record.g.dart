// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrganizationRecord _$OrganizationRecordFromJson(Map<String, dynamic> json) =>
    _OrganizationRecord(
      id: json['id'] as String,
      name: json['name'] as String,
      kind: json['kind'] as String,
      countryCode: json['country_code'] as String,
      countryName: json['country_name'] as String,
      region: json['region'] as String?,
      status: json['status'] as String,
    );

Map<String, dynamic> _$OrganizationRecordToJson(_OrganizationRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'kind': instance.kind,
      'country_code': instance.countryCode,
      'country_name': instance.countryName,
      'region': ?instance.region,
      'status': instance.status,
    };
