import 'package:injectable/injectable.dart';

import '../../services/session_control_service.dart';

@injectable
class OpenSessionUseCase {
  const OpenSessionUseCase(this._control);

  final SessionControlService _control;

  Future<ControlDelivery> call(String sessionId) => _control.open(sessionId);
}
