import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/network/api_exception.dart';
import '../../../../domain/models/location_input.dart';
import '../../../../domain/use_cases/directory/load_location_use_case.dart';
import '../../../../domain/use_cases/locations/create_location_use_case.dart';
import '../../../../domain/use_cases/locations/update_location_use_case.dart';
import 'location_form_state.dart';

@injectable
class LocationFormCubit extends Cubit<LocationFormState> {
  LocationFormCubit(this._load, this._create, this._update)
    : super(const LocationFormState());

  final LoadLocationUseCase _load;
  final CreateLocationUseCase _create;
  final UpdateLocationUseCase _update;

  Future<void> init({String? locationId}) async {
    if (locationId == null) return;
    emit(state.copyWith(status: LocationFormStatus.loading, error: null));
    try {
      emit(
        state.copyWith(
          status: LocationFormStatus.editing,
          location: await _load(locationId),
        ),
      );
    } on ApiException catch (error) {
      emit(state.copyWith(status: LocationFormStatus.failure, error: error));
    }
  }

  Future<void> submit(String organizationId, LocationInput input) async {
    emit(state.copyWith(status: LocationFormStatus.submitting, error: null));
    try {
      final existing = state.location;
      if (existing == null) {
        await _create(organizationId, input);
      } else {
        await _update(existing.id, input);
      }
      emit(state.copyWith(status: LocationFormStatus.saved));
    } on ApiException catch (error) {
      emit(state.copyWith(status: LocationFormStatus.editing, error: error));
    }
  }
}
