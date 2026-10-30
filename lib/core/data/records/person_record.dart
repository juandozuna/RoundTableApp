import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_record.freezed.dart';
part 'person_record.g.dart';

/// Row of `people`. RLS lets a member read only their own rows; coordinators
/// and facilitators read more (see `people_read`).
@freezed
abstract class PersonRecord with _$PersonRecord {
  const factory PersonRecord({
    required String id,
    String? organizationId,
    required String firstName,
    required String lastName,
    String? position,
    String? email,
    String? phone,
    required String status,
  }) = _PersonRecord;

  factory PersonRecord.fromJson(Map<String, dynamic> json) =>
      _$PersonRecordFromJson(json);
}
