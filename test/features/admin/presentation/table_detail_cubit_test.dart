import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/network/api_exception.dart';
import 'package:gold_roundtables/features/admin/domain/models/admin_table.dart';
import 'package:gold_roundtables/features/admin/domain/models/membership_role.dart';
import 'package:gold_roundtables/features/admin/domain/models/person_input.dart';
import 'package:gold_roundtables/features/admin/domain/models/table_change.dart';
import 'package:gold_roundtables/features/admin/domain/models/table_membership.dart';
import 'package:gold_roundtables/features/admin/domain/services/admin_management_service.dart';
import 'package:gold_roundtables/features/admin/domain/use_cases/directory/load_table_detail_use_case.dart';
import 'package:gold_roundtables/features/admin/domain/use_cases/tables/add_member_to_table_use_case.dart';
import 'package:gold_roundtables/features/admin/domain/use_cases/tables/change_facilitator_use_case.dart';
import 'package:gold_roundtables/features/admin/domain/use_cases/tables/deactivate_member_use_case.dart';
import 'package:gold_roundtables/features/admin/domain/use_cases/tables/move_member_use_case.dart';
import 'package:gold_roundtables/features/admin/presentation/pages/table_detail/cubit/table_detail_cubit.dart';
import 'package:gold_roundtables/features/admin/presentation/pages/table_detail/cubit/table_detail_state.dart';
import 'package:mocktail/mocktail.dart';

import '../fakes.dart';

class MockManagement extends Mock implements AdminManagementService {}

void main() {
  late FakeDirectory directory;
  late MockManagement management;

  TableDetailCubit build() => TableDetailCubit(
    LoadTableDetailUseCase(directory, FakeKpiService()),
    ChangeFacilitatorUseCase(management),
    AddMemberToTableUseCase(management),
    MoveMemberUseCase(management),
    DeactivateMemberUseCase(management),
  );

  setUpAll(() => registerFallbackValue(const PersonRef.existing('x')));

  setUp(() {
    management = MockManagement();
    directory = FakeDirectory(
      tableRows: [
        const AdminTable(
          id: 't1',
          organizationId: 'o1',
          organizationName: 'Luz',
          name: 'Fe',
          code: 'LUZ-01',
          activePeople: 9,
        ),
        const AdminTable(
          id: 't2',
          organizationId: 'o1',
          organizationName: 'Luz',
          name: 'Alba',
          code: 'LUZ-02',
          activePeople: 4,
        ),
      ],
      memberRows: [
        const TableMembership(
          id: 'm1',
          personId: 'p1',
          firstName: 'Ana',
          lastName: 'Pérez',
          role: MembershipRole.facilitator,
        ),
      ],
    );
  });

  test('load gathers seats, sibling tables for moves and the table', () async {
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load('t1');
    final detail = cubit.state.detail!;
    expect(detail.table.isFull, isTrue);
    expect(detail.organizationTables.single.id, 't2');
    expect(detail.activeMembers.single.fullName, 'Ana Pérez');
  });

  blocTest<TableDetailCubit, TableDetailState>(
    'a typed server error (table_full) is surfaced and nothing is reloaded',
    build: build,
    setUp: () {
      when(
        () => management.moveMember(
          tableMemberId: any(named: 'tableMemberId'),
          toTableId: any(named: 'toTableId'),
        ),
      ).thenThrow(
        const ApiException(
          kind: ApiErrorKind.conflict,
          code: 'table_full',
          statusCode: 409,
        ),
      );
    },
    act: (cubit) async {
      await cubit.load('t1');
      await cubit.moveMember(
        tableMemberId: 'm1',
        toTableId: 't2',
        personName: 'Ana',
      );
    },
    verify: (cubit) {
      expect(cubit.state.actionError!.code, 'table_full');
      expect(cubit.state.working, isFalse);
      expect(cubit.state.notice, isNull);
    },
  );

  test('a successful change reports what happened and reloads', () async {
    when(
      () => management.changeFacilitator(
        tableId: any(named: 'tableId'),
        facilitator: any(named: 'facilitator'),
        keepPreviousAsMember: any(named: 'keepPreviousAsMember'),
      ),
    ).thenAnswer((_) async => const TableChange(tableId: 't1'));
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load('t1');
    await cubit.changeFacilitator(
      personId: 'p2',
      personName: 'Luis',
      keepPreviousAsMember: true,
    );
    expect(cubit.state.notice, TableNotice.facilitatorChanged);
    expect(cubit.state.noticeName, 'Luis');
    verify(
      () => management.changeFacilitator(
        tableId: 't1',
        facilitator: const PersonRef.existing('p2'),
        keepPreviousAsMember: true,
      ),
    ).called(1);
  });

  test(
    'a table outside the user scope is a not-found failure the page denies',
    () async {
      final cubit = build();
      addTearDown(cubit.close);
      await cubit.load('missing');
      expect(cubit.state.status, TableDetailStatus.failure);
      expect(cubit.state.error!.kind, ApiErrorKind.notFound);
    },
  );
}
