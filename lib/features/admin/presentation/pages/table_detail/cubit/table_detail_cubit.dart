import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/network/api_exception.dart';
import '../../../../domain/models/person_input.dart';
import '../../../../domain/use_cases/directory/load_table_detail_use_case.dart';
import '../../../../domain/use_cases/tables/add_member_to_table_use_case.dart';
import '../../../../domain/use_cases/tables/change_facilitator_use_case.dart';
import '../../../../domain/use_cases/tables/deactivate_member_use_case.dart';
import '../../../../domain/use_cases/tables/move_member_use_case.dart';
import 'table_detail_state.dart';

@injectable
class TableDetailCubit extends Cubit<TableDetailState> {
  TableDetailCubit(
    this._load,
    this._changeFacilitator,
    this._addMember,
    this._moveMember,
    this._deactivateMember,
  ) : super(const TableDetailState());

  final LoadTableDetailUseCase _load;
  final ChangeFacilitatorUseCase _changeFacilitator;
  final AddMemberToTableUseCase _addMember;
  final MoveMemberUseCase _moveMember;
  final DeactivateMemberUseCase _deactivateMember;
  String? _tableId;

  Future<void> load(String tableId) async {
    _tableId = tableId;
    emit(state.copyWith(status: TableDetailStatus.loading, error: null));
    await _fetch();
  }

  Future<void> refresh() async {
    if (_tableId != null && !state.working) await _fetch();
  }

  Future<void> _fetch() async {
    try {
      final detail = await _load(_tableId!);
      emit(
        state.copyWith(
          status: TableDetailStatus.ready,
          detail: detail,
          error: null,
        ),
      );
    } on ApiException catch (error) {
      emit(
        state.copyWith(
          status: state.detail == null
              ? TableDetailStatus.failure
              : TableDetailStatus.ready,
          error: error,
        ),
      );
    }
  }

  /// Changes the facilitator to an existing person. The previous one ends
  /// their seat (history kept) or stays as a member.
  Future<void> changeFacilitator({
    required String personId,
    required String personName,
    required bool keepPreviousAsMember,
  }) => _run(TableNotice.facilitatorChanged, personName, () async {
    await _changeFacilitator(
      tableId: _tableId!,
      facilitator: PersonRef.existing(personId),
      keepPreviousAsMember: keepPreviousAsMember,
    );
  });

  Future<void> addExistingMember({
    required String personId,
    required String personName,
  }) => _run(
    TableNotice.memberAdded,
    personName,
    () => _addMember(tableId: _tableId!, personId: personId),
  );

  Future<void> moveMember({
    required String tableMemberId,
    required String toTableId,
    required String personName,
  }) => _run(
    TableNotice.memberMoved,
    personName,
    () => _moveMember(tableMemberId: tableMemberId, toTableId: toTableId),
  );

  Future<void> deactivateMember({
    required String tableMemberId,
    required String personName,
  }) => _run(
    TableNotice.memberDeactivated,
    personName,
    () => _deactivateMember(tableMemberId),
  );

  Future<void> _run(
    TableNotice notice,
    String name,
    Future<void> Function() action,
  ) async {
    emit(state.copyWith(working: true, notice: null, actionError: null));
    try {
      await action();
      emit(state.copyWith(working: false, notice: notice, noticeName: name));
      await _fetch();
    } on ApiException catch (error) {
      emit(state.copyWith(working: false, actionError: error));
    }
  }
}
