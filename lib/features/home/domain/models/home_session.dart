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

    /// `null` when there is not enough history to judge.
    HealthStatus? health,
  }) = _HomeSession;
}
