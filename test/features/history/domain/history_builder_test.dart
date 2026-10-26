import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/models/attendance_status.dart';
import 'package:gold_roundtables/features/history/domain/models/history_builder.dart';
import 'package:gold_roundtables/features/history/domain/models/history_snapshot.dart';
import 'package:gold_roundtables/features/session/domain/models/commitment_follow_up_status.dart';

import '../support/history_fixtures.dart';

void main() {
  final snapshot = HistoryFixtures.snapshot();

  group('member history', () {
    final ana = HistoryBuilder.member(snapshot, HistoryFixtures.ana);

    test('pairs the initial and follow-up score of a value', () {
      final honesty = ana.values.first;
      expect(honesty.name, 'Honestidad');
      expect(honesty.initialScore, 6);
      expect(honesty.followUpScore, 8);
      expect(honesty.improvement, 2);
    });

    test('a value without follow-up has no improvement yet', () {
      final responsibility = ana.values.last;
      expect(responsibility.initialScore, 7);
      expect(responsibility.followUpScore, isNull);
      expect(responsibility.improvement, isNull);
    });

    test('keeps the justification trimmed and drops blank ones', () {
      expect(
        ana.values.first.initialJustification,
        'Me cuesta decir la verdad',
      );
      expect(ana.values.last.initialJustification, isNull);
    });

    test('carries the commitment and how it was followed up', () {
      final commitment = ana.values.first.commitment!;
      expect(commitment.actionText, 'Llamar a mi mamá · esta semana');
      expect(commitment.status, CommitmentFollowUpStatus.kept);
      expect(commitment.note, 'Lo logré');
      expect(ana.values.last.commitment!.status, isNull);
    });

    test('lists only held sessions, newest first, with attendance', () {
      expect([for (final s in ana.sessions) s.sessionId], ['s4', 's3']);
      expect(ana.sessions.first.attendance, AttendanceStatus.late);
      expect(ana.sessions.last.attendance, AttendanceStatus.present);
    });

    test('flags the session whose follow-up reached the server late', () {
      expect(ana.sessions.first.syncedLate, isTrue);
      expect(ana.sessions.last.syncedLate, isFalse);
      expect(ana.values.first.hasLateData, isTrue);
      expect(ana.lateSyncedSessions, 1);
    });

    test('summarises attendance and averages', () {
      expect(ana.closedSessions, 2);
      expect(ana.attendedSessions, 2);
      expect(ana.averageInitial, 6.5);
      expect(ana.averageFollowUp, 8);
      expect(ana.averageImprovement, 2);
    });

    test('a person with no data has an empty history', () {
      final marta = HistoryBuilder.member(snapshot, HistoryFixtures.marta);
      expect(marta.hasActivity, isFalse);
      expect(marta.values, isEmpty);
      expect(marta.sessions.every((s) => s.attendance == null), isTrue);
    });
  });

  group('table history', () {
    final table = HistoryBuilder.table(snapshot);

    test('hides inactive members who have no data', () {
      final names = [for (final m in table.members) m.name];
      expect(names, isNot(contains('Marta Quiroz')));
      expect(
        names,
        containsAll(['Ana Méndez', 'Luis Ferrer', 'Sofía Herrera']),
      );
      expect(
        table.members
            .firstWhere((m) => m.name == 'Sofía Herrera')
            .isFacilitator,
        isTrue,
      );
    });

    test('averages every value across the people who answered', () {
      final honesty = table.values.first;
      expect(honesty.sequence, 3);
      expect(honesty.averageInitial, 5);
      expect(honesty.averageFollowUp, 6);
      expect(honesty.averageImprovement, 1);
      expect(honesty.initialCount, 2);
      expect(table.averageImprovement, 1);
    });

    test('summarises each session with per-member scores', () {
      final second = table.sessions.first;
      expect(second.sessionId, 's4');
      expect(second.attendedCount, 2);
      final ana = second.entries.firstWhere(
        (e) => e.personId == HistoryFixtures.ana,
      );
      expect(ana.initialScore, 7);
      expect(ana.followUpScore, 8);
      expect(ana.commitmentText, 'Entregar mis tareas · cada viernes');
      final luis = second.entries.firstWhere(
        (e) => e.personId == HistoryFixtures.luis,
      );
      expect(luis.syncedLate, isTrue);
    });

    test('attendance rate counts present and late over recorded seats', () {
      expect(table.closedSessions, 2);
      // s3: ana present, luis absent, sofia none; s4: ana late, luis present.
      expect(table.attendanceRate, closeTo(3 / 6, 0.001));
    });

    test('an empty table is empty', () {
      final empty = HistoryBuilder.table(
        const HistorySnapshot(tableId: 't', tableName: 'Mesa'),
      );
      expect(empty.isEmpty, isTrue);
    });
  });
}
