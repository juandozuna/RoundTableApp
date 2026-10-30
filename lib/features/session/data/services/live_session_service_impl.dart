import 'package:injectable/injectable.dart';

import '../../../../core/data/data_scope.dart';
import '../../../../core/data/records/records.dart';
import '../../../../core/data/remote_watch.dart';
import '../../../../core/data/wait_unwrapped.dart';
import '../../../../core/models/session_status.dart';
import '../../../../core/services/clock/clock_service.dart';
import '../../../settings/domain/models/content_language.dart';
import '../../../settings/domain/services/selected_content_language_service.dart';
import '../../domain/models/live_session.dart';
import '../../domain/models/today_session_selector.dart';
import '../../domain/services/live_session_service.dart';
import '../assembly/curriculum_text.dart';
import '../assembly/live_session_assembler.dart';
import '../assembly/session_record_mappers.dart';
import '../assembly/session_records.dart';
import '../datasources/session_reads_remote_data_source.dart';

/// Live screens poll while somebody listens; the app's own writes refetch at
/// once through `DataChangeSignal`.
@LazySingleton(as: LiveSessionService)
class LiveSessionServiceImpl implements LiveSessionService {
  LiveSessionServiceImpl(
    this._reads,
    this._contentLanguage,
    this._watch,
    this._clock,
  );

  static const Duration pollInterval = Duration(seconds: 5);

  final SessionReadsRemoteDataSource _reads;
  final SelectedContentLanguageService _contentLanguage;
  final RemoteWatch _watch;
  final ClockService _clock;

  @override
  Stream<LiveSession?> watch({String? tableId}) async* {
    yield* _watch<LiveSession?>(
      () => _load(tableId),
      scopes: const {DataScope.session, DataScope.contentLanguage},
      pollInterval: pollInterval,
    );
  }

  Future<LiveSession?> _load(String? tableId) async {
    final now = _clock.nowUtc();
    final membership = await _reads.myMembership(tableId: tableId);
    if (membership == null) return null;
    final table = await _reads.roundTable(membership.roundTableId);
    if (table == null) return null;

    final selected = await _selectSession(table.id, now);
    if (selected == null) return null;
    final session = selected.record;

    final followUpValueId = session.followUpValueId;
    final values = await _reads.values([session.valueId, ?followUpValueId]);
    final baseValue = values[session.valueId];
    if (baseValue == null) return null;

    final (organization, questions, roster) = await (
      _reads.organization(table.organizationId),
      _reads.questions(session.valueId),
      _reads.roster(table.id),
    ).waitUnwrapped;
    final (
      attendance,
      assessments,
      answers,
      commitments,
      previousCommitments,
    ) = await (
      _reads.attendance(session.id),
      _reads.assessments(session.id),
      _reads.answers(session.id),
      _reads.commitments(session.id),
      followUpValueId == null
          ? Future.value(const <MemberCommitmentRecord>[])
          : _reads.commitmentsOfValue(
              tableId: table.id,
              valueId: followUpValueId,
            ),
    ).waitUnwrapped;

    final text = await _curriculumText(
      locale: await _contentLanguage.readCode(),
      valueIds: values.keys,
      questionIds: [for (final q in questions) q.id],
    );
    final followUpBase = followUpValueId == null
        ? null
        : values[followUpValueId];

    final records = SessionRecords(
      myPersonId: membership.personId,
      table: table,
      organizationName: organization?.name ?? '',
      selectedSession: session,
      isToday: selected.isToday,
      value: text.value(baseValue),
      followUpValue: followUpBase == null ? null : text.value(followUpBase),
      questions: [for (final q in questions) text.question(q)],
      roster: roster.where((m) => m.leftAt == null).toList(),
      attendance: attendance,
      assessments: assessments,
      answers: answers,
      commitments: commitments,
      previousCommitments: previousCommitments,
    );
    return LiveSessionAssembler.assemble(records);
  }

  /// Picks the session to show with [TodaySessionSelector]; null when the
  /// table has none yet.
  Future<({SessionRecord record, bool isToday})?> _selectSession(
    String tableId,
    DateTime now,
  ) async {
    final pending = _pendingFirst(await _reads.pendingSessions(tableId));
    // An open session is shown whatever else exists, so skip the second read.
    final lastClosed = pending?.status == SessionStatus.open
        ? null
        : await _reads.lastClosedSession(tableId);
    final selected = TodaySessionSelector.select(
      pending: pending?.toInfo(),
      lastClosed: lastClosed?.toInfo(),
      now: now,
    );
    if (selected == null) return null;
    final record = [
      pending,
      lastClosed,
    ].nonNulls.firstWhere((r) => r.id == selected.info.id);
    return (record: record, isToday: selected.isToday);
  }

  /// The open session, else the earliest scheduled one.
  static SessionRecord? _pendingFirst(List<SessionRecord> sessions) {
    final pending = sessions.where((s) => !s.status.isFinal).toList()
      ..sort((a, b) {
        final aOpen = a.status == SessionStatus.open;
        if (aOpen != (b.status == SessionStatus.open)) return aOpen ? -1 : 1;
        return a.scheduledAt.compareTo(b.scheduledAt);
      });
    return pending.firstOrNull;
  }

  /// Translations in [locale]; none for the Spanish base text.
  Future<CurriculumText> _curriculumText({
    required String locale,
    required Iterable<String> valueIds,
    required Iterable<String> questionIds,
  }) async {
    if (locale == ContentLanguageChoice.baseCode) {
      return CurriculumText(const []);
    }
    return CurriculumText(
      await _reads.translations(
        locale: locale,
        entityIds: [...valueIds, ...questionIds],
      ),
    );
  }
}
