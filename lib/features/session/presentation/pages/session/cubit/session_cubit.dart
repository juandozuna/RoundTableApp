import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/models/session_stage.dart';
import '../../../../../../core/models/session_status.dart';
import '../../../../../../core/services/connectivity/watch_connectivity_use_case.dart';
import '../../../../../../core/services/logging/app_log.dart';
import '../../../../../../core/sync/domain/sync_snapshot.dart';
import '../../../../../../core/sync/domain/watch_sync_status_use_case.dart';
import '../../../../domain/models/facilitator_stage.dart';
import '../../../../domain/models/live_session.dart';
import '../../../../domain/models/member_step.dart';
import '../../../../domain/services/session_control_service.dart';
import '../../../../domain/use_cases/control/close_answers_use_case.dart';
import '../../../../domain/use_cases/control/close_session_use_case.dart';
import '../../../../domain/use_cases/control/open_session_use_case.dart';
import '../../../../domain/use_cases/control/set_session_stage_use_case.dart';
import '../../../../domain/use_cases/live/watch_live_session_use_case.dart';
import '../../../../domain/use_cases/sync/request_sync_use_case.dart';
import 'session_state.dart';

/// Streams today's session with the connection state and runs the
/// facilitator's session controls. Both roles read it; only the facilitator
/// calls the control methods.
@injectable
class SessionCubit extends Cubit<SessionState> {
  SessionCubit(
    this._watchSession,
    this._watchConnectivity,
    this._watchSync,
    this._openSession,
    this._setStage,
    this._closeAnswers,
    this._closeSession,
    this._requestSync,
  ) : super(const SessionState.loading());

  final WatchLiveSessionUseCase _watchSession;
  final WatchConnectivityUseCase _watchConnectivity;
  final WatchSyncStatusUseCase _watchSync;
  final OpenSessionUseCase _openSession;
  final SetSessionStageUseCase _setStage;
  final CloseAnswersUseCase _closeAnswers;
  final CloseSessionUseCase _closeSession;
  final RequestSyncUseCase _requestSync;

  final List<StreamSubscription<Object?>> _subscriptions = [];

  String? _tableId;
  bool _loaded = false;
  LiveSession? _session;
  bool _online = true;
  SyncSnapshot _sync = SyncSnapshot.unavailable;
  ControlOverride? _override;
  bool _busy = false;
  SessionPrompt? _prompt;
  SessionProblem? _problem;
  SessionNotice? _notice;

  /// Starts watching. [tableId] null means the user's active table.
  void start({String? tableId}) {
    if (_subscriptions.isNotEmpty) return;
    _tableId = tableId;
    _subscriptions
      ..add(
        _watchSession(tableId: tableId).listen(
          _onSession,
          onError: (Object error, StackTrace stackTrace) {
            AppLog.error('session', 'Live session failed', error, stackTrace);
            emit(SessionState.failure(error));
          },
        ),
      )
      ..add(_watchConnectivity().listen(_onConnectivity))
      ..add(
        _watchSync().listen((snapshot) {
          _sync = snapshot;
          _publish();
        }),
      );
  }

  /// Starts over after a failure.
  Future<void> retry() async {
    for (final subscription in _subscriptions) {
      await subscription.cancel();
    }
    _subscriptions.clear();
    _loaded = false;
    emit(const SessionState.loading());
    start(tableId: _tableId);
  }

  void _onSession(LiveSession? session) {
    _loaded = true;
    _session = session;
    final override = _override;
    if (override != null &&
        (session == null || _satisfied(session, override))) {
      _override = null;
    }
    _publish();
  }

  void _onConnectivity(bool online) {
    final reconnected = !_online && online;
    _online = online;
    if (reconnected) {
      _notice = SessionNotice.reconnected;
      unawaited(_requestSync());
    }
    _publish();
  }

  // ----------------------------------------------------- facilitator controls

  /// Runs the dock action of the current stage, asking for confirmation when
  /// people have not answered yet. [force] skips the confirmation.
  Future<void> advance({bool force = false}) async {
    final view = _currentView;
    if (view == null || _busy) return;
    final session = view.session;
    if (!session.iAmFacilitator || session.session.isFinal) return;

    _problem = null;
    _prompt = null;
    switch (view.stage) {
      case FacilitatorStage.open:
        if (!session.isToday) return;
        await _run(
          () => _openSession(session.session.id),
          const ControlOverride(
            status: SessionStatus.open,
            stage: SessionStage.attendance,
          ),
        );
      case FacilitatorStage.attendance:
        // The facilitator's own mark is saved automatically on entering
        // the attendance stage.
        final unmarked = [
          for (final p in session.unmarkedParticipants)
            if (!p.isMe) p,
        ];
        if (unmarked.isNotEmpty) {
          _problem = SessionProblem.attendanceIncomplete([
            for (final p in unmarked) p.personId,
          ]);
          return _publish();
        }
        await _run(
          () => _setStage(session.session.id, SessionStage.followUp),
          const ControlOverride(stage: SessionStage.followUp),
        );
      case FacilitatorStage.followUp:
      case FacilitatorStage.value:
        final prompt = force ? null : _confirmationFor(view);
        if (prompt != null) {
          _prompt = prompt;
          return _publish();
        }
        if (view.stage == FacilitatorStage.followUp) {
          await _run(
            () => _setStage(session.session.id, SessionStage.value),
            const ControlOverride(stage: SessionStage.value),
          );
        } else {
          await _run(
            () => _closeAnswers(session.session.id),
            ControlOverride(answersClosedAt: DateTime.now().toUtc()),
          );
        }
      case FacilitatorStage.closing:
        if (!force) {
          _prompt = SessionPrompt.confirmClose(
            incomplete: _incompleteCount(session),
          );
          return _publish();
        }
        await _run(
          () => _closeSession(session.session.id),
          ControlOverride(
            status: SessionStatus.closed,
            stage: SessionStage.closed,
            endedAt: DateTime.now().toUtc(),
          ),
        );
    }
  }

