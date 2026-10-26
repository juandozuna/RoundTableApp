import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_profile.dart';

part 'my_account.freezed.dart';
part 'my_account.g.dart';

/// `GET/PATCH /admin/me`: the person rows bound to this sign-in, one per
/// organization.
@freezed
abstract class MyAccount with _$MyAccount {
  const factory MyAccount({@Default([]) List<UserProfile> people}) = _MyAccount;

  factory MyAccount.fromJson(Map<String, dynamic> json) =>
      _$MyAccountFromJson(json);
}
