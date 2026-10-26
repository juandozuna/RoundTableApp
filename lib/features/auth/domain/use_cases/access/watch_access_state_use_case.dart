import 'package:injectable/injectable.dart';

import '../../models/access_state.dart';
import '../../services/access_session_service.dart';

@injectable
class WatchAccessStateUseCase {
  const WatchAccessStateUseCase(this._access);

  final AccessSessionService _access;

  AccessState get current => _access.state;

  Stream<AccessState> call() => _access.watch();
}
