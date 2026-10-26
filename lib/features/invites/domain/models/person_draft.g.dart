// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_draft.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PersonDraft _$PersonDraftFromJson(Map<String, dynamic> json) => _PersonDraft(
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  position: json['position'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
);

Map<String, dynamic> _$PersonDraftToJson(_PersonDraft instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'position': ?instance.position,
      'email': ?instance.email,
      'phone': ?instance.phone,
    };
