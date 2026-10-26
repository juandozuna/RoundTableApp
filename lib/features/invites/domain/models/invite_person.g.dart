// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invite_person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InvitePerson _$InvitePersonFromJson(Map<String, dynamic> json) =>
    _InvitePerson(
      id: json['id'] as String,
      organizationId: json['organization_id'] as String?,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      position: json['position'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      status:
          $enumDecodeNullable(
            _$PersonStatusEnumMap,
            json['status'],
            unknownValue: PersonStatus.invited,
          ) ??
          PersonStatus.invited,
      linked: json['linked'] as bool? ?? false,
    );

Map<String, dynamic> _$InvitePersonToJson(_InvitePerson instance) =>
    <String, dynamic>{
      'id': instance.id,
      'organization_id': ?instance.organizationId,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'position': ?instance.position,
      'email': ?instance.email,
      'phone': ?instance.phone,
      'status': _$PersonStatusEnumMap[instance.status]!,
      'linked': instance.linked,
    };

const _$PersonStatusEnumMap = {
  PersonStatus.invited: 'invited',
  PersonStatus.active: 'active',
  PersonStatus.inactive: 'inactive',
};
