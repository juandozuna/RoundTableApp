import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/network/api_exception.dart';
import 'account_context.dart';
import 'account_person.dart';

part 'access_state.freezed.dart';

/// Where a signed-in identity stands before it can enter the app.
enum AccessStatus {
  signedOut,

  /// Loading people and contexts.
  resolving,

  /// Contexts could not be loaded and none are cached.
  failed,

  /// A context is active.
  ready,

  /// Several contexts and no remembered choice on this device.
  needsContext,

  /// The identity has a person but no role or table yet.
  noRole,
  deactivated,

  /// Signed in, but nobody invited this identity.
  unknownAccount,
}

@freezed
abstract class AccessState with _$AccessState {
  const factory AccessState({
    @Default(AccessStatus.signedOut) AccessStatus status,
    @Default([]) List<AccountContext> contexts,
    @Default([]) List<AccountPerson> people,
    AccountContext? active,
    ApiException? failure,

    /// Contexts come from the device cache because the server was unreachable.
    @Default(false) bool fromCache,
  }) = _AccessState;

  const AccessState._();

  bool get hasSeveralContexts => contexts.length > 1;

  /// The person must leave the sign-in area for the app.
  bool get isBlocked =>
      status == AccessStatus.noRole ||
      status == AccessStatus.deactivated ||
      status == AccessStatus.unknownAccount;
}
