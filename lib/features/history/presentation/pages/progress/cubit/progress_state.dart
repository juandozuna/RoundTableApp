import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/member_history.dart';
import '../../../../domain/models/table_history.dart';

part 'progress_state.freezed.dart';

enum ProgressStatus {
  loading,

  /// The active context has no table (coordinator, no assignment).
  unavailable,
  member,
  facilitator,
  failure,
}

@freezed
abstract class ProgressState with _$ProgressState {
  const factory ProgressState({
    @Default(ProgressStatus.loading) ProgressStatus status,
    MemberHistory? member,
    TableHistory? table,
    Object? error,
    @Default(true) bool online,
  }) = _ProgressState;
}
