import '../models/session_draft.dart';

/// Keeps a person's unsent answers for a session on this device.
abstract interface class SessionDraftService {
  Future<SessionDraft?> load({
    required String sessionId,
    required String personId,
  });

  /// An empty [draft] removes what was stored.
  Future<void> save({
    required String sessionId,
    required String personId,
    required SessionDraft draft,
  });
}
