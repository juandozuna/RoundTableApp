import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/models/user_role.dart';
import '../../../../domain/models/invite.dart';
import '../../../../domain/models/invite_problem.dart';
import '../../../../domain/models/invite_role_kind.dart';
import '../../../../domain/models/invite_target_organization.dart';
import '../../../../domain/models/invite_target_table.dart';

part 'invite_form_state.freezed.dart';

enum InviteFormStatus { loading, ready, denied, failed }

@freezed
abstract class InviteFormState with _$InviteFormState {
  const factory InviteFormState({
    @Default(InviteFormStatus.loading) InviteFormStatus status,

    /// Role the inviter acts as; decides what the form lets them pick.
    UserRole? inviterRole,
    @Default([]) List<InviteRoleKind> roles,
    @Default(InviteRoleKind.member) InviteRoleKind role,
    @Default([]) List<InviteTargetOrganization> organizations,
    @Default([]) List<InviteTargetTable> tables,
    String? organizationId,
    String? tableId,
    @Default(false) bool loadingTables,
    @Default(false) bool submitting,
    InviteProblem? problem,
    @Default(true) bool online,

    /// Set when the invite was created; the page opens the share screen.
    Invite? created,
  }) = _InviteFormState;

  const InviteFormState._();

  InviteTargetTable? get selectedTable {
    for (final table in tables) {
      if (table.id == tableId) return table;
    }
    return null;
  }

  bool get needsTable => role.needsTable;

  bool get tableIsFull => needsTable && (selectedTable?.isFull ?? false);

  /// A facilitator invite to a table that already has one.
  bool get facilitatorTaken =>
      role == InviteRoleKind.facilitator &&
      (selectedTable?.hasFacilitator ?? false);

  bool get canSubmit =>
      status == InviteFormStatus.ready &&
      online &&
      !submitting &&
      !loadingTables &&
      !tableIsFull &&
      !facilitatorTaken &&
      (!needsTable || tableId != null) &&
      (needsTable || organizationId != null);
}
