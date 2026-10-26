import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/sync_state.dart';

part 'step_progress.freezed.dart';

/// Whether one person has captured one step, and how far that capture got.
@freezed
abstract class StepProgress with _$StepProgress {
  const factory StepProgress({
    @Default(false) bool isDone,

    /// Row sync state; null until [isDone].
    SyncState? syncState,
  }) = _StepProgress;

  const StepProgress._();

  static const StepProgress none = StepProgress();

  bool get isSyncedLate => syncState == SyncState.syncedLate;
}
