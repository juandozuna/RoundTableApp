import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/models/session_stage.dart';
import 'package:gold_roundtables/features/session/domain/models/commitment_follow_up_status.dart';
import 'package:gold_roundtables/features/session/domain/models/member_flow.dart';
import 'package:gold_roundtables/features/session/domain/models/member_step.dart';
import 'package:gold_roundtables/features/session/domain/models/response_submissions.dart';
import 'package:gold_roundtables/features/session/domain/use_cases/responses/submit_commitment_use_case.dart';
import 'package:gold_roundtables/features/session/domain/use_cases/responses/submit_follow_up_use_case.dart';
import 'package:gold_roundtables/features/session/domain/use_cases/responses/submit_reflection_use_case.dart';
import 'package:gold_roundtables/features/session/presentation/pages/member_flow/cubit/member_flow_cubit.dart';
import 'package:mocktail/mocktail.dart';

import '../support/live_session_builder.dart';

class _MockFollowUp extends Mock implements SubmitFollowUpUseCase {}

class _MockReflection extends Mock implements SubmitReflectionUseCase {}

class _MockCommitment extends Mock implements SubmitCommitmentUseCase {}

void main() {
  late _MockFollowUp followUp;
  late _MockReflection reflection;
  late _MockCommitment commitment;
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
    cubit = MemberFlowCubit(followUp, reflection, commitment);
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
}
