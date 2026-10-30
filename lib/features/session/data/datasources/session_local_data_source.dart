import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/models/assessment_kind.dart';
import '../../../../core/models/session_status.dart';
import '../../../../core/sync/data/content_text_sql.dart';
import '../../../../core/sync/data/sync_database.dart';
import '../../../../core/sync/data/sync_schema.dart';
import '../../domain/models/today_session_selector.dart';
import '../local/local_session_data.dart';
import '../local/row_mappers.dart';
import '../local/session_drift_database.dart';
import '../local/session_sync_schema.dart';

/// Reads and writes the session-domain tables in the local PowerSync
/// database through Drift. Writes queue an upload automatically (PowerSync
/// triggers); this class never touches the network.
@lazySingleton
class SessionLocalDataSource {
  SessionLocalDataSource(this._db, this._sync);

  static const String _activeStatus = 'active';

  final SessionDriftDatabase _db;
  final SyncDatabase _sync;

  /// Emits whenever a session-domain table or the upload queue changes.
  Stream<void> watchChanges() => _sync.powerSync
      .onChange([
        SessionTables.curriculumValues,
        SessionTables.valueQuestions,
        SessionTables.curriculumTranslations,
        CoreSyncTables.localSyncState,
        SessionTables.organizations,
        SessionTables.people,
        SessionTables.roundTables,
        SessionTables.tableMembers,
        SessionTables.sessions,
        SessionTables.sessionAttendance,
        SessionTables.memberAssessments,
        SessionTables.memberAnswers,
        SessionTables.memberCommitments,
        CoreSyncTables.uploadRejections,
        'ps_crud',
      ], throttle: const Duration(milliseconds: 50))
      .map((_) {});

  // ---------------------------------------------------------------- reads

  /// Ids of rows whose change has not finished uploading, read from
  /// PowerSync's queue (never from a column, api-contract.md §4).
  Future<Set<String>> pendingRowIds() async {
    final rows = await _sync.powerSync.getAll('SELECT data FROM ps_crud');
    final ids = <String>{};
    for (final row in rows) {
      final entry = jsonDecode(row['data'] as String) as Map<String, dynamic>;
      final id = entry['id'];
      if (id is String) ids.add(id);
    }
    return ids;
  }

  /// Loads everything for today's session of [tableId] (or of the user's
  /// active table). Null while the device lacks the table, its curriculum or
  /// any session.
  Future<LocalSessionData?> load({
    required DateTime now,
    String? tableId,
  }) async {
    final membership = await _findMyMembership(tableId);
    if (membership == null) return null;
    final table = await _tableById(membership.roundTableId!);
    if (table == null) return null;

    final selected = await _selectSession(table.id, now);
    if (selected == null) return null;
    final sessionRow = await sessionById(selected.info.id);
    final value = await _valueById(selected.info.valueId);
    if (sessionRow == null || value == null) return null;

    final followUpValueId = selected.info.followUpValueId;
    final session = selected.info.id;
    final organization = table.organizationId == null
        ? null
        : await _organizationById(table.organizationId!);

    return LocalSessionData(
      myPersonId: membership.personId!,
      table: table,
      organizationName: organization?.name ?? '',
      selectedSession: sessionRow,
      isToday: selected.isToday,
      value: value,
      followUpValue: followUpValueId == null
          ? null
          : await _valueById(followUpValueId),
      questions: await _translatedQuestions(
        await (_db.select(_db.valueQuestions)
              ..where(
                (q) =>
                    q.valueId.equals(value.id) & q.status.equals(_activeStatus),
              )
              ..orderBy([(q) => OrderingTerm.asc(q.sortOrder)]))
            .get(),
      ),
      roster: await _activeRoster(table.id),
      attendance: await (_db.select(
        _db.sessionAttendance,
      )..where((r) => r.sessionId.equals(session))).get(),
      assessments: await (_db.select(
        _db.memberAssessments,
      )..where((r) => r.sessionId.equals(session))).get(),
      answers: await (_db.select(
        _db.memberAnswers,
      )..where((r) => r.sessionId.equals(session))).get(),
      commitments: await (_db.select(
        _db.memberCommitments,
      )..where((r) => r.sessionId.equals(session))).get(),
      previousCommitments: followUpValueId == null
          ? const []
          : await (_db.select(_db.memberCommitments)..where(
                  (r) =>
                      r.roundTableId.equals(table.id) &
                      r.valueId.equals(followUpValueId),
                ))
                .get(),
      pendingRowIds: await pendingRowIds(),
      rejections:
          await (_db.select(_db.syncUploadRejections)
                ..orderBy([(r) => OrderingTerm.desc(r.rejectedAt)])
                ..limit(5))
              .get(),
    );
  }

