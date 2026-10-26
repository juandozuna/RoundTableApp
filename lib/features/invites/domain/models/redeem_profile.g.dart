// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redeem_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RedeemProfile _$RedeemProfileFromJson(Map<String, dynamic> json) =>
    _RedeemProfile(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      position: json['position'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$RedeemProfileToJson(_RedeemProfile instance) =>
    <String, dynamic>{
      'first_name': ?instance.firstName,
      'last_name': ?instance.lastName,
      'position': ?instance.position,
      'phone': ?instance.phone,
    };
