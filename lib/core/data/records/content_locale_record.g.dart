// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_locale_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContentLocaleRecord _$ContentLocaleRecordFromJson(Map<String, dynamic> json) =>
    _ContentLocaleRecord(
      id: json['id'] as String,
      code: json['code'] as String,
      name: json['name'] as String,
      isDefault: json['is_default'] as bool,
      status: json['status'] as String,
    );

Map<String, dynamic> _$ContentLocaleRecordToJson(
  _ContentLocaleRecord instance,
) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'name': instance.name,
  'is_default': instance.isDefault,
  'status': instance.status,
};
