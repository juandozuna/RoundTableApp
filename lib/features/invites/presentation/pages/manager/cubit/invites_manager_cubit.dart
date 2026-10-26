import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/services/connectivity/watch_connectivity_use_case.dart';
import '../../../../../../core/services/session_context/session_context.dart';
import '../../../../../../core/services/session_context/watch_session_context_use_case.dart';
import '../../../../domain/models/invite.dart';
import '../../../../domain/models/invite_problem.dart';
import '../../../../domain/models/invite_status.dart';
import '../../../../domain/use_cases/manage/list_invites_use_case.dart';
import '../../../../domain/use_cases/manage/renew_invite_use_case.dart';
import '../../../../domain/use_cases/manage/revoke_invite_use_case.dart';
import 'invites_manager_state.dart';

@injectable
class InvitesManagerCubit extends Cubit<InvitesManagerState> {
  InvitesManagerCubit(
    this._list,
    this._revoke,
    this._renew,
    this._watchContext,
    this._watchConnectivity,
  ) : super(const InvitesManagerState()) {
    _subscriptions
      ..add(_watchContext().listen(_onContext))
      ..add(_watchConnectivity().listen(_onConnectivity));
  }

  final ListInvitesUseCase _list;
  final RevokeInviteUseCase _revoke;
  final RenewInviteUseCase _renew;
  final WatchSessionContextUseCase _watchContext;
  final WatchConnectivityUseCase _watchConnectivity;
  final List<StreamSubscription<Object?>> _subscriptions = [];
  SessionContext? _context;
  int _serial = 0;

  void _onContext(SessionContext? context) {
    if (context == _context) return;
    _context = context;
    if (context != null) unawaited(load());
  }

  void _onConnectivity(bool online) {
    final cameBack = online && !state.online;
    emit(state.copyWith(online: online));
    if (cameBack && state.status == InvitesManagerStatus.failed) {
      unawaited(load());
    }
  }

  Future<void> load() async {
    final context = _context;
    if (context == null) return;
    emit(
      state.copyWith(
        status: InvitesManagerStatus.loading,
        problem: null,
        selectedIds: const {},
      ),
    );
    try {
      final invites = await _list(context);
      if (isClosed) return;
      emit(
        state.copyWith(status: InvitesManagerStatus.ready, invites: invites),
      );
    } on InviteFailure catch (failure) {
      if (isClosed) return;
      emit(
        state.copyWith(
          status: failure.problem == InviteProblem.forbidden
              ? InvitesManagerStatus.denied
              : InvitesManagerStatus.failed,
          problem: failure.problem,
        ),
      );
    }
  }

  void setFilter(InviteStatus? filter) =>
      emit(state.copyWith(filter: filter, selectedIds: const {}));

  void setQuery(String query) => emit(state.copyWith(query: query));

  void toggleSelected(String inviteId) {
    final next = {...state.selectedIds};
    if (!next.remove(inviteId)) next.add(inviteId);
    emit(state.copyWith(selectedIds: next));
  }

  void toggleAllVisible() {
    final ids = {for (final invite in state.visible) invite.id};
    emit(
      state.copyWith(selectedIds: state.allVisibleSelected ? const {} : ids),
    );
  }

  void clearSelection() => emit(state.copyWith(selectedIds: const {}));

  /// Revokes [inviteIds]; frees their seats server-side.
  Future<void> revoke(Iterable<String> inviteIds) async {
    final ids = inviteIds.toList();
    var done = 0;
    InviteProblem? failure;
    emit(state.copyWith(busy: true));
    for (final id in ids) {
      try {
        _replace(await _revoke(id));
        done++;
      } on InviteFailure catch (error) {
        failure = error.problem;
      }
    }
    _finish(InvitesManagerEventKind.revoked, done, failure);
  }

  /// Renews [inviteIds] (new code, new expiry). Returns the renewed invite
  /// when exactly one was asked for, so the page can open its share screen.
  Future<Invite?> renew(Iterable<String> inviteIds) async {
    final ids = inviteIds.toList();
    var done = 0;
    Invite? last;
    InviteProblem? failure;
    emit(state.copyWith(busy: true));
    for (final id in ids) {
      try {
        last = await _renew(id);
        _replace(last);
        done++;
      } on InviteFailure catch (error) {
        failure = error.problem;
      }
    }
    _finish(InvitesManagerEventKind.renewed, done, failure);
    return ids.length == 1 ? last : null;
  }

  void _replace(Invite updated) => emit(
    state.copyWith(
      invites: [
        for (final invite in state.invites)
          invite.id == updated.id ? updated : invite,
      ],
    ),
  );

  void _finish(InvitesManagerEventKind kind, int done, InviteProblem? failure) {
    if (isClosed) return;
    emit(
      state.copyWith(
        busy: false,
        selectedIds: const {},
        event: InvitesManagerEvent(
          kind: done == 0 && failure != null
              ? InvitesManagerEventKind.failed
              : kind,
          serial: ++_serial,
          count: done,
          problem: failure,
        ),
      ),
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
