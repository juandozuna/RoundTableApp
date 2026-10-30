import '../../../../core/data/curriculum_names.dart';
import '../../../../core/data/records/records.dart';
import '../../../../core/models/user_role.dart';
import '../../../../core/network/postgrest/postgrest.dart';
import '../../domain/models/history_snapshot.dart';

extension SessionRecordHistoryMapper on SessionRecord {
  HistorySession toHistorySession() => HistorySession(
    id: id,
    status: status,
    valueId: valueId,
    followUpValueId: followUpValueId,
    scheduledAt: scheduledAt.toUtc(),
    incomplete: completion == 'incomplete',
  );
}

extension AttendanceRecordHistoryMapper on SessionAttendanceRecord {
  HistoryAttendance toHistoryAttendance() => HistoryAttendance(
    sessionId: sessionId,
    personId: personId,
    status: status,
    syncedLate: syncedLate,
  );
}

extension AssessmentRecordHistoryMapper on MemberAssessmentRecord {
  HistoryAssessment toHistoryAssessment() => HistoryAssessment(
    sessionId: sessionId,
    personId: personId,
    valueId: valueId,
    kind: kind,
    score: score,
    justification: justification,
    syncedLate: syncedLate,
  );
}

extension CommitmentRecordHistoryMapper on MemberCommitmentRecord {
  HistoryCommitment toHistoryCommitment() => HistoryCommitment(
    sessionId: sessionId,
    personId: personId,
    valueId: valueId,
    actionText: actionText,
    measureText: measureText,
    followUpSessionId: followUpSessionId,
    followUpStatus: followUpStatus,
    followUpNote: followUpNote,
    syncedLate: syncedLate,
    followUpSyncedLate: followUpSyncedLate,
  );
}

extension CurriculumNamesHistoryMapper on CurriculumNames {
  Map<String, HistoryValue> toHistoryValues() => {
    for (final record in values)
      record.id: HistoryValue(
        id: record.id,
        sequence: record.sequence,
        name: valueName(record.id)!,
        moduleNumber: moduleOf(record.id)?.number,
        moduleName: _moduleNameOf(record.id),
      ),
  };

  String? _moduleNameOf(String valueId) {
    final module = moduleOf(valueId);
    return module == null ? null : moduleName(module);
  }
}

extension TableMembersHistoryMapper on Iterable<TableMemberRecord> {
  /// One entry per person: an active membership wins over earlier ones.
  List<HistoryRosterEntry> toHistoryRoster() {
    final byPerson = <String, HistoryRosterEntry>{};
    for (final member in this) {
      final entry = HistoryRosterEntry(
        personId: member.personId,
        name: '${member.firstName} ${member.lastName}'.trim(),
        isFacilitator: member.role == UserRole.facilitator,
        isActive: member.status == PostgrestValues.activeStatus,
      );
      final previous = byPerson[member.personId];
      if (previous == null || (entry.isActive && !previous.isActive)) {
        byPerson[member.personId] = entry;
      }
    }
    return byPerson.values.toList()..sort((a, b) => a.name.compareTo(b.name));
  }
}
