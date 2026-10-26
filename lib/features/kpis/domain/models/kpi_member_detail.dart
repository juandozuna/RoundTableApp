import 'package:freezed_annotation/freezed_annotation.dart';

part 'kpi_member_detail.freezed.dart';
part 'kpi_member_detail.g.dart';

@freezed
abstract class KpiMemberScore with _$KpiMemberScore {
  const factory KpiMemberScore({
    required String valueId,
    required String valueLabel,
    @Default(0) int sequence,
    int? initialScore,
    int? followUpScore,
    int? delta,
    @Default(false) bool syncedLate,
  }) = _KpiMemberScore;

  factory KpiMemberScore.fromJson(Map<String, dynamic> json) =>
      _$KpiMemberScoreFromJson(json);
}

/// One member of a table with scores only (`kpi_member_detail`, sensitive).
@freezed
abstract class KpiMemberDetail with _$KpiMemberDetail {
  const KpiMemberDetail._();

  const factory KpiMemberDetail({
    required String personId,
    required String firstName,
    required String lastName,
    String? role,
    String? membershipStatus,
    @Default(0) int sessionsExpected,
    @Default(0) int sessionsPresent,
    double? attendancePct,
    @Default(0) int valuesCompleted,
    double? improvementAvg,
    @Default(0) int syncedLateSessions,
    @Default([]) List<KpiMemberScore> scores,
  }) = _KpiMemberDetail;

  factory KpiMemberDetail.fromJson(Map<String, dynamic> json) =>
      _$KpiMemberDetailFromJson(json);

  String get fullName => '$firstName $lastName'.trim();
}
