// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MyAccount _$MyAccountFromJson(Map<String, dynamic> json) => _MyAccount(
  people:
      (json['people'] as List<dynamic>?)
          ?.map((e) => UserProfile.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$MyAccountToJson(_MyAccount instance) =>
    <String, dynamic>{
      'people': instance.people.map((e) => e.toJson()).toList(),
    };
