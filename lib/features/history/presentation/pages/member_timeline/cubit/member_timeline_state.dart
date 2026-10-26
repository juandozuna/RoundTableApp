import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/member_history.dart';

part 'member_timeline_state.freezed.dart';

enum MemberTimelineStatus { loading, ready, failure }

@freezed
abstract class MemberTimelineState with _$MemberTimelineState {
  const factory MemberTimelineState({
    @Default(MemberTimelineStatus.loading) MemberTimelineStatus status,
    MemberHistory? history,
    Object? error,
    @Default(true) bool online,
  }) = _MemberTimelineState;
}
