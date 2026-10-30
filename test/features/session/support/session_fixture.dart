import 'session_test_database.dart';

/// A deterministic table: facilitator Sofía (the device user when
/// [asFacilitator]) and members Ana (device user otherwise), Luis and Marta.
/// Session "today" is Responsabilidad (value 4) reviewing Honestidad (3).
abstract final class Ids {
  static const org = 'org-luz';
  static const table = 'table-esperanza';
  static const session = 'session-4';
  static const closedSession = 'session-3';
  static const value3 = 'value-3';
  static const value4 = 'value-4';
  static const q1 = 'question-1';
  static const q2 = 'question-2';
  static const sofia = 'person-sofia';
  static const ana = 'person-ana';
  static const luis = 'person-luis';
  static const marta = 'person-marta';
  static const anaPrevious = 'commit-ana-3';
  static const luisPrevious = 'commit-luis-3';
}

final DateTime scheduledAt = DateTime.utc(2026, 10, 29, 23);

abstract final class SessionFixture {
  /// Seeds the baseline a device holds before the meeting. The device user is
  /// the facilitator when [asFacilitator], otherwise Ana.
  static Future<void> seed(
    SessionTestDatabase db, {
    bool asFacilitator = false,
    String status = 'scheduled',
    String stage = 'lobby',
    String? endedAt,
  }) async {
    final me = asFacilitator ? Ids.sofia : Ids.ana;
    await db.seedSynced('people', me, {
      'organization_id': Ids.org,
      'first_name': asFacilitator ? 'Sofía' : 'Ana Lucía',
      'last_name': asFacilitator ? 'Herrera' : 'Méndez',
      'status': 'active',
    });
    await db.seedSynced('organizations', Ids.org, {
      'name': 'Fundación Luz',
      'status': 'active',
    });
    await db.seedSynced('round_tables', Ids.table, {
      'organization_id': Ids.org,
      'name': 'Mesa Esperanza 03',
      'code': 'LUZ-03',
      'duration_minutes': 30,
      'status': 'active',
    });
    for (final (id, person, role, first, last) in [
      ('tm-sofia', Ids.sofia, 'facilitator', 'Sofía', 'Herrera'),
      ('tm-ana', Ids.ana, 'member', 'Ana Lucía', 'Méndez'),
      ('tm-luis', Ids.luis, 'member', 'Luis', 'Ferrer'),
      ('tm-marta', Ids.marta, 'member', 'Marta', 'Quiroz'),
    ]) {
      await db.seedSynced('table_members', id, {
        'organization_id': Ids.org,
        'round_table_id': Ids.table,
        'person_id': person,
        'role': role,
        'status': 'active',
        'first_name': first,
        'last_name': last,
      });
    }
    await db.seedSynced('curriculum_values', Ids.value3, {
      'name': 'Honestidad',
      'sequence': 3,
      'status': 'active',
    });
    await db.seedSynced('curriculum_values', Ids.value4, {
      'name': 'Responsabilidad',
      'sequence': 4,
      'status': 'active',
    });
    for (final (id, text, order) in [
      (Ids.q1, '¿Quién es para ti un ejemplo de este valor?', 1),
      (Ids.q2, '¿Por qué te diste ese puntaje?', 2),
    ]) {
      await db.seedSynced('value_questions', id, {
        'value_id': Ids.value4,
        'question_text': text,
        'sort_order': order,
        'response_type': id == Ids.q1 ? 'person' : 'text',
        'status': 'active',
      });
    }
    await db.seedSynced('sessions', Ids.session, {
      'organization_id': Ids.org,
      'round_table_id': Ids.table,
      'value_id': Ids.value4,
      'follow_up_value_id': Ids.value3,
      'status': status,
      'stage': stage,
      'scheduled_at': scheduledAt.toIso8601String(),
      'ended_at': endedAt,
    });
    // Last week's commitments: Ana and Luis attended, Marta did not.
    for (final (id, person, text) in [
      (Ids.anaPrevious, Ids.ana, 'Llamar a mi mamá 3 veces · esta semana'),
      (Ids.luisPrevious, Ids.luis, 'Llegar puntual · todos los días'),
    ]) {
      await db.seedSynced('member_commitments', id, {
        'organization_id': Ids.org,
        'round_table_id': Ids.table,
        'session_id': Ids.closedSession,
        'person_id': person,
        'value_id': Ids.value3,
        'action_text': text,
        'measure_text': 'Cuántas veces',
        'device_created_at': '2026-10-22T23:30:00Z',
      });
    }
  }
}
