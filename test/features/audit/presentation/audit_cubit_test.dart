import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/features/admin/domain/use_cases/directory/load_organizations_use_case.dart';
import 'package:gold_roundtables/features/audit/domain/models/audit_category.dart';
import 'package:gold_roundtables/features/audit/domain/models/audit_event.dart';
import 'package:gold_roundtables/features/audit/domain/models/audit_query.dart';
import 'package:gold_roundtables/features/audit/domain/services/audit_service.dart';
import 'package:gold_roundtables/features/audit/domain/use_cases/load_audit_events_use_case.dart';
import 'package:gold_roundtables/features/audit/presentation/pages/audit/cubit/audit_cubit.dart';
import 'package:gold_roundtables/features/audit/presentation/pages/audit/cubit/audit_state.dart';
import 'package:gold_roundtables/features/kpis/domain/use_cases/export/export_csv_use_case.dart';

import '../../admin/fakes.dart';

class _Audit implements AuditService {
  final List<AuditQuery> queries = [];
  List<AuditEvent> all = [
    AuditEvent(
      id: '1',
      eventType: 'table.created',
      actorName: 'Julia Ferrer',
      createdAt: DateTime.utc(2026, 10, 25),
    ),
    AuditEvent(
      id: '2',
      eventType: 'answers.revealed',
      actorName: 'Marisol Peña',
      createdAt: DateTime.utc(2026, 10, 24),
    ),
  ];

  @override
  Future<List<AuditEvent>> events(AuditQuery query) async {
    queries.add(query);
    final category = query.category;
    return [
      for (final e in all)
        if (category == null || category.eventTypes.contains(e.eventType)) e,
    ];
  }
}

void main() {
  late _Audit audit;

  AuditCubit build() => AuditCubit(
    LoadAuditEventsUseCase(audit),
    LoadOrganizationsUseCase(FakeDirectory()),
    ExportCsvUseCase(RecordingCsvExport()),
  );

  setUp(() => audit = _Audit());

  test('loads newest first from the server and sends the page size', () async {
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();
    expect(cubit.state.status, AuditStatus.ready);
    expect(cubit.state.events, hasLength(2));
    expect(audit.queries.single.limit, 100);
  });

  test('type chips are applied by the server', () async {
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();
    await cubit.setCategory(AuditCategory.sensitive);
    expect(audit.queries.last.category, AuditCategory.sensitive);
    expect(cubit.state.events.single.eventType, 'answers.revealed');
  });

  test('search filters what is already loaded, ignoring case', () async {
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();
    cubit.search('JULIA');
    final visible = cubit.visible((e) => e.actorName ?? '');
    expect(visible.single.id, '1');
    expect(audit.queries, hasLength(1), reason: 'no extra request');
  });

  test('a full page offers "cargar más" and grows the limit', () async {
    audit.all = [
      for (var i = 0; i < 100; i++)
        AuditEvent(
          id: '$i',
          eventType: 'table.created',
          createdAt: DateTime.utc(2026, 10, 25),
        ),
    ];
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();
    expect(cubit.state.hasMore, isTrue);
    await cubit.loadMore();
    expect(audit.queries.last.limit, 200);
  });

  test('categories cover every event type the server writes', () {
    const known = [
      'organization.created',
      'organization.updated',
      'organization.status_changed',
      'location.created',
      'location.updated',
      'table.created',
      'table.updated',
      'table.facilitator_changed',
      'member.added',
      'member.moved',
      'member.deactivated',
      'invite.created',
      'invite.revoked',
      'invite.renewed',
      'invite.accepted',
      'person.updated',
      'person.deactivated',
      'role.granted',
      'role.revoked',
      'session.opened',
      'session.closed',
      'session.cancelled',
      'answers.revealed',
    ];
    for (final type in known) {
      expect(AuditCategory.forEventType(type), isNotNull, reason: type);
    }
  });
}
