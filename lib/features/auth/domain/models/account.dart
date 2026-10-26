import 'package:freezed_annotation/freezed_annotation.dart';

import 'account_context.dart';
import 'account_person.dart';
import 'person_status.dart';

part 'account.freezed.dart';
part 'account.g.dart';

/// What the backend knows about the signed-in identity (`GET /admin/me`).
@freezed
abstract class Account with _$Account {
  const factory Account({
    required String authUserId,
    @Default(false) bool isPlatformAdmin,
    @Default([]) List<AccountPerson> people,
    @Default([]) List<AccountContext> contexts,
  }) = _Account;

  const Account._();

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  /// The identity exists but nobody invited it yet.
  bool get isUnknown => people.isEmpty;

  /// Every person bound to the identity was deactivated.
  bool get isDeactivated =>
      people.isNotEmpty &&
      people.every((person) => person.status == PersonStatus.inactive);
}
