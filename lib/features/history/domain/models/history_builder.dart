import '../../../../core/models/assessment_kind.dart';
import '../../../../core/models/session_status.dart';
import 'history_snapshot.dart';
import 'member_history.dart';
import 'table_history.dart';

/// Builds the history views from what the device holds. Pure: no I/O.
abstract final class HistoryBuilder {
  static final DateTime _epoch = DateTime.fromMillisecondsSinceEpoch(
    0,
    isUtc: true,
  );

  static MemberHistory member(HistorySnapshot snapshot, String personId) {
    final dates = _sessionDates(snapshot);
    final assessments = snapshot.assessments
        .where((a) => a.personId == personId)
        .toList();
    final commitments = snapshot.commitments
        .where((c) => c.personId == personId)
        .toList();
    final valueIds = {
      ...assessments.map((a) => a.valueId),
      ...commitments.map((c) => c.valueId),
    };

    final values = <ValueProgress>[
      for (final id in valueIds)
        if (snapshot.values[id] case final value?)
          _valueProgress(value, assessments, commitments, dates),
    ]..sort((a, b) => a.sequence.compareTo(b.sequence));

    return MemberHistory(
      personId: personId,
      name: _nameOf(snapshot, personId),
      values: values,
      sessions: _sessionRecords(snapshot, personId, assessments, commitments),
    );
  }

  static TableHistory table(HistorySnapshot snapshot) {
    final histories = {
      for (final entry in snapshot.roster)
        entry.personId: member(snapshot, entry.personId),
    };
    final shownPeople = [
      for (final entry in snapshot.roster)
        if (entry.isActive || histories[entry.personId]!.hasActivity) entry,
    ];

    return TableHistory(
      tableId: snapshot.tableId,
      tableName: snapshot.tableName,
      members: [
        for (final entry in shownPeople)
          _memberSummary(entry, histories[entry.personId]!),
      ],
      sessions: _tableSessions(snapshot, shownPeople),
      values: _tableValues(snapshot, histories.values),
    );
  }

  // ----------------------------------------------------------------- member

  static ValueProgress _valueProgress(
    HistoryValue value,
    List<HistoryAssessment> assessments,
    List<HistoryCommitment> commitments,
    Map<String, DateTime> dates,
  ) {
    HistoryAssessment? latest(AssessmentKind kind) => _latest(
      assessments.where((a) => a.valueId == value.id && a.kind == kind),
      (a) => dates[a.sessionId],
    );
    final initial = latest(AssessmentKind.initial);
    final followUp = latest(AssessmentKind.followUp);
    final commitment = _latest(
      commitments.where((c) => c.valueId == value.id),
      (c) => dates[c.sessionId],
    );
    return ValueProgress(
      valueId: value.id,
      sequence: value.sequence,
      name: value.name,
      moduleNumber: value.moduleNumber,
      moduleName: value.moduleName,
      initialScore: initial?.score,
      initialJustification: _blankToNull(initial?.justification),
      initialSyncedLate: initial?.syncedLate ?? false,
      followUpScore: followUp?.score,
      followUpJustification: _blankToNull(followUp?.justification),
      followUpSyncedLate: followUp?.syncedLate ?? false,
      commitment: commitment == null
          ? null
          : CommitmentProgress(
              actionText: commitment.actionText,
              measureText: _blankToNull(commitment.measureText),
              status: commitment.followUpStatus,
              note: _blankToNull(commitment.followUpNote),
              syncedLate:
                  commitment.syncedLate || commitment.followUpSyncedLate,
            ),
    );
  }

  static List<SessionRecord> _sessionRecords(
    HistorySnapshot snapshot,
    String personId,
    List<HistoryAssessment> assessments,
    List<HistoryCommitment> commitments,
  ) {
    final records = <SessionRecord>[];
    for (final session in _heldSessions(snapshot)) {
      final attendance = snapshot.attendance
          .where((a) => a.sessionId == session.id && a.personId == personId)
          .firstOrNull;
      final late =
          (attendance?.syncedLate ?? false) ||
          assessments.any((a) => a.sessionId == session.id && a.syncedLate) ||
          commitments.any(
            (c) =>
                (c.sessionId == session.id && c.syncedLate) ||
                (c.followUpSessionId == session.id && c.followUpSyncedLate),
          );
      final value = snapshot.values[session.valueId];
      records.add(
        SessionRecord(
          sessionId: session.id,
          scheduledAt: session.scheduledAt ?? _epoch,
          isOpen: session.status == SessionStatus.open,
          valueSequence: value?.sequence,
          valueName: value?.name,
          attendance: attendance?.status,
          syncedLate: late,
        ),
      );
    }
    return records;
  }

  // ------------------------------------------------------------------ table

