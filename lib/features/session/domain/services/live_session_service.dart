import '../models/live_session.dart';

/// Today's session of a table, assembled from local data.
abstract interface class LiveSessionService {
  /// Emits the session to run (or the one that just closed) for [tableId],
  /// or for the signed-in user's active table when null. Emits null when
  /// the device has no table or no session yet. Re-emits on every local
  /// change, including rows that arrive from the server.
  Stream<LiveSession?> watch({String? tableId});
}
