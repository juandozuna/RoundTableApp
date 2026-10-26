import 'dart:convert';
import 'dart:typed_data';

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
import 'package:gold_roundtables/features/admin/domain/models/record_status.dart';
import 'package:gold_roundtables/features/admin/domain/models/table_input.dart';
import 'package:gold_roundtables/features/kpis/data/client/answers_reveal_client.dart';
import 'package:gold_roundtables/features/kpis/data/client/kpi_client.dart';
import 'package:gold_roundtables/features/kpis/data/datasources/kpi_remote_data_source.dart';
import 'package:gold_roundtables/features/kpis/domain/models/kpi_dimension.dart';
import 'package:gold_roundtables/features/kpis/domain/models/kpi_filters.dart';

class RecordedRequest {
  RecordedRequest(this.options, this.body);

  final RequestOptions options;
  final Object? body;

  String get method => options.method;
  String get path => options.path;
  Map<String, dynamic> get query => options.queryParameters;
}

/// Answers each request with the next canned reply and records it.
class ScriptedAdapter implements HttpClientAdapter {
  final List<RecordedRequest> requests = [];
  final List<({int status, Object? body})> replies = [];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(RecordedRequest(options, options.data));
    final reply = replies.isEmpty
        ? (status: 200, body: <String, dynamic>{})
        : replies.removeAt(0);
    return ResponseBody.fromString(
      jsonEncode(reply.body),
      reply.status,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

Map<String, dynamic> _org({String id = 'o1'}) => {
  'id': id,
  'name': 'Fundación Luz',
  'kind': 'foundation',
  'country_code': 'DO',
  'country_name': 'República Dominicana',
  'status': 'active',
};

void main() {
  late ScriptedAdapter adapter;
  late AdminRemoteDataSource admin;
  late KpiRemoteDataSource kpis;

  setUp(() {
    adapter = ScriptedAdapter();
    Dio dio(String base) =>
        Dio(BaseOptions(baseUrl: base))..httpClientAdapter = adapter;
    final rest = dio('http://x/rest/v1');
    final edge = dio('http://x/functions/v1');
    admin = AdminRemoteDataSource(
      AdminReadClient(rest),
      AdminWriteClient(edge),
      AdminInvitesClient(edge),
    );
    kpis = KpiRemoteDataSource(KpiClient(rest), AnswersRevealClient(edge));
  });

  group('reads', () {
    test('filters by organization with PostgREST syntax', () async {
      adapter.replies.add((status: 200, body: <Object>[]));
      await admin.people(organizationId: 'o1');
      final request = adapter.requests.single;
      expect(request.path, '/admin_people');
      expect(request.query['organization_id'], 'eq.o1');
    });

    test('a missing row is a not-found failure', () async {
      adapter.replies.add((status: 200, body: <Object>[]));
      expect(
        admin.table('nope'),
        throwsA(
          isA<ApiException>().having(
            (e) => e.kind,
            'kind',
            ApiErrorKind.notFound,
          ),
        ),
      );
    });

    test('parses organizations', () async {
      adapter.replies.add((status: 200, body: [_org()]));
      final orgs = await admin.organizations();
      expect(orgs.single.countryCode, 'DO');
    });
  });

  group('writes', () {
    test('create organization posts snake_case fields without nulls', () async {
      adapter.replies.add((status: 201, body: {'organization': _org()}));
      final org = await admin.createOrganization(
        const OrganizationInput(
          name: 'Fundación Luz',
          kind: 'foundation',
          countryCode: 'DO',
          countryName: 'República Dominicana',
        ),
      );
      expect(org.id, 'o1');
      final request = adapter.requests.single;
      expect(request.method, 'POST');
      expect(request.path, '/admin/organizations');
      expect(request.body, {
        'name': 'Fundación Luz',
        'kind': 'foundation',
        'country_code': 'DO',
        'country_name': 'República Dominicana',
      });
    });

    test('status change sends the wire value', () async {
      adapter.replies.add((status: 200, body: {'organization': _org()}));
      await admin.setOrganizationStatus('o1', OrganizationStatus.paused);
      expect(adapter.requests.single.path, '/admin/organizations/o1/status');
      expect(adapter.requests.single.body, {'status': 'paused'});
    });

    test('location update sends only what changed', () async {
      adapter.replies.add((
        status: 200,
        body: {
          'location': {
            'id': 'l1',
            'organization_id': 'o1',
            'name': 'Sede',
            'status': 'inactive',
          },
        },
      ));
      final location = await admin.updateLocation(
        'l1',
        const LocationInput(status: RecordStatus.inactive),
      );
      expect(location.status, RecordStatus.inactive);
      expect(adapter.requests.single.method, 'PATCH');
      expect(adapter.requests.single.body, {'status': 'inactive'});
    });

    test(
      'create table carries the facilitator and returns their invite',
      () async {
        adapter.replies.add((
          status: 201,
          body: {
            'table': {
              'id': 't1',
              'facilitator_invite': {
                'id': 'i1',
                'code': 'ABC234',
                'role_kind': 'facilitator',
                'invite_url': 'http://app/invite/ABC234',
              },
            },
          },
        ));
        final change = await admin.createTable(
          organizationId: 'o1',
          input: const TableInput(
            locationId: 'l1',
            name: 'Mesa Fe',
            code: 'LUZ-07',
            weekday: 2,
            startTime: '19:00',
            timezone: 'America/Santo_Domingo',
          ),
          facilitator: const PersonRef.registered(
            PersonInput(firstName: 'Ana', lastName: 'Pérez', email: 'a@x.org'),
          ),
        );
        expect(change.tableId, 't1');
        expect(change.facilitatorInvite!.code, 'ABC234');
        final body = adapter.requests.single.body! as Map<String, dynamic>;
        expect(body['organization_id'], 'o1');
        expect(body['start_time'], '19:00');
        expect(body['facilitator'], {
          'person': {
            'first_name': 'Ana',
            'last_name': 'Pérez',
            'email': 'a@x.org',
          },
        });
      },
    );

    test(
      'change facilitator sends the existing person and the keep flag',
      () async {
        adapter.replies.add((
          status: 200,
          body: {
            'table': {'id': 't1'},
          },
        ));
        await admin.changeFacilitator(
          tableId: 't1',
          facilitator: const PersonRef.existing('p9'),
          keepPreviousAsMember: false,
        );
        expect(adapter.requests.single.path, '/admin/tables/t1/facilitator');
        expect(adapter.requests.single.body, {
          'person_id': 'p9',
          'keep_previous_as_member': false,
        });
      },
    );

    test('move and deactivate hit the membership routes', () async {
      await admin.moveMember('m1', 't2');
      await admin.deactivateMember('m1');
      expect(adapter.requests[0].path, '/admin/members/m1/move');
      expect(adapter.requests[0].body, {'to_round_table_id': 't2'});
      expect(adapter.requests[1].path, '/admin/members/m1/deactivate');
      // The Edge Function reads a JSON body even for this action.
      expect(adapter.requests[1].body, isA<Map<String, dynamic>>());
    });

    test('typed server errors keep their code', () async {
      adapter.replies.add((
        status: 409,
        body: {
          'error': {
            'code': 'table_full',
            'message': 'La mesa ya tiene 9 personas',
          },
        },
      ));
      expect(
        admin.addMember('t1', 'p1'),
        throwsA(
          isA<ApiException>()
              .having((e) => e.code, 'code', 'table_full')
              .having((e) => e.kind, 'kind', ApiErrorKind.conflict),
        ),
      );
    });

    test('invite for a member uses the table and the person payload', () async {
      adapter.replies.add((
        status: 201,
        body: {
          'invite': {
            'id': 'i1',
            'code': 'MESA34',
            'role_kind': 'member',
            'person': {'id': 'p1', 'first_name': 'Rodrigo', 'last_name': 'Paz'},
          },
        },
      ));
      final share = await admin.createInvite(
        const InviteRequest(
          roleKind: InviteRoleKind.member,
          roundTableId: 't1',
          person: PersonRef.registered(
            PersonInput(firstName: 'Rodrigo', lastName: 'Paz'),
          ),
        ),
      );
      expect(share.personName, 'Rodrigo Paz');
      final request = adapter.requests.single;
      expect(request.path, '/invites');
      expect(request.body, {
        'role_kind': 'member',
        'round_table_id': 't1',
        'person': {'first_name': 'Rodrigo', 'last_name': 'Paz'},
      });
    });
  });

  group('kpis', () {
    test(
      'breakdown sends the dimension with the active filters only',
      () async {
        adapter.replies.add((status: 200, body: <Object>[]));
        await kpis.breakdown(
          KpiDimension.roundTable,
          const KpiFilters(country: 'DO'),
        );
        final request = adapter.requests.single;
        expect(request.path, '/rpc/kpi_breakdown');
        expect(request.body, {'p_dimension': 'round_table', 'p_country': 'DO'});
      },
    );

    test('PostgREST "forbidden" becomes a permission failure', () async {
      adapter.replies.add((
        status: 400,
        body: {
          'code': 'P0001',
          'message': 'forbidden',
          'details': 'Sin permiso',
        },
      ));
      expect(
        kpis.memberDetail('t1'),
        throwsA(
          isA<ApiException>().having(
            (e) => e.kind,
            'kind',
            ApiErrorKind.forbidden,
          ),
        ),
      );
    });

    test('reveal asks for one person of one table', () async {
      adapter.replies.add((
        status: 200,
        body: {'round_table_id': 't1', 'people': <Object>[]},
      ));
      await kpis.revealAnswers(roundTableId: 't1', personId: 'p1');
      expect(adapter.requests.single.path, '/answers-reveal');
      expect(adapter.requests.single.body, {
        'round_table_id': 't1',
        'person_id': 'p1',
      });
    });
  });
}
