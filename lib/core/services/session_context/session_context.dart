import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/user_role.dart';

part 'session_context.freezed.dart';
part 'session_context.g.dart';

/// The role assignment a person is currently acting under, e.g.
/// "Coordinator @ Fundación Luz" or "Member @ Mesa Esperanza 03" (ADR 0006).
@freezed
abstract class SessionContext with _$SessionContext {
  const factory SessionContext({
    required UserRole role,
    String? organizationId,
    String? organizationName,
    String? tableId,
    String? tableName,
  }) = _SessionContext;

  factory SessionContext.fromJson(Map<String, dynamic> json) =>
      _$SessionContextFromJson(json);
}
