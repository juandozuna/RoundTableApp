import '../../../core/network/api_error_messages.dart';
import '../../../core/network/api_exception.dart';
import '../../../l10n/gen/app_localizations.dart';

/// Plain-language copy for the typed errors of the administration API
/// (api-contract §2). Unknown codes fall back to the server's Spanish
/// message, then to the generic failure text.
extension AdminApiErrorMessages on ApiException {
  String adminMessage(AppLocalizations l10n) => switch (code) {
    'table_full' => l10n.adminErrorTableFull,
    'duplicate_table_code' => l10n.adminErrorDuplicateTableCode,
    'duplicate_organization' => l10n.adminErrorDuplicateOrganization,
    'duplicate_location' => l10n.adminErrorDuplicateLocation,
    'facilitator_required' => l10n.adminErrorFacilitatorRequired,
    'table_has_facilitator' => l10n.adminErrorTableHasFacilitator,
    'cannot_move_facilitator' => l10n.adminErrorCannotMoveFacilitator,
    'cannot_remove_facilitator' => l10n.adminErrorCannotRemoveFacilitator,
    'already_member' => l10n.adminErrorAlreadyMember,
    'person_already_linked' => l10n.adminErrorPersonAlreadyLinked,
    'invite_pending_exists' => l10n.adminErrorInvitePendingExists,
    'organization_inactive' => l10n.adminErrorOrganizationInactive,
    'last_platform_admin' => l10n.adminErrorLastPlatformAdmin,
    'table_not_active' => l10n.adminErrorTableNotActive,
    'forbidden' => l10n.adminErrorForbidden,
    _ =>
      (message != null && message!.isNotEmpty && code != null)
          ? message!
          : userMessage(l10n),
  };

  /// Field a typed error belongs to, so forms can mark it.
  String? get adminFieldName => switch (code) {
    'duplicate_table_code' => 'code',
    'duplicate_organization' => 'name',
    'duplicate_location' => 'name',
    _ => null,
  };
}
