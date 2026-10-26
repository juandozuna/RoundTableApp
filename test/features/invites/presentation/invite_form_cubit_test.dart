import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/models/user_role.dart';
import 'package:gold_roundtables/core/services/connectivity/watch_connectivity_use_case.dart';
import 'package:gold_roundtables/core/services/session_context/session_context.dart';
import 'package:gold_roundtables/core/services/session_context/watch_session_context_use_case.dart';
import 'package:gold_roundtables/features/invites/domain/models/invite_defaults.dart';
import 'package:gold_roundtables/features/invites/domain/models/invite_problem.dart';
import 'package:gold_roundtables/features/invites/domain/models/invite_role_kind.dart';
import 'package:gold_roundtables/features/invites/domain/models/person_draft.dart';
import 'package:gold_roundtables/features/invites/domain/use_cases/manage/create_invite_use_case.dart';
import 'package:gold_roundtables/features/invites/domain/use_cases/manage/load_invite_targets_use_case.dart';
import 'package:gold_roundtables/features/invites/domain/use_cases/manage/load_organization_tables_use_case.dart';
import 'package:gold_roundtables/features/invites/presentation/pages/form/cubit/invite_form_cubit.dart';
import 'package:gold_roundtables/features/invites/presentation/pages/form/cubit/invite_form_state.dart';

import '../helpers/fakes.dart';

void main() {
  late FakeInviteService invites;
  late FakeDirectory directory;
  late FakeConnectivity connectivity;
  const person = PersonDraft(
    firstName: 'Rodrigo',
    lastName: 'Paz',
    email: 'rodrigo@ejemplo.org',
    phone: '+18095550101',
  );

  Future<InviteFormCubit> ready(SessionContext context) async {
    final cubit = InviteFormCubit(
      LoadInviteTargetsUseCase(directory),
      LoadOrganizationTablesUseCase(directory),
      CreateInviteUseCase(invites),
      WatchSessionContextUseCase(FakeSessionContext(context)),
      WatchConnectivityUseCase(connectivity),
    );
    await cubit.stream.firstWhere((s) => s.status != InviteFormStatus.loading);
    return cubit;
  }

  setUp(() {
    invites = FakeInviteService();
    directory = FakeDirectory();
    connectivity = FakeConnectivity();
  });

  test('a facilitator can only invite members to their own table', () async {
    final cubit = await ready(facilitatorSession);

    expect(cubit.state.roles, [InviteRoleKind.member]);
    expect(cubit.state.tableId, 'table-esperanza');
    expect(cubit.state.tables, hasLength(1));
    expect(cubit.state.selectedTable?.freeSeats, 1);
    cubit.selectRole(InviteRoleKind.coordinator); // locked
    expect(cubit.state.role, InviteRoleKind.member);
    await cubit.close();
  });

  test('a member is denied before anything loads', () async {
    final cubit = await ready(memberSession);
    expect(cubit.state.status, InviteFormStatus.denied);
    await cubit.close();
  });

  test('a coordinator picks among the tables of their organization', () async {
    final cubit = await ready(coordinatorSession);

    expect(cubit.state.roles, [
      InviteRoleKind.member,
      InviteRoleKind.facilitator,
      InviteRoleKind.coordinator,
    ]);
    expect(cubit.state.tables.map((t) => t.id), [
      'table-esperanza',
      'table-fe',
    ]);
    // First table with room.
    expect(cubit.state.tableId, 'table-esperanza');

    cubit.selectTable('table-fe'); // 9/9
    expect(cubit.state.tableIsFull, isTrue);
    expect(cubit.state.canSubmit, isFalse);
    await cubit.close();
  });

  test('a coordinator invite needs the organization, not a table', () async {
    final cubit = await ready(coordinatorSession);
    cubit.selectTable('table-fe'); // full, but irrelevant for this role
    cubit.selectRole(InviteRoleKind.coordinator);

    expect(cubit.state.needsTable, isFalse);
    expect(cubit.state.canSubmit, isTrue);

    await cubit.submit(person);
    expect(invites.lastCreated?.roleKind, InviteRoleKind.coordinator);
    expect(invites.lastCreated?.organizationId, 'org-luz');
    expect(invites.lastCreated?.roundTableId, isNull);
    expect(invites.lastCreated?.expiresInDays, InviteDefaults.expiresInDays);
    expect(cubit.state.created?.person.firstName, 'Rodrigo');
    await cubit.close();
  });

  test('a facilitator invite is blocked on a table that has one', () async {
    final cubit = await ready(coordinatorSession);
    cubit.selectRole(InviteRoleKind.facilitator);

    expect(cubit.state.facilitatorTaken, isTrue);
    expect(cubit.state.canSubmit, isFalse);
    await cubit.close();
  });

  test(
    'an administrator chooses the organization, which reloads its tables',
    () async {
      final cubit = await ready(
        const SessionContext(role: UserRole.administrator, personId: 'p-admin'),
      );
      expect(cubit.state.organizations, hasLength(2));
      expect(cubit.state.organizationId, 'org-luz');

      await cubit.selectOrganization('org-hor');
      expect(cubit.state.tables.single.id, 'table-hor');
      expect(cubit.state.tableId, 'table-hor');
      expect(cubit.state.canSubmit, isTrue);
      await cubit.close();
    },
  );

  test(
    'creates a member invite for the chosen table and hands it over',
    () async {
      final cubit = await ready(facilitatorSession);
      await cubit.submit(person);

      expect(invites.lastCreated?.roundTableId, 'table-esperanza');
      expect(invites.lastCreated?.organizationId, isNull);
      expect(cubit.state.created, isNotNull);
      expect(cubit.state.submitting, isFalse);

      cubit.consumeCreated();
      expect(cubit.state.created, isNull);
      await cubit.close();
    },
  );

  test('server refusals stay on the form with their reason', () async {
    invites.createFailure = const InviteFailure(InviteProblem.pendingExists);
    final cubit = await ready(facilitatorSession);
    await cubit.submit(person);

    expect(cubit.state.problem, InviteProblem.pendingExists);
    expect(cubit.state.created, isNull);
    expect(cubit.state.canSubmit, isTrue);
    await cubit.close();
  });

  test('cannot submit offline', () async {
    final cubit = await ready(facilitatorSession);
    connectivity.controller.add(false);
    await Future<void>.delayed(Duration.zero);

    expect(cubit.state.canSubmit, isFalse);
    await cubit.submit(person);
    expect(invites.calls, isNot(contains('create')));
    await cubit.close();
  });
}
