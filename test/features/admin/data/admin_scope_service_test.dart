import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/models/user_role.dart';
import 'package:gold_roundtables/core/services/session_context/in_memory_session_context_service.dart';
import 'package:gold_roundtables/core/services/session_context/session_context.dart';
import 'package:gold_roundtables/features/admin/data/client/admin_invites_client.dart';
import 'package:gold_roundtables/features/admin/data/client/admin_read_client.dart';
import 'package:gold_roundtables/features/admin/data/client/admin_write_client.dart';
import 'package:gold_roundtables/features/admin/data/datasources/admin_remote_data_source.dart';
import 'package:gold_roundtables/features/admin/data/services/admin_scope_service_impl.dart';

import 'admin_remote_data_source_test.dart';

void main() {
  late ScriptedAdapter adapter;
  late InMemorySessionContextService context;
  late AdminScopeServiceImpl service;

  setUp(() {
    adapter = ScriptedAdapter();
    Dio dio(String base) =>
        Dio(BaseOptions(baseUrl: base))..httpClientAdapter = adapter;
    final edge = dio('http://x/functions/v1');
    context = InMemorySessionContextService();
    service = AdminScopeServiceImpl(
      context,
      AdminRemoteDataSource(
        AdminReadClient(dio('http://x/rest/v1')),
        AdminWriteClient(edge),
        AdminInvitesClient(edge),
      ),
    );
  });

  test('administrator context sees everything', () async {
    await context.select(const SessionContext(role: UserRole.administrator));
    final scope = await service.watch().first;
    expect(scope!.isAdministrator, isTrue);
    expect(scope.canAccessOrganization('any'), isTrue);
  });

  test('coordinator context is limited to their organization', () async {
    await context.select(
      const SessionContext(
        role: UserRole.coordinator,
        organizationId: 'o1',
        organizationName: 'Fundación Luz',
      ),
    );
    final scope = (await service.watch().first)!;
    expect(scope.isAdministrator, isFalse);
    expect(scope.canAccessOrganization('o1'), isTrue);
    expect(scope.canAccessOrganization('o2'), isFalse);
  });

  test('members and facilitators have no administrative scope', () async {
    await context.select(const SessionContext(role: UserRole.member));
    expect(await service.watch().first, isNull);
  });

  test('without a context the server decides (platform admin)', () async {
    adapter.replies.add((status: 200, body: {'is_platform_admin': true}));
    expect((await service.watch().first)!.isAdministrator, isTrue);
    expect(adapter.requests.single.path, '/admin/me');
  });

  test('without a context a coordinator is found in the contexts', () async {
    adapter.replies.add((
      status: 200,
      body: {
        'is_platform_admin': false,
        'contexts': [
          {'kind': 'member', 'organization_id': 'o9'},
          {
            'kind': 'coordinator',
            'organization_id': 'o1',
            'organization_name': 'Fundación Luz',
          },
        ],
      },
    ));
    final scope = (await service.watch().first)!;
    expect(scope.organizationId, 'o1');
    expect(scope.isAdministrator, isFalse);
  });
}