  /// The device user's person at [tableId], or null if not a participant.
  Future<String?> myPersonIdAt(String tableId) async =>
      (await _findMyMembership(tableId))?.personId;

  Future<TableMemberRow?> _findMyMembership(String? tableId) async {
    final people = await _db.select(_db.people).get();
    if (people.isEmpty) return null;
    final myIds = people.map((p) => p.id).toList();
    final memberships =
        await (_db.select(_db.tableMembers)..where(
              (m) => m.personId.isIn(myIds) & m.status.equals(_activeStatus),
            ))
            .get();
    final candidates = memberships.where(
      (m) =>
          (m.leftAt ?? '').isEmpty &&
          m.roundTableId != null &&
          m.personId != null &&
          (tableId == null || m.roundTableId == tableId),
    );
    if (candidates.isEmpty) return null;
    return candidates.firstWhere(
      (m) => m.role == 'facilitator',
      orElse: () => candidates.first,
    );
  }

  Future<SelectedSession?> _selectSession(String tableId, DateTime now) async {
    final rows =
        await (_db.select(_db.sessions)..where(
              (s) => s.roundTableId.equals(tableId) & s.archivedAt.isNull(),
            ))
            .get();
    final infos = rows.map((r) => r.toInfo()).nonNulls.toList();
    final pending = infos.where((s) => !s.isFinal).toList()
      ..sort((a, b) {
        if (a.isOpen != b.isOpen) return a.isOpen ? -1 : 1;
        return a.scheduledAt.compareTo(b.scheduledAt);
      });
    final closed = infos.where((s) => s.status == SessionStatus.closed).toList()
      ..sort(
        (a, b) =>
            (b.endedAt ?? b.scheduledAt).compareTo(a.endedAt ?? a.scheduledAt),
      );
    return TodaySessionSelector.select(
      pending: pending.firstOrNull,
      lastClosed: closed.firstOrNull,
      now: now,
    );
  }

  Future<List<TableMemberRow>> _activeRoster(String tableId) async {
    final rows =
        await (_db.select(_db.tableMembers)..where(
              (m) =>
                  m.roundTableId.equals(tableId) &
                  m.status.equals(_activeStatus),
            ))
            .get();
    return rows
        .where((m) => (m.leftAt ?? '').isEmpty && m.personId != null)
        .toList();
  }

  Future<RoundTableRow?> _tableById(String id) => (_db.select(
    _db.roundTables,
  )..where((t) => t.id.equals(id))).getSingleOrNull();

  /// The value in the user's content language (Spanish where untranslated).
  Future<ValueRow?> _valueById(String id) async {
    final row = await (_db.select(
      _db.curriculumValues,
    )..where((v) => v.id.equals(id))).getSingleOrNull();
    if (row == null) return null;
    final translated = await _sync.powerSync.getOptional(
      'SELECT ${ContentTextSql.name('value', 'v')} AS name, '
      "COALESCE((SELECT NULLIF(TRIM(tr.description), '') FROM "
      "curriculum_translations tr WHERE tr.entity_type = 'value' AND "
      'tr.entity_id = v.id AND tr.locale = ${ContentTextSql.locale}), '
      'v.description) AS description '
      'FROM curriculum_values v WHERE v.id = ?',
      [id],
    );
    return row.copyWith(
      name: Value(translated?['name'] as String? ?? row.name),
      description: Value(
        translated?['description'] as String? ?? row.description,
      ),
    );
  }

