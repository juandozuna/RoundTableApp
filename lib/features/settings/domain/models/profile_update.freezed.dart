// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_update.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileUpdate {
  String get firstName;
  String get lastName;
  String? get position;

  /// E.164, unverified.
  String? get phone;

  /// Create a copy of ProfileUpdate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileUpdateCopyWith<ProfileUpdate> get copyWith =>
      _$ProfileUpdateCopyWithImpl<ProfileUpdate>(
        this as ProfileUpdate,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileUpdate &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, firstName, lastName, position, phone);

  @override
  String toString() {
    return 'ProfileUpdate(firstName: $firstName, lastName: $lastName, position: $position, phone: $phone)';
  }
}

/// @nodoc
abstract mixin class $ProfileUpdateCopyWith<$Res> {
  factory $ProfileUpdateCopyWith(
    ProfileUpdate value,
    $Res Function(ProfileUpdate) _then,
  ) = _$ProfileUpdateCopyWithImpl;
  @useResult
  $Res call({
    String firstName,
    String lastName,
    String? position,
    String? phone,
  });
}

/// @nodoc
class _$ProfileUpdateCopyWithImpl<$Res>
    implements $ProfileUpdateCopyWith<$Res> {
  _$ProfileUpdateCopyWithImpl(this._self, this._then);

  final ProfileUpdate _self;
  final $Res Function(ProfileUpdate) _then;

  /// Create a copy of ProfileUpdate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? position = freezed,
    Object? phone = freezed,
  }) {
    return _then(
      _self.copyWith(
        firstName: null == firstName
            ? _self.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
        lastName: null == lastName
            ? _self.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String,
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

/// Adds pattern-matching-related methods to [ProfileUpdate].
extension ProfileUpdatePatterns on ProfileUpdate {
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
    TResult Function(_ProfileUpdate value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProfileUpdate() when $default != null:
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
    TResult Function(_ProfileUpdate value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileUpdate():
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
    TResult? Function(_ProfileUpdate value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileUpdate() when $default != null:
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
      String firstName,
      String lastName,
      String? position,
      String? phone,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProfileUpdate() when $default != null:
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
      String firstName,
      String lastName,
      String? position,
      String? phone,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileUpdate():
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
      String firstName,
      String lastName,
      String? position,
      String? phone,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileUpdate() when $default != null:
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

class _ProfileUpdate implements ProfileUpdate {
  const _ProfileUpdate({
    required this.firstName,
    required this.lastName,
    this.position,
    this.phone,
  });

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String? position;

  /// E.164, unverified.
  @override
  final String? phone;

  /// Create a copy of ProfileUpdate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProfileUpdateCopyWith<_ProfileUpdate> get copyWith =>
      __$ProfileUpdateCopyWithImpl<_ProfileUpdate>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProfileUpdate &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, firstName, lastName, position, phone);

  @override
  String toString() {
    return 'ProfileUpdate(firstName: $firstName, lastName: $lastName, position: $position, phone: $phone)';
  }
}

/// @nodoc
abstract mixin class _$ProfileUpdateCopyWith<$Res>
    implements $ProfileUpdateCopyWith<$Res> {
  factory _$ProfileUpdateCopyWith(
    _ProfileUpdate value,
    $Res Function(_ProfileUpdate) _then,
  ) = __$ProfileUpdateCopyWithImpl;
  @override
  @useResult
  $Res call({
    String firstName,
    String lastName,
    String? position,
    String? phone,
  });
}

/// @nodoc
class __$ProfileUpdateCopyWithImpl<$Res>
    implements _$ProfileUpdateCopyWith<$Res> {
  __$ProfileUpdateCopyWithImpl(this._self, this._then);

  final _ProfileUpdate _self;
  final $Res Function(_ProfileUpdate) _then;

  /// Create a copy of ProfileUpdate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? position = freezed,
    Object? phone = freezed,
  }) {
    return _then(
      _ProfileUpdate(
        firstName: null == firstName
            ? _self.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
        lastName: null == lastName
            ? _self.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String,
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
