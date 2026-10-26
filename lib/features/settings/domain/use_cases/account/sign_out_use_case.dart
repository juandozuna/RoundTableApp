import 'package:injectable/injectable.dart';

import '../../../../../core/services/session_context/session_context_service.dart';
import '../../../../notifications/domain/use_cases/delivery/unregister_device_use_case.dart';
import '../../services/sign_out_service.dart';

/// Signs the user out: removes this device's push token while the session is
/// still valid (ADR 0009), forgets the active context, then ends the session.
/// Unsent session data stays on the device and uploads on the next sign-in of
/// the same user (ADR 0004).
@injectable
class SignOutUseCase {
  const SignOutUseCase(this._unregisterDevice, this._context, this._signOut);

  final UnregisterDeviceUseCase _unregisterDevice;
  final SessionContextService _context;
  final SignOutService _signOut;

  Future<void> call() async {
    await _unregisterDevice();
    await _context.clear();
    await _signOut.signOut();
  }
}
