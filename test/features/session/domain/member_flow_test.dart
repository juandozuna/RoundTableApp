import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/models/session_stage.dart';
import 'package:gold_roundtables/features/session/domain/models/member_flow.dart';
import 'package:gold_roundtables/features/session/domain/models/member_step.dart';
import 'package:gold_roundtables/features/session/domain/models/session_status.dart';
import 'package:gold_roundtables/features/session/domain/models/step_progress.dart';

import '../support/live_session_builder.dart';

void main() {
  final fac = person('sofia', facilitator: true);

  group('live (stage driven)', () {
    MemberFlow flow({
      SessionStatus status = SessionStatus.open,
      SessionStage stage = SessionStage.followUp,
      bool previous = true,
      bool followUpDone = false,
      bool reflectionDone = false,
      DateTime? answersClosedAt,
    }) => MemberFlow(
      liveSession(
        participants: [
          fac,
          person(
            'ana',
            me: true,
            previous: previous,
            followUp: followUpDone ? done() : StepProgress.none,
            reflection: reflectionDone ? done() : StepProgress.none,
          ),
        ],
        status: status,
        stage: stage,
        answersClosedAt: answersClosedAt,
      ),
      live: true,
    );

    test('waits in the lobby until the session opens', () {
      expect(
        flow(
          status: SessionStatus.scheduled,
          stage: SessionStage.lobby,
        ).screen(),
        MemberScreen.lobby,
      );
    });

    test('follows the facilitator stage', () {
      expect(
        flow(stage: SessionStage.attendance).screen(),
        MemberScreen.attendance,
      );
      expect(
        flow(stage: SessionStage.followUp).screen(),
        MemberScreen.followUp,
      );
      expect(flow(stage: SessionStage.value).screen(), MemberScreen.reflection);
      expect(
        flow(stage: SessionStage.value, reflectionDone: true).screen(),
        MemberScreen.commitment,
      );
    });

    test('the commitment stage is part of Valor, not a gate', () {
      expect(
        flow(stage: SessionStage.commitment).screen(),
        MemberScreen.reflection,
      );
      expect(
        flow(stage: SessionStage.commitment).accessOf(MemberStep.commitment),
        StepAccess.open,
      );
    });

    test('earlier steps stay open until answers close', () {
      final f = flow(stage: SessionStage.value);
      expect(f.accessOf(MemberStep.followUp), StepAccess.open);
      expect(f.screen(chosen: MemberStep.followUp), MemberScreen.followUp);
    });

    test('later steps are not yet open', () {
      expect(
        flow(stage: SessionStage.followUp).accessOf(MemberStep.reflection),
        StepAccess.notYet,
      );
      expect(
        flow(
          stage: SessionStage.followUp,
        ).screen(chosen: MemberStep.reflection),
        MemberScreen.followUp,
      );
    });

    test('closed answers lock what was not captured', () {
      final f = flow(
        stage: SessionStage.value,
        followUpDone: true,
        answersClosedAt: DateTime.utc(2026, 10, 30),
      );
      expect(f.accessOf(MemberStep.followUp), StepAccess.done);
      expect(f.accessOf(MemberStep.reflection), StepAccess.closed);
      expect(f.screen(), MemberScreen.recap);
    });

    test('no previous commitment skips the follow-up', () {
      final f = flow(previous: false);
      expect(f.accessOf(MemberStep.followUp), StepAccess.skipped);
      expect(f.isFinished, isFalse);
    });

    test('a closed session shows the summary, a cancelled one says so', () {
      expect(
        flow(status: SessionStatus.closed, stage: SessionStage.closed).screen(),
        MemberScreen.summary,
      );
      expect(
        flow(status: SessionStatus.cancelled).screen(),
        MemberScreen.cancelled,
      );
    });

    test('a session that is not today waits', () {
      final far = MemberFlow(
        liveSession(
          participants: [fac, person('ana', me: true)],
          status: SessionStatus.scheduled,
          stage: SessionStage.lobby,
          isToday: false,
        ),
        live: true,
      );
      expect(far.screen(), MemberScreen.notToday);
    });
  });

  group('self-paced (no connection)', () {
    MemberFlow flow({
      bool previous = true,
      bool followUpDone = false,
      bool reflectionDone = false,
      bool commitmentDone = false,
      bool acknowledged = false,
      SessionStage stage = SessionStage.lobby,
    }) => MemberFlow(
      liveSession(
        participants: [
          fac,
          person(
            'ana',
            me: true,
            previous: previous,
            followUp: followUpDone ? done() : StepProgress.none,
            reflection: reflectionDone ? done() : StepProgress.none,
            commitment: commitmentDone ? done() : StepProgress.none,
          ),
        ],
        status: SessionStatus.scheduled,
        stage: stage,
      ),
      live: false,
      noPreviousAcknowledged: acknowledged,
    );

    test('walks the steps in order whatever the synced stage says', () {
      expect(flow().screen(), MemberScreen.followUp);
      expect(flow(followUpDone: true).screen(), MemberScreen.reflection);
      expect(
        flow(followUpDone: true, reflectionDone: true).screen(),
        MemberScreen.commitment,
      );
      expect(
        flow(
          followUpDone: true,
          reflectionDone: true,
          commitmentDone: true,
        ).screen(),
        MemberScreen.recap,
      );
    });

    test('value and commitment unlock after the follow-up', () {
      expect(flow().accessOf(MemberStep.reflection), StepAccess.notYet);
      expect(
        flow(followUpDone: true).accessOf(MemberStep.commitment),
        StepAccess.open,
      );
    });

    test('shows the no-previous-commitment screen once, then moves on', () {
      expect(flow(previous: false).screen(), MemberScreen.followUp);
      expect(
        flow(previous: false, acknowledged: true).screen(),
        MemberScreen.reflection,
      );
      expect(
        flow(previous: false).accessOf(MemberStep.reflection),
        StepAccess.open,
      );
    });
  });

  group('the facilitator answering', () {
    test('is always stage driven, even offline', () {
      final f = MemberFlow(
        liveSession(
          participants: [person('sofia', facilitator: true, me: true)],
          stage: SessionStage.attendance,
        ),
        live: false,
      );
      expect(f.isLive, isTrue);
      expect(f.screen(), MemberScreen.attendance);
    });
  });
}
