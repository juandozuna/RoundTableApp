import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../../../core/services/session_context/session_context.dart';
import '../../../../../core/services/session_context/watch_session_context_use_case.dart';
import '../../models/home_overview.dart';
import '../../services/home_service.dart';

/// Follows the active context and emits the home overview of whichever
/// context is current. A context switch cancels the previous overview.
@injectable
class WatchHomeOverviewUseCase {
  const WatchHomeOverviewUseCase(this._watchContext, this._service);

  final WatchSessionContextUseCase _watchContext;
  final HomeService _service;

  Stream<HomeOverview> call() {
    StreamSubscription<SessionContext?>? contextSubscription;
    StreamSubscription<HomeOverview>? overviewSubscription;
    late final StreamController<HomeOverview> controller;

    Future<void> onContext(SessionContext? context) async {
      await overviewSubscription?.cancel();
      if (context == null) {
        controller.add(const HomeOverview.noContext());
        return;
      }
      overviewSubscription = _service
          .watchOverview(context)
          .listen(controller.add, onError: controller.addError);
    }

    controller = StreamController<HomeOverview>(
      onListen: () {
        contextSubscription = _watchContext().listen(
          onContext,
          onError: controller.addError,
        );
      },
      onCancel: () async {
        await contextSubscription?.cancel();
        await overviewSubscription?.cancel();
      },
    );
    return controller.stream;
  }
}
