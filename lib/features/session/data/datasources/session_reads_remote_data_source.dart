import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../../core/data/records/records.dart';
import '../../../../core/models/assessment_kind.dart';
import '../../../../core/models/session_status.dart';
import '../../../../core/models/user_role.dart';
import '../../../../core/network/api_guard.dart';
import '../../../../core/network/auth_token_provider.dart';
import '../../../../core/network/postgrest/postgrest.dart';
import '../../../../core/services/clock/clock_service.dart';

/// PostgREST reads of the session feature, under the caller's RLS (ADR 0008).
///
/// RLS is wider than the session itself (coordinators and administrators
/// read whole organizations), so every call filters by the table, session or
/// person it means, and session-domain tables add `archived_at=is.null`.
/// Reference data that rarely changes (the person's seat, table, curriculum
/// text) is kept for [referenceTtl] so a live screen polling every few
/// seconds only re-reads the rows that move.
@lazySingleton
class SessionReadsRemoteDataSource {
  SessionReadsRemoteDataSource(this._client, this._tokens, this._clock);

  static const Duration referenceTtl = Duration(minutes: 5);

  /// Open and scheduled sessions of one table (a table keeps one pending).
  static const int _pendingSessionsLimit = 20;

  final TableReadsClient _client;
  final AuthTokenProvider _tokens;
  final ClockService _clock;
  final Map<String, ({DateTime at, Future<Object?> value})> _reference = {};

  Future<T> _cached<T>(String key, Future<T> Function() load) {
    final now = _clock.nowUtc();
    final hit = _reference[key];
    if (hit != null && now.difference(hit.at) < referenceTtl) {
      return hit.value as Future<T>;
    }
    final value = load();
    _reference[key] = (at: now, value: value);
    // Failures and "not found" are not remembered: the next read retries.
    unawaited(
      value.then<void>((found) {
        if (found == null) _reference.remove(key);
      }, onError: (Object _) => _reference.remove(key)),
    );
    return value;
  }

  static final Map<String, String> _active = {
    PostgrestColumns.archivedAt: PostgrestFilter.isNull(),
  };

  // ------------------------------------------------------ who and where

  /// The signed-in person's active seat, at [tableId] when given. The
  /// facilitator seat wins when the person has several. Null when signed out
  /// or without a seat.
  Future<TableMemberRecord?> myMembership({String? tableId}) {
    final userId = _tokens.userId;
    if (userId == null) return Future.value();
    return _cached('membership:$userId:${tableId ?? ''}', () async {
      final rows = await guardApiCall(
        () => _client.tableMembers(
          PostgrestQuery.of(
            filters: {
              PostgrestColumns.authUserId: PostgrestFilter.eq(userId),
              PostgrestColumns.status: PostgrestFilter.eq(
                PostgrestValues.activeStatus,
              ),
              PostgrestColumns.roundTableId: ?(tableId == null
                  ? null
                  : PostgrestFilter.eq(tableId)),
            },
            order: [PostgrestOrder.asc(PostgrestColumns.joinedAt)],
          ),
        ),
      );
      final seats = rows.where((m) => m.leftAt == null).toList();
      if (seats.isEmpty) return null;
      return seats.firstWhere(
        (m) => m.role == UserRole.facilitator,
        orElse: () => seats.first,
      );
    });
  }

  Future<RoundTableRecord?> roundTable(String id) =>
      _cached('table:$id', () async {
        final rows = await guardApiCall(
          () => _client.roundTables(
            PostgrestQuery.of(
              filters: {PostgrestColumns.id: PostgrestFilter.eq(id)},
              limit: 1,
            ),
          ),
        );
        return rows.firstOrNull;
      });

  Future<OrganizationRecord?> organization(String id) =>
      _cached('organization:$id', () async {
        final rows = await guardApiCall(
          () => _client.organizations(
            PostgrestQuery.of(
              filters: {PostgrestColumns.id: PostgrestFilter.eq(id)},
              limit: 1,
            ),
          ),
        );
        return rows.firstOrNull;
      });

  // ------------------------------------------------------- curriculum

  Future<Map<String, CurriculumValueRecord>> values(Iterable<String> ids) {
    final wanted = ids.toSet().toList()..sort();
    return _cached('values:${wanted.join(',')}', () async {
      final rows = await guardApiCall(
        () => _client.curriculumValues(
          PostgrestQuery.of(
            filters: {PostgrestColumns.id: PostgrestFilter.inList(wanted)},
          ),
        ),
      );
      return {for (final row in rows) row.id: row};
    });
  }

  /// Active questions of [valueId] in answer order.
  Future<List<ValueQuestionRecord>> questions(String valueId) =>
      _cached('questions:$valueId', () {
        return guardApiCall(
          () => _client.valueQuestions(
            PostgrestQuery.of(
              filters: {
                PostgrestColumns.valueId: PostgrestFilter.eq(valueId),
                PostgrestColumns.status: PostgrestFilter.eq(
                  PostgrestValues.activeStatus,
                ),
              },
              order: [PostgrestOrder.asc(PostgrestColumns.sortOrder)],
            ),
          ),
        );
      });

  /// Translations in [locale] of the curriculum rows [entityIds] (values and
  /// questions share one id space).
  Future<List<CurriculumTranslationRecord>> translations({
    required String locale,
    required Iterable<String> entityIds,
  }) {
    final wanted = entityIds.toSet().toList()..sort();
    if (wanted.isEmpty) return Future.value(const []);
    return _cached('translations:$locale:${wanted.join(',')}', () {
      return guardApiCall(
        () => _client.curriculumTranslations(
          PostgrestQuery.of(
            filters: {
              PostgrestColumns.locale: PostgrestFilter.eq(locale),
              PostgrestColumns.entityId: PostgrestFilter.inList(wanted),
            },
          ),
        ),
      );
    });
  }

