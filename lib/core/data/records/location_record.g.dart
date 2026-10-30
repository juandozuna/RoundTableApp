// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocationRecord _$LocationRecordFromJson(Map<String, dynamic> json) =>
    _LocationRecord(
      id: json['id'] as String,
      organizationId: json['organization_id'] as String,
      name: json['name'] as String,
      city: json['city'] as String?,
      region: json['region'] as String?,
      status: json['status'] as String,
    );

Map<String, dynamic> _$LocationRecordToJson(_LocationRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'organization_id': instance.organizationId,
      'name': instance.name,
      'city': ?instance.city,
      'region': ?instance.region,
      'status': instance.status,
    };
