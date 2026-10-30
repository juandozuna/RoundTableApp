import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_locale_record.freezed.dart';
part 'content_locale_record.g.dart';

/// Row of `content_locales`; exactly one locale has `isDefault` (ADR 0017).
@freezed
abstract class ContentLocaleRecord with _$ContentLocaleRecord {
  const factory ContentLocaleRecord({
    required String id,
    required String code,
    required String name,
    required bool isDefault,
    required String status,
  }) = _ContentLocaleRecord;

  factory ContentLocaleRecord.fromJson(Map<String, dynamic> json) =>
      _$ContentLocaleRecordFromJson(json);
}
