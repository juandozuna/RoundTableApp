import 'package:gold_roundtables/features/calendar/domain/models/upcoming_session.dart';

UpcomingSession upcomingSession({
  String id = 's1',
  String tableId = 't1',
  String tableName = 'Mesa Esperanza 03',
  UpcomingSessionState state = UpcomingSessionState.scheduled,
  DateTime? localStart,
  String timezone = 'America/Santo_Domingo',
  String? locationId = 'l1',
  String? locationName = 'Sede Central',
  String? facilitatorId = 'f1',
  String? facilitatorName = 'Sofía Herrera',
  bool isExtraordinary = false,
  DateTime? rescheduledFromLocal,
}) {
  final local = localStart ?? DateTime(2026, 10, 29, 19);
  return UpcomingSession(
    id: id,
    roundTableId: tableId,
    tableName: tableName,
    state: state,
    scheduledAt: local.add(const Duration(hours: 4)).toUtc(),
    localStart: local,
    timezone: timezone,
    locationId: locationId,
    locationName: locationName,
    facilitatorId: facilitatorId,
    facilitatorName: facilitatorName,
    isExtraordinary: isExtraordinary,
    rescheduledFromLocal: rescheduledFromLocal,
  );
}
