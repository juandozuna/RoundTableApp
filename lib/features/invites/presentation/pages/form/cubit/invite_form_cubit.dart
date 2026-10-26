import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/services/connectivity/watch_connectivity_use_case.dart';
import '../../../../../../core/services/session_context/session_context.dart';
import '../../../../../../core/services/session_context/watch_session_context_use_case.dart';
import '../../../../domain/models/invite_defaults.dart';
import '../../../../domain/models/invite_permissions.dart';
import '../../../../domain/models/invite_problem.dart';
import '../../../../domain/models/invite_role_kind.dart';
import '../../../../domain/models/invite_target_table.dart';
import '../../../../domain/models/new_invite.dart';
import '../../../../domain/models/person_draft.dart';
import '../../../../domain/use_cases/manage/create_invite_use_case.dart';
import '../../../../domain/use_cases/manage/load_invite_targets_use_case.dart';
import '../../../../domain/use_cases/manage/load_organization_tables_use_case.dart';
import 'invite_form_state.dart';

@injectable
class InviteFormCubit extends Cubit<InviteFormState> {
  InviteFormCubit(
    this._loadTargets,
    this._loadTables,
    this._create,
    this._watchContext,
    this._watchConnectivity,
  ) : super(const InviteFormState()) {
    _subscriptions
      ..add(_watchContext().listen(_onContext))
      ..add(
        _watchConnectivity().listen(
          (online) => emit(state.copyWith(online: online)),
        ),
      );
  }

  final LoadInviteTargetsUseCase _loadTargets;
  final LoadOrganizationTablesUseCase _loadTables;
  final CreateInviteUseCase _create;
  final WatchSessionContextUseCase _watchContext;
  final WatchConnectivityUseCase _watchConnectivity;
  final List<StreamSubscription<Object?>> _subscriptions = [];
  SessionContext? _context;

  void _onContext(SessionContext? context) {
    if (context == _context) return;
    _context = context;
    if (context != null) unawaited(load());
  }

  Future<void> load() async {
    final context = _context;
    if (context == null) return;
    final roles = InvitePermissions.grantableBy(context.role);
    if (roles.isEmpty) {
      emit(
        state.copyWith(
          status: InviteFormStatus.denied,
          inviterRole: context.role,
        ),
      );
      return;
    }
    emit(
      InviteFormState(
        inviterRole: context.role,
        roles: roles,
        role: roles.first,
        online: state.online,
      ),
    );
    try {
      final targets = await _loadTargets(context);
      if (isClosed) return;
      final tables = targets.tables;
      emit(
        state.copyWith(
          status: InviteFormStatus.ready,
          organizations: targets.organizations,
          organizationId: targets.organizationId,
          tables: tables,
          tableId: _firstAvailable(tables)?.id,
        ),
      );
    } on InviteFailure catch (failure) {
      if (isClosed) return;
      emit(
        state.copyWith(
          status: failure.problem == InviteProblem.forbidden
              ? InviteFormStatus.denied
              : InviteFormStatus.failed,
          problem: failure.problem,
        ),
      );
    }
  }

  void selectRole(InviteRoleKind role) {
    if (!state.roles.contains(role)) return;
    emit(state.copyWith(role: role, problem: null));
  }

  Future<void> selectOrganization(String organizationId) async {
    if (organizationId == state.organizationId) return;
    emit(
      state.copyWith(
        organizationId: organizationId,
        tables: const [],
        tableId: null,
        loadingTables: true,
        problem: null,
      ),
    );
    try {
      final tables = await _loadTables(organizationId);
      if (isClosed || state.organizationId != organizationId) return;
      emit(
        state.copyWith(
          tables: tables,
          tableId: _firstAvailable(tables)?.id,
          loadingTables: false,
        ),
      );
    } on InviteFailure catch (failure) {
      if (isClosed) return;
      emit(state.copyWith(loadingTables: false, problem: failure.problem));
    }
  }

  void selectTable(String? tableId) =>
      emit(state.copyWith(tableId: tableId, problem: null));

  Future<void> submit(PersonDraft person) async {
    if (!state.canSubmit) return;
    emit(state.copyWith(submitting: true, problem: null));
    final input = NewInvite(
      roleKind: state.role,
      organizationId: state.needsTable ? null : state.organizationId,
      roundTableId: state.needsTable ? state.tableId : null,
      person: person,
      expiresInDays: InviteDefaults.expiresInDays,
    );
    try {
      final invite = await _create(input);
      if (isClosed) return;
      emit(state.copyWith(submitting: false, created: invite));
    } on InviteFailure catch (failure) {
      if (isClosed) return;
      emit(state.copyWith(submitting: false, problem: failure.problem));
    }
  }

  /// The page consumed [InviteFormState.created].
  void consumeCreated() => emit(state.copyWith(created: null));

  InviteTargetTable? _firstAvailable(List<InviteTargetTable> tables) {
    for (final table in tables) {
      if (table.acceptsInvites && !table.isFull) return table;
    }
    return tables.firstOrNull;
  }

  @override
  Future<void> close() async {
    for (final subscription in _subscriptions) {
      await subscription.cancel();
    }
    return super.close();
  }
}
