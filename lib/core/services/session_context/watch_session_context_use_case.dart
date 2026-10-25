import 'package:injectable/injectable.dart';

import 'session_context.dart';
import 'session_context_service.dart';

@injectable
class WatchSessionContextUseCase {
  const WatchSessionContextUseCase(this._service);

  final SessionContextService _service;

  Stream<SessionContext?> call() => _service.watch();
}
