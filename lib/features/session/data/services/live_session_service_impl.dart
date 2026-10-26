import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../../core/services/clock/clock_service.dart';
import '../../../../core/sync/domain/sync_status_service.dart';
import '../../domain/models/live_session.dart';
import '../../domain/services/live_session_service.dart';
import '../datasources/session_local_data_source.dart';
import '../local/live_session_assembler.dart';

@LazySingleton(as: LiveSessionService)
class LiveSessionServiceImpl implements LiveSessionService {
  LiveSessionServiceImpl(
    this._local,
    this._status,
    this._clock,
  );

  /// "Today" depends on the clock, so re-evaluate even without data changes.
  static const Duration clockCheckInterval = Duration(minutes: 1);

  final SessionLocalDataSource _local;
  final SyncStatusService _status;
  final ClockService _clock;

  @override
  Stream<LiveSession?> watch({String? tableId}) {
    late final StreamController<LiveSession?> controller;
    StreamSubscription<void>? changes;
    StreamSubscription<Object?>? status;
    Timer? ticker;
    var uploading = false;
    var running = false;
    var rerun = false;
    var emitted = false;
    LiveSession? last;

    Future<void> refresh() async {
      if (running) {
        rerun = true;
        return;
      }
      running = true;
      try {
        do {
          rerun = false;
          final now = _clock.nowUtc();
          final data = await _local.load(now: now, tableId: tableId);
          final next = data == null
              ? null
              : LiveSessionAssembler.assemble(
                  data,
                  uploading: uploading,
                  now: now,
                );
          if (controller.isClosed) return;
          if (!emitted || next != last) {
            emitted = true;
            last = next;
            controller.add(next);
          }
        } while (rerun);
      } on Object catch (error, stackTrace) {
        if (!controller.isClosed) controller.addError(error, stackTrace);
      } finally {
        running = false;
      }
    }

    controller = StreamController<LiveSession?>(
      onListen: () {
        changes = _local.watchChanges().listen((_) => unawaited(refresh()));
        status = _status.watch().listen((snapshot) {
          if (snapshot.uploading == uploading) return;
          uploading = snapshot.uploading;
          unawaited(refresh());
        });
        ticker = Timer.periodic(
          clockCheckInterval,
          (_) => unawaited(refresh()),
        );
        unawaited(refresh());
      },
      onCancel: () async {
        ticker?.cancel();
        await changes?.cancel();
        await status?.cancel();
      },
    );
    return controller.stream;
  }
}
