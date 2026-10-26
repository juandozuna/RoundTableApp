import 'package:injectable/injectable.dart';

import '../../../../core/services/clock/clock_service.dart';
import '../../../../core/services/id/id_generator.dart';
import '../../domain/models/response_submissions.dart';
import '../../domain/services/responses_service.dart';
import '../datasources/session_local_data_source.dart';
import '../local/session_drift_database.dart';

@LazySingleton(as: ResponsesService)
class ResponsesServiceImpl implements ResponsesService {
  ResponsesServiceImpl(this._local, this._clock, this._ids);

  final SessionLocalDataSource _local;
  final ClockService _clock;
  final IdGenerator _ids;

  @override
  Future<void> submitFollowUp(FollowUpSubmission submission) async {
    final session = await _session(submission.sessionId);
    await _local.saveFollowUp(
      session: session,
      personId: await _me(session),
      previousCommitmentId: submission.previousCommitmentId,
      status: submission.status.wireValue,
      note: _blankToNull(submission.note),
      score: submission.score,
      justification: _blankToNull(submission.justification),
      nowIso: _now,
      newId: _ids.newId,
    );
  }

  @override
  Future<void> submitReflection(ReflectionSubmission submission) async {
    final session = await _session(submission.sessionId);
    await _local.saveReflection(
      session: session,
      personId: await _me(session),
      answers: submission.answers,
      score: submission.score,
      justification: _blankToNull(submission.justification),
      nowIso: _now,
      newId: _ids.newId,
    );
  }

  @override
  Future<void> submitCommitment(CommitmentSubmission submission) async {
    final session = await _session(submission.sessionId);
    await _local.saveCommitment(
      session: session,
      personId: await _me(session),
      actionText: submission.actionText,
      measureText: submission.measureText,
      nowIso: _now,
      newId: _ids.newId,
    );
  }

  String get _now => _clock.nowUtc().toIso8601String();

  Future<SessionRow> _session(String id) async {
    final session = await _local.sessionById(id);
    if (session == null) throw StateError('Session $id is not on this device');
    return session;
  }

  Future<String> _me(SessionRow session) async {
    final personId = await _local.myPersonIdAt(session.roundTableId!);
    if (personId == null) {
      throw StateError(
        'No participant of this device at ${session.roundTableId}',
      );
    }
    return personId;
  }

  static String? _blankToNull(String? text) {
    final trimmed = text?.trim();
    return trimmed == null || trimmed.isEmpty ? null : trimmed;
  }
}
