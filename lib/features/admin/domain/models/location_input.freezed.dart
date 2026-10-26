// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocationInput {
  String? get name;
  String? get city;
  String? get region;
  String? get address;
  RecordStatus? get status;

  /// Create a copy of LocationInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LocationInputCopyWith<LocationInput> get copyWith =>
      _$LocationInputCopyWithImpl<LocationInput>(
        this as LocationInput,
        _$identity,
      );

  /// Serializes this LocationInput to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LocationInput &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, city, region, address, status);

  @override
  String toString() {
    return 'LocationInput(name: $name, city: $city, region: $region, address: $address, status: $status)';
  }
}

/// @nodoc
abstract mixin class $LocationInputCopyWith<$Res> {
  factory $LocationInputCopyWith(
    LocationInput value,
    $Res Function(LocationInput) _then,
  ) = _$LocationInputCopyWithImpl;
  @useResult
  $Res call({
    String? name,
    String? city,
    String? region,
    String? address,
    RecordStatus? status,
  });
}

/// @nodoc
class _$LocationInputCopyWithImpl<$Res>
    implements $LocationInputCopyWith<$Res> {
  _$LocationInputCopyWithImpl(this._self, this._then);

  final LocationInput _self;
  final $Res Function(LocationInput) _then;

  /// Create a copy of LocationInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? city = freezed,
    Object? region = freezed,
    Object? address = freezed,
    Object? status = freezed,
  }) {
    return _then(
      _self.copyWith(
        name: freezed == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        city: freezed == city
            ? _self.city
            : city // ignore: cast_nullable_to_non_nullable
                  as String?,
        region: freezed == region
            ? _self.region
            : region // ignore: cast_nullable_to_non_nullable
                  as String?,
        address: freezed == address
            ? _self.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as RecordStatus?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [LocationInput].
extension LocationInputPatterns on LocationInput {
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
    TResult Function(_LocationInput value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocationInput() when $default != null:
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
    TResult Function(_LocationInput value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationInput():
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
    TResult? Function(_LocationInput value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationInput() when $default != null:
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
      String? name,
      String? city,
      String? region,
      String? address,
      RecordStatus? status,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocationInput() when $default != null:
        return $default(
          _that.name,
          _that.city,
          _that.region,
          _that.address,
          _that.status,
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
      String? name,
      String? city,
      String? region,
      String? address,
      RecordStatus? status,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationInput():
        return $default(
          _that.name,
          _that.city,
          _that.region,
          _that.address,
          _that.status,
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
      String? name,
      String? city,
      String? region,
      String? address,
      RecordStatus? status,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationInput() when $default != null:
        return $default(
          _that.name,
          _that.city,
          _that.region,
          _that.address,
          _that.status,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LocationInput implements LocationInput {
  const _LocationInput({
    this.name,
    this.city,
    this.region,
    this.address,
    this.status,
  });
  factory _LocationInput.fromJson(Map<String, dynamic> json) =>
      _$LocationInputFromJson(json);

  @override
  final String? name;
  @override
  final String? city;
  @override
  final String? region;
  @override
  final String? address;
  @override
  final RecordStatus? status;

  /// Create a copy of LocationInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LocationInputCopyWith<_LocationInput> get copyWith =>
      __$LocationInputCopyWithImpl<_LocationInput>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LocationInputToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocationInput &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, city, region, address, status);

  @override
  String toString() {
    return 'LocationInput(name: $name, city: $city, region: $region, address: $address, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$LocationInputCopyWith<$Res>
    implements $LocationInputCopyWith<$Res> {
  factory _$LocationInputCopyWith(
    _LocationInput value,
    $Res Function(_LocationInput) _then,
  ) = __$LocationInputCopyWithImpl;
  @override
  @useResult
  $Res call({
    String? name,
    String? city,
    String? region,
    String? address,
    RecordStatus? status,
  });
}

/// @nodoc
class __$LocationInputCopyWithImpl<$Res>
    implements _$LocationInputCopyWith<$Res> {
  __$LocationInputCopyWithImpl(this._self, this._then);

  final _LocationInput _self;
  final $Res Function(_LocationInput) _then;

  /// Create a copy of LocationInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = freezed,
    Object? city = freezed,
    Object? region = freezed,
    Object? address = freezed,
    Object? status = freezed,
  }) {
    return _then(
      _LocationInput(
        name: freezed == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        city: freezed == city
            ? _self.city
            : city // ignore: cast_nullable_to_non_nullable
                  as String?,
        region: freezed == region
            ? _self.region
            : region // ignore: cast_nullable_to_non_nullable
                  as String?,
        address: freezed == address
            ? _self.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as RecordStatus?,
      ),
    );
  }
}
