import 'package:freezed_annotation/freezed_annotation.dart';

part 'redeem_profile.freezed.dart';
part 'redeem_profile.g.dart';

/// Profile fields confirmed or corrected while redeeming. Omitted fields keep
/// what the inviter registered.
@freezed
abstract class RedeemProfile with _$RedeemProfile {
  const factory RedeemProfile({
    String? firstName,
    String? lastName,
    String? position,

    /// E.164, unverified contact data (ADR 0007).
    String? phone,
  }) = _RedeemProfile;

  factory RedeemProfile.fromJson(Map<String, dynamic> json) =>
      _$RedeemProfileFromJson(json);
}
