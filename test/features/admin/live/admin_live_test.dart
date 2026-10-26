// Exercises the real wire format of the administration, KPI and audit data
// layers against a running local Supabase stack. Skipped unless RT_LIVE=1:
//
//   RT_LIVE=1 RT_ANON_KEY=$(supabase status -o env | grep ^ANON_KEY | cut -d'"' -f2) \
//     flutter test test/features/admin/live
//
// It creates its own organization (unique name) and deactivates it at the end.
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/network/api_exception.dart';
import 'package:gold_roundtables/features/admin/data/client/admin_invites_client.dart';
import 'package:gold_roundtables/features/admin/data/client/admin_read_client.dart';
import 'package:gold_roundtables/features/admin/data/client/admin_write_client.dart';
import 'package:gold_roundtables/features/admin/data/datasources/admin_remote_data_source.dart';
import 'package:gold_roundtables/features/admin/domain/models/invite_request.dart';
import 'package:gold_roundtables/features/admin/domain/models/location_input.dart';
import 'package:gold_roundtables/features/admin/domain/models/organization_input.dart';
import 'package:gold_roundtables/features/admin/domain/models/organization_status.dart';
import 'package:gold_roundtables/features/admin/domain/models/person_input.dart';
import 'package:gold_roundtables/features/admin/domain/models/table_input.dart';
import 'package:gold_roundtables/features/audit/data/client/audit_client.dart';
import 'package:gold_roundtables/features/audit/data/datasources/audit_remote_data_source.dart';
import 'package:gold_roundtables/features/audit/domain/models/audit_category.dart';
import 'package:gold_roundtables/features/audit/domain/models/audit_query.dart';
import 'package:gold_roundtables/features/kpis/data/client/answers_reveal_client.dart';
import 'package:gold_roundtables/features/kpis/data/client/kpi_client.dart';
import 'package:gold_roundtables/features/kpis/data/datasources/kpi_remote_data_source.dart';
import 'package:gold_roundtables/features/kpis/domain/models/kpi_dimension.dart';
import 'package:gold_roundtables/features/kpis/domain/models/kpi_filters.dart';

const _base = 'http://127.0.0.1:54321';

Future<Dio> _dio(String path, String anon, String email) async {
  final auth = Dio(BaseOptions(baseUrl: _base));
  final response = await auth.post<Map<String, dynamic>>(
    '/auth/v1/token',
    queryParameters: {'grant_type': 'password'},
    data: {'email': email, 'password': 'dev-password-123'},
    options: Options(headers: {'apikey': anon}),
  );
  final token = response.data!['access_token'] as String;
  return Dio(
    BaseOptions(
      baseUrl: '$_base$path',
      headers: {'apikey': anon, 'Authorization': 'Bearer $token'},
    ),
  );
}

