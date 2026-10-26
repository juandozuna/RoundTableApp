import 'package:injectable/injectable.dart';

import '../../models/admin_organization.dart';
import '../../models/organization_status.dart';
import '../../services/admin_management_service.dart';

/// Pauses, reactivates or deactivates an organization. History is kept.
@injectable
class SetOrganizationStatusUseCase {
  const SetOrganizationStatusUseCase(this._admin);

  final AdminManagementService _admin;

  Future<AdminOrganization> call(String id, OrganizationStatus status) =>
      _admin.setOrganizationStatus(id, status);
}
