import 'package:injectable/injectable.dart';

import '../../models/admin_organization.dart';
import '../../models/organization_input.dart';
import '../../services/admin_management_service.dart';

@injectable
class CreateOrganizationUseCase {
  const CreateOrganizationUseCase(this._admin);

  final AdminManagementService _admin;

  Future<AdminOrganization> call(OrganizationInput input) =>
      _admin.createOrganization(input);
}
