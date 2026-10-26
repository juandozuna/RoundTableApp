import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/network/api_exception.dart';
import '../../../../../admin/domain/models/admin_organization.dart';
import '../../../../domain/models/audit_category.dart';
import '../../../../domain/models/audit_event.dart';

part 'audit_state.freezed.dart';

enum AuditStatus { loading, ready, failure }

@freezed
abstract class AuditState with _$AuditState {
  const AuditState._();

  const factory AuditState({
    @Default(AuditStatus.loading) AuditStatus status,
    ApiException? error,
    @Default(false) bool refreshing,
    @Default([]) List<AuditEvent> events,
    @Default([]) List<AdminOrganization> organizations,
    AuditCategory? category,
    String? organizationId,
    @Default('') String search,
    @Default(100) int limit,

    /// More events may exist on the server beyond [limit].
    @Default(false) bool hasMore,
  }) = _AuditState;
}
