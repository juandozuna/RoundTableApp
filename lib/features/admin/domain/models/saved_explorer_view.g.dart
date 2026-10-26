// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_explorer_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SavedExplorerView _$SavedExplorerViewFromJson(Map<String, dynamic> json) =>
    _SavedExplorerView(
      id: json['id'] as String,
      name: json['name'] as String,
      filters:
          (json['filters'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      search: json['search'] as String? ?? '',
      sortKey: json['sort_key'] as String? ?? 'code',
      ascending: json['ascending'] as bool? ?? true,
    );

Map<String, dynamic> _$SavedExplorerViewToJson(_SavedExplorerView instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'filters': instance.filters,
      'search': instance.search,
      'sort_key': instance.sortKey,
      'ascending': instance.ascending,
    };
