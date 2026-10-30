import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/data/records/records.dart';
import 'package:gold_roundtables/core/models/assessment_kind.dart';
import 'package:gold_roundtables/core/models/attendance_status.dart';
import 'package:gold_roundtables/core/models/commitment_follow_up_status.dart';
import 'package:gold_roundtables/core/models/session_stage.dart';
import 'package:gold_roundtables/core/models/session_status.dart';
import 'package:gold_roundtables/core/models/user_role.dart';

void main() {
  group('SessionRecord', () {
    final json = <String, dynamic>{
      'id': 's1',
      'organization_id': 'o1',
      'round_table_id': 't1',
      'value_id': 'v1',
      'follow_up_value_id': 'v0',
      'status': 'open',
      'stage': 'follow_up',
      'scheduled_at': '2026-10-30T14:00:00+00:00',
      'started_at': '2026-10-30T14:02:00.123456+00:00',
      'ended_at': null,
      'completion': null,
      'kind': 'extraordinary',
      'original_scheduled_at': '2026-10-29T14:00:00+00:00',
      'facilitator_person_id': 'p1',
      'archived_at': null,
      'created_at': '2026-10-01T10:00:00+00:00',
      'updated_at': '2026-10-30T14:02:00+00:00',
    };

    test('parses a PostgREST row', () {
      final record = SessionRecord.fromJson(json);

      expect(record.status, SessionStatus.open);
      expect(record.stage, SessionStage.followUp);
      expect(record.scheduledAt, DateTime.utc(2026, 10, 30, 14));
      expect(record.endedAt, isNull);
      expect(record.kind, 'extraordinary');
      expect(record.followUpValueId, 'v0');
    });

    test('defaults kind to regular and ignores unknown columns', () {
      final record = SessionRecord.fromJson(
        {...json, 'kind': null, 'brand_new_column': 1}..remove('kind'),
      );

      expect(record.kind, 'regular');
    });

    test('round-trips through json', () {
      final record = SessionRecord.fromJson(json);

      expect(SessionRecord.fromJson(record.toJson()), record);
      expect(record.toJson()['round_table_id'], 't1');
    });
  });

  group('TableMemberRecord', () {
    final json = <String, dynamic>{
      'id': 'm1',
      'organization_id': 'o1',
      'round_table_id': 't1',
      'person_id': 'p1',
      'role': 'facilitator',
      'joined_at': '2026-09-01T10:00:00+00:00',
      'left_at': null,
      'left_reason': null,
      'status': 'active',
      'first_name': 'Ana',
      'last_name': 'Pérez',
      'auth_user_id': 'u1',
    };

    test('parses the denormalized names and role', () {
      final record = TableMemberRecord.fromJson(json);

      expect(record.role, UserRole.facilitator);
      expect(record.firstName, 'Ana');
      expect(record.lastName, 'Pérez');
      expect(record.leftAt, isNull);
    });

    test('round-trips through json', () {
      final record = TableMemberRecord.fromJson(json);

      expect(TableMemberRecord.fromJson(record.toJson()), record);
    });
  });

  group('MemberAssessmentRecord', () {
    final json = <String, dynamic>{
      'id': 'a1',
      'organization_id': 'o1',
      'round_table_id': 't1',
      'session_id': 's1',
      'person_id': 'p1',
      'value_id': 'v1',
      'kind': 'follow_up',
      'score': 8,
      'justification': 'Mejoré',
      'device_created_at': '2026-10-30T14:10:00+00:00',
      'received_at': '2026-10-30T14:10:01+00:00',
      'synced_late': true,
      'archived_at': null,
    };

    test('parses kind, score and the late flag', () {
      final record = MemberAssessmentRecord.fromJson(json);

      expect(record.kind, AssessmentKind.followUp);
      expect(record.score, 8);
      expect(record.syncedLate, isTrue);
    });

    test('defaults syncedLate to false', () {
      final record = MemberAssessmentRecord.fromJson(
        {...json}..remove('synced_late'),
      );

      expect(record.syncedLate, isFalse);
    });

    test('round-trips through json', () {
      final record = MemberAssessmentRecord.fromJson(json);

      expect(MemberAssessmentRecord.fromJson(record.toJson()), record);
    });
  });

  group('MemberCommitmentRecord', () {
    test('parses the follow-up written in the next session', () {
      final record = MemberCommitmentRecord.fromJson({
        'id': 'c1',
        'organization_id': 'o1',
        'round_table_id': 't1',
        'session_id': 's1',
        'person_id': 'p1',
        'value_id': 'v1',
        'action_text': 'Llamar a mamá',
        'measure_text': null,
        'follow_up_session_id': 's2',
        'follow_up_status': 'partial',
        'follow_up_synced_late': false,
      });

      expect(record.followUpStatus, CommitmentFollowUpStatus.partial);
      expect(record.followUpSessionId, 's2');
      expect(record.measureText, isNull);
    });
  });

  group('SessionAttendanceRecord', () {
    test('parses status and source', () {
      final record = SessionAttendanceRecord.fromJson({
        'id': 'at1',
        'organization_id': 'o1',
        'round_table_id': 't1',
        'session_id': 's1',
        'person_id': 'p1',
        'status': 'present',
        'source': 'auto_submission',
      });

      expect(record.status, AttendanceStatus.present);
      expect(record.source, 'auto_submission');
    });
  });
}
