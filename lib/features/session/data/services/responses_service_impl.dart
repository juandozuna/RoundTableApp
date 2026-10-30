import 'package:injectable/injectable.dart';

import '../../../../core/data/records/records.dart';
import '../../../../core/models/assessment_kind.dart';
import '../../../../core/services/clock/clock_service.dart';
import '../../../../core/services/id/id_generator.dart';
import '../../domain/models/response_submissions.dart';
import '../../domain/services/responses_service.dart';
import '../datasources/session_reads_remote_data_source.dart';
import '../models/session_write_operation.dart';
import '../models/session_write_operations.dart';
import 'session_write_gateway.dart';

@LazySingleton(as: ResponsesService)
class ResponsesServiceImpl implements ResponsesService {
  ResponsesServiceImpl(this._reads, this._gateway, this._clock, this._ids);

  final SessionReadsRemoteDataSource _reads;
  final SessionWriteGateway _gateway;
  final ClockService _clock;
  final IdGenerator _ids;

  @override
  Future<void> submitFollowUp(FollowUpSubmission submission) async {
    final (session, personId) = await _sessionAndMe(submission.sessionId);
    final nowIso = _now;
    await _gateway.upload([
      SessionWriteOperations.followUpReview(
        previousCommitmentId: submission.previousCommitmentId,
        sessionId: session.id,
        status: submission.status,
        note: _blankToNull(submission.note),
        nowIso: nowIso,
      ),
      await _assessment(
        session: session,
        personId: personId,
        kind: AssessmentKind.followUp,
        score: submission.score,
        justification: submission.justification,
        nowIso: nowIso,
      ),
    ]);
  }

  @override
  Future<void> submitReflection(ReflectionSubmission submission) async {
    final (session, personId) = await _sessionAndMe(submission.sessionId);
    final nowIso = _now;
    final existing = {
      for (final row in await _reads.myAnswers(
        sessionId: session.id,
        personId: personId,
      ))
        row.questionId: row.id,
    };
    await _gateway.upload([
      for (final entry in submission.answers.entries)
        SessionWriteOperations.answer(
          existingId: existing[entry.key],
          newId: _ids.newId,
          sessionId: session.id,
          personId: personId,
          questionId: entry.key,
          text: entry.value.trim(),
          pickedPersonId: submission.answerPersonIds[entry.key],
          nowIso: nowIso,
        ),
      await _assessment(
        session: session,
        personId: personId,
        kind: AssessmentKind.initial,
        score: submission.score,
        justification: submission.justification,
        nowIso: nowIso,
      ),
    ]);
  }

  @override
  Future<void> submitCommitment(CommitmentSubmission submission) async {
    final (session, personId) = await _sessionAndMe(submission.sessionId);
    final existing = await _reads.myCommitment(
      sessionId: session.id,
      personId: personId,
    );
    await _gateway.upload([
      SessionWriteOperations.commitment(
        existingId: existing?.id,
        newId: _ids.newId,
        sessionId: session.id,
        personId: personId,
        actionText: submission.actionText,
        measureText: submission.measureText,
        nowIso: _now,
      ),
    ]);
  }

  Future<SessionWriteOperation> _assessment({
    required SessionRecord session,
    required String personId,
    required AssessmentKind kind,
    required int score,
    required String? justification,
    required String nowIso,
  }) async {
    final existing = await _reads.myAssessment(
      sessionId: session.id,
      personId: personId,
      kind: kind,
    );
    return SessionWriteOperations.assessment(
      existingId: existing?.id,
      newId: _ids.newId,
      sessionId: session.id,
      personId: personId,
      kind: kind,
      score: score,
      justification: _blankToNull(justification),
      nowIso: nowIso,
    );
  }

  String get _now => _clock.nowUtc().toIso8601String();

  Future<(SessionRecord, String)> _sessionAndMe(String sessionId) async {
    final session = await _reads.session(sessionId);
    if (session == null) {
      throw StateError('Session $sessionId is not available');
    }
    final membership = await _reads.myMembership(tableId: session.roundTableId);
    if (membership == null) {
      throw StateError(
        'No seat of the signed-in user at ${session.roundTableId}',
      );
    }
    return (session, membership.personId);
  }

  static String? _blankToNull(String? text) {
    final trimmed = text?.trim();
    return trimmed == null || trimmed.isEmpty ? null : trimmed;
  }
}
