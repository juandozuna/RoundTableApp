import 'package:injectable/injectable.dart';

import '../../../../../core/models/session_stage.dart';
import '../../services/session_control_service.dart';

@injectable
class SetSessionStageUseCase {
  const SetSessionStageUseCase(this._control);

  final SessionControlService _control;

  Future<ControlDelivery> call(String sessionId, SessionStage stage) =>
      _control.setStage(sessionId, stage);
}
