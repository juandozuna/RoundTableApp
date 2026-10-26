import '../../../../core/services/session_context/session_context.dart';
import '../models/home_overview.dart';

/// What the home screen needs for the active context.
abstract interface class HomeService {
  /// Emits the overview for [context], then every change. Facilitator and
  /// member homes follow the local database; the manager home is
  /// live-server-authoritative and emits once (ADR 0003). Errors surface as
  /// stream errors.
  Stream<HomeOverview> watchOverview(SessionContext context);
}
