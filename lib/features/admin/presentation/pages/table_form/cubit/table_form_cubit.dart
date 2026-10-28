import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/network/api_exception.dart';
import '../../../../domain/models/person_input.dart';
import '../../../../domain/models/table_input.dart';
import '../../../../domain/use_cases/directory/load_table_form_data_use_case.dart';
import '../../../../domain/use_cases/tables/create_table_use_case.dart';
import '../../../../domain/use_cases/tables/update_table_use_case.dart';
import 'table_form_state.dart';

@injectable
class TableFormCubit extends Cubit<TableFormState> {
  TableFormCubit(this._loadData, this._createTable, this._updateTable)
    : super(const TableFormState());

  final LoadTableFormDataUseCase _loadData;
  final CreateTableUseCase _createTable;
  final UpdateTableUseCase _updateTable;

  /// Loads the choices. [tableId] edits that table; [organizationId]
  /// preselects the organization when creating.
  Future<void> init({String? tableId, String? organizationId}) async {
    emit(state.copyWith(status: TableFormStatus.loading, error: null));
    await _load(tableId: tableId, organizationId: organizationId);
  }

  /// A platform admin picked another organization: reload its locations and
  /// people.
  Future<void> selectOrganization(String organizationId) async {
    if (organizationId == state.organizationId) return;
    await _load(organizationId: organizationId);
  }

  Future<void> _load({String? tableId, String? organizationId}) async {
    try {
      final data = await _loadData(
        tableId: tableId,
        organizationId: organizationId,
      );
      emit(
        state.copyWith(
          status: TableFormStatus.editing,
          data: data,
          organizationId: data.table?.organizationId ?? organizationId,
        ),
      );
    } on ApiException catch (error) {
      emit(state.copyWith(status: TableFormStatus.failure, error: error));
    }
  }

  /// Creates a table with its facilitator (existing or newly registered).
  Future<void> create({
    required String organizationId,
    required TableInput input,
    required PersonRef facilitator,
  }) async {
    emit(state.copyWith(status: TableFormStatus.submitting, error: null));
    try {
      final created = await _createTable(
        organizationId: organizationId,
        input: input,
        facilitator: facilitator,
      );
      emit(
        state.copyWith(
          status: TableFormStatus.saved,
          savedTableId: created.tableId,
          facilitatorInvite: created.facilitatorInvite,
        ),
      );
    } on ApiException catch (error) {
      emit(state.copyWith(status: TableFormStatus.editing, error: error));
    }
  }

  Future<void> update(String tableId, TableInput input) async {
    emit(
      state.copyWith(
        status: TableFormStatus.submitting,
        error: null,
        pendingRewind: null,
      ),
    );
    try {
      await _updateTable(tableId, input);
      emit(
        state.copyWith(status: TableFormStatus.saved, savedTableId: tableId),
      );
    } on ApiException catch (error) {
      if (error.code == _rewindConfirmationCode) {
        emit(
          state.copyWith(status: TableFormStatus.editing, pendingRewind: input),
        );
        return;
      }
      emit(state.copyWith(status: TableFormStatus.editing, error: error));
    }
  }

  /// The admin confirmed the rewind: resend the refused edit.
  Future<void> confirmRewind(String tableId) async {
    final pending = state.pendingRewind;
    if (pending == null) return;
    await update(tableId, pending.copyWith(confirmRewind: true));
  }

  void dismissRewind() => emit(state.copyWith(pendingRewind: null));

  static const _rewindConfirmationCode = 'value_rewind_confirmation_required';
}
