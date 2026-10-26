import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/user_role.dart';
import '../../../../core/services/session_context/session_context.dart';

part 'account_context.freezed.dart';
part 'account_context.g.dart';

/// One role the person can act under, as returned by `my_contexts` /
/// `GET /admin/me` ("Coordinador · Fundación Luz").
@freezed
abstract class AccountContext with _$AccountContext {
  const factory AccountContext({
    required UserRole kind,
    required String personId,
    String? organizationId,
    String? organizationName,
    String? roundTableId,
    String? roundTableName,
    String? roundTableCode,
    @Default('') String label,
  }) = _AccountContext;

  const AccountContext._();

  factory AccountContext.fromJson(Map<String, dynamic> json) =>
      _$AccountContextFromJson(json);

  /// Stable identity, used to remember the choice on this device.
  String get key => [
    kind.wireValue,
    personId,
    organizationId ?? '',
    roundTableId ?? '',
  ].join('|');

  /// Table or organization name; `null` for the platform administrator.
  String? get scopeName => roundTableName ?? organizationName;

  SessionContext toSessionContext() => SessionContext(
    role: kind,
    personId: personId,
    organizationId: organizationId,
    organizationName: organizationName,
    tableId: roundTableId,
    tableName: roundTableName,
  );
}
