// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PersonRecord _$PersonRecordFromJson(Map<String, dynamic> json) =>
    _PersonRecord(
      id: json['id'] as String,
      organizationId: json['organization_id'] as String?,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      position: json['position'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      status: json['status'] as String,
    );

Map<String, dynamic> _$PersonRecordToJson(_PersonRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'organization_id': ?instance.organizationId,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'position': ?instance.position,
      'email': ?instance.email,
      'phone': ?instance.phone,
      'status': instance.status,
    };
