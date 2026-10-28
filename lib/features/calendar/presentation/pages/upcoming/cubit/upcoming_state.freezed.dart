// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upcoming_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpcomingState {
  UpcomingStatus get status;
  UpcomingSessions? get sessions;
  UpcomingFilter get filter;
  Object? get error;
  bool get online;

  /// Create a copy of UpcomingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpcomingStateCopyWith<UpcomingState> get copyWith =>
      _$UpcomingStateCopyWithImpl<UpcomingState>(
        this as UpcomingState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpcomingState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.sessions, sessions) ||
                other.sessions == sessions) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.online, online) || other.online == online));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    sessions,
    filter,
    const DeepCollectionEquality().hash(error),
    online,
  );

  @override
  String toString() {
    return 'UpcomingState(status: $status, sessions: $sessions, filter: $filter, error: $error, online: $online)';
  }
}

/// @nodoc
abstract mixin class $UpcomingStateCopyWith<$Res> {
  factory $UpcomingStateCopyWith(
    UpcomingState value,
    $Res Function(UpcomingState) _then,
  ) = _$UpcomingStateCopyWithImpl;
  @useResult
  $Res call({
    UpcomingStatus status,
    UpcomingSessions? sessions,
    UpcomingFilter filter,
    Object? error,
    bool online,
  });

  $UpcomingSessionsCopyWith<$Res>? get sessions;
  $UpcomingFilterCopyWith<$Res> get filter;
}

/// @nodoc
class _$UpcomingStateCopyWithImpl<$Res>
    implements $UpcomingStateCopyWith<$Res> {
  _$UpcomingStateCopyWithImpl(this._self, this._then);

  final UpcomingState _self;
  final $Res Function(UpcomingState) _then;

  /// Create a copy of UpcomingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? sessions = freezed,
    Object? filter = null,
    Object? error = freezed,
    Object? online = null,
  }) {
    return _then(
      _self.copyWith(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as UpcomingStatus,
        sessions: freezed == sessions
            ? _self.sessions
            : sessions // ignore: cast_nullable_to_non_nullable
                  as UpcomingSessions?,
        filter: null == filter
            ? _self.filter
            : filter // ignore: cast_nullable_to_non_nullable
                  as UpcomingFilter,
        error: freezed == error ? _self.error : error,
        online: null == online
            ? _self.online
            : online // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of UpcomingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UpcomingSessionsCopyWith<$Res>? get sessions {
    if (_self.sessions == null) {
      return null;
    }

    return $UpcomingSessionsCopyWith<$Res>(_self.sessions!, (value) {
      return _then(_self.copyWith(sessions: value));
    });
  }

  /// Create a copy of UpcomingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UpcomingFilterCopyWith<$Res> get filter {
    return $UpcomingFilterCopyWith<$Res>(_self.filter, (value) {
      return _then(_self.copyWith(filter: value));
    });
  }
}

/// Adds pattern-matching-related methods to [UpcomingState].
extension UpcomingStatePatterns on UpcomingState {
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
    TResult Function(_UpcomingState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpcomingState() when $default != null:
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
    TResult Function(_UpcomingState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpcomingState():
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
    TResult? Function(_UpcomingState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpcomingState() when $default != null:
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
      UpcomingStatus status,
      UpcomingSessions? sessions,
      UpcomingFilter filter,
      Object? error,
      bool online,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpcomingState() when $default != null:
        return $default(
          _that.status,
          _that.sessions,
          _that.filter,
          _that.error,
          _that.online,
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
      UpcomingStatus status,
      UpcomingSessions? sessions,
      UpcomingFilter filter,
      Object? error,
      bool online,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpcomingState():
        return $default(
          _that.status,
          _that.sessions,
          _that.filter,
          _that.error,
          _that.online,
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
      UpcomingStatus status,
      UpcomingSessions? sessions,
      UpcomingFilter filter,
      Object? error,
      bool online,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpcomingState() when $default != null:
        return $default(
          _that.status,
          _that.sessions,
          _that.filter,
          _that.error,
          _that.online,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _UpcomingState extends UpcomingState {
  const _UpcomingState({
    this.status = UpcomingStatus.loading,
    this.sessions,
    this.filter = const UpcomingFilter(),
    this.error,
    this.online = true,
  }) : super._();

  @override
  @JsonKey()
  final UpcomingStatus status;
  @override
  final UpcomingSessions? sessions;
  @override
  @JsonKey()
  final UpcomingFilter filter;
  @override
  final Object? error;
  @override
  @JsonKey()
  final bool online;

  /// Create a copy of UpcomingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpcomingStateCopyWith<_UpcomingState> get copyWith =>
      __$UpcomingStateCopyWithImpl<_UpcomingState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpcomingState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.sessions, sessions) ||
                other.sessions == sessions) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.online, online) || other.online == online));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    sessions,
    filter,
    const DeepCollectionEquality().hash(error),
    online,
  );

  @override
  String toString() {
    return 'UpcomingState(status: $status, sessions: $sessions, filter: $filter, error: $error, online: $online)';
  }
}

/// @nodoc
abstract mixin class _$UpcomingStateCopyWith<$Res>
    implements $UpcomingStateCopyWith<$Res> {
  factory _$UpcomingStateCopyWith(
    _UpcomingState value,
    $Res Function(_UpcomingState) _then,
  ) = __$UpcomingStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    UpcomingStatus status,
    UpcomingSessions? sessions,
    UpcomingFilter filter,
    Object? error,
    bool online,
  });

  @override
  $UpcomingSessionsCopyWith<$Res>? get sessions;
  @override
  $UpcomingFilterCopyWith<$Res> get filter;
}

/// @nodoc
class __$UpcomingStateCopyWithImpl<$Res>
    implements _$UpcomingStateCopyWith<$Res> {
  __$UpcomingStateCopyWithImpl(this._self, this._then);

  final _UpcomingState _self;
  final $Res Function(_UpcomingState) _then;

  /// Create a copy of UpcomingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? sessions = freezed,
    Object? filter = null,
    Object? error = freezed,
    Object? online = null,
  }) {
    return _then(
      _UpcomingState(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as UpcomingStatus,
        sessions: freezed == sessions
            ? _self.sessions
            : sessions // ignore: cast_nullable_to_non_nullable
                  as UpcomingSessions?,
        filter: null == filter
            ? _self.filter
            : filter // ignore: cast_nullable_to_non_nullable
                  as UpcomingFilter,
        error: freezed == error ? _self.error : error,
        online: null == online
            ? _self.online
            : online // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of UpcomingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UpcomingSessionsCopyWith<$Res>? get sessions {
    if (_self.sessions == null) {
      return null;
    }

    return $UpcomingSessionsCopyWith<$Res>(_self.sessions!, (value) {
      return _then(_self.copyWith(sessions: value));
    });
  }

  /// Create a copy of UpcomingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UpcomingFilterCopyWith<$Res> get filter {
    return $UpcomingFilterCopyWith<$Res>(_self.filter, (value) {
      return _then(_self.copyWith(filter: value));
    });
  }
}
