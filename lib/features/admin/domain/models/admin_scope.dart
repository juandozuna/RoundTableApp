import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_scope.freezed.dart';

/// What the signed-in user may administer. A platform administrator sees every
/// organization; a coordinator only their own.
@freezed
abstract class AdminScope with _$AdminScope {
  const AdminScope._();

  const factory AdminScope({
    required bool isAdministrator,
    String? organizationId,
    String? organizationName,
  }) = _AdminScope;

  bool canAccessOrganization(String id) =>
      isAdministrator || organizationId == id;
}
