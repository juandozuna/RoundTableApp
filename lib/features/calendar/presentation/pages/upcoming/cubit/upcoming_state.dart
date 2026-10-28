import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/upcoming_filter.dart';
import '../../../../domain/models/upcoming_session.dart';
import '../../../../domain/models/upcoming_sessions.dart';

part 'upcoming_state.freezed.dart';

enum UpcomingStatus { loading, ready, failure }

@freezed
abstract class UpcomingState with _$UpcomingState {
  const UpcomingState._();

  const factory UpcomingState({
    @Default(UpcomingStatus.loading) UpcomingStatus status,
    UpcomingSessions? sessions,
    @Default(UpcomingFilter()) UpcomingFilter filter,
    Object? error,
    @Default(true) bool online,
  }) = _UpcomingState;

  /// The sessions that pass the filter.
  List<UpcomingSession> get visible =>
      filter.apply(sessions?.sessions ?? const []);

  bool get isManager => sessions?.scope == UpcomingScope.manager;

  bool get isUnavailable => sessions?.scope == UpcomingScope.unavailable;
}
