// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignInState {
  /// The provider flow is open (waiting for the person or the redirect).
  AuthProvider? get signingInWith;
  bool get devBusy;
  SignInNotice get notice;

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignInStateCopyWith<SignInState> get copyWith =>
      _$SignInStateCopyWithImpl<SignInState>(this as SignInState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignInState &&
            (identical(other.signingInWith, signingInWith) ||
                other.signingInWith == signingInWith) &&
            (identical(other.devBusy, devBusy) || other.devBusy == devBusy) &&
            (identical(other.notice, notice) || other.notice == notice));
  }

  @override
  int get hashCode => Object.hash(runtimeType, signingInWith, devBusy, notice);

  @override
  String toString() {
    return 'SignInState(signingInWith: $signingInWith, devBusy: $devBusy, notice: $notice)';
  }
}

/// @nodoc
abstract mixin class $SignInStateCopyWith<$Res> {
  factory $SignInStateCopyWith(
    SignInState value,
    $Res Function(SignInState) _then,
  ) = _$SignInStateCopyWithImpl;
  @useResult
  $Res call({AuthProvider? signingInWith, bool devBusy, SignInNotice notice});
}

/// @nodoc
class _$SignInStateCopyWithImpl<$Res> implements $SignInStateCopyWith<$Res> {
  _$SignInStateCopyWithImpl(this._self, this._then);

  final SignInState _self;
  final $Res Function(SignInState) _then;

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signingInWith = freezed,
    Object? devBusy = null,
    Object? notice = null,
  }) {
    return _then(
      _self.copyWith(
        signingInWith: freezed == signingInWith
            ? _self.signingInWith
            : signingInWith // ignore: cast_nullable_to_non_nullable
                  as AuthProvider?,
        devBusy: null == devBusy
            ? _self.devBusy
            : devBusy // ignore: cast_nullable_to_non_nullable
                  as bool,
        notice: null == notice
            ? _self.notice
            : notice // ignore: cast_nullable_to_non_nullable
                  as SignInNotice,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [SignInState].
extension SignInStatePatterns on SignInState {
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
    TResult Function(_SignInState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SignInState() when $default != null:
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
    TResult Function(_SignInState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SignInState():
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
    TResult? Function(_SignInState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SignInState() when $default != null:
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
      AuthProvider? signingInWith,
      bool devBusy,
      SignInNotice notice,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SignInState() when $default != null:
        return $default(_that.signingInWith, _that.devBusy, _that.notice);
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
      AuthProvider? signingInWith,
      bool devBusy,
      SignInNotice notice,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SignInState():
        return $default(_that.signingInWith, _that.devBusy, _that.notice);
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
      AuthProvider? signingInWith,
      bool devBusy,
      SignInNotice notice,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SignInState() when $default != null:
        return $default(_that.signingInWith, _that.devBusy, _that.notice);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SignInState extends SignInState {
  const _SignInState({
    this.signingInWith,
    this.devBusy = false,
    this.notice = SignInNotice.none,
  }) : super._();

  /// The provider flow is open (waiting for the person or the redirect).
  @override
  final AuthProvider? signingInWith;
  @override
  @JsonKey()
  final bool devBusy;
  @override
  @JsonKey()
  final SignInNotice notice;

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SignInStateCopyWith<_SignInState> get copyWith =>
      __$SignInStateCopyWithImpl<_SignInState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignInState &&
            (identical(other.signingInWith, signingInWith) ||
                other.signingInWith == signingInWith) &&
            (identical(other.devBusy, devBusy) || other.devBusy == devBusy) &&
            (identical(other.notice, notice) || other.notice == notice));
  }

  @override
  int get hashCode => Object.hash(runtimeType, signingInWith, devBusy, notice);

  @override
  String toString() {
    return 'SignInState(signingInWith: $signingInWith, devBusy: $devBusy, notice: $notice)';
  }
}

/// @nodoc
abstract mixin class _$SignInStateCopyWith<$Res>
    implements $SignInStateCopyWith<$Res> {
  factory _$SignInStateCopyWith(
    _SignInState value,
    $Res Function(_SignInState) _then,
  ) = __$SignInStateCopyWithImpl;
  @override
  @useResult
  $Res call({AuthProvider? signingInWith, bool devBusy, SignInNotice notice});
}

/// @nodoc
class __$SignInStateCopyWithImpl<$Res> implements _$SignInStateCopyWith<$Res> {
  __$SignInStateCopyWithImpl(this._self, this._then);

  final _SignInState _self;
  final $Res Function(_SignInState) _then;

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? signingInWith = freezed,
    Object? devBusy = null,
    Object? notice = null,
  }) {
    return _then(
      _SignInState(
        signingInWith: freezed == signingInWith
            ? _self.signingInWith
            : signingInWith // ignore: cast_nullable_to_non_nullable
                  as AuthProvider?,
        devBusy: null == devBusy
            ? _self.devBusy
            : devBusy // ignore: cast_nullable_to_non_nullable
                  as bool,
        notice: null == notice
            ? _self.notice
            : notice // ignore: cast_nullable_to_non_nullable
                  as SignInNotice,
      ),
    );
  }
}
