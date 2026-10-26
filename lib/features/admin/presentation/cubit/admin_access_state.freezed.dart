// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_access_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdminAccessState {
  AdminAccessStatus get status;
  AdminScope? get scope;
  bool get online;
  ApiException? get error;

  /// Create a copy of AdminAccessState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AdminAccessStateCopyWith<AdminAccessState> get copyWith =>
      _$AdminAccessStateCopyWithImpl<AdminAccessState>(
        this as AdminAccessState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AdminAccessState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.scope, scope) || other.scope == scope) &&
            (identical(other.online, online) || other.online == online) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, scope, online, error);

  @override
  String toString() {
    return 'AdminAccessState(status: $status, scope: $scope, online: $online, error: $error)';
  }
}

/// @nodoc
abstract mixin class $AdminAccessStateCopyWith<$Res> {
  factory $AdminAccessStateCopyWith(
    AdminAccessState value,
    $Res Function(AdminAccessState) _then,
  ) = _$AdminAccessStateCopyWithImpl;
  @useResult
  $Res call({
    AdminAccessStatus status,
    AdminScope? scope,
    bool online,
    ApiException? error,
  });

  $AdminScopeCopyWith<$Res>? get scope;
}

/// @nodoc
class _$AdminAccessStateCopyWithImpl<$Res>
    implements $AdminAccessStateCopyWith<$Res> {
  _$AdminAccessStateCopyWithImpl(this._self, this._then);

  final AdminAccessState _self;
  final $Res Function(AdminAccessState) _then;

  /// Create a copy of AdminAccessState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? scope = freezed,
    Object? online = null,
    Object? error = freezed,
  }) {
    return _then(
      _self.copyWith(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as AdminAccessStatus,
        scope: freezed == scope
            ? _self.scope
            : scope // ignore: cast_nullable_to_non_nullable
                  as AdminScope?,
        online: null == online
            ? _self.online
            : online // ignore: cast_nullable_to_non_nullable
                  as bool,
        error: freezed == error
            ? _self.error
            : error // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
      ),
    );
  }

  /// Create a copy of AdminAccessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AdminScopeCopyWith<$Res>? get scope {
    if (_self.scope == null) {
      return null;
    }

    return $AdminScopeCopyWith<$Res>(_self.scope!, (value) {
      return _then(_self.copyWith(scope: value));
    });
  }
}

/// Adds pattern-matching-related methods to [AdminAccessState].
extension AdminAccessStatePatterns on AdminAccessState {
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
    TResult Function(_AdminAccessState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdminAccessState() when $default != null:
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
    TResult Function(_AdminAccessState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminAccessState():
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
    TResult? Function(_AdminAccessState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminAccessState() when $default != null:
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
      AdminAccessStatus status,
      AdminScope? scope,
      bool online,
      ApiException? error,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdminAccessState() when $default != null:
        return $default(_that.status, _that.scope, _that.online, _that.error);
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
      AdminAccessStatus status,
      AdminScope? scope,
      bool online,
      ApiException? error,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminAccessState():
        return $default(_that.status, _that.scope, _that.online, _that.error);
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
      AdminAccessStatus status,
      AdminScope? scope,
      bool online,
      ApiException? error,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminAccessState() when $default != null:
        return $default(_that.status, _that.scope, _that.online, _that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AdminAccessState implements AdminAccessState {
  const _AdminAccessState({
    this.status = AdminAccessStatus.loading,
    this.scope,
    this.online = true,
    this.error,
  });

  @override
  @JsonKey()
  final AdminAccessStatus status;
  @override
  final AdminScope? scope;
  @override
  @JsonKey()
  final bool online;
  @override
  final ApiException? error;

  /// Create a copy of AdminAccessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AdminAccessStateCopyWith<_AdminAccessState> get copyWith =>
      __$AdminAccessStateCopyWithImpl<_AdminAccessState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AdminAccessState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.scope, scope) || other.scope == scope) &&
            (identical(other.online, online) || other.online == online) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, scope, online, error);

  @override
  String toString() {
    return 'AdminAccessState(status: $status, scope: $scope, online: $online, error: $error)';
  }
}

/// @nodoc
abstract mixin class _$AdminAccessStateCopyWith<$Res>
    implements $AdminAccessStateCopyWith<$Res> {
  factory _$AdminAccessStateCopyWith(
    _AdminAccessState value,
    $Res Function(_AdminAccessState) _then,
  ) = __$AdminAccessStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    AdminAccessStatus status,
    AdminScope? scope,
    bool online,
    ApiException? error,
  });

  @override
  $AdminScopeCopyWith<$Res>? get scope;
}

/// @nodoc
class __$AdminAccessStateCopyWithImpl<$Res>
    implements _$AdminAccessStateCopyWith<$Res> {
  __$AdminAccessStateCopyWithImpl(this._self, this._then);

  final _AdminAccessState _self;
  final $Res Function(_AdminAccessState) _then;

  /// Create a copy of AdminAccessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? scope = freezed,
    Object? online = null,
    Object? error = freezed,
  }) {
    return _then(
      _AdminAccessState(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as AdminAccessStatus,
        scope: freezed == scope
            ? _self.scope
            : scope // ignore: cast_nullable_to_non_nullable
                  as AdminScope?,
        online: null == online
            ? _self.online
            : online // ignore: cast_nullable_to_non_nullable
                  as bool,
        error: freezed == error
            ? _self.error
            : error // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
      ),
    );
  }

  /// Create a copy of AdminAccessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AdminScopeCopyWith<$Res>? get scope {
    if (_self.scope == null) {
      return null;
    }

    return $AdminScopeCopyWith<$Res>(_self.scope!, (value) {
      return _then(_self.copyWith(scope: value));
    });
  }
}
