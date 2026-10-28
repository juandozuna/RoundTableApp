import 'package:injectable/injectable.dart';

import '../../models/session_cancel_reason.dart';
import '../../services/admin_management_service.dart';

/// Cancels one scheduled session. The program value does not advance: the
/// table's next session carries the same value.
@injectable
class CancelSessionUseCase {
  const CancelSessionUseCase(this._admin);

  final AdminManagementService _admin;

  Future<void> call({
    required String sessionId,
    required SessionCancelReason reason,
    String? note,
  }) => _admin.cancelSession(sessionId: sessionId, reason: reason, note: note);
}
