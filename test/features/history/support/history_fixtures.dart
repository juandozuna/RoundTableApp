import 'package:gold_roundtables/core/models/assessment_kind.dart';
import 'package:gold_roundtables/core/models/attendance_status.dart';
import 'package:gold_roundtables/core/models/commitment_follow_up_status.dart';
import 'package:gold_roundtables/core/models/session_status.dart';
import 'package:gold_roundtables/features/history/domain/models/history_snapshot.dart';

/// Table "Esperanza": facilitator Sofía, members Ana and Luis, and Marta who
/// left without any data. Two closed sessions (Honestidad on the 22nd,
/// Responsabilidad on the 29th), a cancelled and a scheduled one.
abstract final class HistoryFixtures {
  static const table = 'table-1';
  static const ana = 'person-ana';
  static const luis = 'person-luis';
  static const sofia = 'person-sofia';
  static const marta = 'person-marta';

  static final DateTime firstSession = DateTime.utc(2026, 10, 22, 23);
  static final DateTime secondSession = DateTime.utc(2026, 10, 29, 23);

  static HistorySnapshot snapshot() => HistorySnapshot(
    tableId: table,
    tableName: 'Mesa Esperanza 03',
    values: const {
      'v3': HistoryValue(
        id: 'v3',
        sequence: 3,
        name: 'Honestidad',
        moduleNumber: 1,
        moduleName: 'Carácter',
      ),
      'v4': HistoryValue(
        id: 'v4',
        sequence: 4,
        name: 'Responsabilidad',
        moduleNumber: 1,
        moduleName: 'Carácter',
      ),
    },
    sessions: [
      HistorySession(
        id: 's3',
        status: SessionStatus.closed,
        valueId: 'v3',
        scheduledAt: firstSession,
      ),
      HistorySession(
        id: 's4',
        status: SessionStatus.closed,
        valueId: 'v4',
        followUpValueId: 'v3',
        scheduledAt: secondSession,
      ),
      HistorySession(
        id: 's-cancelled',
        status: SessionStatus.cancelled,
        scheduledAt: DateTime.utc(2026, 11, 5, 23),
      ),
      HistorySession(
        id: 's-next',
        status: SessionStatus.scheduled,
        scheduledAt: DateTime.utc(2026, 11, 12, 23),
      ),
    ],
    roster: const [
      HistoryRosterEntry(
        personId: ana,
        name: 'Ana Méndez',
        isFacilitator: false,
        isActive: true,
      ),
      HistoryRosterEntry(
        personId: luis,
        name: 'Luis Ferrer',
        isFacilitator: false,
        isActive: true,
      ),
      HistoryRosterEntry(
        personId: sofia,
        name: 'Sofía Herrera',
        isFacilitator: true,
        isActive: true,
      ),
      HistoryRosterEntry(
        personId: marta,
        name: 'Marta Quiroz',
        isFacilitator: false,
        isActive: false,
      ),
    ],
    attendance: const [
      HistoryAttendance(
        sessionId: 's3',
        personId: ana,
        status: AttendanceStatus.present,
        syncedLate: false,
      ),
      HistoryAttendance(
        sessionId: 's3',
        personId: luis,
        status: AttendanceStatus.absent,
        syncedLate: false,
      ),
      HistoryAttendance(
        sessionId: 's4',
        personId: ana,
        status: AttendanceStatus.late,
        syncedLate: false,
      ),
      HistoryAttendance(
        sessionId: 's4',
        personId: luis,
        status: AttendanceStatus.present,
        syncedLate: true,
      ),
    ],
    assessments: const [
      HistoryAssessment(
        sessionId: 's3',
        personId: ana,
        valueId: 'v3',
        kind: AssessmentKind.initial,
        score: 6,
        justification: '  Me cuesta decir la verdad ',
        syncedLate: false,
      ),
      HistoryAssessment(
        sessionId: 's4',
        personId: ana,
        valueId: 'v3',
        kind: AssessmentKind.followUp,
        score: 8,
        syncedLate: false,
      ),
      HistoryAssessment(
        sessionId: 's4',
        personId: ana,
        valueId: 'v4',
        kind: AssessmentKind.initial,
        score: 7,
        justification: '   ',
        syncedLate: false,
      ),
      HistoryAssessment(
        sessionId: 's3',
        personId: luis,
        valueId: 'v3',
        kind: AssessmentKind.initial,
        score: 4,
        syncedLate: false,
      ),
      HistoryAssessment(
        sessionId: 's4',
        personId: luis,
        valueId: 'v3',
        kind: AssessmentKind.followUp,
        score: 4,
        syncedLate: true,
      ),
    ],
    commitments: const [
      HistoryCommitment(
        sessionId: 's3',
        personId: ana,
        valueId: 'v3',
        actionText: 'Llamar a mi mamá · esta semana',
        measureText: 'Cuántas veces',
        followUpSessionId: 's4',
        followUpStatus: CommitmentFollowUpStatus.kept,
        followUpNote: 'Lo logré',
        syncedLate: false,
        followUpSyncedLate: true,
      ),
      HistoryCommitment(
        sessionId: 's4',
        personId: ana,
        valueId: 'v4',
        actionText: 'Entregar mis tareas · cada viernes',
        syncedLate: false,
        followUpSyncedLate: false,
      ),
    ],
  );
}
