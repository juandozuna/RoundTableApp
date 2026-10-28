import 'package:freezed_annotation/freezed_annotation.dart';

import 'upcoming_session.dart';

part 'upcoming_filter.freezed.dart';

/// Narrowing of the upcoming-sessions list; `null` means "all".
@freezed
abstract class UpcomingFilter with _$UpcomingFilter {
  const UpcomingFilter._();

  const factory UpcomingFilter({
    String? locationId,
    String? facilitatorId,
    String? roundTableId,
  }) = _UpcomingFilter;

  bool get isActive =>
      locationId != null || facilitatorId != null || roundTableId != null;

  bool matches(UpcomingSession session) =>
      (locationId == null || session.locationId == locationId) &&
      (facilitatorId == null || session.facilitatorId == facilitatorId) &&
      (roundTableId == null || session.roundTableId == roundTableId);

  List<UpcomingSession> apply(List<UpcomingSession> sessions) =>
      isActive ? sessions.where(matches).toList() : sessions;
}
