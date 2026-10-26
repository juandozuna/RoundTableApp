// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PersonInput _$PersonInputFromJson(Map<String, dynamic> json) => _PersonInput(
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  position: json['position'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
);

Map<String, dynamic> _$PersonInputToJson(_PersonInput instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'position': ?instance.position,
      'email': ?instance.email,
      'phone': ?instance.phone,
    };
