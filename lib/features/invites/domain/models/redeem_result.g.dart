// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redeem_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RedeemResult _$RedeemResultFromJson(Map<String, dynamic> json) =>
    _RedeemResult(
      alreadyRedeemed: json['already_redeemed'] as bool? ?? false,
      person: InvitePerson.fromJson(json['person'] as Map<String, dynamic>),
      invite: Invite.fromJson(json['invite'] as Map<String, dynamic>),
      contexts:
          (json['contexts'] as List<dynamic>?)
              ?.map((e) => AccountContext.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RedeemResultToJson(_RedeemResult instance) =>
    <String, dynamic>{
      'already_redeemed': instance.alreadyRedeemed,
      'person': instance.person.toJson(),
      'invite': instance.invite.toJson(),
      'contexts': instance.contexts.map((e) => e.toJson()).toList(),
    };
