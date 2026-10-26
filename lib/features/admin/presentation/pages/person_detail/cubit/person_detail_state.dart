import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/network/api_exception.dart';
import '../../../../domain/models/admin_person.dart';
import '../../../../domain/models/person_status.dart';

part 'person_detail_state.freezed.dart';

enum PersonDetailStatus { loading, ready, failure }

@freezed
abstract class PersonDetailState with _$PersonDetailState {
  const factory PersonDetailState({
    @Default(PersonDetailStatus.loading) PersonDetailStatus status,
    AdminPerson? person,
    ApiException? error,
    @Default(false) bool working,

    /// Status the person was just moved to (drives the success toast).
    PersonStatus? changedTo,
    ApiException? actionError,
  }) = _PersonDetailState;
}
