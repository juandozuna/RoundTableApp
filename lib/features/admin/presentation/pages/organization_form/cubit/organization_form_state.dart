import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/network/api_exception.dart';
import '../../../../domain/models/admin_organization.dart';
import '../../../../domain/models/invite_share.dart';

part 'organization_form_state.freezed.dart';

enum OrganizationFormStatus { loading, editing, submitting, saved, failure }

@freezed
abstract class OrganizationFormState with _$OrganizationFormState {
  const factory OrganizationFormState({
    @Default(OrganizationFormStatus.editing) OrganizationFormStatus status,

    /// The organization being edited; null when creating.
    AdminOrganization? organization,

    /// Load failure (edit) or submit failure.
    ApiException? error,

    /// Id of the saved organization.
    String? savedId,

    /// Coordinator invite created together with the organization.
    InviteShare? invite,

    /// The organization was created but its coordinator invite failed.
    ApiException? inviteError,
  }) = _OrganizationFormState;
}
