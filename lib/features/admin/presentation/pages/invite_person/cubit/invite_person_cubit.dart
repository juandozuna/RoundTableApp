import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/network/api_exception.dart';
import '../../../../domain/models/admin_table.dart';
import '../../../../domain/models/invite_request.dart';
import '../../../../domain/models/invite_share.dart';
import '../../../../domain/models/person_input.dart';
import '../../../../domain/use_cases/directory/load_organizations_use_case.dart';
import '../../../../domain/use_cases/directory/load_tables_use_case.dart';
import '../../../../domain/use_cases/invites/invite_person_use_case.dart';
import '../../../../domain/use_cases/invites/share_invite_use_case.dart';
import 'invite_person_state.dart';

@injectable
class InvitePersonCubit extends Cubit<InvitePersonState> {
  InvitePersonCubit(
    this._organizations,
    this._tables,
    this._invite,
    this._share,
  ) : super(const InvitePersonState());

  final LoadOrganizationsUseCase _organizations;
  final LoadTablesUseCase _tables;
  final InvitePersonUseCase _invite;
  final ShareInviteUseCase _share;

  /// Prepares the form. When [existing] is given (an invite just created by
  /// another screen) the share view opens directly.
  Future<void> init({
    required InviteRoleKind role,
    String? organizationId,
    String? tableId,
    InviteShare? existing,
  }) async {
    if (existing != null) {
      emit(
        state.copyWith(
          status: InvitePersonStatus.shared,
          role: role,
          invite: existing,
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        status: InvitePersonStatus.loading,
        role: role,
        organizationId: organizationId,
        tableId: tableId,
        error: null,
      ),
    );
    try {
      final organizations = await _organizations();
      var orgId = organizationId;
      if (orgId == null && organizations.length == 1) {
        orgId = organizations.first.id;
      }
      final tables = orgId == null
          ? const <AdminTable>[]
          : await _tables(organizationId: orgId);
      emit(
        state.copyWith(
          status: InvitePersonStatus.editing,
          organizations: organizations,
          organizationId: orgId,
          tables: tables,
        ),
      );
    } on ApiException catch (error) {
      emit(state.copyWith(status: InvitePersonStatus.failure, error: error));
    }
  }

  Future<void> selectOrganization(String organizationId) async {
    emit(
      state.copyWith(
        organizationId: organizationId,
        tableId: null,
        tables: const [],
      ),
    );
    try {
      emit(
        state.copyWith(tables: await _tables(organizationId: organizationId)),
      );
    } on ApiException catch (error) {
      emit(state.copyWith(error: error));
    }
  }

  void selectRole(InviteRoleKind role) =>
      emit(state.copyWith(role: role, tableId: null, error: null));

  void selectTable(String? tableId) => emit(state.copyWith(tableId: tableId));

  Future<void> submit(PersonInput person) async {
    emit(state.copyWith(status: InvitePersonStatus.submitting, error: null));
    try {
      final invite = await _invite(
        InviteRequest(
          roleKind: state.role,
          organizationId: state.role == InviteRoleKind.coordinator
              ? state.organizationId
              : null,
          roundTableId: state.role == InviteRoleKind.coordinator
              ? null
              : state.tableId,
          person: PersonRef.registered(person),
        ),
      );
      emit(state.copyWith(status: InvitePersonStatus.shared, invite: invite));
    } on ApiException catch (error) {
      emit(state.copyWith(status: InvitePersonStatus.editing, error: error));
    }
  }

  /// Back to an empty form to invite another person.
  void inviteAnother() => emit(
    state.copyWith(
      status: InvitePersonStatus.editing,
      invite: null,
      error: null,
    ),
  );

  Future<void> share(String message, {String? subject}) =>
      _share(message, subject: subject);
}
