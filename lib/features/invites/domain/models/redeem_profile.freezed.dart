// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'redeem_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RedeemProfile {
  String? get firstName;
  String? get lastName;
  String? get position;

  /// E.164, unverified contact data (ADR 0007).
  String? get phone;

  /// Create a copy of RedeemProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RedeemProfileCopyWith<RedeemProfile> get copyWith =>
      _$RedeemProfileCopyWithImpl<RedeemProfile>(
        this as RedeemProfile,
        _$identity,
      );

  /// Serializes this RedeemProfile to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RedeemProfile &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, firstName, lastName, position, phone);

  @override
  String toString() {
    return 'RedeemProfile(firstName: $firstName, lastName: $lastName, position: $position, phone: $phone)';
  }
}

/// @nodoc
abstract mixin class $RedeemProfileCopyWith<$Res> {
  factory $RedeemProfileCopyWith(
    RedeemProfile value,
    $Res Function(RedeemProfile) _then,
  ) = _$RedeemProfileCopyWithImpl;
  @useResult
  $Res call({
    String? firstName,
    String? lastName,
    String? position,
    String? phone,
  });
}

/// @nodoc
class _$RedeemProfileCopyWithImpl<$Res>
    implements $RedeemProfileCopyWith<$Res> {
  _$RedeemProfileCopyWithImpl(this._self, this._then);

  final RedeemProfile _self;
  final $Res Function(RedeemProfile) _then;

  /// Create a copy of RedeemProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? position = freezed,
    Object? phone = freezed,
  }) {
    return _then(
      _self.copyWith(
        firstName: freezed == firstName
            ? _self.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastName: freezed == lastName
            ? _self.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String?,
        position: freezed == position
            ? _self.position
            : position // ignore: cast_nullable_to_non_nullable
                  as String?,
        phone: freezed == phone
            ? _self.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [RedeemProfile].
extension RedeemProfilePatterns on RedeemProfile {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_RedeemProfile value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RedeemProfile() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_RedeemProfile value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RedeemProfile():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_RedeemProfile value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RedeemProfile() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String? firstName,
      String? lastName,
      String? position,
      String? phone,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RedeemProfile() when $default != null:
        return $default(
          _that.firstName,
          _that.lastName,
          _that.position,
          _that.phone,
        );
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String? firstName,
      String? lastName,
      String? position,
      String? phone,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RedeemProfile():
        return $default(
          _that.firstName,
          _that.lastName,
          _that.position,
          _that.phone,
        );
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String? firstName,
      String? lastName,
      String? position,
      String? phone,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RedeemProfile() when $default != null:
        return $default(
          _that.firstName,
          _that.lastName,
          _that.position,
          _that.phone,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RedeemProfile implements RedeemProfile {
  const _RedeemProfile({
    this.firstName,
    this.lastName,
    this.position,
    this.phone,
  });
  factory _RedeemProfile.fromJson(Map<String, dynamic> json) =>
      _$RedeemProfileFromJson(json);

  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? position;

  /// E.164, unverified contact data (ADR 0007).
  @override
  final String? phone;

  /// Create a copy of RedeemProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RedeemProfileCopyWith<_RedeemProfile> get copyWith =>
      __$RedeemProfileCopyWithImpl<_RedeemProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RedeemProfileToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RedeemProfile &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, firstName, lastName, position, phone);

  @override
  String toString() {
    return 'RedeemProfile(firstName: $firstName, lastName: $lastName, position: $position, phone: $phone)';
  }
}

/// @nodoc
abstract mixin class _$RedeemProfileCopyWith<$Res>
    implements $RedeemProfileCopyWith<$Res> {
  factory _$RedeemProfileCopyWith(
    _RedeemProfile value,
    $Res Function(_RedeemProfile) _then,
  ) = __$RedeemProfileCopyWithImpl;
  @override
  @useResult
  $Res call({
    String? firstName,
    String? lastName,
    String? position,
    String? phone,
  });
}

/// @nodoc
class __$RedeemProfileCopyWithImpl<$Res>
    implements _$RedeemProfileCopyWith<$Res> {
  __$RedeemProfileCopyWithImpl(this._self, this._then);

  final _RedeemProfile _self;
  final $Res Function(_RedeemProfile) _then;

  /// Create a copy of RedeemProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? position = freezed,
    Object? phone = freezed,
  }) {
    return _then(
      _RedeemProfile(
        firstName: freezed == firstName
            ? _self.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastName: freezed == lastName
            ? _self.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String?,
        position: freezed == position
            ? _self.position
            : position // ignore: cast_nullable_to_non_nullable
                  as String?,
        phone: freezed == phone
            ? _self.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}
