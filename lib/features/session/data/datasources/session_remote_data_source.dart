import 'package:injectable/injectable.dart';

import '../../../../core/models/session_stage.dart';
import '../../../../core/network/api_guard.dart';
import '../client/session_control_client.dart';
import '../client/session_sync_client.dart';
import '../models/sync_upload_response.dart';

/// Edge Function calls of the session feature: the sync upload and the
/// facilitator's online controls. Never touches the local database.
@lazySingleton
class SessionRemoteDataSource {
  SessionRemoteDataSource(this._sync, this._control);

  final SessionSyncClient _sync;
  final SessionControlClient _control;

  /// Maximum operations per request (api-contract.md §4).
  static const int maxBatch = 500;

  Future<SyncUploadResponse> uploadBatch(List<Map<String, Object?>> batch) =>
      guardApiCall(() => _sync.upload({'batch': batch}));

  Future<void> open(String sessionId, {required SessionStage stage}) =>
      guardApiCall(() => _control.open(sessionId, {'stage': stage.wireValue}));

  Future<void> setStage(String sessionId, SessionStage stage) => guardApiCall(
    () => _control.setStage(sessionId, {'stage': stage.wireValue}),
  );

  Future<void> closeAnswers(String sessionId, DateTime at) => guardApiCall(
    () => _control.closeAnswers(sessionId, {
      'answers_closed_at': at.toUtc().toIso8601String(),
    }),
  );

  Future<void> close(String sessionId, DateTime at) => guardApiCall(
    () => _control.close(sessionId, {
      'ended_at': at.toUtc().toIso8601String(),
    }),
  );
}
