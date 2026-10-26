// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'step_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StepProgress {
  bool get isDone;

  /// Row sync state; null until [isDone].
  SyncState? get syncState;

  /// Score given in the step (follow-up and reflection), when visible.
  int? get score;

  /// Create a copy of StepProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StepProgressCopyWith<StepProgress> get copyWith =>
      _$StepProgressCopyWithImpl<StepProgress>(
        this as StepProgress,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StepProgress &&
            (identical(other.isDone, isDone) || other.isDone == isDone) &&
            (identical(other.syncState, syncState) ||
                other.syncState == syncState) &&
            (identical(other.score, score) || other.score == score));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isDone, syncState, score);

  @override
  String toString() {
    return 'StepProgress(isDone: $isDone, syncState: $syncState, score: $score)';
  }
}

/// @nodoc
abstract mixin class $StepProgressCopyWith<$Res> {
  factory $StepProgressCopyWith(
    StepProgress value,
    $Res Function(StepProgress) _then,
  ) = _$StepProgressCopyWithImpl;
  @useResult
  $Res call({bool isDone, SyncState? syncState, int? score});
}

/// @nodoc
class _$StepProgressCopyWithImpl<$Res> implements $StepProgressCopyWith<$Res> {
  _$StepProgressCopyWithImpl(this._self, this._then);

  final StepProgress _self;
  final $Res Function(StepProgress) _then;

  /// Create a copy of StepProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDone = null,
    Object? syncState = freezed,
    Object? score = freezed,
  }) {
    return _then(
      _self.copyWith(
        isDone: null == isDone
            ? _self.isDone
            : isDone // ignore: cast_nullable_to_non_nullable
                  as bool,
        syncState: freezed == syncState
            ? _self.syncState
            : syncState // ignore: cast_nullable_to_non_nullable
                  as SyncState?,
        score: freezed == score
            ? _self.score
            : score // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [StepProgress].
extension StepProgressPatterns on StepProgress {
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
    TResult Function(_StepProgress value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StepProgress() when $default != null:
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
    TResult Function(_StepProgress value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StepProgress():
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
    TResult? Function(_StepProgress value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StepProgress() when $default != null:
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
    TResult Function(bool isDone, SyncState? syncState, int? score)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StepProgress() when $default != null:
        return $default(_that.isDone, _that.syncState, _that.score);
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
    TResult Function(bool isDone, SyncState? syncState, int? score) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StepProgress():
        return $default(_that.isDone, _that.syncState, _that.score);
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
    TResult? Function(bool isDone, SyncState? syncState, int? score)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _StepProgress() when $default != null:
        return $default(_that.isDone, _that.syncState, _that.score);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _StepProgress extends StepProgress {
  const _StepProgress({this.isDone = false, this.syncState, this.score})
    : super._();

  @override
  @JsonKey()
  final bool isDone;

  /// Row sync state; null until [isDone].
  @override
  final SyncState? syncState;

  /// Score given in the step (follow-up and reflection), when visible.
  @override
  final int? score;

  /// Create a copy of StepProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StepProgressCopyWith<_StepProgress> get copyWith =>
      __$StepProgressCopyWithImpl<_StepProgress>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StepProgress &&
            (identical(other.isDone, isDone) || other.isDone == isDone) &&
            (identical(other.syncState, syncState) ||
                other.syncState == syncState) &&
            (identical(other.score, score) || other.score == score));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isDone, syncState, score);

  @override
  String toString() {
    return 'StepProgress(isDone: $isDone, syncState: $syncState, score: $score)';
  }
}

/// @nodoc
abstract mixin class _$StepProgressCopyWith<$Res>
    implements $StepProgressCopyWith<$Res> {
  factory _$StepProgressCopyWith(
    _StepProgress value,
    $Res Function(_StepProgress) _then,
  ) = __$StepProgressCopyWithImpl;
  @override
  @useResult
  $Res call({bool isDone, SyncState? syncState, int? score});
}

/// @nodoc
class __$StepProgressCopyWithImpl<$Res>
    implements _$StepProgressCopyWith<$Res> {
  __$StepProgressCopyWithImpl(this._self, this._then);

  final _StepProgress _self;
  final $Res Function(_StepProgress) _then;

  /// Create a copy of StepProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isDone = null,
    Object? syncState = freezed,
    Object? score = freezed,
  }) {
    return _then(
      _StepProgress(
        isDone: null == isDone
            ? _self.isDone
            : isDone // ignore: cast_nullable_to_non_nullable
                  as bool,
        syncState: freezed == syncState
            ? _self.syncState
            : syncState // ignore: cast_nullable_to_non_nullable
                  as SyncState?,
        score: freezed == score
            ? _self.score
            : score // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}
