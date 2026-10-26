/// Server defaults the screens mention (api-contract.md §3 invites).
abstract final class InviteDefaults {
  /// Invites expire after this many days unless the inviter asks otherwise.
  static const int expiresInDays = 14;
}
