import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/network/api_exception.dart';
import '../../../../domain/models/organization_status.dart';
import '../../../../domain/use_cases/directory/load_organization_detail_use_case.dart';
import '../../../../domain/use_cases/organizations/set_organization_status_use_case.dart';
import 'organization_detail_state.dart';

@injectable
class OrganizationDetailCubit extends Cubit<OrganizationDetailState> {
  OrganizationDetailCubit(this._load, this._setStatus)
    : super(const OrganizationDetailState());

  final LoadOrganizationDetailUseCase _load;
  final SetOrganizationStatusUseCase _setStatus;
  String? _organizationId;

  Future<void> load(String organizationId) async {
    _organizationId = organizationId;
    emit(state.copyWith(status: OrganizationDetailStatus.loading, error: null));
    await _fetch();
  }

  Future<void> refresh() async {
    if (_organizationId != null && !state.working) await _fetch();
  }

  Future<void> _fetch() async {
    try {
      final detail = await _load(_organizationId!);
      emit(
        state.copyWith(
          status: OrganizationDetailStatus.ready,
          detail: detail,
          error: null,
        ),
      );
    } on ApiException catch (error) {
      emit(
        state.copyWith(
          status: state.detail == null
              ? OrganizationDetailStatus.failure
              : OrganizationDetailStatus.ready,
          error: error,
        ),
      );
    }
  }

  /// Pauses, reactivates or deactivates. History is always kept.
  Future<void> changeStatus(OrganizationStatus status) async {
    emit(state.copyWith(working: true, changedTo: null, actionError: null));
    try {
      await _setStatus(_organizationId!, status);
      emit(state.copyWith(working: false, changedTo: status));
      await _fetch();
    } on ApiException catch (error) {
      emit(state.copyWith(working: false, actionError: error));
    }
  }
}
