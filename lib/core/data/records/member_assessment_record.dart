import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/assessment_kind.dart';

part 'member_assessment_record.freezed.dart';
part 'member_assessment_record.g.dart';

/// Row of `member_assessments`; `score` is 1–10 without 5.
@freezed
abstract class MemberAssessmentRecord with _$MemberAssessmentRecord {
  const factory MemberAssessmentRecord({
    required String id,
    required String organizationId,
    required String roundTableId,
    DateTime? deviceCreatedAt,
    DateTime? deviceModifiedAt,
    DateTime? receivedAt,
    @Default(false) bool syncedLate,
    DateTime? archivedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    required String sessionId,
    required String personId,
    required String valueId,
    required AssessmentKind kind,
    required int score,
    String? justification,
  }) = _MemberAssessmentRecord;

  factory MemberAssessmentRecord.fromJson(Map<String, dynamic> json) =>
      _$MemberAssessmentRecordFromJson(json);
}
