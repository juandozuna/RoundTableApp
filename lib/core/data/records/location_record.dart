import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_record.freezed.dart';
part 'location_record.g.dart';

/// Row of `locations`.
@freezed
abstract class LocationRecord with _$LocationRecord {
  const factory LocationRecord({
    required String id,
    required String organizationId,
    required String name,
    String? city,
    String? region,
    required String status,
  }) = _LocationRecord;

  factory LocationRecord.fromJson(Map<String, dynamic> json) =>
      _$LocationRecordFromJson(json);
}
