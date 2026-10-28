import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/features/calendar/data/client/calendar_client.dart';
import 'package:gold_roundtables/features/calendar/data/datasources/calendar_remote_data_source.dart';

class _Adapter implements HttpClientAdapter {
  final List<RequestOptions> requests = [];
  final List<Object> replies = [];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    return ResponseBody.fromString(
      jsonEncode(replies.removeAt(0)),
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

Map<String, dynamic> _table({
  String id = 't1',
  String name = 'Mesa Esperanza 03',
  String? pendingId = 's1',
  String pendingStatus = 'scheduled',
  String? kind,
  String? original,
}) => {
  'id': id,
  'name': name,
  'location_id': 'l1',
  'location_name': 'Sede Central',
  'timezone': 'America/Santo_Domingo',
  'facilitator_person_id': 'f1',
  'facilitator_name': 'Sofía Herrera',
  'pending_session_id': pendingId,
  'pending_session_status': pendingId == null ? null : pendingStatus,
  'pending_session_at': pendingId == null ? null : '2026-10-29T23:00:00+00:00',
  'pending_session_kind': kind,
  'pending_session_original_at': original,
};

void main() {
  late _Adapter adapter;
  late CalendarRemoteDataSource source;
  final now = DateTime.utc(2026, 10, 26, 12);

  setUp(() {
    adapter = _Adapter();
    source = CalendarRemoteDataSource(
      CalendarClient(
        Dio(BaseOptions(baseUrl: 'http://x/rest/v1'))
          ..httpClientAdapter = adapter,
      ),
    );
  });

  test(
    'asks for the active tables of the organization and future cancellations',
    () async {
      adapter.replies
        ..add([_table()])
        ..add(<Object>[]);
      await source.fetch(now: now, organizationId: 'org-1');

      final tables = adapter.requests[0];
      expect(tables.path, '/admin_tables');
      expect(tables.queryParameters['status'], 'eq.active');
      expect(tables.queryParameters['organization_id'], 'eq.org-1');
      expect(tables.queryParameters.containsKey('id'), isFalse);

      final sessions = adapter.requests[1];
      expect(sessions.path, '/sessions');
      expect(sessions.queryParameters['status'], 'eq.cancelled');
      expect(sessions.queryParameters['archived_at'], 'is.null');
      expect(
        sessions.queryParameters['scheduled_at'],
        'gte.2026-10-26T12:00:00.000Z',
      );
    },
  );

  test('narrows both reads to one table', () async {
    adapter.replies
      ..add(<Object>[])
      ..add(<Object>[]);
    await source.fetch(now: now, tableId: 't1');
    expect(adapter.requests[0].queryParameters['id'], 'eq.t1');
    expect(adapter.requests[1].queryParameters['round_table_id'], 'eq.t1');
  });

  test(
    'maps pending sessions with their markers, skipping tables without one',
    () async {
      adapter.replies
        ..add([
          _table(
            kind: 'extraordinary',
            original: '2026-10-28T23:00:00+00:00',
            pendingStatus: 'open',
          ),
          _table(id: 't2', name: 'Mesa Norte', pendingId: null),
        ])
        ..add(<Object>[]);
      final records = await source.fetch(now: now);

      expect(records, hasLength(1));
      final record = records.single;
      expect(record.id, 's1');
      expect(record.status, 'open');
      expect(record.scheduledAt, DateTime.utc(2026, 10, 29, 23));
      expect(record.isExtraordinary, isTrue);
      expect(record.originalScheduledAt, DateTime.utc(2026, 10, 28, 23));
      expect(record.locationName, 'Sede Central');
      expect(record.facilitatorName, 'Sofía Herrera');
    },
  );

  test('lists cancelled meetings but not those of a closed table', () async {
    adapter.replies
      ..add([_table()])
      ..add([
        {
          'id': 'c1',
          'round_table_id': 't1',
          'scheduled_at': '2026-11-05T23:00:00+00:00',
          'kind': 'regular',
          'original_scheduled_at': null,
          'cancelled_reason': 'Feriado',
        },
        {
          'id': 'c2',
          'round_table_id': 't1',
          'scheduled_at': '2026-11-12T23:00:00+00:00',
          'kind': 'regular',
          'cancelled_reason': 'table_closed',
        },
        {
          'id': 'c3',
          'round_table_id': 'other-org-table',
          'scheduled_at': '2026-11-19T23:00:00+00:00',
          'kind': 'regular',
        },
      ]);
    final records = await source.fetch(now: now);

    expect(records.map((r) => r.id), ['s1', 'c1']);
    final cancelled = records.last;
    expect(cancelled.status, 'cancelled');
    expect(cancelled.tableName, 'Mesa Esperanza 03');
    expect(cancelled.timezone, 'America/Santo_Domingo');
  });
}
