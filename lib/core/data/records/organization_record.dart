import 'package:freezed_annotation/freezed_annotation.dart';

part 'organization_record.freezed.dart';
part 'organization_record.g.dart';

/// Row of `organizations` (the tenant). Contact columns are not mapped; add them
/// here if a feature needs them.
@freezed
abstract class OrganizationRecord with _$OrganizationRecord {
  const factory OrganizationRecord({
    required String id,
    required String name,
    required String kind,
    required String countryCode,
    required String countryName,
    String? region,
    required String status,
  }) = _OrganizationRecord;

  factory OrganizationRecord.fromJson(Map<String, dynamic> json) =>
      _$OrganizationRecordFromJson(json);
}
