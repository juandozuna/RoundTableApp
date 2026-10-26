import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/models/session_stage.dart';
import 'package:gold_roundtables/features/session/domain/models/commitment_follow_up_status.dart';
import 'package:gold_roundtables/features/session/domain/models/facilitator_stage.dart';
import 'package:gold_roundtables/features/session/domain/models/response_validation.dart';
import 'package:gold_roundtables/features/session/domain/models/session_info.dart';
import 'package:gold_roundtables/features/session/domain/models/session_status.dart';
import 'package:gold_roundtables/features/session/domain/models/today_session_selector.dart';

SessionInfo info({
  String id = 's',
  SessionStatus status = SessionStatus.scheduled,
  SessionStage stage = SessionStage.lobby,
  required DateTime scheduledAt,
  DateTime? endedAt,
  DateTime? answersClosedAt,
}) => SessionInfo(
  id: id,
  tableId: 't',
  status: status,
  stage: stage,
  scheduledAt: scheduledAt,
  valueId: 'v',
  endedAt: endedAt,
  answersClosedAt: answersClosedAt,
);

void main() {
  final now = DateTime.utc(2026, 10, 29, 22);

  group('TodaySessionSelector', () {
    test('an open session always wins', () {
      final open = info(
        status: SessionStatus.open,
        scheduledAt: now.subtract(const Duration(days: 2)),
      );
      final selected = TodaySessionSelector.select(
        pending: open,
        lastClosed: null,
        now: now,
      );
      expect(selected!.info.id, open.id);
      expect(selected.isToday, isTrue);
    });

    test('a session that just closed is shown as the summary', () {
      final closed = info(
        id: 'closed',
        status: SessionStatus.closed,
        stage: SessionStage.closed,
        scheduledAt: now.subtract(const Duration(hours: 2)),
        endedAt: now.subtract(const Duration(minutes: 20)),
      );
      final next = info(
        id: 'next',
        scheduledAt: now.add(const Duration(days: 7)),
      );
      expect(
        TodaySessionSelector.select(
          pending: next,
          lastClosed: closed,
          now: now,
        )!.info.id,
        'closed',
      );
    });

    test('a week later the pending session is shown but is not today', () {
      final closed = info(
        id: 'closed',
        status: SessionStatus.closed,
        scheduledAt: now.subtract(const Duration(days: 1)),
        endedAt: now.subtract(const Duration(days: 1)),
      );
      final next = info(
        id: 'next',
        scheduledAt: now.add(const Duration(days: 6)),
      );
      final selected = TodaySessionSelector.select(
        pending: next,
        lastClosed: closed,
        now: now,
      );
      expect(selected!.info.id, 'next');
      expect(selected.isToday, isFalse);
    });

    test('a session within the window or overdue is today', () {
      expect(
        TodaySessionSelector.select(
          pending: info(scheduledAt: now.add(const Duration(hours: 1))),
          lastClosed: null,
          now: now,
        )!.isToday,
        isTrue,
      );
      expect(
        TodaySessionSelector.select(
          pending: info(scheduledAt: now.subtract(const Duration(days: 3))),
          lastClosed: null,
          now: now,
        )!.isToday,
        isTrue,
      );
    });

    test('nothing to show without sessions', () {
      expect(
        TodaySessionSelector.select(pending: null, lastClosed: null, now: now),
        isNull,
      );
    });
  });

  group('FacilitatorStage', () {
    FacilitatorStage of(SessionInfo i) => FacilitatorStage.of(i);
    final scheduled = now.add(const Duration(hours: 1));

    test('maps the synced session to the five-stage bar', () {
      expect(of(info(scheduledAt: scheduled)), FacilitatorStage.open);
      expect(
        of(
          info(
            scheduledAt: scheduled,
            status: SessionStatus.open,
            stage: SessionStage.attendance,
          ),
        ),
        FacilitatorStage.attendance,
      );
      expect(
        of(
          info(
            scheduledAt: scheduled,
            status: SessionStatus.open,
            stage: SessionStage.followUp,
          ),
        ),
        FacilitatorStage.followUp,
      );
      for (final stage in [SessionStage.value, SessionStage.commitment]) {
        expect(
          of(
            info(
              scheduledAt: scheduled,
              status: SessionStatus.open,
              stage: stage,
            ),
          ),
          FacilitatorStage.value,
        );
      }
    });

    test('closed answers or a closed session read as Cierre', () {
      expect(
        of(
          info(
            scheduledAt: scheduled,
            status: SessionStatus.open,
            stage: SessionStage.value,
            answersClosedAt: now,
          ),
        ),
        FacilitatorStage.closing,
      );
      expect(
        of(info(scheduledAt: scheduled, status: SessionStatus.closed)),
        FacilitatorStage.closing,
      );
    });

    test('knows the next stage and the server stage it writes', () {
      expect(FacilitatorStage.attendance.next, FacilitatorStage.followUp);
      expect(FacilitatorStage.closing.next, isNull);
      expect(FacilitatorStage.value.serverStage, SessionStage.value);
    });
  });

  group('ResponseValidator', () {
    test('the follow-up needs a status and a score that is not 5', () {
      expect(
        ResponseValidator.followUp(status: null, score: null).keys,
        containsAll(['followUpStatus', 'followUpScore']),
      );
      expect(
        ResponseValidator.followUp(
          status: CommitmentFollowUpStatus.kept,
          score: 5,
        )['followUpScore'],
        ResponseError.scoreNotAllowed,
      );
      expect(
        ResponseValidator.followUp(
          status: CommitmentFollowUpStatus.kept,
          score: 6,
        ),
        isEmpty,
      );
    });

    test('reflection answers need text of at least 3 characters', () {
      final errors = ResponseValidator.reflection(
        answers: {'q1': ' ', 'q2': 'ab', 'q3': 'Mi abuelo'},
        questionIds: ['q1', 'q2', 'q3'],
        score: 11,
      );
      expect(
        errors[ResponseValidator.answerField('q1')],
        ResponseError.required,
      );
      expect(
        errors[ResponseValidator.answerField('q2')],
        ResponseError.tooShort,
      );
      expect(errors.containsKey(ResponseValidator.answerField('q3')), isFalse);
      expect(errors['reflectionScore'], ResponseError.scoreNotAllowed);
    });

    test('a commitment needs what, when and how', () {
      expect(
        ResponseValidator.commitment(what: '', when: null, how: null).length,
        3,
      );
      expect(
        ResponseValidator.commitment(
          what: 'corto',
          when: 'Hoy',
          how: 'Sí',
        )['commitmentWhat'],
        ResponseError.tooShort,
      );
      expect(
        ResponseValidator.commitment(
          what: 'Llamar a mi abuela',
          when: 'Cada martes',
          how: 'Cuántas veces',
        ),
        isEmpty,
      );
    });
  });
}
