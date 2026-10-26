// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_draft.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionDraft _$SessionDraftFromJson(Map<String, dynamic> json) =>
    _SessionDraft(
      followUpStatus: $enumDecodeNullable(
        _$CommitmentFollowUpStatusEnumMap,
        json['follow_up_status'],
      ),
      followUpNote: json['follow_up_note'] as String? ?? '',
      followUpScore: (json['follow_up_score'] as num?)?.toInt(),
      followUpJustification: json['follow_up_justification'] as String? ?? '',
      answers:
          (json['answers'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      reflectionScore: (json['reflection_score'] as num?)?.toInt(),
      reflectionJustification:
          json['reflection_justification'] as String? ?? '',
      commitmentWhat: json['commitment_what'] as String? ?? '',
      commitmentWhen: json['commitment_when'] as String?,
      commitmentHow: json['commitment_how'] as String?,
    );

Map<String, dynamic> _$SessionDraftToJson(_SessionDraft instance) =>
    <String, dynamic>{
      'follow_up_status':
          ?_$CommitmentFollowUpStatusEnumMap[instance.followUpStatus],
      'follow_up_note': instance.followUpNote,
      'follow_up_score': ?instance.followUpScore,
      'follow_up_justification': instance.followUpJustification,
      'answers': instance.answers,
      'reflection_score': ?instance.reflectionScore,
      'reflection_justification': instance.reflectionJustification,
      'commitment_what': instance.commitmentWhat,
      'commitment_when': ?instance.commitmentWhen,
      'commitment_how': ?instance.commitmentHow,
    };

const _$CommitmentFollowUpStatusEnumMap = {
  CommitmentFollowUpStatus.kept: 'kept',
  CommitmentFollowUpStatus.partial: 'partial',
  CommitmentFollowUpStatus.notKept: 'not_kept',
};
