import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/domain/models/account_context.dart';
import 'invite.dart';
import 'invite_person.dart';

part 'redeem_result.freezed.dart';
part 'redeem_result.g.dart';

@freezed
abstract class RedeemResult with _$RedeemResult {
  const factory RedeemResult({
    @Default(false) bool alreadyRedeemed,
    required InvitePerson person,
    required Invite invite,
    @Default([]) List<AccountContext> contexts,
  }) = _RedeemResult;

  const RedeemResult._();

  factory RedeemResult.fromJson(Map<String, dynamic> json) =>
      _$RedeemResultFromJson(json);

  /// The context the invite just opened, when the server listed it.
  AccountContext? get joinedContext {
    for (final context in contexts) {
      if (context.personId == person.id) return context;
    }
    return null;
  }
}
