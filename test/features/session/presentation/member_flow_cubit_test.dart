import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/models/session_stage.dart';
import 'package:gold_roundtables/features/session/domain/models/commitment_follow_up_status.dart';
import 'package:gold_roundtables/features/session/domain/models/member_flow.dart';
import 'package:gold_roundtables/features/session/domain/models/member_step.dart';
import 'package:gold_roundtables/features/session/domain/models/response_submissions.dart';
import 'package:gold_roundtables/features/session/domain/models/session_draft.dart';
import 'package:gold_roundtables/features/session/domain/services/session_draft_service.dart';
import 'package:gold_roundtables/features/session/domain/use_cases/drafts/load_session_draft_use_case.dart';
import 'package:gold_roundtables/features/session/domain/use_cases/drafts/save_session_draft_use_case.dart';
import 'package:gold_roundtables/features/session/domain/use_cases/responses/submit_commitment_use_case.dart';
import 'package:gold_roundtables/features/session/domain/use_cases/responses/submit_follow_up_use_case.dart';
import 'package:gold_roundtables/features/session/domain/use_cases/responses/submit_reflection_use_case.dart';
import 'package:gold_roundtables/features/session/presentation/pages/member_flow/cubit/member_flow_cubit.dart';
import 'package:mocktail/mocktail.dart';

import '../support/live_session_builder.dart';

class _MockFollowUp extends Mock implements SubmitFollowUpUseCase {}

class _MockReflection extends Mock implements SubmitReflectionUseCase {}

class _MockCommitment extends Mock implements SubmitCommitmentUseCase {}

class _MemoryDrafts implements SessionDraftService {
  final Map<String, SessionDraft> stored = {};

  @override
  Future<SessionDraft?> load({
    required String sessionId,
    required String personId,
  }) async => stored['$sessionId/$personId'];

  @override
  Future<void> save({
    required String sessionId,
    required String personId,
    required SessionDraft draft,
  }) async {
    if (draft.isEmpty) {
      stored.remove('$sessionId/$personId');
    } else {
      stored['$sessionId/$personId'] = draft;
    }
  }
}

