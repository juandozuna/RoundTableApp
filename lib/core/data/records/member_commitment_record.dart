import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/commitment_follow_up_status.dart';

part 'member_commitment_record.freezed.dart';
part 'member_commitment_record.g.dart';

/// Row of `member_commitments`, including the follow-up written in the next session.
@freezed
abstract class MemberCommitmentRecord with _$MemberCommitmentRecord {
  const factory MemberCommitmentRecord({
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
    required String actionText,
    String? measureText,
    String? followUpSessionId,
    CommitmentFollowUpStatus? followUpStatus,
    String? followUpNote,
    DateTime? followUpDeviceAt,
    DateTime? followUpReceivedAt,
    @Default(false) bool followUpSyncedLate,
  }) = _MemberCommitmentRecord;

  factory MemberCommitmentRecord.fromJson(Map<String, dynamic> json) =>
      _$MemberCommitmentRecordFromJson(json);
}