  // --------------------------------------------------------- sessions

  /// Scheduled and open sessions of [tableId], earliest first.
  Future<List<SessionRecord>> pendingSessions(String tableId) => guardApiCall(
    () => _client.sessions(
      PostgrestQuery.of(
        filters: {
          ..._active,
          PostgrestColumns.roundTableId: PostgrestFilter.eq(tableId),
          PostgrestColumns.status: PostgrestFilter.inList([
            SessionStatus.scheduled.wireValue,
            SessionStatus.open.wireValue,
          ]),
        },
        order: [
          PostgrestOrder.asc(PostgrestColumns.scheduledAt),
          PostgrestOrder.asc(PostgrestColumns.id),
        ],
        limit: _pendingSessionsLimit,
      ),
    ),
  );

  /// The session of [tableId] that closed last, if it is not archived yet.
  Future<SessionRecord?> lastClosedSession(String tableId) async {
    final rows = await guardApiCall(
      () => _client.sessions(
        PostgrestQuery.of(
          filters: {
            ..._active,
            PostgrestColumns.roundTableId: PostgrestFilter.eq(tableId),
            PostgrestColumns.status: PostgrestFilter.eq(
              SessionStatus.closed.wireValue,
            ),
          },
          order: [
            PostgrestOrder.desc(PostgrestColumns.endedAt),
            PostgrestOrder.desc(PostgrestColumns.scheduledAt),
          ],
          limit: 1,
        ),
      ),
    );
    return rows.firstOrNull;
  }

  Future<SessionRecord?> session(String id) async {
    final rows = await guardApiCall(
      () => _client.sessions(
        PostgrestQuery.of(
          filters: {..._active, PostgrestColumns.id: PostgrestFilter.eq(id)},
          limit: 1,
        ),
      ),
    );
    return rows.firstOrNull;
  }

  /// Active participants of [tableId] (facilitator included).
  Future<List<TableMemberRecord>> roster(String tableId) => guardApiCall(
    () => _client.tableMembers(
      PostgrestQuery.of(
        filters: {
          PostgrestColumns.roundTableId: PostgrestFilter.eq(tableId),
          PostgrestColumns.status: PostgrestFilter.eq(
            PostgrestValues.activeStatus,
          ),
        },
        order: [PostgrestOrder.asc(PostgrestColumns.id)],
      ),
    ),
  );

  // ---------------------------------------------------- session rows

  Future<List<SessionAttendanceRecord>> attendance(String sessionId) =>
      guardApiCall(() => _client.sessionAttendance(_ofSession(sessionId)));

  /// Own rows for a member; everyone's for the facilitator of the table.
  Future<List<MemberAssessmentRecord>> assessments(String sessionId) =>
      guardApiCall(() => _client.memberAssessments(_ofSession(sessionId)));

  Future<List<MemberAnswerRecord>> answers(String sessionId) =>
      guardApiCall(() => _client.memberAnswers(_ofSession(sessionId)));

  /// Commitments written in [sessionId].
  Future<List<MemberCommitmentRecord>> commitments(String sessionId) =>
      guardApiCall(() => _client.memberCommitments(_ofSession(sessionId)));

  /// Commitments of [valueId] at [tableId]: what the follow-up reviews.
  Future<List<MemberCommitmentRecord>> commitmentsOfValue({
    required String tableId,
    required String valueId,
  }) => guardApiCall(
    () => _client.memberCommitments(
      PostgrestQuery.of(
        filters: {
          ..._active,
          PostgrestColumns.roundTableId: PostgrestFilter.eq(tableId),
          PostgrestColumns.valueId: PostgrestFilter.eq(valueId),
        },
        order: [PostgrestOrder.asc(PostgrestColumns.id)],
      ),
    ),
  );

  Map<String, dynamic> _ofSession(String sessionId) => PostgrestQuery.of(
    filters: {
      ..._active,
      PostgrestColumns.sessionId: PostgrestFilter.eq(sessionId),
    },
    order: [PostgrestOrder.asc(PostgrestColumns.id)],
  );

  // ------------------------------------------------ rows a write edits

  Future<MemberAssessmentRecord?> myAssessment({
    required String sessionId,
    required String personId,
    required AssessmentKind kind,
  }) async {
    final rows = await guardApiCall(
      () => _client.memberAssessments(
        PostgrestQuery.of(
          filters: {
            ..._active,
            PostgrestColumns.sessionId: PostgrestFilter.eq(sessionId),
            PostgrestColumns.personId: PostgrestFilter.eq(personId),
            PostgrestColumns.kind: PostgrestFilter.eq(kind.wireValue),
          },
          limit: 1,
        ),
      ),
    );
    return rows.firstOrNull;
  }

  Future<List<MemberAnswerRecord>> myAnswers({
    required String sessionId,
    required String personId,
  }) => guardApiCall(
    () => _client.memberAnswers(
      PostgrestQuery.of(
        filters: {
          ..._active,
          PostgrestColumns.sessionId: PostgrestFilter.eq(sessionId),
          PostgrestColumns.personId: PostgrestFilter.eq(personId),
        },
        order: [PostgrestOrder.asc(PostgrestColumns.id)],
      ),
    ),
  );

  Future<MemberCommitmentRecord?> myCommitment({
    required String sessionId,
    required String personId,
  }) async {
    final rows = await guardApiCall(
      () => _client.memberCommitments(
        PostgrestQuery.of(
          filters: {
            ..._active,
            PostgrestColumns.sessionId: PostgrestFilter.eq(sessionId),
            PostgrestColumns.personId: PostgrestFilter.eq(personId),
          },
          limit: 1,
        ),
      ),
    );
    return rows.firstOrNull;
  }
}
