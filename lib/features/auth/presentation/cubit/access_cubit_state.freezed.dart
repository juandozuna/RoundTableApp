// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'access_cubit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccessCubitState {
  AccessState get access;
  SignedInUser? get user;
  bool get refreshing;

  /// Create a copy of AccessCubitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AccessCubitStateCopyWith<AccessCubitState> get copyWith =>
      _$AccessCubitStateCopyWithImpl<AccessCubitState>(
        this as AccessCubitState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AccessCubitState &&
            (identical(other.access, access) || other.access == access) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.refreshing, refreshing) ||
                other.refreshing == refreshing));
  }

  @override
  int get hashCode => Object.hash(runtimeType, access, user, refreshing);

  @override
  String toString() {
    return 'AccessCubitState(access: $access, user: $user, refreshing: $refreshing)';
  }
}

/// @nodoc
abstract mixin class $AccessCubitStateCopyWith<$Res> {
  factory $AccessCubitStateCopyWith(
    AccessCubitState value,
    $Res Function(AccessCubitState) _then,
  ) = _$AccessCubitStateCopyWithImpl;
  @useResult
  $Res call({AccessState access, SignedInUser? user, bool refreshing});

  $AccessStateCopyWith<$Res> get access;
}

/// @nodoc
class _$AccessCubitStateCopyWithImpl<$Res>
    implements $AccessCubitStateCopyWith<$Res> {
  _$AccessCubitStateCopyWithImpl(this._self, this._then);

  final AccessCubitState _self;
  final $Res Function(AccessCubitState) _then;

  /// Create a copy of AccessCubitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? access = null,
    Object? user = freezed,
    Object? refreshing = null,
  }) {
    return _then(
      _self.copyWith(
        access: null == access
            ? _self.access
            : access // ignore: cast_nullable_to_non_nullable
                  as AccessState,
        user: freezed == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as SignedInUser?,
        refreshing: null == refreshing
            ? _self.refreshing
            : refreshing // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of AccessCubitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AccessStateCopyWith<$Res> get access {
    return $AccessStateCopyWith<$Res>(_self.access, (value) {
      return _then(_self.copyWith(access: value));
    });
  }
}

/// Adds pattern-matching-related methods to [AccessCubitState].
extension AccessCubitStatePatterns on AccessCubitState {
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
    TResult Function(_AccessCubitState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AccessCubitState() when $default != null:
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
    TResult Function(_AccessCubitState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AccessCubitState():
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
    TResult? Function(_AccessCubitState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AccessCubitState() when $default != null:
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
    TResult Function(AccessState access, SignedInUser? user, bool refreshing)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AccessCubitState() when $default != null:
        return $default(_that.access, _that.user, _that.refreshing);
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
    TResult Function(AccessState access, SignedInUser? user, bool refreshing)
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AccessCubitState():
        return $default(_that.access, _that.user, _that.refreshing);
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
    TResult? Function(AccessState access, SignedInUser? user, bool refreshing)?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AccessCubitState() when $default != null:
        return $default(_that.access, _that.user, _that.refreshing);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AccessCubitState extends AccessCubitState {
  const _AccessCubitState({
    this.access = const AccessState(),
    this.user,
    this.refreshing = false,
  }) : super._();

  @override
  @JsonKey()
  final AccessState access;
  @override
  final SignedInUser? user;
  @override
  @JsonKey()
  final bool refreshing;

  /// Create a copy of AccessCubitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AccessCubitStateCopyWith<_AccessCubitState> get copyWith =>
      __$AccessCubitStateCopyWithImpl<_AccessCubitState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AccessCubitState &&
            (identical(other.access, access) || other.access == access) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.refreshing, refreshing) ||
                other.refreshing == refreshing));
  }

  @override
  int get hashCode => Object.hash(runtimeType, access, user, refreshing);

  @override
  String toString() {
    return 'AccessCubitState(access: $access, user: $user, refreshing: $refreshing)';
  }
}

/// @nodoc
abstract mixin class _$AccessCubitStateCopyWith<$Res>
    implements $AccessCubitStateCopyWith<$Res> {
  factory _$AccessCubitStateCopyWith(
    _AccessCubitState value,
    $Res Function(_AccessCubitState) _then,
  ) = __$AccessCubitStateCopyWithImpl;
  @override
  @useResult
  $Res call({AccessState access, SignedInUser? user, bool refreshing});

  @override
  $AccessStateCopyWith<$Res> get access;
}

/// @nodoc
class __$AccessCubitStateCopyWithImpl<$Res>
    implements _$AccessCubitStateCopyWith<$Res> {
  __$AccessCubitStateCopyWithImpl(this._self, this._then);

  final _AccessCubitState _self;
  final $Res Function(_AccessCubitState) _then;

  /// Create a copy of AccessCubitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? access = null,
    Object? user = freezed,
    Object? refreshing = null,
  }) {
    return _then(
      _AccessCubitState(
        access: null == access
            ? _self.access
            : access // ignore: cast_nullable_to_non_nullable
                  as AccessState,
        user: freezed == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as SignedInUser?,
        refreshing: null == refreshing
            ? _self.refreshing
            : refreshing // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of AccessCubitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AccessStateCopyWith<$Res> get access {
    return $AccessStateCopyWith<$Res>(_self.access, (value) {
      return _then(_self.copyWith(access: value));
    });
  }
}
