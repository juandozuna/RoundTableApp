import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/network/api_exception.dart';
import 'package:gold_roundtables/features/admin/domain/models/admin_table.dart';
import 'package:gold_roundtables/features/admin/domain/models/person_input.dart';
import 'package:gold_roundtables/features/admin/domain/models/program_value.dart';
import 'package:gold_roundtables/features/admin/domain/models/table_change.dart';
import 'package:gold_roundtables/features/admin/domain/models/table_input.dart';
import 'package:gold_roundtables/features/admin/domain/services/admin_management_service.dart';
import 'package:gold_roundtables/features/admin/domain/use_cases/directory/load_table_form_data_use_case.dart';
import 'package:gold_roundtables/features/admin/domain/use_cases/tables/create_table_use_case.dart';
import 'package:gold_roundtables/features/admin/domain/use_cases/tables/update_table_use_case.dart';
import 'package:gold_roundtables/features/admin/presentation/pages/table_form/cubit/table_form_cubit.dart';
import 'package:gold_roundtables/features/admin/presentation/pages/table_form/cubit/table_form_state.dart';
import 'package:mocktail/mocktail.dart';

import '../fakes.dart';

class MockManagement extends Mock implements AdminManagementService {}

const _rewindRefused = ApiException(
  kind: ApiErrorKind.conflict,
  code: 'value_rewind_confirmation_required',
  statusCode: 409,
);

void main() {
  late FakeDirectory directory;
  late MockManagement management;

  TableFormCubit build() => TableFormCubit(
    LoadTableFormDataUseCase(directory),
    CreateTableUseCase(management),
    UpdateTableUseCase(management),
  );

  setUpAll(() {
    registerFallbackValue(const TableInput());
    registerFallbackValue(const PersonRef.existing('x'));
  });

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
          currentValueId: 'v9',
        ),
      ],
      programRows: [
        for (var i = 1; i <= 48; i++)
          ProgramValue(
            id: 'v$i',
            sequence: i,
            numberInModule: (i - 1) % 10 + 1,
            name: 'Valor $i',
            module: ProgramModule(number: (i - 1) ~/ 10 + 1, name: 'Módulo'),
          ),
      ],
    );
  });

  test('init offers the 48 program values next to the table', () async {
    final cubit = build();
    await cubit.init(tableId: 't1');
    expect(cubit.state.status, TableFormStatus.editing);
    expect(cubit.state.data.programValues, hasLength(48));
    expect(cubit.state.data.table!.currentValueId, 'v9');
  });

  blocTest<TableFormCubit, TableFormState>(
    'moving back past completed history waits for confirmation',
    build: () {
      when(() => management.updateTable('t1', any())).thenThrow(_rewindRefused);
      return build();
    },
    act: (cubit) => cubit.update('t1', const TableInput(currentValueId: 'v2')),
    expect: () => [
      isA<TableFormState>().having(
        (s) => s.status,
        'status',
        TableFormStatus.submitting,
      ),
      isA<TableFormState>()
          .having((s) => s.status, 'status', TableFormStatus.editing)
          .having((s) => s.error, 'error', isNull)
          .having(
            (s) => s.pendingRewind?.currentValueId,
            'pending value',
            'v2',
          ),
    ],
  );

  test('confirming resends the same edit with the confirmation', () async {
    var calls = 0;
    when(() => management.updateTable('t1', any())).thenAnswer((call) async {
      final input = call.positionalArguments[1] as TableInput;
      if (calls++ == 0) throw _rewindRefused;
      expect(input.currentValueId, 'v2');
      expect(input.confirmRewind, isTrue);
    });
    final cubit = build();
    await cubit.update('t1', const TableInput(currentValueId: 'v2'));
    expect(cubit.state.pendingRewind, isNotNull);

    await cubit.confirmRewind('t1');

    expect(cubit.state.status, TableFormStatus.saved);
    expect(cubit.state.pendingRewind, isNull);
    expect(calls, 2);
  });

  test('declining the rewind drops the pending edit without saving', () async {
    when(() => management.updateTable('t1', any())).thenThrow(_rewindRefused);
    final cubit = build();
    await cubit.update('t1', const TableInput(currentValueId: 'v2'));

    cubit.dismissRewind();

    expect(cubit.state.pendingRewind, isNull);
    expect(cubit.state.status, TableFormStatus.editing);
    verify(() => management.updateTable('t1', any())).called(1);
  });

  test('other failures are reported as errors, not as a rewind', () async {
    when(() => management.updateTable('t1', any())).thenThrow(
      const ApiException(
        kind: ApiErrorKind.conflict,
        code: 'value_change_blocked',
        statusCode: 409,
      ),
    );
    final cubit = build();
    await cubit.update('t1', const TableInput(currentValueId: 'v2'));
    expect(cubit.state.pendingRewind, isNull);
    expect(cubit.state.error?.code, 'value_change_blocked');
  });

  test('create sends the starting value to the use case', () async {
    when(
      () => management.createTable(
        organizationId: any(named: 'organizationId'),
        input: any(named: 'input'),
        facilitator: any(named: 'facilitator'),
      ),
    ).thenAnswer((_) async => const TableChange(tableId: 'new'));
    final cubit = build();
    await cubit.create(
      organizationId: 'o1',
      input: const TableInput(name: 'Mesa', startValueId: 'v13'),
      facilitator: const PersonRef.existing('p1'),
    );
    final input =
        verify(
              () => management.createTable(
                organizationId: 'o1',
                input: captureAny(named: 'input'),
                facilitator: any(named: 'facilitator'),
              ),
            ).captured.single
            as TableInput;
    expect(input.startValueId, 'v13');
    expect(cubit.state.savedTableId, 'new');
  });
}
