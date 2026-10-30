// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResetPasswordState {
  bool get saving;

  /// The new password is set; the page offers to continue.
  bool get done;
  ResetPasswordNotice get notice;

  /// Create a copy of ResetPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ResetPasswordStateCopyWith<ResetPasswordState> get copyWith =>
      _$ResetPasswordStateCopyWithImpl<ResetPasswordState>(
        this as ResetPasswordState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ResetPasswordState &&
            (identical(other.saving, saving) || other.saving == saving) &&
            (identical(other.done, done) || other.done == done) &&
            (identical(other.notice, notice) || other.notice == notice));
  }

  @override
  int get hashCode => Object.hash(runtimeType, saving, done, notice);

  @override
  String toString() {
    return 'ResetPasswordState(saving: $saving, done: $done, notice: $notice)';
  }
}

/// @nodoc
abstract mixin class $ResetPasswordStateCopyWith<$Res> {
  factory $ResetPasswordStateCopyWith(
    ResetPasswordState value,
    $Res Function(ResetPasswordState) _then,
  ) = _$ResetPasswordStateCopyWithImpl;
  @useResult
  $Res call({bool saving, bool done, ResetPasswordNotice notice});
}

/// @nodoc
class _$ResetPasswordStateCopyWithImpl<$Res>
    implements $ResetPasswordStateCopyWith<$Res> {
  _$ResetPasswordStateCopyWithImpl(this._self, this._then);

  final ResetPasswordState _self;
  final $Res Function(ResetPasswordState) _then;

  /// Create a copy of ResetPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saving = null,
    Object? done = null,
    Object? notice = null,
  }) {
    return _then(
      _self.copyWith(
        saving: null == saving
            ? _self.saving
            : saving // ignore: cast_nullable_to_non_nullable
                  as bool,
        done: null == done
            ? _self.done
            : done // ignore: cast_nullable_to_non_nullable
                  as bool,
        notice: null == notice
            ? _self.notice
            : notice // ignore: cast_nullable_to_non_nullable
                  as ResetPasswordNotice,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [ResetPasswordState].
extension ResetPasswordStatePatterns on ResetPasswordState {
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
    TResult Function(_ResetPasswordState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ResetPasswordState() when $default != null:
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
    TResult Function(_ResetPasswordState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResetPasswordState():
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
    TResult? Function(_ResetPasswordState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResetPasswordState() when $default != null:
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
    TResult Function(bool saving, bool done, ResetPasswordNotice notice)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ResetPasswordState() when $default != null:
        return $default(_that.saving, _that.done, _that.notice);
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
    TResult Function(bool saving, bool done, ResetPasswordNotice notice)
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResetPasswordState():
        return $default(_that.saving, _that.done, _that.notice);
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
    TResult? Function(bool saving, bool done, ResetPasswordNotice notice)?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ResetPasswordState() when $default != null:
        return $default(_that.saving, _that.done, _that.notice);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ResetPasswordState implements ResetPasswordState {
  const _ResetPasswordState({
    this.saving = false,
    this.done = false,
    this.notice = ResetPasswordNotice.none,
  });

  @override
  @JsonKey()
  final bool saving;

  /// The new password is set; the page offers to continue.
  @override
  @JsonKey()
  final bool done;
  @override
  @JsonKey()
  final ResetPasswordNotice notice;

  /// Create a copy of ResetPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ResetPasswordStateCopyWith<_ResetPasswordState> get copyWith =>
      __$ResetPasswordStateCopyWithImpl<_ResetPasswordState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ResetPasswordState &&
            (identical(other.saving, saving) || other.saving == saving) &&
            (identical(other.done, done) || other.done == done) &&
            (identical(other.notice, notice) || other.notice == notice));
  }

  @override
  int get hashCode => Object.hash(runtimeType, saving, done, notice);

  @override
  String toString() {
    return 'ResetPasswordState(saving: $saving, done: $done, notice: $notice)';
  }
}

/// @nodoc
abstract mixin class _$ResetPasswordStateCopyWith<$Res>
    implements $ResetPasswordStateCopyWith<$Res> {
  factory _$ResetPasswordStateCopyWith(
    _ResetPasswordState value,
    $Res Function(_ResetPasswordState) _then,
  ) = __$ResetPasswordStateCopyWithImpl;
  @override
  @useResult
  $Res call({bool saving, bool done, ResetPasswordNotice notice});
}

/// @nodoc
class __$ResetPasswordStateCopyWithImpl<$Res>
    implements _$ResetPasswordStateCopyWith<$Res> {
  __$ResetPasswordStateCopyWithImpl(this._self, this._then);

  final _ResetPasswordState _self;
  final $Res Function(_ResetPasswordState) _then;

  /// Create a copy of ResetPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? saving = null,
    Object? done = null,
    Object? notice = null,
  }) {
    return _then(
      _ResetPasswordState(
        saving: null == saving
            ? _self.saving
            : saving // ignore: cast_nullable_to_non_nullable
                  as bool,
        done: null == done
            ? _self.done
            : done // ignore: cast_nullable_to_non_nullable
                  as bool,
        notice: null == notice
            ? _self.notice
            : notice // ignore: cast_nullable_to_non_nullable
                  as ResetPasswordNotice,
      ),
    );
  }
}
