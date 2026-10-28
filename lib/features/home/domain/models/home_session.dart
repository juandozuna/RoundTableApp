import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/health_status.dart';

part 'home_session.freezed.dart';

/// The pending (scheduled or open) session of the user's table.
@freezed
abstract class HomeSession with _$HomeSession {
  const factory HomeSession({
    required String id,
    required String roundTableId,
    required String tableName,
    required DateTime scheduledAt,
    required bool isOpen,
    required int seatsTaken,
    String? valueName,
    int? valueSequence,
    String? followUpValueName,

    /// An extra meeting added by the coordination (RF-30).
    @Default(false) bool isExtraordinary,

    /// Regular slot this session was moved from, when it was rescheduled.
    DateTime? rescheduledFrom,

    /// Slot of a session cancelled since the last one held: the next session
    /// carries the same value.
    DateTime? cancelledNoticeFor,

    /// `null` when there is not enough history to judge.
    HealthStatus? health,
  }) = _HomeSession;
}