  Future<List<QuestionRow>> _translatedQuestions(List<QuestionRow> rows) async {
    if (rows.isEmpty) return rows;
    final translated = await _sync.powerSync.getAll(
      'SELECT q.id AS id, '
      '${ContentTextSql.text(entityType: 'question', alias: 'q', field: 'question_text', base: 'q.question_text')} '
      'AS text FROM value_questions q WHERE q.id IN '
      '(${List.filled(rows.length, '?').join(', ')})',
      [for (final row in rows) row.id],
    );
    final byId = {for (final r in translated) r['id']! as String: r['text']};
    return [
      for (final row in rows)
        row.copyWith(
          questionText: Value(byId[row.id] as String? ?? row.questionText),
        ),
    ];
  }

  Future<OrganizationRow?> _organizationById(String id) => (_db.select(
    _db.organizations,
  )..where((o) => o.id.equals(id))).getSingleOrNull();

  Future<SessionRow?> sessionById(String id) => (_db.select(
    _db.sessions,
  )..where((s) => s.id.equals(id))).getSingleOrNull();

  // --------------------------------------------------------------- writes

  /// Saves who is present. One row per (session, person): an existing row
  /// is edited, never duplicated (api-contract.md §4, rule 3).
  Future<void> upsertAttendance({
    required SessionRow session,
    required List<String> personIds,
    required String status,
    required String nowIso,
    required String Function() newId,
  }) => _db.transaction(() async {
    for (final personId in personIds) {
      final existing =
          await (_db.select(_db.sessionAttendance)..where(
                (r) =>
                    r.sessionId.equals(session.id) &
                    r.personId.equals(personId),
              ))
              .getSingleOrNull();
      if (existing == null) {
        await _db
            .into(_db.sessionAttendance)
            .insert(
              SessionAttendanceCompanion.insert(
                id: newId(),
                organizationId: Value(session.organizationId),
                roundTableId: Value(session.roundTableId),
                sessionId: Value(session.id),
                personId: Value(personId),
                status: Value(status),
                source: const Value('facilitator'),
                deviceCreatedAt: Value(nowIso),
              ),
            );
      } else if (existing.status != status) {
        await (_db.update(
          _db.sessionAttendance,
        )..where((r) => r.id.equals(existing.id))).write(
          SessionAttendanceCompanion(
            status: Value(status),
            source: const Value('facilitator'),
            deviceModifiedAt: Value(nowIso),
          ),
        );
      }
    }
  });

  /// Review of last week's commitment plus the follow-up score, atomically.
  Future<void> saveFollowUp({
    required SessionRow session,
    required String personId,
    required String previousCommitmentId,
    required String status,
    required String? note,
    required int score,
    String? justification,
    required String nowIso,
    required String Function() newId,
  }) => _db.transaction(() async {
    await (_db.update(
      _db.memberCommitments,
    )..where((c) => c.id.equals(previousCommitmentId))).write(
      MemberCommitmentsCompanion(
        followUpSessionId: Value(session.id),
        followUpStatus: Value(status),
        followUpNote: Value(note),
        followUpDeviceAt: Value(nowIso),
        deviceModifiedAt: Value(nowIso),
      ),
    );
    await _upsertAssessment(
      session: session,
      personId: personId,
      kind: AssessmentKind.followUp,
      score: score,
      justification: justification,
      valueId: session.followUpValueId,
      nowIso: nowIso,
      newId: newId,
    );
  });

  /// Reflection answers plus the initial score, atomically.
  Future<void> saveReflection({
    required SessionRow session,
    required String personId,
    required Map<String, String> answers,
    Map<String, String> answerPersonIds = const {},
    required int score,
    String? justification,
    required String nowIso,
    required String Function() newId,
  }) => _db.transaction(() async {
    for (final entry in answers.entries) {
      final pickedPerson = answerPersonIds[entry.key];
      final existing =
          await (_db.select(_db.memberAnswers)..where(
                (a) =>
                    a.sessionId.equals(session.id) &
                    a.personId.equals(personId) &
                    a.questionId.equals(entry.key),
              ))
              .getSingleOrNull();
      if (existing == null) {
        await _db
            .into(_db.memberAnswers)
            .insert(
              MemberAnswersCompanion.insert(
                id: newId(),
                organizationId: Value(session.organizationId),
                roundTableId: Value(session.roundTableId),
                sessionId: Value(session.id),
                personId: Value(personId),
                valueId: Value(session.valueId),
                questionId: Value(entry.key),
                answerText: Value(entry.value.trim()),
                answerPersonId: Value(pickedPerson),
                deviceCreatedAt: Value(nowIso),
              ),
            );
      } else {
        await (_db.update(
          _db.memberAnswers,
        )..where((a) => a.id.equals(existing.id))).write(
          MemberAnswersCompanion(
            answerText: Value(entry.value.trim()),
            answerPersonId: Value(pickedPerson),
            deviceModifiedAt: Value(nowIso),
          ),
        );
      }
    }
    await _upsertAssessment(
      session: session,
      personId: personId,
      kind: AssessmentKind.initial,
      score: score,
      justification: justification,
      valueId: session.valueId,
      nowIso: nowIso,
      newId: newId,
    );
  });

