import '../../../../core/models/health_status.dart';
import '../../domain/models/home_commitment.dart';
import '../../domain/models/home_progress.dart';

/// A table and its pending session as read from the local database or from
/// PostgREST. Data-layer only; the service maps it to domain models.
class HomeTableRecord {
  const HomeTableRecord({
    required this.tableId,
    required this.tableName,
    required this.tableIsActive,
    required this.seats,
    this.lastClosedAt,
    this.sessionId,
    this.sessionIsOpen = false,
    this.scheduledAt,
    this.valueName,
    this.valueSequence,
    this.followUpValueName,
    this.health,
  });

  final String tableId;
  final String tableName;
  final bool tableIsActive;
  final int seats;
  final DateTime? lastClosedAt;
  final String? sessionId;
  final bool sessionIsOpen;
  final DateTime? scheduledAt;
  final String? valueName;
  final int? valueSequence;
  final String? followUpValueName;

  /// Pre-computed by the server (`kpi_tables`); `null` for local rows.
  final HealthStatus? health;
}

/// Personal part of a member's home.
class HomeMemberRecord {
  const HomeMemberRecord({
    this.table,
    this.commitment,
    this.progress = const HomeProgress(),
  });

  final HomeTableRecord? table;
  final HomeCommitment? commitment;
  final HomeProgress progress;
}
