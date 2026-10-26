// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_out_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignOutState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SignOutState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SignOutState()';
  }
}

/// @nodoc
class $SignOutStateCopyWith<$Res> {
  $SignOutStateCopyWith(SignOutState _, $Res Function(SignOutState) __);
}

/// Adds pattern-matching-related methods to [SignOutState].
extension SignOutStatePatterns on SignOutState {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignOutChecking value)? checking,
    TResult Function(SignOutConfirm value)? confirm,
    TResult Function(SignOutSyncing value)? syncing,
    TResult Function(SignOutSigningOut value)? signingOut,
    TResult Function(SignOutDone value)? done,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case SignOutChecking() when checking != null:
        return checking(_that);
      case SignOutConfirm() when confirm != null:
        return confirm(_that);
      case SignOutSyncing() when syncing != null:
        return syncing(_that);
      case SignOutSigningOut() when signingOut != null:
        return signingOut(_that);
      case SignOutDone() when done != null:
        return done(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(SignOutChecking value) checking,
    required TResult Function(SignOutConfirm value) confirm,
    required TResult Function(SignOutSyncing value) syncing,
    required TResult Function(SignOutSigningOut value) signingOut,
    required TResult Function(SignOutDone value) done,
  }) {
    final _that = this;
    switch (_that) {
      case SignOutChecking():
        return checking(_that);
      case SignOutConfirm():
        return confirm(_that);
      case SignOutSyncing():
        return syncing(_that);
      case SignOutSigningOut():
        return signingOut(_that);
      case SignOutDone():
        return done(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignOutChecking value)? checking,
    TResult? Function(SignOutConfirm value)? confirm,
    TResult? Function(SignOutSyncing value)? syncing,
    TResult? Function(SignOutSigningOut value)? signingOut,
    TResult? Function(SignOutDone value)? done,
  }) {
    final _that = this;
    switch (_that) {
      case SignOutChecking() when checking != null:
        return checking(_that);
      case SignOutConfirm() when confirm != null:
        return confirm(_that);
      case SignOutSyncing() when syncing != null:
        return syncing(_that);
      case SignOutSigningOut() when signingOut != null:
        return signingOut(_that);
      case SignOutDone() when done != null:
        return done(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checking,
    TResult Function(int pendingCount, bool online, SignOutProblem? problem)?
    confirm,
    TResult Function()? syncing,
    TResult Function()? signingOut,
    TResult Function()? done,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case SignOutChecking() when checking != null:
        return checking();
      case SignOutConfirm() when confirm != null:
        return confirm(_that.pendingCount, _that.online, _that.problem);
      case SignOutSyncing() when syncing != null:
        return syncing();
      case SignOutSigningOut() when signingOut != null:
        return signingOut();
      case SignOutDone() when done != null:
        return done();
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
  TResult when<TResult extends Object?>({
    required TResult Function() checking,
    required TResult Function(
      int pendingCount,
      bool online,
      SignOutProblem? problem,
    )
    confirm,
    required TResult Function() syncing,
    required TResult Function() signingOut,
    required TResult Function() done,
  }) {
    final _that = this;
    switch (_that) {
      case SignOutChecking():
        return checking();
      case SignOutConfirm():
        return confirm(_that.pendingCount, _that.online, _that.problem);
      case SignOutSyncing():
        return syncing();
      case SignOutSigningOut():
        return signingOut();
      case SignOutDone():
        return done();
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checking,
    TResult? Function(int pendingCount, bool online, SignOutProblem? problem)?
    confirm,
    TResult? Function()? syncing,
    TResult? Function()? signingOut,
    TResult? Function()? done,
  }) {
    final _that = this;
    switch (_that) {
      case SignOutChecking() when checking != null:
        return checking();
      case SignOutConfirm() when confirm != null:
        return confirm(_that.pendingCount, _that.online, _that.problem);
      case SignOutSyncing() when syncing != null:
        return syncing();
      case SignOutSigningOut() when signingOut != null:
        return signingOut();
      case SignOutDone() when done != null:
        return done();
      case _:
        return null;
    }
  }
}

/// @nodoc

class SignOutChecking implements SignOutState {
  const SignOutChecking();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SignOutChecking);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SignOutState.checking()';
  }
}

/// @nodoc

class SignOutConfirm implements SignOutState {
  const SignOutConfirm({
    required this.pendingCount,
    required this.online,
    this.problem,
  });

  final int pendingCount;
  final bool online;
  final SignOutProblem? problem;

  /// Create a copy of SignOutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignOutConfirmCopyWith<SignOutConfirm> get copyWith =>
      _$SignOutConfirmCopyWithImpl<SignOutConfirm>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignOutConfirm &&
            (identical(other.pendingCount, pendingCount) ||
                other.pendingCount == pendingCount) &&
            (identical(other.online, online) || other.online == online) &&
            (identical(other.problem, problem) || other.problem == problem));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pendingCount, online, problem);

  @override
  String toString() {
    return 'SignOutState.confirm(pendingCount: $pendingCount, online: $online, problem: $problem)';
  }
}

/// @nodoc
abstract mixin class $SignOutConfirmCopyWith<$Res>
    implements $SignOutStateCopyWith<$Res> {
  factory $SignOutConfirmCopyWith(
    SignOutConfirm value,
    $Res Function(SignOutConfirm) _then,
  ) = _$SignOutConfirmCopyWithImpl;
  @useResult
  $Res call({int pendingCount, bool online, SignOutProblem? problem});
}

/// @nodoc
class _$SignOutConfirmCopyWithImpl<$Res>
    implements $SignOutConfirmCopyWith<$Res> {
  _$SignOutConfirmCopyWithImpl(this._self, this._then);

  final SignOutConfirm _self;
  final $Res Function(SignOutConfirm) _then;

  /// Create a copy of SignOutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? pendingCount = null,
    Object? online = null,
    Object? problem = freezed,
  }) {
    return _then(
      SignOutConfirm(
        pendingCount: null == pendingCount
            ? _self.pendingCount
            : pendingCount // ignore: cast_nullable_to_non_nullable
                  as int,
        online: null == online
            ? _self.online
            : online // ignore: cast_nullable_to_non_nullable
                  as bool,
        problem: freezed == problem
            ? _self.problem
            : problem // ignore: cast_nullable_to_non_nullable
                  as SignOutProblem?,
      ),
    );
  }
}

/// @nodoc

class SignOutSyncing implements SignOutState {
  const SignOutSyncing();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SignOutSyncing);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SignOutState.syncing()';
  }
}

/// @nodoc

class SignOutSigningOut implements SignOutState {
  const SignOutSigningOut();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SignOutSigningOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SignOutState.signingOut()';
  }
}

/// @nodoc

class SignOutDone implements SignOutState {
  const SignOutDone();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SignOutDone);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SignOutState.done()';
  }
}
