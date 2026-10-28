import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../../../core/services/session_context/session_context.dart';
import '../../../../../core/services/session_context/watch_session_context_use_case.dart';
import '../../models/upcoming_sessions.dart';
import '../../services/upcoming_sessions_service.dart';

/// Follows the active context and emits its upcoming sessions. A context
/// switch cancels the previous list.
@injectable
class WatchUpcomingSessionsUseCase {
  const WatchUpcomingSessionsUseCase(this._watchContext, this._service);

  final WatchSessionContextUseCase _watchContext;
  final UpcomingSessionsService _service;

  Stream<UpcomingSessions> call() {
    StreamSubscription<SessionContext?>? contextSubscription;
    StreamSubscription<UpcomingSessions>? listSubscription;
    late final StreamController<UpcomingSessions> controller;

    Future<void> onContext(SessionContext? context) async {
      await listSubscription?.cancel();
      if (context == null) {
        controller.add(
          const UpcomingSessions(scope: UpcomingScope.unavailable),
        );
        return;
      }
      listSubscription = _service
          .watch(context)
          .listen(controller.add, onError: controller.addError);
    }

    controller = StreamController<UpcomingSessions>(
      onListen: () {
        contextSubscription = _watchContext().listen(
          onContext,
          onError: controller.addError,
        );
      },
      onCancel: () async {
        await contextSubscription?.cancel();
        await listSubscription?.cancel();
      },
    );
    return controller.stream;
  }
}