  /// Answers "yes" to the pending [SessionPrompt].
  Future<void> confirmPrompt() => advance(force: true);

  void dismissPrompt() {
    if (_prompt == null) return;
    _prompt = null;
    _publish();
  }

  void dismissProblem() {
    if (_problem == null) return;
    _problem = null;
    _publish();
  }

  void consumeNotice() {
    if (_notice == null) return;
    _notice = null;
    _publish();
  }

  Future<void> syncNow() async {
    try {
      await _requestSync();
    } on Object catch (error) {
      AppLog.warning('session', 'Manual sync failed', error);
    }
  }

  Future<void> _run(
    Future<ControlDelivery> Function() control,
    ControlOverride expected,
  ) async {
    _busy = true;
    _publish();
    try {
      final delivery = await control();
      if (delivery == ControlDelivery.online) {
        _override = _merge(_override, expected);
      } else {
        _notice = SessionNotice.savedOnDevice;
      }
    } on Object catch (error) {
      AppLog.warning('session', 'Session control failed', error);
      _problem = SessionProblem.failed(error);
    } finally {
      _busy = false;
      _publish();
    }
  }

  SessionPrompt? _confirmationFor(SessionView view) {
    final session = view.session;
    final stage = view.stage;
    final pending = <String>{};
    for (final member in session.members) {
      final steps = stage == FacilitatorStage.followUp
          ? const [MemberStep.followUp]
          : const [MemberStep.reflection, MemberStep.commitment];
      if (steps.any(
        (s) =>
            session.appliesTo(member, s) &&
            !LiveSession.progressOf(member, s).isDone,
      )) {
        pending.add(member.firstName);
      }
    }
    final mine = stage == FacilitatorStage.value
        ? [
            for (final step in MemberStep.values)
              if (session.appliesTo(session.me, step) &&
                  !LiveSession.progressOf(session.me, step).isDone)
                step,
          ]
        : const <MemberStep>[];
    if ((view.isOnline && pending.isNotEmpty) || mine.isNotEmpty) {
      return SessionPrompt.confirmAdvance(
        next: stage.next!,
        pendingNames: pending.toList(),
        myMissingSteps: mine,
      );
    }
    return null;
  }

  static int _incompleteCount(LiveSession session) => session.participants
      .where(
        (p) => MemberStep.values.any(
          (s) =>
              session.appliesTo(p, s) && !LiveSession.progressOf(p, s).isDone,
        ),
      )
      .length;

  // ---------------------------------------------------------------- view

  static ControlOverride _merge(
    ControlOverride? previous,
    ControlOverride next,
  ) => ControlOverride(
    status: next.status ?? previous?.status,
    stage: next.stage ?? previous?.stage,
    answersClosedAt: next.answersClosedAt ?? previous?.answersClosedAt,
    endedAt: next.endedAt ?? previous?.endedAt,
  );

  /// The synced session already shows what the override promised.
  static bool _satisfied(LiveSession session, ControlOverride override) {
    final info = session.session;
    if (info.isFinal) return true;
    return (override.status == null || info.status == override.status) &&
        (override.stage == null || info.stage == override.stage) &&
        (override.answersClosedAt == null || info.answersClosed) &&
        (override.endedAt == null || info.endedAt != null);
  }

  LiveSession _withOverride(LiveSession session) {
    final override = _override;
    if (override == null) return session;
    final info = session.session;
    return session.copyWith(
      session: info.copyWith(
        status: override.status ?? info.status,
        stage: override.stage ?? info.stage,
        answersClosedAt: override.answersClosedAt ?? info.answersClosedAt,
        endedAt: override.endedAt ?? info.endedAt,
      ),
    );
  }

  SessionView? get _currentView {
    final session = _session;
    if (session == null) return null;
    return SessionView(
      session: _withOverride(session),
      isOnline: _online,
      sync: _sync,
      isBusy: _busy,
      prompt: _prompt,
      problem: _problem,
      notice: _notice,
    );
  }

  void _publish() {
    if (isClosed || state is SessionFailure) return;
    if (!_loaded) return;
    final view = _currentView;
    emit(
      view == null
          ? const SessionState.unavailable()
          : SessionState.ready(view),
    );
  }

  @override
  Future<void> close() async {
    for (final subscription in _subscriptions) {
      await subscription.cancel();
    }
    return super.close();
  }
}
