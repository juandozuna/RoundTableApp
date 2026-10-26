import 'package:freezed_annotation/freezed_annotation.dart';

import 'audit_category.dart';

part 'audit_query.freezed.dart';

@freezed
abstract class AuditQuery with _$AuditQuery {
  const factory AuditQuery({
    AuditCategory? category,
    String? organizationId,
    @Default(100) int limit,
  }) = _AuditQuery;
}
