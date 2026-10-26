// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminLocation _$AdminLocationFromJson(Map<String, dynamic> json) =>
    _AdminLocation(
      id: json['id'] as String,
      organizationId: json['organization_id'] as String,
      name: json['name'] as String,
      city: json['city'] as String?,
      region: json['region'] as String?,
      address: json['address'] as String?,
      status:
          $enumDecodeNullable(
            _$RecordStatusEnumMap,
            json['status'],
            unknownValue: RecordStatus.inactive,
          ) ??
          RecordStatus.active,
    );

Map<String, dynamic> _$AdminLocationToJson(_AdminLocation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'organization_id': instance.organizationId,
      'name': instance.name,
      'city': ?instance.city,
      'region': ?instance.region,
      'address': ?instance.address,
      'status': _$RecordStatusEnumMap[instance.status]!,
    };

const _$RecordStatusEnumMap = {
  RecordStatus.active: 'active',
  RecordStatus.inactive: 'inactive',
};