  Future<void> _upsertAssessment({
    required SessionRow session,
    required String personId,
    required AssessmentKind kind,
    required int score,
    required String? justification,
    required String? valueId,
    required String nowIso,
    required String Function() newId,
  }) async {
    final existing =
        await (_db.select(_db.memberAssessments)..where(
              (a) =>
                  a.sessionId.equals(session.id) &
                  a.personId.equals(personId) &
                  a.kind.equals(kind.wireValue),
            ))
            .getSingleOrNull();
    if (existing == null) {
      await _db
          .into(_db.memberAssessments)
          .insert(
            MemberAssessmentsCompanion.insert(
              id: newId(),
              organizationId: Value(session.organizationId),
              roundTableId: Value(session.roundTableId),
              sessionId: Value(session.id),
              personId: Value(personId),
              valueId: Value(valueId),
              kind: Value(kind.wireValue),
              score: Value(score),
              justification: Value(justification),
              deviceCreatedAt: Value(nowIso),
            ),
          );
    } else {
      await (_db.update(
        _db.memberAssessments,
      )..where((a) => a.id.equals(existing.id))).write(
        MemberAssessmentsCompanion(
          score: Value(score),
          justification: Value(justification),
          deviceModifiedAt: Value(nowIso),
        ),
      );
    }
  }

  Future<void> saveCommitment({
    required SessionRow session,
    required String personId,
    required String actionText,
    required String measureText,
    required String nowIso,
    required String Function() newId,
  }) => _db.transaction(() async {
    final existing =
        await (_db.select(_db.memberCommitments)..where(
              (c) =>
                  c.sessionId.equals(session.id) & c.personId.equals(personId),
            ))
            .getSingleOrNull();
    if (existing == null) {
      await _db
          .into(_db.memberCommitments)
          .insert(
            MemberCommitmentsCompanion.insert(
              id: newId(),
              organizationId: Value(session.organizationId),
              roundTableId: Value(session.roundTableId),
              sessionId: Value(session.id),
              personId: Value(personId),
              valueId: Value(session.valueId),
              actionText: Value(actionText),
              measureText: Value(measureText),
              deviceCreatedAt: Value(nowIso),
            ),
          );
    } else {
      await (_db.update(
        _db.memberCommitments,
      )..where((c) => c.id.equals(existing.id))).write(
        MemberCommitmentsCompanion(
          actionText: Value(actionText),
          measureText: Value(measureText),
          deviceModifiedAt: Value(nowIso),
        ),
      );
    }
  });

  /// Edits the session row (facilitator controls while offline). Only the
  /// given fields change, so the queued PATCH carries just those.
  Future<void> patchSession(
    String sessionId, {
    required String nowIso,
    String? status,
    String? stage,
    String? startedAt,
    String? endedAt,
    String? answersClosedAt,
  }) => (_db.update(_db.sessions)..where((s) => s.id.equals(sessionId))).write(
    SessionsCompanion(
      status: Value.absentIfNull(status),
      stage: Value.absentIfNull(stage),
      startedAt: Value.absentIfNull(startedAt),
      endedAt: Value.absentIfNull(endedAt),
      answersClosedAt: Value.absentIfNull(answersClosedAt),
      deviceModifiedAt: Value(nowIso),
    ),
  );
}
