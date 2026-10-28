import 'package:injectable/injectable.dart';

import '../../services/admin_management_service.dart';

/// Moves one scheduled session to [localDateTime], a wall-clock time in the
/// table's own timezone.
@injectable
class RescheduleSessionUseCase {
  const RescheduleSessionUseCase(this._admin);

  final AdminManagementService _admin;

  Future<void> call({
    required String sessionId,
    required DateTime localDateTime,
    String? reason,
  }) => _admin.rescheduleSession(
    sessionId: sessionId,
    localDateTime: localDateTime,
    reason: reason,
  );
}
