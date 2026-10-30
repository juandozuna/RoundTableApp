import '../models/live_session.dart';

/// Today's session of a table, read from the server while somebody watches.
abstract interface class LiveSessionService {
  /// Emits the session to run (or the one that just closed) for [tableId],
  /// or for the signed-in user's active table when null. Emits null when
  /// the person has no seat or the table no session yet. Re-emits when the
  /// session changes: after the app's own writes at once, other people's
  /// changes within a few seconds. Errors while the server is unreachable and
  /// keeps watching.
  Stream<LiveSession?> watch({String? tableId});
}