  static TableMemberSummary _memberSummary(
    HistoryRosterEntry entry,
    MemberHistory history,
  ) => TableMemberSummary(
    personId: entry.personId,
    name: entry.name,
    isFacilitator: entry.isFacilitator,
    attendedSessions: history.attendedSessions,
    closedSessions: history.closedSessions,
    averageInitial: history.averageInitial,
    averageFollowUp: history.averageFollowUp,
    averageImprovement: history.averageImprovement,
  );

  static List<TableSessionSummary> _tableSessions(
    HistorySnapshot snapshot,
    List<HistoryRosterEntry> people,
  ) {
    final summaries = <TableSessionSummary>[];
    for (final session in _heldSessions(snapshot)) {
      final entries = <TableSessionEntry>[];
      for (final person in people) {
        final attendance = snapshot.attendance
            .where(
              (a) => a.sessionId == session.id && a.personId == person.personId,
            )
            .firstOrNull;
        int? score(AssessmentKind kind) => snapshot.assessments
            .where(
              (a) =>
                  a.sessionId == session.id &&
                  a.personId == person.personId &&
                  a.kind == kind,
            )
            .firstOrNull
            ?.score;
        final commitment = snapshot.commitments
            .where(
              (c) => c.sessionId == session.id && c.personId == person.personId,
            )
            .firstOrNull;
        final hasData =
            attendance != null ||
            commitment != null ||
            score(AssessmentKind.initial) != null ||
            score(AssessmentKind.followUp) != null;
        if (!hasData && !person.isActive) continue;
        entries.add(
          TableSessionEntry(
            personId: person.personId,
            name: person.name,
            attendance: attendance?.status,
            initialScore: score(AssessmentKind.initial),
            followUpScore: score(AssessmentKind.followUp),
            commitmentText: commitment?.actionText,
            syncedLate:
                (attendance?.syncedLate ?? false) ||
                (commitment?.syncedLate ?? false),
          ),
        );
      }
      final value = snapshot.values[session.valueId];
      summaries.add(
        TableSessionSummary(
          sessionId: session.id,
          scheduledAt: session.scheduledAt ?? _epoch,
          isOpen: session.status == SessionStatus.open,
          valueSequence: value?.sequence,
          valueName: value?.name,
          entries: entries,
        ),
      );
    }
    return summaries;
  }

  static List<TableValueSummary> _tableValues(
    HistorySnapshot snapshot,
    Iterable<MemberHistory> histories,
  ) {
    final summaries = <TableValueSummary>[];
    for (final value in snapshot.values.values) {
      final progress = [
        for (final history in histories)
          history.values.where((v) => v.valueId == value.id).firstOrNull,
      ].whereType<ValueProgress>().toList();
      final initial = progress.map((p) => p.initialScore).whereType<int>();
      final followUp = progress.map((p) => p.followUpScore).whereType<int>();
      final improvement = progress.map((p) => p.improvement).whereType<int>();
      if (initial.isEmpty && followUp.isEmpty) continue;
      summaries.add(
        TableValueSummary(
          valueId: value.id,
          sequence: value.sequence,
          name: value.name,
          averageInitial: _mean(initial),
          averageFollowUp: _mean(followUp),
          averageImprovement: _mean(improvement),
          initialCount: initial.length,
          followUpCount: followUp.length,
        ),
      );
    }
    return summaries..sort((a, b) => a.sequence.compareTo(b.sequence));
  }

  // ---------------------------------------------------------------- helpers

  /// Closed and running sessions, newest first.
  static List<HistorySession> _heldSessions(HistorySnapshot snapshot) =>
      snapshot.sessions
          .where(
            (s) =>
                s.status == SessionStatus.closed ||
                s.status == SessionStatus.open,
          )
          .toList()
        ..sort(
          (a, b) =>
              (b.scheduledAt ?? _epoch).compareTo(a.scheduledAt ?? _epoch),
        );

  static Map<String, DateTime> _sessionDates(HistorySnapshot snapshot) => {
    for (final s in snapshot.sessions) s.id: s.scheduledAt ?? _epoch,
  };

  static T? _latest<T>(Iterable<T> items, DateTime? Function(T) dateOf) {
    T? best;
    DateTime? bestDate;
    for (final item in items) {
      final date = dateOf(item) ?? _epoch;
      if (best == null || date.isAfter(bestDate!)) {
        best = item;
        bestDate = date;
      }
    }
    return best;
  }

  static String _nameOf(HistorySnapshot snapshot, String personId) =>
      snapshot.roster.where((r) => r.personId == personId).firstOrNull?.name ??
      '';

  static double? _mean(Iterable<int> numbers) => numbers.isEmpty
      ? null
      : numbers.fold<int>(0, (a, b) => a + b) / numbers.length;

  static String? _blankToNull(String? text) {
    final trimmed = text?.trim();
    return trimmed == null || trimmed.isEmpty ? null : trimmed;
  }
}
