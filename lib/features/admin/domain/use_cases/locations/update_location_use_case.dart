import 'package:injectable/injectable.dart';

import '../../models/admin_location.dart';
import '../../models/location_input.dart';
import '../../services/admin_management_service.dart';

@injectable
class UpdateLocationUseCase {
  const UpdateLocationUseCase(this._admin);

  final AdminManagementService _admin;

  Future<AdminLocation> call(String id, LocationInput input) =>
      _admin.updateLocation(id, input);
}
