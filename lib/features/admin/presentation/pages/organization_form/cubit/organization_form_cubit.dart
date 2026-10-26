import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/network/api_exception.dart';
import '../../../../domain/models/invite_request.dart';
import '../../../../domain/models/organization_input.dart';
import '../../../../domain/models/person_input.dart';
import '../../../../domain/use_cases/directory/load_organization_use_case.dart';
import '../../../../domain/use_cases/invites/invite_person_use_case.dart';
import '../../../../domain/use_cases/organizations/create_organization_use_case.dart';
import '../../../../domain/use_cases/organizations/update_organization_use_case.dart';
import 'organization_form_state.dart';

@injectable
class OrganizationFormCubit extends Cubit<OrganizationFormState> {
  OrganizationFormCubit(this._load, this._create, this._update, this._invite)
    : super(const OrganizationFormState());

  final LoadOrganizationUseCase _load;
  final CreateOrganizationUseCase _create;
  final UpdateOrganizationUseCase _update;
  final InvitePersonUseCase _invite;

  /// Prepares the form: loads the organization when [organizationId] is set.
  Future<void> init({String? organizationId}) async {
    if (organizationId == null) return;
    emit(state.copyWith(status: OrganizationFormStatus.loading, error: null));
    try {
      final organization = await _load(organizationId);
      emit(
        state.copyWith(
          status: OrganizationFormStatus.editing,
          organization: organization,
        ),
      );
    } on ApiException catch (error) {
      emit(
        state.copyWith(status: OrganizationFormStatus.failure, error: error),
      );
    }
  }

  /// Creates or updates. When creating, [inviteContact] also invites the
  /// contact as the organization's first coordinator.
  Future<void> submit(
    OrganizationInput input, {
    bool inviteContact = false,
  }) async {
    emit(
      state.copyWith(
        status: OrganizationFormStatus.submitting,
        error: null,
        inviteError: null,
      ),
    );
    try {
      final existing = state.organization;
      if (existing != null) {
        final saved = await _update(existing.id, input);
        emit(
          state.copyWith(
            status: OrganizationFormStatus.saved,
            savedId: saved.id,
          ),
        );
        return;
      }
      final created = await _create(input);
      emit(state.copyWith(savedId: created.id));
      if (inviteContact) {
        await _inviteCoordinator(created.id, input);
      }
      emit(state.copyWith(status: OrganizationFormStatus.saved));
    } on ApiException catch (error) {
      emit(
        state.copyWith(status: OrganizationFormStatus.editing, error: error),
      );
    }
  }

  Future<void> _inviteCoordinator(
    String organizationId,
    OrganizationInput input,
  ) async {
    final words = (input.contactName ?? '').trim().split(RegExp(r'\s+'));
    final person = PersonInput(
      firstName: words.first,
      lastName: words.length > 1 ? words.skip(1).join(' ') : words.first,
      email: input.contactEmail,
      phone: input.contactPhone,
    );
    try {
      final invite = await _invite(
        InviteRequest(
          roleKind: InviteRoleKind.coordinator,
          organizationId: organizationId,
          person: PersonRef.registered(person),
        ),
      );
      emit(state.copyWith(invite: invite));
    } on ApiException catch (error) {
      emit(state.copyWith(inviteError: error));
    }
  }
}
