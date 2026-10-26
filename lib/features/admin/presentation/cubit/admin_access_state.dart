import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/network/api_exception.dart';
import '../../domain/models/admin_scope.dart';

part 'admin_access_state.freezed.dart';

enum AdminAccessStatus { loading, ready, denied, failure }

/// Who the screen is for (scope) and whether the network is reachable.
@freezed
abstract class AdminAccessState with _$AdminAccessState {
  const factory AdminAccessState({
    @Default(AdminAccessStatus.loading) AdminAccessStatus status,
    AdminScope? scope,
    @Default(true) bool online,
    ApiException? error,
  }) = _AdminAccessState;
}
