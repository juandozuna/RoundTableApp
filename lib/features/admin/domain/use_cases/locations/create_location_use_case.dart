import 'package:injectable/injectable.dart';

import '../../models/admin_location.dart';
import '../../models/location_input.dart';
import '../../services/admin_management_service.dart';

@injectable
class CreateLocationUseCase {
  const CreateLocationUseCase(this._admin);

  final AdminManagementService _admin;

  Future<AdminLocation> call(String organizationId, LocationInput input) =>
      _admin.createLocation(organizationId, input);
}
