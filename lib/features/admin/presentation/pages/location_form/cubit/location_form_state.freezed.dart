// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocationFormState {
  LocationFormStatus get status;
  AdminLocation? get location;
  ApiException? get error;

  /// Create a copy of LocationFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LocationFormStateCopyWith<LocationFormState> get copyWith =>
      _$LocationFormStateCopyWithImpl<LocationFormState>(
        this as LocationFormState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LocationFormState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, location, error);

  @override
  String toString() {
    return 'LocationFormState(status: $status, location: $location, error: $error)';
  }
}

/// @nodoc
abstract mixin class $LocationFormStateCopyWith<$Res> {
  factory $LocationFormStateCopyWith(
    LocationFormState value,
    $Res Function(LocationFormState) _then,
  ) = _$LocationFormStateCopyWithImpl;
  @useResult
  $Res call({
    LocationFormStatus status,
    AdminLocation? location,
    ApiException? error,
  });

  $AdminLocationCopyWith<$Res>? get location;
}

/// @nodoc
class _$LocationFormStateCopyWithImpl<$Res>
    implements $LocationFormStateCopyWith<$Res> {
  _$LocationFormStateCopyWithImpl(this._self, this._then);

  final LocationFormState _self;
  final $Res Function(LocationFormState) _then;

  /// Create a copy of LocationFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? location = freezed,
    Object? error = freezed,
  }) {
    return _then(
      _self.copyWith(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as LocationFormStatus,
        location: freezed == location
            ? _self.location
            : location // ignore: cast_nullable_to_non_nullable
                  as AdminLocation?,
        error: freezed == error
            ? _self.error
            : error // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
      ),
    );
  }

  /// Create a copy of LocationFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AdminLocationCopyWith<$Res>? get location {
    if (_self.location == null) {
      return null;
    }

    return $AdminLocationCopyWith<$Res>(_self.location!, (value) {
      return _then(_self.copyWith(location: value));
    });
  }
}

/// Adds pattern-matching-related methods to [LocationFormState].
extension LocationFormStatePatterns on LocationFormState {
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
    TResult Function(_LocationFormState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocationFormState() when $default != null:
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
    TResult Function(_LocationFormState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationFormState():
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
    TResult? Function(_LocationFormState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationFormState() when $default != null:
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
      LocationFormStatus status,
      AdminLocation? location,
      ApiException? error,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocationFormState() when $default != null:
        return $default(_that.status, _that.location, _that.error);
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
      LocationFormStatus status,
      AdminLocation? location,
      ApiException? error,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationFormState():
        return $default(_that.status, _that.location, _that.error);
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
      LocationFormStatus status,
      AdminLocation? location,
      ApiException? error,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationFormState() when $default != null:
        return $default(_that.status, _that.location, _that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LocationFormState implements LocationFormState {
  const _LocationFormState({
    this.status = LocationFormStatus.editing,
    this.location,
    this.error,
  });

  @override
  @JsonKey()
  final LocationFormStatus status;
  @override
  final AdminLocation? location;
  @override
  final ApiException? error;

  /// Create a copy of LocationFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LocationFormStateCopyWith<_LocationFormState> get copyWith =>
      __$LocationFormStateCopyWithImpl<_LocationFormState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocationFormState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, location, error);

  @override
  String toString() {
    return 'LocationFormState(status: $status, location: $location, error: $error)';
  }
}

/// @nodoc
abstract mixin class _$LocationFormStateCopyWith<$Res>
    implements $LocationFormStateCopyWith<$Res> {
  factory _$LocationFormStateCopyWith(
    _LocationFormState value,
    $Res Function(_LocationFormState) _then,
  ) = __$LocationFormStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    LocationFormStatus status,
    AdminLocation? location,
    ApiException? error,
  });

  @override
  $AdminLocationCopyWith<$Res>? get location;
}

/// @nodoc
class __$LocationFormStateCopyWithImpl<$Res>
    implements _$LocationFormStateCopyWith<$Res> {
  __$LocationFormStateCopyWithImpl(this._self, this._then);

  final _LocationFormState _self;
  final $Res Function(_LocationFormState) _then;

  /// Create a copy of LocationFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? location = freezed,
    Object? error = freezed,
  }) {
    return _then(
      _LocationFormState(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as LocationFormStatus,
        location: freezed == location
            ? _self.location
            : location // ignore: cast_nullable_to_non_nullable
                  as AdminLocation?,
        error: freezed == error
            ? _self.error
            : error // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
      ),
    );
  }

  /// Create a copy of LocationFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AdminLocationCopyWith<$Res>? get location {
    if (_self.location == null) {
      return null;
    }

    return $AdminLocationCopyWith<$Res>(_self.location!, (value) {
      return _then(_self.copyWith(location: value));
    });
  }
}
