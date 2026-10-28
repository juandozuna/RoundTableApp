/// A pending or cancelled session with its table, location and facilitator,
/// as read from the local database or PostgREST. Data-layer only; the service
/// maps it to the domain model.
class UpcomingSessionRecord {
  const UpcomingSessionRecord({
    required this.id,
    required this.roundTableId,
    required this.tableName,
    required this.status,
    required this.scheduledAt,
    required this.timezone,
    this.isExtraordinary = false,
    this.originalScheduledAt,
    this.locationId,
    this.locationName,
    this.facilitatorId,
    this.facilitatorName,
  });

  final String id;
  final String roundTableId;
  final String tableName;

  /// `scheduled`, `open` or `cancelled`.
  final String status;
  final DateTime scheduledAt;
  final String timezone;
  final bool isExtraordinary;
  final DateTime? originalScheduledAt;
  final String? locationId;
  final String? locationName;
  final String? facilitatorId;
  final String? facilitatorName;
}
