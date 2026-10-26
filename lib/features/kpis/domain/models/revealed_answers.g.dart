// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revealed_answers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RevealedAssessment _$RevealedAssessmentFromJson(Map<String, dynamic> json) =>
    _RevealedAssessment(
      id: json['id'] as String,
      sessionId: json['session_id'] as String?,
      valueId: json['value_id'] as String?,
      valueName: json['value_name'] as String?,
      kind: json['kind'] as String,
      score: (json['score'] as num?)?.toInt(),
      justification: json['justification'] as String?,
      syncedLate: json['synced_late'] as bool? ?? false,
    );

Map<String, dynamic> _$RevealedAssessmentToJson(_RevealedAssessment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'session_id': ?instance.sessionId,
      'value_id': ?instance.valueId,
      'value_name': ?instance.valueName,
      'kind': instance.kind,
      'score': ?instance.score,
      'justification': ?instance.justification,
      'synced_late': instance.syncedLate,
    };

_RevealedAnswer _$RevealedAnswerFromJson(Map<String, dynamic> json) =>
    _RevealedAnswer(
      id: json['id'] as String,
      sessionId: json['session_id'] as String?,
      valueId: json['value_id'] as String?,
      questionId: json['question_id'] as String?,
      questionText: json['question_text'] as String?,
      answerText: json['answer_text'] as String?,
      syncedLate: json['synced_late'] as bool? ?? false,
    );

Map<String, dynamic> _$RevealedAnswerToJson(_RevealedAnswer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'session_id': ?instance.sessionId,
      'value_id': ?instance.valueId,
      'question_id': ?instance.questionId,
      'question_text': ?instance.questionText,
      'answer_text': ?instance.answerText,
      'synced_late': instance.syncedLate,
    };

_RevealedCommitment _$RevealedCommitmentFromJson(Map<String, dynamic> json) =>
    _RevealedCommitment(
      id: json['id'] as String,
      sessionId: json['session_id'] as String?,
      valueId: json['value_id'] as String?,
      actionText: json['action_text'] as String?,
      measureText: json['measure_text'] as String?,
      followUpStatus: json['follow_up_status'] as String?,
      followUpNote: json['follow_up_note'] as String?,
      syncedLate: json['synced_late'] as bool? ?? false,
    );

Map<String, dynamic> _$RevealedCommitmentToJson(_RevealedCommitment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'session_id': ?instance.sessionId,
      'value_id': ?instance.valueId,
      'action_text': ?instance.actionText,
      'measure_text': ?instance.measureText,
      'follow_up_status': ?instance.followUpStatus,
      'follow_up_note': ?instance.followUpNote,
      'synced_late': instance.syncedLate,
    };

_RevealedPerson _$RevealedPersonFromJson(
  Map<String, dynamic> json,
) => _RevealedPerson(
  personId: json['person_id'] as String,
  firstName: json['first_name'] as String?,
  lastName: json['last_name'] as String?,
  assessments:
      (json['assessments'] as List<dynamic>?)
          ?.map((e) => RevealedAssessment.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  answers:
      (json['answers'] as List<dynamic>?)
          ?.map((e) => RevealedAnswer.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  commitments:
      (json['commitments'] as List<dynamic>?)
          ?.map((e) => RevealedCommitment.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$RevealedPersonToJson(_RevealedPerson instance) =>
    <String, dynamic>{
      'person_id': instance.personId,
      'first_name': ?instance.firstName,
      'last_name': ?instance.lastName,
      'assessments': instance.assessments.map((e) => e.toJson()).toList(),
      'answers': instance.answers.map((e) => e.toJson()).toList(),
      'commitments': instance.commitments.map((e) => e.toJson()).toList(),
    };

_RevealedAnswers _$RevealedAnswersFromJson(Map<String, dynamic> json) =>
    _RevealedAnswers(
      roundTableId: json['round_table_id'] as String,
      revealedAt: json['revealed_at'] == null
          ? null
          : DateTime.parse(json['revealed_at'] as String),
      people:
          (json['people'] as List<dynamic>?)
              ?.map((e) => RevealedPerson.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RevealedAnswersToJson(_RevealedAnswers instance) =>
    <String, dynamic>{
      'round_table_id': instance.roundTableId,
      'revealed_at': ?instance.revealedAt?.toIso8601String(),
      'people': instance.people.map((e) => e.toJson()).toList(),
    };
