// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Account _$AccountFromJson(Map<String, dynamic> json) => _Account(
  authUserId: json['auth_user_id'] as String,
  isPlatformAdmin: json['is_platform_admin'] as bool? ?? false,
  people:
      (json['people'] as List<dynamic>?)
          ?.map((e) => AccountPerson.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  contexts:
      (json['contexts'] as List<dynamic>?)
          ?.map((e) => AccountContext.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$AccountToJson(_Account instance) => <String, dynamic>{
  'auth_user_id': instance.authUserId,
  'is_platform_admin': instance.isPlatformAdmin,
  'people': instance.people.map((e) => e.toJson()).toList(),
  'contexts': instance.contexts.map((e) => e.toJson()).toList(),
};
