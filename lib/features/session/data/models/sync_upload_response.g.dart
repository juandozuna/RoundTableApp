// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_upload_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SyncUploadResponse _$SyncUploadResponseFromJson(Map<String, dynamic> json) =>
    _SyncUploadResponse(
      applied: (json['applied'] as num?)?.toInt() ?? 0,
      rejected: (json['rejected'] as num?)?.toInt() ?? 0,
      results:
          (json['results'] as List<dynamic>?)
              ?.map((e) => SyncUploadResult.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SyncUploadResponseToJson(_SyncUploadResponse instance) =>
    <String, dynamic>{
      'applied': instance.applied,
      'rejected': instance.rejected,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };

_SyncUploadResult _$SyncUploadResultFromJson(Map<String, dynamic> json) =>
    _SyncUploadResult(
      status: json['status'] as String,
      id: json['id'] as String?,
      table: json['table'] as String?,
      op: json['op'] as String?,
      code: json['code'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$SyncUploadResultToJson(_SyncUploadResult instance) =>
    <String, dynamic>{
      'status': instance.status,
      'id': ?instance.id,
      'table': ?instance.table,
      'op': ?instance.op,
      'code': ?instance.code,
      'message': ?instance.message,
    };
