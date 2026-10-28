import '../../../../core/services/session_context/session_context.dart';
import '../models/upcoming_sessions.dart';

/// The upcoming sessions the active context may see.
abstract interface class UpcomingSessionsService {
  /// A facilitator's list follows the local database and keeps working
  /// offline; the managers' list is live-server-authoritative and emits once
  /// (ADR 0003). Errors surface as stream errors.
  Stream<UpcomingSessions> watch(SessionContext context);
}
