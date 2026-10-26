import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/models/attendance_status.dart';
import 'package:gold_roundtables/core/models/session_stage.dart';
import 'package:gold_roundtables/core/models/sync_state.dart';
import 'package:gold_roundtables/core/theme/status_tone.dart';
import 'package:gold_roundtables/features/session/domain/models/facilitator_stage.dart';
import 'package:gold_roundtables/features/session/presentation/pages/facilitator_board/board_progress.dart';
import 'package:gold_roundtables/features/session/presentation/pages/facilitator_board/round_table_layout.dart';
import 'package:gold_roundtables/features/session/presentation/pages/facilitator_board/seat_status.dart';

import '../support/live_session_builder.dart';

void main() {
  final luis = person('luis', followUp: done());
  final marta = person('marta', previous: false);
  final ana = person(
    'ana',
    me: true,
    followUp: done(SyncState.pending),
    reflection: done(),
  );
  final sofia = person('sofia', facilitator: true);
  final session = liveSession(
    participants: [sofia, ana, luis, marta],
    stage: SessionStage.value,
  );

  SeatStatus status(p, FacilitatorStage stage, {bool others = true}) =>
      SeatStatus.of(
        session: session,
        participant: p,
        viewing: stage,
        canSeeOthers: others,
      );

  group('SeatStatus', () {
    test('attendance pairs each mark with a distinct tone', () {
      expect(
        status(person('x'), FacilitatorStage.attendance).label,
        SeatLabel.unmarked,
      );
      expect(
        status(
          person('x', attendance: AttendanceStatus.absent),
          FacilitatorStage.attendance,
        ).tone,
        StatusTone.offline,
      );
      expect(
        status(
          person('x', attendance: AttendanceStatus.present),
          FacilitatorStage.attendance,
        ).tone,
        StatusTone.ok,
      );
    });

    test('follow-up: answered, saved on phone, skipped and pending', () {
      expect(status(luis, FacilitatorStage.followUp).label, SeatLabel.answered);
      expect(
        status(ana, FacilitatorStage.followUp).label,
        SeatLabel.savedOnPhone,
      );
      expect(status(marta, FacilitatorStage.followUp).label, SeatLabel.skipped);
      expect(status(sofia, FacilitatorStage.followUp).label, SeatLabel.pending);
    });

    test('while offline other seats read Sin red but mine stays known', () {
      expect(
        status(sofia, FacilitatorStage.followUp, others: false).label,
        SeatLabel.offline,
      );
      expect(
        status(ana, FacilitatorStage.followUp, others: false).label,
        SeatLabel.savedOnPhone,
      );
    });

    test('late arrivals show Llegó tarde', () {
      final late = person('x', followUp: done(SyncState.syncedLate));
      expect(
        status(late, FacilitatorStage.followUp).label,
        SeatLabel.syncedLate,
      );
    });

    test('value aggregates reflection and commitment with two pips', () {
      final s = status(ana, FacilitatorStage.value);
      expect(s.done, 1);
      expect(s.total, 2);
      expect(s.pips, hasLength(2));
      expect(s.label, SeatLabel.progress);
    });

    test('closed answers turn missing steps into No respondió', () {
      final closed = liveSession(
        participants: [sofia, ana, luis, marta],
        stage: SessionStage.value,
        answersClosedAt: DateTime.utc(2026, 10, 30),
      );
      expect(
        SeatStatus.of(
          session: closed,
          participant: sofia,
          viewing: FacilitatorStage.followUp,
          canSeeOthers: true,
        ).label,
        SeatLabel.missed,
      );
    });
  });

  group('BoardProgress', () {
    test(
      'counts attendance marks and people without a previous commitment',
      () {
        final p = liveSession(
          participants: [
            sofia,
            person('ana', me: true, attendance: AttendanceStatus.present),
            marta,
          ],
        );
        expect(BoardProgress.of(p, FacilitatorStage.attendance).done, 1);
        final follow = BoardProgress.of(p, FacilitatorStage.followUp);
        expect(follow.noPrevious, 1);
        expect(follow.total, 2);
      },
    );

    test(
      'value counts people with both parts and those with a pending commitment',
      () {
        final p = BoardProgress.of(session, FacilitatorStage.value);
        expect(p.done, 0);
        expect(p.withPendingCommitment, 1);
      },
    );
  });

  group('RoundTableLayout', () {
    test('seats never overlap for 3 to 9 people on a 360 px phone', () {
      for (var n = 3; n <= 9; n++) {
        final layout = RoundTableLayout.compute(seats: n, width: 330);
        expect(layout.seats, hasLength(n));
        for (var i = 0; i < n; i++) {
          final a = layout.seats[i] & Size(layout.seatWidth, layout.avatarSize);
          expect(a.left, greaterThanOrEqualTo(-1), reason: 'n=$n seat $i');
          expect(a.right, lessThanOrEqualTo(layout.width + 1), reason: 'n=$n');
          for (var j = i + 1; j < n; j++) {
            final b =
                layout.seats[j] & Size(layout.seatWidth, layout.avatarSize);
            expect(a.overlaps(b), isFalse, reason: 'n=$n seats $i,$j');
          }
        }
      }
    });
  });
}
