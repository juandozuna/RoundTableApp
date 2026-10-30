import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_answer_record.freezed.dart';
part 'member_answer_record.g.dart';

/// Row of `member_answers`. `answerPersonId` is set for `person` questions.
@freezed
abstract class MemberAnswerRecord with _$MemberAnswerRecord {
  const factory MemberAnswerRecord({
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
    required String questionId,
    required String answerText,
    String? answerPersonId,
  }) = _MemberAnswerRecord;

  factory MemberAnswerRecord.fromJson(Map<String, dynamic> json) =>
      _$MemberAnswerRecordFromJson(json);
}
