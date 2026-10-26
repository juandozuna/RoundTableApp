// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'organization_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrganizationDetailState {
  OrganizationDetailStatus get status;
  OrganizationDetail? get detail;
  ApiException? get error;

  /// A status change is being sent.
  bool get working;

  /// Status the organization was just moved to (drives the success toast).
  OrganizationStatus? get changedTo;

  /// Failure of the last status change (drives the error toast).
  ApiException? get actionError;

  /// Create a copy of OrganizationDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrganizationDetailStateCopyWith<OrganizationDetailState> get copyWith =>
      _$OrganizationDetailStateCopyWithImpl<OrganizationDetailState>(
        this as OrganizationDetailState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrganizationDetailState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.working, working) || other.working == working) &&
            (identical(other.changedTo, changedTo) ||
                other.changedTo == changedTo) &&
            (identical(other.actionError, actionError) ||
                other.actionError == actionError));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    detail,
    error,
    working,
    changedTo,
    actionError,
  );

  @override
  String toString() {
    return 'OrganizationDetailState(status: $status, detail: $detail, error: $error, working: $working, changedTo: $changedTo, actionError: $actionError)';
  }
}

/// @nodoc
abstract mixin class $OrganizationDetailStateCopyWith<$Res> {
  factory $OrganizationDetailStateCopyWith(
    OrganizationDetailState value,
    $Res Function(OrganizationDetailState) _then,
  ) = _$OrganizationDetailStateCopyWithImpl;
  @useResult
  $Res call({
    OrganizationDetailStatus status,
    OrganizationDetail? detail,
    ApiException? error,
    bool working,
    OrganizationStatus? changedTo,
    ApiException? actionError,
  });

  $OrganizationDetailCopyWith<$Res>? get detail;
}

/// @nodoc
class _$OrganizationDetailStateCopyWithImpl<$Res>
    implements $OrganizationDetailStateCopyWith<$Res> {
  _$OrganizationDetailStateCopyWithImpl(this._self, this._then);

  final OrganizationDetailState _self;
  final $Res Function(OrganizationDetailState) _then;

  /// Create a copy of OrganizationDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? detail = freezed,
    Object? error = freezed,
    Object? working = null,
    Object? changedTo = freezed,
    Object? actionError = freezed,
  }) {
    return _then(
      _self.copyWith(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as OrganizationDetailStatus,
        detail: freezed == detail
            ? _self.detail
            : detail // ignore: cast_nullable_to_non_nullable
                  as OrganizationDetail?,
        error: freezed == error
            ? _self.error
            : error // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
        working: null == working
            ? _self.working
            : working // ignore: cast_nullable_to_non_nullable
                  as bool,
        changedTo: freezed == changedTo
            ? _self.changedTo
            : changedTo // ignore: cast_nullable_to_non_nullable
                  as OrganizationStatus?,
        actionError: freezed == actionError
            ? _self.actionError
            : actionError // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
      ),
    );
  }

  /// Create a copy of OrganizationDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrganizationDetailCopyWith<$Res>? get detail {
    if (_self.detail == null) {
      return null;
    }

    return $OrganizationDetailCopyWith<$Res>(_self.detail!, (value) {
      return _then(_self.copyWith(detail: value));
    });
  }
}

