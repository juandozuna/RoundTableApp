import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/network/api_exception.dart';
import '../../../../domain/models/admin_location.dart';

part 'location_form_state.freezed.dart';

enum LocationFormStatus { loading, editing, submitting, saved, failure }

@freezed
abstract class LocationFormState with _$LocationFormState {
  const factory LocationFormState({
    @Default(LocationFormStatus.editing) LocationFormStatus status,
    AdminLocation? location,
    ApiException? error,
  }) = _LocationFormState;
}
