import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/network/api_exception.dart';
import '../../../../domain/models/organization_detail.dart';
import '../../../../domain/models/organization_status.dart';

part 'organization_detail_state.freezed.dart';

enum OrganizationDetailStatus { loading, ready, failure }

@freezed
abstract class OrganizationDetailState with _$OrganizationDetailState {
  const factory OrganizationDetailState({
    @Default(OrganizationDetailStatus.loading) OrganizationDetailStatus status,
    OrganizationDetail? detail,
    ApiException? error,

    /// A status change is being sent.
    @Default(false) bool working,

    /// Status the organization was just moved to (drives the success toast).
    OrganizationStatus? changedTo,

    /// Failure of the last status change (drives the error toast).
    ApiException? actionError,
  }) = _OrganizationDetailState;
}