/// Adds pattern-matching-related methods to [OrganizationDetailState].
extension OrganizationDetailStatePatterns on OrganizationDetailState {
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
    TResult Function(_OrganizationDetailState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrganizationDetailState() when $default != null:
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
    TResult Function(_OrganizationDetailState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrganizationDetailState():
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
    TResult? Function(_OrganizationDetailState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrganizationDetailState() when $default != null:
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
      OrganizationDetailStatus status,
      OrganizationDetail? detail,
      ApiException? error,
      bool working,
      OrganizationStatus? changedTo,
      ApiException? actionError,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrganizationDetailState() when $default != null:
        return $default(
          _that.status,
          _that.detail,
          _that.error,
          _that.working,
          _that.changedTo,
          _that.actionError,
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
      OrganizationDetailStatus status,
      OrganizationDetail? detail,
      ApiException? error,
      bool working,
      OrganizationStatus? changedTo,
      ApiException? actionError,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrganizationDetailState():
        return $default(
          _that.status,
          _that.detail,
          _that.error,
          _that.working,
          _that.changedTo,
          _that.actionError,
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
      OrganizationDetailStatus status,
      OrganizationDetail? detail,
      ApiException? error,
      bool working,
      OrganizationStatus? changedTo,
      ApiException? actionError,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrganizationDetailState() when $default != null:
        return $default(
          _that.status,
          _that.detail,
          _that.error,
          _that.working,
          _that.changedTo,
          _that.actionError,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _OrganizationDetailState implements OrganizationDetailState {
  const _OrganizationDetailState({
    this.status = OrganizationDetailStatus.loading,
    this.detail,
    this.error,
    this.working = false,
    this.changedTo,
    this.actionError,
  });

  @override
  @JsonKey()
  final OrganizationDetailStatus status;
  @override
  final OrganizationDetail? detail;
  @override
  final ApiException? error;

  /// A status change is being sent.
  @override
  @JsonKey()
  final bool working;

  /// Status the organization was just moved to (drives the success toast).
  @override
  final OrganizationStatus? changedTo;

  /// Failure of the last status change (drives the error toast).
  @override
  final ApiException? actionError;

  /// Create a copy of OrganizationDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrganizationDetailStateCopyWith<_OrganizationDetailState> get copyWith =>
      __$OrganizationDetailStateCopyWithImpl<_OrganizationDetailState>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrganizationDetailState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.working, working) || other.working == working) &&
            (identical(other.changedTo, changedTo) ||
                other.changedTo == changedTo) &&
            (identical(other.actionError, actionError) ||
                other.actionError == actionError));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    detail,
    error,
    working,
    changedTo,
    actionError,
  );

  @override
  String toString() {
    return 'OrganizationDetailState(status: $status, detail: $detail, error: $error, working: $working, changedTo: $changedTo, actionError: $actionError)';
  }
}

/// @nodoc
abstract mixin class _$OrganizationDetailStateCopyWith<$Res>
    implements $OrganizationDetailStateCopyWith<$Res> {
  factory _$OrganizationDetailStateCopyWith(
    _OrganizationDetailState value,
    $Res Function(_OrganizationDetailState) _then,
  ) = __$OrganizationDetailStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    OrganizationDetailStatus status,
    OrganizationDetail? detail,
    ApiException? error,
    bool working,
    OrganizationStatus? changedTo,
    ApiException? actionError,
  });

  @override
  $OrganizationDetailCopyWith<$Res>? get detail;
}

/// @nodoc
class __$OrganizationDetailStateCopyWithImpl<$Res>
    implements _$OrganizationDetailStateCopyWith<$Res> {
  __$OrganizationDetailStateCopyWithImpl(this._self, this._then);

  final _OrganizationDetailState _self;
  final $Res Function(_OrganizationDetailState) _then;

  /// Create a copy of OrganizationDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? detail = freezed,
    Object? error = freezed,
    Object? working = null,
    Object? changedTo = freezed,
    Object? actionError = freezed,
  }) {
    return _then(
      _OrganizationDetailState(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as OrganizationDetailStatus,
        detail: freezed == detail
            ? _self.detail
            : detail // ignore: cast_nullable_to_non_nullable
                  as OrganizationDetail?,
        error: freezed == error
            ? _self.error
            : error // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
        working: null == working
            ? _self.working
            : working // ignore: cast_nullable_to_non_nullable
                  as bool,
        changedTo: freezed == changedTo
            ? _self.changedTo
            : changedTo // ignore: cast_nullable_to_non_nullable
                  as OrganizationStatus?,
        actionError: freezed == actionError
            ? _self.actionError
            : actionError // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
      ),
    );
  }

  /// Create a copy of OrganizationDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrganizationDetailCopyWith<$Res>? get detail {
    if (_self.detail == null) {
      return null;
    }

    return $OrganizationDetailCopyWith<$Res>(_self.detail!, (value) {
      return _then(_self.copyWith(detail: value));
    });
  }
}