void main() {
  late _MockFollowUp followUp;
  late _MockReflection reflection;
  late _MockCommitment commitment;
  late _MemoryDrafts drafts;
  late MemberFlowCubit cubit;

  setUpAll(() {
    registerFallbackValue(
      const FollowUpSubmission(
        sessionId: 's',
        previousCommitmentId: 'p',
        status: CommitmentFollowUpStatus.kept,
        score: 6,
      ),
    );
    registerFallbackValue(
      const ReflectionSubmission(sessionId: 's', answers: {}, score: 6),
    );
    registerFallbackValue(
      const CommitmentSubmission(sessionId: 's', what: '', when: '', how: ''),
    );
  });

  setUp(() {
    followUp = _MockFollowUp();
    reflection = _MockReflection();
    commitment = _MockCommitment();
    drafts = _MemoryDrafts();
    cubit = MemberFlowCubit(
      followUp,
      reflection,
      commitment,
      LoadSessionDraftUseCase(drafts),
      SaveSessionDraftUseCase(drafts),
    );
  });

  tearDown(() => cubit.close());

  MemberFlow flow({SessionStage stage = SessionStage.followUp}) => MemberFlow(
    liveSession(
      stage: stage,
      participants: [
        person('sofia', facilitator: true),
        person('ana', me: true),
      ],
    ),
    live: true,
  );

  test('an empty follow-up shows field errors and saves nothing', () async {
    await cubit.submitFollowUp(flow());

    expect(
      cubit.state.errors.keys,
      containsAll(['followUpStatus', 'followUpScore']),
    );
    verifyNever(() => followUp(any()));
  });

  test('typing clears that field error', () async {
    await cubit.submitFollowUp(flow());
    cubit.setFollowUpStatus(CommitmentFollowUpStatus.partial);
    expect(cubit.state.errors.containsKey('followUpStatus'), isFalse);
    expect(cubit.state.errors.containsKey('followUpScore'), isTrue);
  });

  test('saves a valid follow-up once and reports it', () async {
    when(() => followUp(any())).thenAnswer((_) async {});
    cubit
      ..setFollowUpStatus(CommitmentFollowUpStatus.partial)
      ..setFollowUpScore(7)
      ..setFollowUpNote('Dos veces');

    await cubit.submitFollowUp(flow());

    final sent =
        verify(() => followUp(captureAny())).captured.single
            as FollowUpSubmission;
    expect(sent.previousCommitmentId, 'commit-prev');
    expect(sent.score, 7);
    expect(sent.note, 'Dos veces');
    expect(cubit.state.justSaved, MemberStep.followUp);
    expect(cubit.state.submitting, isNull);
  });

  test('does not save a step that is not open yet', () async {
    cubit
      ..setReflectionScore(8)
      ..setAnswer('q1', 'Mi abuelo')
      ..setAnswer('q2', 'Cumplo');

    await cubit.submitReflection(flow());

    verifyNever(() => reflection(any()));
  });

  test('reflection needs every question answered', () async {
    cubit
      ..setReflectionScore(8)
      ..setAnswer('q1', 'Mi abuelo');

    await cubit.submitReflection(flow(stage: SessionStage.value));

    expect(cubit.state.errors.keys, ['answer:q2']);
    verifyNever(() => reflection(any()));
  });

  test('the commitment needs qué, cuándo and cómo', () async {
    cubit.setCommitmentWhat('Llamar a mi abuela');
    await cubit.submitCommitment(flow(stage: SessionStage.value));
    expect(
      cubit.state.errors.keys,
      unorderedEquals(['commitmentWhen', 'commitmentHow']),
    );

    when(() => commitment(any())).thenAnswer((_) async {});
    cubit
      ..setCommitmentWhen('Esta semana')
      ..setCommitmentHow('Cuántas veces');
    await cubit.submitCommitment(flow(stage: SessionStage.value));

    final sent =
        verify(() => commitment(captureAny())).captured.single
            as CommitmentSubmission;
    expect(sent.actionText, 'Llamar a mi abuela · Esta semana');
    expect(sent.measureText, 'Cuántas veces');
    expect(cubit.state.justSaved, MemberStep.commitment);
  });

  test('an unexpected failure keeps the drafts and reports it', () async {
    when(() => commitment(any())).thenThrow(StateError('disk full'));
    cubit
      ..setCommitmentWhat('Llamar a mi abuela')
      ..setCommitmentWhen('Esta semana')
      ..setCommitmentHow('Cuántas veces');

    await cubit.submitCommitment(flow(stage: SessionStage.value));

    expect(cubit.state.failure, isA<StateError>());
    expect(cubit.state.commitmentWhat, 'Llamar a mi abuela');
    expect(cubit.state.submitting, isNull);
  });

  test(
    'chips pick a step only through the cubit and clear once saved',
    () async {
      cubit.chooseStep(MemberStep.followUp);
      expect(cubit.state.chosenStep, MemberStep.followUp);
      cubit.acknowledgeNoPrevious();
      expect(cubit.state.noPreviousAcknowledged, isTrue);
      expect(cubit.state.chosenStep, isNull);
    },
  );

  group('drafts on the device', () {
    test('typing is saved after a pause and restored by a new cubit', () async {
      await cubit.restoreDraft(sessionId: 's1', personId: 'ana');
      cubit
        ..setCommitmentWhat('Llamar a mi abuela')
        ..setAnswer('q1', 'Porque cumplo');
      expect(drafts.stored, isEmpty, reason: 'saving waits for a pause');

      await Future<void>.delayed(
        MemberFlowCubit.draftSaveDelay + const Duration(milliseconds: 100),
      );
      expect(drafts.stored['s1/ana']?.commitmentWhat, 'Llamar a mi abuela');

      final reopened = MemberFlowCubit(
        followUp,
        reflection,
        commitment,
        LoadSessionDraftUseCase(drafts),
        SaveSessionDraftUseCase(drafts),
      );
      addTearDown(reopened.close);
      await reopened.restoreDraft(sessionId: 's1', personId: 'ana');

      expect(reopened.state.commitmentWhat, 'Llamar a mi abuela');
      expect(reopened.state.answers, {'q1': 'Porque cumplo'});
    });

    test('a draft never overwrites what was already typed', () async {
      drafts.stored['s1/ana'] = const SessionDraft(commitmentWhat: 'viejo');
      cubit.setCommitmentWhat('nuevo');
      await cubit.restoreDraft(sessionId: 's1', personId: 'ana');
      expect(cubit.state.commitmentWhat, 'nuevo');
    });

    test('drafts of another person or session are not mixed', () async {
      drafts.stored['s1/luis'] = const SessionDraft(commitmentWhat: 'de Luis');
      await cubit.restoreDraft(sessionId: 's1', personId: 'ana');
      expect(cubit.state.commitmentWhat, isEmpty);
    });

    test('a step that was sent leaves the draft', () async {
      when(() => commitment(any())).thenAnswer((_) async {});
      await cubit.restoreDraft(sessionId: 's1', personId: 'ana');
      cubit
        ..setCommitmentWhat('Llamar a mi abuela')
        ..setCommitmentWhen('Todos los días')
        ..setCommitmentHow('Sí o no cada día');
      await Future<void>.delayed(
        MemberFlowCubit.draftSaveDelay + const Duration(milliseconds: 100),
      );
      expect(drafts.stored['s1/ana'], isNotNull);

      await cubit.submitCommitment(flow(stage: SessionStage.value));
      await Future<void>.delayed(
        MemberFlowCubit.draftSaveDelay + const Duration(milliseconds: 100),
      );
      expect(drafts.stored['s1/ana'], isNull);
    });
  });
}
