import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/models/user_role.dart';
import 'package:gold_roundtables/features/auth/domain/models/account.dart';
import 'package:gold_roundtables/features/auth/domain/models/person_status.dart';

void main() {
  // Shape of GET /functions/v1/admin/me (api-contract.md §5).
  const meJson = {
    'auth_user_id': 'u1',
    'is_platform_admin': false,
    'people': [
      {
        'id': 'p1',
        'organization_id': 'org1',
        'first_name': 'Julia',
        'last_name': 'Ferrer',
        'position': null,
        'email': 'coord@dev.local',
        'phone': null,
        'status': 'active',
        'linked': true,
      },
    ],
    'contexts': [
      {
        'kind': 'coordinator',
        'person_id': 'p1',
        'organization_id': 'org1',
        'organization_name': 'Fundación Luz',
        'round_table_id': null,
        'label': 'Coordinador · Fundación Luz',
      },
      {
        'kind': 'member',
        'person_id': 'p1',
        'organization_id': 'org1',
        'organization_name': 'Fundación Luz',
        'round_table_id': 't1',
        'round_table_name': 'Mesa Fe 01',
        'round_table_code': 'LUZ-01',
        'label': 'Miembro · Mesa Fe 01',
      },
      {
        'kind': 'platform_admin',
        'person_id': 'p2',
        'organization_id': null,
        'round_table_id': null,
        'label': 'Administrador · Plataforma',
      },
    ],
  };

  test('parses the account and its contexts', () {
    final account = Account.fromJson(meJson);

    expect(account.people.single.status, PersonStatus.active);
    expect(account.contexts.map((c) => c.kind), [
      UserRole.coordinator,
      UserRole.member,
      UserRole.administrator,
    ]);
    expect(account.contexts[1].scopeName, 'Mesa Fe 01');
    expect(account.contexts[2].scopeName, isNull);
    expect(account.isUnknown, isFalse);
  });

  test('a context maps to the app-wide SessionContext', () {
    final member = Account.fromJson(meJson).contexts[1];
    final session = member.toSessionContext();

    expect(session.role, UserRole.member);
    expect(session.personId, 'p1');
    expect(session.organizationId, 'org1');
    expect(session.tableId, 't1');
    expect(session.tableName, 'Mesa Fe 01');
  });

  test('keys differ per role and table of the same person', () {
    final contexts = Account.fromJson(meJson).contexts;
    expect({for (final c in contexts) c.key}, hasLength(3));
  });

  test('unknown and deactivated identities are told apart', () {
    expect(const Account(authUserId: 'u').isUnknown, isTrue);
    final deactivated = Account.fromJson({
      ...meJson,
      'contexts': [],
      'people': [
        {
          ...(meJson['people']! as List).first as Map<String, dynamic>,
          'status': 'inactive',
        },
      ],
    });
    expect(deactivated.isDeactivated, isTrue);
    expect(deactivated.isUnknown, isFalse);
  });
}
