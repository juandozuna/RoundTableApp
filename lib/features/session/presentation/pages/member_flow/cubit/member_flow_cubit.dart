import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/services/logging/app_log.dart';
import '../../../../domain/models/commitment_follow_up_status.dart';
import '../../../../domain/models/invalid_response_exception.dart';
import '../../../../domain/models/live_session.dart';
import '../../../../domain/models/member_flow.dart';
import '../../../../domain/models/member_step.dart';
import '../../../../domain/models/response_submissions.dart';
import '../../../../domain/models/response_validation.dart';
import '../../../../domain/models/session_draft.dart';
import '../../../../domain/use_cases/drafts/load_session_draft_use_case.dart';
import '../../../../domain/use_cases/drafts/save_session_draft_use_case.dart';
import '../../../../domain/use_cases/responses/submit_commitment_use_case.dart';
import '../../../../domain/use_cases/responses/submit_follow_up_use_case.dart';
import '../../../../domain/use_cases/responses/submit_reflection_use_case.dart';
import 'member_flow_state.dart';

/// Holds what the person is typing and saves each step through use cases.
/// The screen to show comes from the domain `MemberFlow` the page builds
/// from the session and this state.
@injectable
class MemberFlowCubit extends Cubit<MemberFlowState> {
  MemberFlowCubit(
    this._submitFollowUp,
    this._submitReflection,
    this._submitCommitment,
    this._loadDraft,
    this._saveDraft,
  ) : super(const MemberFlowState());

  /// Typing is persisted this long after the last keystroke.
  static const Duration draftSaveDelay = Duration(milliseconds: 600);

  final SubmitFollowUpUseCase _submitFollowUp;
  final SubmitReflectionUseCase _submitReflection;
  final SubmitCommitmentUseCase _submitCommitment;
  final LoadSessionDraftUseCase _loadDraft;
  final SaveSessionDraftUseCase _saveDraft;

  ({String sessionId, String personId})? _draftOwner;
  final Set<MemberStep> _sentSteps = {};
  Timer? _draftTimer;

  // ------------------------------------------------------ draft on device

  /// Brings back what the person typed and did not send before the app was
  /// closed. Only fills an untouched form, and starts keeping drafts.
  Future<void> restoreDraft({
    required String sessionId,
    required String personId,
  }) async {
    final owner = (sessionId: sessionId, personId: personId);
    if (_draftOwner == owner) return;
    _draftOwner = owner;
    _sentSteps.clear();
    try {
      final draft = await _loadDraft(sessionId: sessionId, personId: personId);
      if (isClosed || draft == null || _draftOwner != owner) return;
      if (_draftOf(state) != const SessionDraft()) return;
      emit(
        state.copyWith(
          followUpStatus: draft.followUpStatus,
          followUpNote: draft.followUpNote,
          followUpScore: draft.followUpScore,
          followUpJustification: draft.followUpJustification,
          answers: draft.answers,
          reflectionScore: draft.reflectionScore,
          reflectionJustification: draft.reflectionJustification,
          commitmentWhat: draft.commitmentWhat,
          commitmentWhen: draft.commitmentWhen,
          commitmentHow: draft.commitmentHow,
        ),
      );
    } on Object catch (error) {
      AppLog.warning('session', 'Restoring the draft failed', error);
    }
  }

  static SessionDraft _draftOf(MemberFlowState state) => SessionDraft(
    followUpStatus: state.followUpStatus,
    followUpNote: state.followUpNote,
    followUpScore: state.followUpScore,
    followUpJustification: state.followUpJustification,
    answers: state.answers,
    reflectionScore: state.reflectionScore,
    reflectionJustification: state.reflectionJustification,
    commitmentWhat: state.commitmentWhat,
    commitmentWhen: state.commitmentWhen,
    commitmentHow: state.commitmentHow,
  );

