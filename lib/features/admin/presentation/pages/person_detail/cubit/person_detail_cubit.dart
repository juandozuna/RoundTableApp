import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/network/api_exception.dart';
import '../../../../domain/models/person_status.dart';
import '../../../../domain/services/admin_management_service.dart';
import '../../../../domain/use_cases/directory/load_person_detail_use_case.dart';
import '../../../../domain/use_cases/people/update_person_use_case.dart';
import 'person_detail_state.dart';

@injectable
class PersonDetailCubit extends Cubit<PersonDetailState> {
  PersonDetailCubit(this._load, this._update)
    : super(const PersonDetailState());

  final LoadPersonDetailUseCase _load;
  final UpdatePersonUseCase _update;
  String? _personId;

  Future<void> load(String personId) async {
    _personId = personId;
    emit(state.copyWith(status: PersonDetailStatus.loading, error: null));
    await _fetch();
  }

  Future<void> refresh() async {
    if (_personId != null && !state.working) await _fetch();
  }

  Future<void> _fetch() async {
    try {
      final person = await _load(_personId!);
      emit(
        state.copyWith(
          status: PersonDetailStatus.ready,
          person: person,
          error: null,
        ),
      );
    } on ApiException catch (error) {
      emit(
        state.copyWith(
          status: state.person == null
              ? PersonDetailStatus.failure
              : PersonDetailStatus.ready,
          error: error,
        ),
      );
    }
  }

  /// Deactivating ends the person's seats, roles and pending invites; their
  /// history is kept.
  Future<void> setActive(bool active) async {
    emit(state.copyWith(working: true, changedTo: null, actionError: null));
    try {
      final person = await _update(
        _personId!,
        status: active
            ? PersonStatusChange.active
            : PersonStatusChange.inactive,
      );
      emit(
        state.copyWith(
          working: false,
          person: person,
          changedTo: active ? PersonStatus.active : PersonStatus.inactive,
        ),
      );
      await _fetch();
    } on ApiException catch (error) {
      emit(state.copyWith(working: false, actionError: error));
    }
  }
}
