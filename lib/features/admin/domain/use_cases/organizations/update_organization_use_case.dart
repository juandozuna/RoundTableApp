import 'package:injectable/injectable.dart';

import '../../models/admin_organization.dart';
import '../../models/organization_input.dart';
import '../../services/admin_management_service.dart';

@injectable
class UpdateOrganizationUseCase {
  const UpdateOrganizationUseCase(this._admin);

  final AdminManagementService _admin;

  Future<AdminOrganization> call(String id, OrganizationInput input) =>
      _admin.updateOrganization(id, input);
}