  /// The typed values that still wait to be sent: steps already saved are in
  /// the local database and must not come back as a draft.
  SessionDraft _pendingDraft() {
    final draft = _draftOf(state);
    return draft.copyWith(
      followUpStatus: _sentSteps.contains(MemberStep.followUp)
          ? null
          : draft.followUpStatus,
      followUpNote: _sentSteps.contains(MemberStep.followUp)
          ? ''
          : draft.followUpNote,
      followUpScore: _sentSteps.contains(MemberStep.followUp)
          ? null
          : draft.followUpScore,
      followUpJustification: _sentSteps.contains(MemberStep.followUp)
          ? ''
          : draft.followUpJustification,
      answers: _sentSteps.contains(MemberStep.reflection)
          ? const {}
          : draft.answers,
      reflectionScore: _sentSteps.contains(MemberStep.reflection)
          ? null
          : draft.reflectionScore,
      reflectionJustification: _sentSteps.contains(MemberStep.reflection)
          ? ''
          : draft.reflectionJustification,
      commitmentWhat: _sentSteps.contains(MemberStep.commitment)
          ? ''
          : draft.commitmentWhat,
      commitmentWhen: _sentSteps.contains(MemberStep.commitment)
          ? null
          : draft.commitmentWhen,
      commitmentHow: _sentSteps.contains(MemberStep.commitment)
          ? null
          : draft.commitmentHow,
    );
  }

  void _scheduleDraftSave() {
    if (_draftOwner == null) return;
    _draftTimer?.cancel();
    _draftTimer = Timer(draftSaveDelay, _writeDraft);
  }

  Future<void> _writeDraft() async {
    final owner = _draftOwner;
    if (owner == null) return;
    try {
      await _saveDraft(
        sessionId: owner.sessionId,
        personId: owner.personId,
        draft: _pendingDraft(),
      );
    } on Object catch (error) {
      AppLog.warning('session', 'Saving the draft failed', error);
    }
  }

  @override
  void onChange(Change<MemberFlowState> change) {
    super.onChange(change);
    if (_draftOf(change.currentState) != _draftOf(change.nextState)) {
      _scheduleDraftSave();
    }
  }

  @override
  Future<void> close() {
    if (_draftTimer?.isActive ?? false) {
      _draftTimer!.cancel();
      unawaited(_writeDraft());
    }
    return super.close();
  }

  // ---------------------------------------------------------- navigation

  void chooseStep(MemberStep? step) => emit(state.copyWith(chosenStep: step));

  void acknowledgeNoPrevious() =>
      emit(state.copyWith(noPreviousAcknowledged: true, chosenStep: null));

  void consumeSaved() => emit(state.copyWith(justSaved: null, failure: null));

  // --------------------------------------------------------------- drafts

  void setFollowUpStatus(CommitmentFollowUpStatus status) => emit(
    state.copyWith(
      followUpStatus: status,
      errors: _without(ResponseField.followUpStatus.name),
    ),
  );

  void setFollowUpNote(String note) => emit(state.copyWith(followUpNote: note));

  void setFollowUpScore(int score) => emit(
    state.copyWith(
      followUpScore: score,
      errors: _without(ResponseField.followUpScore.name),
    ),
  );

  void setFollowUpJustification(String text) =>
      emit(state.copyWith(followUpJustification: text));

  void setReflectionJustification(String text) =>
      emit(state.copyWith(reflectionJustification: text));

  void setAnswer(String questionId, String text) => emit(
    state.copyWith(
      answers: {...state.answers, questionId: text},
      errors: _without(ResponseValidator.answerField(questionId)),
    ),
  );

  void setReflectionScore(int score) => emit(
    state.copyWith(
      reflectionScore: score,
      errors: _without(ResponseField.reflectionScore.name),
    ),
  );

  void setCommitmentWhat(String text) => emit(
    state.copyWith(
      commitmentWhat: text,
      errors: _without(ResponseField.commitmentWhat.name),
    ),
  );

