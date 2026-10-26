// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocationInput _$LocationInputFromJson(Map<String, dynamic> json) =>
    _LocationInput(
      name: json['name'] as String?,
      city: json['city'] as String?,
      region: json['region'] as String?,
      address: json['address'] as String?,
      status: $enumDecodeNullable(_$RecordStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$LocationInputToJson(_LocationInput instance) =>
    <String, dynamic>{
      'name': ?instance.name,
      'city': ?instance.city,
      'region': ?instance.region,
      'address': ?instance.address,
      'status': ?_$RecordStatusEnumMap[instance.status],
    };

const _$RecordStatusEnumMap = {
  RecordStatus.active: 'active',
  RecordStatus.inactive: 'inactive',
};
