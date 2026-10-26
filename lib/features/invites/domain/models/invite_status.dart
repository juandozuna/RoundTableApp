import 'package:json_annotation/json_annotation.dart';

/// Effective invite status: `pending` past its expiry reads `expired`.
@JsonEnum()
enum InviteStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('accepted')
  accepted,
  @JsonValue('expired')
  expired,
  @JsonValue('revoked')
  revoked;

  String get wireValue => name;

  /// Can still be shared, renewed or revoked.
  bool get isOpen => this == pending || this == expired;

  bool get canShare => this == pending;
}