  void setCommitmentWhen(String when) => emit(
    state.copyWith(
      commitmentWhen: when,
      errors: _without(ResponseField.commitmentWhen.name),
    ),
  );

  void setCommitmentHow(String how) => emit(
    state.copyWith(
      commitmentHow: how,
      errors: _without(ResponseField.commitmentHow.name),
    ),
  );

  ResponseErrors _without(String key) => {...state.errors}..remove(key);

  // ----------------------------------------------------------- submitting

  Future<void> submitFollowUp(MemberFlow flow) async {
    final session = flow.session;
    final previous = session.previousCommitment;
    if (!_canSubmit(flow, MemberStep.followUp) || previous == null) return;
    final status = state.followUpStatus;
    final score = state.followUpScore;
    final errors = ResponseValidator.followUp(status: status, score: score);
    if (errors.isNotEmpty) return emit(state.copyWith(errors: errors));
    await _save(
      MemberStep.followUp,
      () => _submitFollowUp(
        FollowUpSubmission(
          sessionId: session.session.id,
          previousCommitmentId: previous.id,
          status: status!,
          score: score!,
          note: state.followUpNote,
          justification: state.followUpJustification,
        ),
      ),
    );
  }

  Future<void> submitReflection(MemberFlow flow) async {
    final session = flow.session;
    if (!_canSubmit(flow, MemberStep.reflection)) return;
    final ids = [for (final q in session.questions) q.id];
    final answers = {for (final id in ids) id: state.answers[id] ?? ''};
    final errors = ResponseValidator.reflection(
      answers: answers,
      questionIds: ids,
      score: state.reflectionScore,
    );
    if (errors.isNotEmpty) return emit(state.copyWith(errors: errors));
    await _save(
      MemberStep.reflection,
      () => _submitReflection(
        ReflectionSubmission(
          sessionId: session.session.id,
          answers: answers,
          score: state.reflectionScore!,
          justification: state.reflectionJustification,
        ),
      ),
    );
  }

  Future<void> submitCommitment(MemberFlow flow) async {
    if (!_canSubmit(flow, MemberStep.commitment)) return;
    final errors = ResponseValidator.commitment(
      what: state.commitmentWhat,
      when: state.commitmentWhen,
      how: state.commitmentHow,
    );
    if (errors.isNotEmpty) return emit(state.copyWith(errors: errors));
    await _save(
      MemberStep.commitment,
      () => _submitCommitment(
        CommitmentSubmission(
          sessionId: flow.session.session.id,
          what: state.commitmentWhat,
          when: state.commitmentWhen!,
          how: state.commitmentHow!,
        ),
      ),
    );
  }

  bool _canSubmit(MemberFlow flow, MemberStep step) =>
      state.submitting == null && flow.accessOf(step) == StepAccess.open;

  Future<void> _save(MemberStep step, Future<void> Function() save) async {
    emit(state.copyWith(submitting: step, failure: null));
    try {
      await save();
      _sentSteps.add(step);
      _scheduleDraftSave();
      emit(
        state.copyWith(
          submitting: null,
          justSaved: step,
          chosenStep: null,
          errors: const {},
        ),
      );
    } on InvalidResponseException catch (error) {
      emit(state.copyWith(submitting: null, errors: error.errors));
    } on Object catch (error, stackTrace) {
      AppLog.error('session', 'Saving $step failed', error, stackTrace);
      emit(state.copyWith(submitting: null, failure: error));
    }
  }

  /// Whether the typed commitment would be accepted, for enabling the send
  /// button without showing errors yet.
  static bool isCommitmentComplete(MemberFlowState state) =>
      ResponseValidator.commitment(
        what: state.commitmentWhat,
        when: state.commitmentWhen,
        how: state.commitmentHow,
      ).isEmpty;

  /// Helper for tests and widgets: the session the flow reads.
  static LiveSession sessionOf(MemberFlow flow) => flow.session;
}
