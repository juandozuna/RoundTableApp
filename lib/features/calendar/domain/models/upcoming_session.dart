import 'package:freezed_annotation/freezed_annotation.dart';

part 'upcoming_session.freezed.dart';

enum UpcomingSessionState { scheduled, open, cancelled }

/// One entry of the upcoming-sessions calendar (RF-26).
@freezed
abstract class UpcomingSession with _$UpcomingSession {
  const UpcomingSession._();

  const factory UpcomingSession({
    required String id,
    required String roundTableId,
    required String tableName,
    required UpcomingSessionState state,

    /// The instant, in UTC.
    required DateTime scheduledAt,

    /// The same instant as wall-clock time in the table's [timezone]; what
    /// people at the table see, whatever zone the viewer is in.
    required DateTime localStart,

    /// IANA name of the table's timezone.
    required String timezone,
    String? locationId,
    String? locationName,
    String? facilitatorId,
    String? facilitatorName,

    /// An extra meeting added by the coordination (RF-30).
    @Default(false) bool isExtraordinary,

    /// Regular slot this session was moved from, in the table's timezone.
    DateTime? rescheduledFromLocal,
  }) = _UpcomingSession;

  bool get isCancelled => state == UpcomingSessionState.cancelled;

  bool get isOpen => state == UpcomingSessionState.open;

  bool get isRescheduled => rescheduledFromLocal != null;
}
