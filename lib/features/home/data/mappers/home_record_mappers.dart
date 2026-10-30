import '../../../../core/data/curriculum_names.dart';
import '../../../../core/data/records/records.dart';
import '../../../../core/models/session_status.dart';
import '../../domain/models/home_commitment.dart';
import '../../domain/models/home_progress.dart';
import '../models/home_records.dart';

/// Turns the rows of one table into the home's table record: its next
/// session, seats, last closed session and the latest administrator
/// cancellation (the same facts the home read from the local database).
abstract final class HomeTableMapper {
  static HomeTableRecord toRecord({
    required RoundTableRecord table,
    required Iterable<TableMemberRecord> members,
    required Iterable<SessionRecord> sessions,
    required CurriculumNames names,
  }) {
    final closed = sessions.where((s) => s.status == SessionStatus.closed);
    final lastClosedAt = closed.isEmpty
        ? null
        : closed
              .map((s) => (s.endedAt ?? s.scheduledAt).toUtc())
              .reduce((a, b) => a.isAfter(b) ? a : b);
    final pending = _nextPending(sessions);
    return HomeTableRecord(
      tableId: table.id,
      tableName: table.name,
      tableIsActive: table.status == 'active',
      seats: members.where((m) => m.status == 'active').length,
      lastClosedAt: lastClosedAt,
      sessionId: pending?.id,
      sessionIsOpen: pending?.status == SessionStatus.open,
      scheduledAt: pending?.scheduledAt.toUtc(),
      valueName: names.valueName(pending?.valueId),
      valueSequence: names.value(pending?.valueId)?.sequence,
      followUpValueName: names.valueName(pending?.followUpValueId),
      sessionIsExtraordinary: pending?.kind == 'extraordinary',
      rescheduledFrom: pending?.originalScheduledAt?.toUtc(),
      cancelledNoticeFor: _cancelledSlot(sessions, after: lastClosedAt),
    );
  }

  static SessionRecord? _nextPending(Iterable<SessionRecord> sessions) {
    final pending = [
      for (final s in sessions)
        if (s.status == SessionStatus.scheduled ||
            s.status == SessionStatus.open)
          s,
    ]..sort((a, b) => a.scheduledAt.compareTo(b.scheduledAt));
    return pending.firstOrNull;
  }

  /// Latest slot an administrator cancelled after the last closed session;
  /// a table closing cancels its pending session with a `table_` reason,
  /// which is not a cancelled meeting.
  static DateTime? _cancelledSlot(
    Iterable<SessionRecord> sessions, {
    required DateTime? after,
  }) {
    DateTime? latest;
    for (final s in sessions) {
      if (s.status != SessionStatus.cancelled) continue;
      if ((s.cancelledReason ?? '').startsWith('table_')) continue;
      final at = s.scheduledAt.toUtc();
      if (after != null && !at.isAfter(after)) continue;
      if (latest == null || at.isAfter(latest)) latest = at;
    }
    return latest;
  }
}

extension MemberCommitmentHomeMapper on MemberCommitmentRecord {
  HomeCommitment toHomeCommitment(CurriculumNames names) => HomeCommitment(
    actionText: actionText,
    measureText: measureText,
    valueName: names.valueName(valueId),
    outcome: CommitmentOutcome.tryParse(followUpStatus?.wireValue),
  );
}

extension CurriculumNamesHomeMapper on CurriculumNames {
  /// Per module: how many of its values the person has scored initially.
  HomeProgress toHomeProgress(Iterable<MemberAssessmentRecord> initial) {
    final scored = {for (final a in initial) a.valueId};
    return HomeProgress(
      modules: [
        for (final module in modules)
          ModuleProgress(
            number: module.number,
            name: moduleName(module),
            completed: values
                .where((v) => v.moduleId == module.id && scored.contains(v.id))
                .length,
            total: module.valueCount,
          ),
      ],
    );
  }
}
