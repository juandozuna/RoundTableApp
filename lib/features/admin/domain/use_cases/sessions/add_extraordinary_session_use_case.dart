import 'package:injectable/injectable.dart';

import '../../services/admin_management_service.dart';

/// Adds an extra meeting before the table's next regular session.
/// [localDateTime] is a wall-clock time in the table's own timezone.
@injectable
class AddExtraordinarySessionUseCase {
  const AddExtraordinarySessionUseCase(this._admin);

  final AdminManagementService _admin;

  Future<void> call({
    required String tableId,
    required DateTime localDateTime,
    String? reason,
  }) => _admin.addExtraordinarySession(
    tableId: tableId,
    localDateTime: localDateTime,
    reason: reason,
  );
}
