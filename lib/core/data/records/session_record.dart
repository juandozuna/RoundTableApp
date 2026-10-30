import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/session_stage.dart';
import '../../models/session_status.dart';

part 'session_record.freezed.dart';
part 'session_record.g.dart';

/// Row of `sessions`. `completion` is `complete` or `incomplete` once closed;
/// `kind` is `regular` or `extraordinary`.
@freezed
abstract class SessionRecord with _$SessionRecord {
  const factory SessionRecord({
    required String id,
    required String organizationId,
    required String roundTableId,
    required String valueId,
    String? followUpValueId,
    required SessionStatus status,
    required SessionStage stage,
    required DateTime scheduledAt,
    DateTime? startedAt,
    DateTime? endedAt,
    DateTime? answersClosedAt,
    String? cancelledReason,
    String? completion,
    String? incompleteReason,
    @Default('regular') String kind,
    DateTime? originalScheduledAt,
    String? facilitatorPersonId,
    DateTime? deviceModifiedAt,
    DateTime? archivedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _SessionRecord;

  factory SessionRecord.fromJson(Map<String, dynamic> json) =>
      _$SessionRecordFromJson(json);
}