void main() {
  final live = Platform.environment['RT_LIVE'] == '1';
  final anon = Platform.environment['RT_ANON_KEY'] ?? '';

  group('live stack', skip: live ? false : 'set RT_LIVE=1 to run', () {
    late AdminRemoteDataSource admin;
    late AdminRemoteDataSource coordinator;
    late KpiRemoteDataSource kpis;
    late AuditRemoteDataSource audit;

    setUpAll(() async {
      final edge = await _dio('/functions/v1', anon, 'admin@dev.local');
      final rest = await _dio('/rest/v1', anon, 'admin@dev.local');
      admin = AdminRemoteDataSource(
        AdminReadClient(rest),
        AdminWriteClient(edge),
        AdminInvitesClient(edge),
      );
      kpis = KpiRemoteDataSource(KpiClient(rest), AnswersRevealClient(edge));
      audit = AuditRemoteDataSource(AuditClient(rest));
      final cEdge = await _dio('/functions/v1', anon, 'coord@dev.local');
      final cRest = await _dio('/rest/v1', anon, 'coord@dev.local');
      coordinator = AdminRemoteDataSource(
        AdminReadClient(cRest),
        AdminWriteClient(cEdge),
        AdminInvitesClient(cEdge),
      );
    });

    test('full management flow', () async {
      final stamp = DateTime.now().millisecondsSinceEpoch;
      final name = 'Prueba Admin $stamp';

      final org = await admin.createOrganization(
        OrganizationInput(
          name: name,
          kind: 'school',
          countryCode: 'CO',
          countryName: 'Colombia',
          region: 'Bogotá',
          contactName: 'Contacto Prueba',
          contactEmail: 'contacto$stamp@example.org',
        ),
      );
      expect(org.name, name);

      // Duplicate names are typed errors.
      await expectLater(
        admin.createOrganization(
          OrganizationInput(
            name: name,
            kind: 'school',
            countryCode: 'CO',
            countryName: 'Colombia',
          ),
        ),
        throwsA(
          isA<ApiException>().having(
            (e) => e.code,
            'code',
            'duplicate_organization',
          ),
        ),
      );

      final updated = await admin.updateOrganization(
        org.id,
        const OrganizationInput(region: 'Medellín'),
      );
      expect(updated.region, 'Medellín');

      final location = await admin.createLocation(
        org.id,
        const LocationInput(name: 'Sede Prueba', city: 'Bogotá'),
      );
      await admin.updateLocation(
        location.id,
        const LocationInput(address: 'Calle 1 # 2-3'),
      );
      expect((await admin.location(location.id)).address, 'Calle 1 # 2-3');

      final coordinatorInvite = await admin.createInvite(
        InviteRequest(
          roleKind: InviteRoleKind.coordinator,
          organizationId: org.id,
          person: PersonRef.registered(
            PersonInput(
              firstName: 'Cora',
              lastName: 'Prueba',
              email: 'cora$stamp@example.org',
            ),
          ),
        ),
      );
      expect(coordinatorInvite.code, hasLength(6));
      expect(coordinatorInvite.inviteUrl, contains(coordinatorInvite.code));

      final created = await admin.createTable(
        organizationId: org.id,
        input: TableInput(
          locationId: location.id,
          name: 'Mesa Prueba',
          code: 'TST-${stamp % 100}'.padRight(6, '0').substring(0, 6),
          weekday: 3,
          startTime: '18:30',
          timezone: 'America/Bogota',
        ),
        facilitator: PersonRef.registered(
          PersonInput(
            firstName: 'Fabio',
            lastName: 'Facilitador',
            email: 'fabio$stamp@example.org',
          ),
        ),
      );
      expect(created.facilitatorInvite, isNotNull);

      final table = await admin.table(created.tableId);
      expect(table.weekday, 3);
      expect(table.startTimeShort, '18:30');
      expect(table.activePeople, 1);
      expect(table.hasFacilitator, isTrue);

      // A second table with the same code is rejected with a typed error.
      await expectLater(
        admin.createTable(
          organizationId: org.id,
          input: TableInput(
            locationId: location.id,
            name: 'Otra',
            code: table.code,
            weekday: 1,
            startTime: '10:00',
            timezone: 'America/Bogota',
          ),
          facilitator: PersonRef.registered(
            PersonInput(
              firstName: 'Otro',
              lastName: 'Facil',
              email: 'otro$stamp@example.org',
            ),
          ),
        ),
        throwsA(
          isA<ApiException>().having(
            (e) => e.code,
            'code',
            'duplicate_table_code',
          ),
        ),
      );

      await admin.updateTable(table.id, const TableInput(startTime: '19:00'));
      expect((await admin.table(table.id)).startTimeShort, '19:00');

      // Fill the table to 9 and check the 10th seat is a typed error.
      final memberIds = <String>[];
      for (var i = 0; i < 9; i++) {
        try {
          final invite = await admin.createInvite(
            InviteRequest(
              roleKind: InviteRoleKind.member,
              roundTableId: table.id,
              person: PersonRef.registered(
                PersonInput(
                  firstName: 'Miembro$i',
                  lastName: 'Prueba',
                  email: 'm$i-$stamp@example.org',
                ),
              ),
            ),
          );
          memberIds.add(invite.person!.id!);
        } on ApiException catch (error) {
          expect(i, 8, reason: 'only the 9th (10th person) may fail');
          expect(error.code, 'table_full');
        }
      }
      expect((await admin.table(table.id)).activePeople, 9);

      final memberships = await admin.memberships(table.id);
      final member = memberships.firstWhere((m) => m.role.name == 'member');
      await admin.deactivateMember(member.id);
      expect((await admin.table(table.id)).activePeople, 8);
      expect(
        (await admin.memberships(table.id)).where((m) => !m.isActive),
        isNotEmpty,
        reason: 'history is kept',
      );

      // Change facilitator to a current member, keeping the previous one.
      final other = (await admin.memberships(
        table.id,
      )).firstWhere((m) => m.isActive && m.role.name == 'member');
      final changed = await admin.changeFacilitator(
        tableId: table.id,
        facilitator: PersonRef.existing(other.personId),
        keepPreviousAsMember: true,
      );
      expect(changed.tableId, table.id);
      expect((await admin.table(table.id)).facilitatorPersonId, other.personId);

      // People view reflects invited people.
      final people = await admin.people(organizationId: org.id);
      expect(people.length, greaterThanOrEqualTo(10));

      // A coordinator of another organization cannot see this one.
      expect(
        () => coordinator.organization(org.id),
        throwsA(
          isA<ApiException>().having(
            (e) => e.kind,
            'kind',
            ApiErrorKind.notFound,
          ),
        ),
      );

      // KPIs and audit see it.
      // Rollups refresh every few minutes, so a brand-new table may not be
      // listed yet; the call itself must work.
      final tables = await kpis.tables(KpiFilters(organizationId: org.id));
      expect(tables.length, lessThanOrEqualTo(1));
      final members = await kpis.memberDetail(table.id);
      expect(members, isA<List<Object>>());
      final events = await audit.events(
        AuditQuery(organizationId: org.id, category: AuditCategory.created),
      );
      expect(events.map((e) => e.eventType), contains('table.created'));

      await admin.setOrganizationStatus(org.id, OrganizationStatus.paused);
      await expectLater(
        admin.createLocation(org.id, const LocationInput(name: 'Nueva')),
        throwsA(
          isA<ApiException>().having(
            (e) => e.code,
            'code',
            'organization_inactive',
          ),
        ),
      );
      await admin.setOrganizationStatus(org.id, OrganizationStatus.inactive);
    });

    test('KPI reads and the reveal gate', () async {
      final summary = await kpis.summary(KpiFilters.none);
      expect(summary.sessionsClosed, greaterThan(0));
      final weekly = await kpis.weeklySeries(
        KpiFilters(from: DateTime.now().subtract(const Duration(days: 90))),
      );
      expect(weekly, isNotEmpty);
      for (final dimension in KpiDimension.values) {
        await kpis.breakdown(dimension, KpiFilters.none);
      }
      final luz = (await kpis.tables(
        KpiFilters.none,
      )).firstWhere((t) => t.code == 'LUZ-03');
      final before = (await audit.events(
        const AuditQuery(category: AuditCategory.sensitive),
      )).length;
      final revealed = await kpis.revealAnswers(roundTableId: luz.roundTableId);
      expect(revealed.people, isNotEmpty);
      final after = (await audit.events(
        const AuditQuery(category: AuditCategory.sensitive, limit: 500),
      )).length;
      expect(after, greaterThan(before));
    });

    test('forbidden member detail is mapped to a permission failure', () async {
      final edge = await _dio('/functions/v1', anon, 'ana@dev.local');
      final rest = await _dio('/rest/v1', anon, 'ana@dev.local');
      final asMember = KpiRemoteDataSource(
        KpiClient(rest),
        AnswersRevealClient(edge),
      );
      final luz = (await kpis.tables(
        KpiFilters.none,
      )).firstWhere((t) => t.code == 'LUZ-03');
      await expectLater(
        asMember.memberDetail(luz.roundTableId),
        throwsA(
          isA<ApiException>().having(
            (e) => e.kind,
            'kind',
            ApiErrorKind.forbidden,
          ),
        ),
      );
    });
  });
}
