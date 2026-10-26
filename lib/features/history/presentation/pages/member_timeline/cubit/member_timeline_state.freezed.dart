// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_timeline_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MemberTimelineState {
  MemberTimelineStatus get status;
  MemberHistory? get history;
  Object? get error;
  bool get online;

  /// Create a copy of MemberTimelineState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MemberTimelineStateCopyWith<MemberTimelineState> get copyWith =>
      _$MemberTimelineStateCopyWithImpl<MemberTimelineState>(
        this as MemberTimelineState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MemberTimelineState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.history, history) || other.history == history) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.online, online) || other.online == online));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    history,
    const DeepCollectionEquality().hash(error),
    online,
  );

  @override
  String toString() {
    return 'MemberTimelineState(status: $status, history: $history, error: $error, online: $online)';
  }
}

/// @nodoc
abstract mixin class $MemberTimelineStateCopyWith<$Res> {
  factory $MemberTimelineStateCopyWith(
    MemberTimelineState value,
    $Res Function(MemberTimelineState) _then,
  ) = _$MemberTimelineStateCopyWithImpl;
  @useResult
  $Res call({
    MemberTimelineStatus status,
    MemberHistory? history,
    Object? error,
    bool online,
  });

  $MemberHistoryCopyWith<$Res>? get history;
}

/// @nodoc
class _$MemberTimelineStateCopyWithImpl<$Res>
    implements $MemberTimelineStateCopyWith<$Res> {
  _$MemberTimelineStateCopyWithImpl(this._self, this._then);

  final MemberTimelineState _self;
  final $Res Function(MemberTimelineState) _then;

  /// Create a copy of MemberTimelineState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? history = freezed,
    Object? error = freezed,
    Object? online = null,
  }) {
    return _then(
      _self.copyWith(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as MemberTimelineStatus,
        history: freezed == history
            ? _self.history
            : history // ignore: cast_nullable_to_non_nullable
                  as MemberHistory?,
        error: freezed == error ? _self.error : error,
        online: null == online
            ? _self.online
            : online // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of MemberTimelineState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MemberHistoryCopyWith<$Res>? get history {
    if (_self.history == null) {
      return null;
    }

    return $MemberHistoryCopyWith<$Res>(_self.history!, (value) {
      return _then(_self.copyWith(history: value));
    });
  }
}

/// Adds pattern-matching-related methods to [MemberTimelineState].
extension MemberTimelineStatePatterns on MemberTimelineState {
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
    TResult Function(_MemberTimelineState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MemberTimelineState() when $default != null:
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
    TResult Function(_MemberTimelineState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberTimelineState():
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
    TResult? Function(_MemberTimelineState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberTimelineState() when $default != null:
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
      MemberTimelineStatus status,
      MemberHistory? history,
      Object? error,
      bool online,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MemberTimelineState() when $default != null:
        return $default(_that.status, _that.history, _that.error, _that.online);
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
      MemberTimelineStatus status,
      MemberHistory? history,
      Object? error,
      bool online,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberTimelineState():
        return $default(_that.status, _that.history, _that.error, _that.online);
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
      MemberTimelineStatus status,
      MemberHistory? history,
      Object? error,
      bool online,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberTimelineState() when $default != null:
        return $default(_that.status, _that.history, _that.error, _that.online);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MemberTimelineState implements MemberTimelineState {
  const _MemberTimelineState({
    this.status = MemberTimelineStatus.loading,
    this.history,
    this.error,
    this.online = true,
  });

  @override
  @JsonKey()
  final MemberTimelineStatus status;
  @override
  final MemberHistory? history;
  @override
  final Object? error;
  @override
  @JsonKey()
  final bool online;

  /// Create a copy of MemberTimelineState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MemberTimelineStateCopyWith<_MemberTimelineState> get copyWith =>
      __$MemberTimelineStateCopyWithImpl<_MemberTimelineState>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MemberTimelineState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.history, history) || other.history == history) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.online, online) || other.online == online));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    history,
    const DeepCollectionEquality().hash(error),
    online,
  );

  @override
  String toString() {
    return 'MemberTimelineState(status: $status, history: $history, error: $error, online: $online)';
  }
}

/// @nodoc
abstract mixin class _$MemberTimelineStateCopyWith<$Res>
    implements $MemberTimelineStateCopyWith<$Res> {
  factory _$MemberTimelineStateCopyWith(
    _MemberTimelineState value,
    $Res Function(_MemberTimelineState) _then,
  ) = __$MemberTimelineStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    MemberTimelineStatus status,
    MemberHistory? history,
    Object? error,
    bool online,
  });

  @override
  $MemberHistoryCopyWith<$Res>? get history;
}

/// @nodoc
class __$MemberTimelineStateCopyWithImpl<$Res>
    implements _$MemberTimelineStateCopyWith<$Res> {
  __$MemberTimelineStateCopyWithImpl(this._self, this._then);

  final _MemberTimelineState _self;
  final $Res Function(_MemberTimelineState) _then;

  /// Create a copy of MemberTimelineState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? history = freezed,
    Object? error = freezed,
    Object? online = null,
  }) {
    return _then(
      _MemberTimelineState(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as MemberTimelineStatus,
        history: freezed == history
            ? _self.history
            : history // ignore: cast_nullable_to_non_nullable
                  as MemberHistory?,
        error: freezed == error ? _self.error : error,
        online: null == online
            ? _self.online
            : online // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of MemberTimelineState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MemberHistoryCopyWith<$Res>? get history {
    if (_self.history == null) {
      return null;
    }

    return $MemberHistoryCopyWith<$Res>(_self.history!, (value) {
      return _then(_self.copyWith(history: value));
    });
  }
}
