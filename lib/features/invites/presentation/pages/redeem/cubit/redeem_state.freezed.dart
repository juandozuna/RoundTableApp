// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'redeem_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RedeemState {
  RedeemStep get step;
  InvitePreview? get preview;
  SignedInUser? get user;

  /// Provider screen is open.
  AuthProvider? get signingInWith;

  /// Provider sign-in did not complete (cancelled, offline…).
  AuthFailureKind? get authNotice;
  InviteProblem? get problem;
  RedeemProfile? get profile;
  RedeemResult? get result;
  bool get online;

  /// Create a copy of RedeemState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RedeemStateCopyWith<RedeemState> get copyWith =>
      _$RedeemStateCopyWithImpl<RedeemState>(this as RedeemState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RedeemState &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.preview, preview) || other.preview == preview) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.signingInWith, signingInWith) ||
                other.signingInWith == signingInWith) &&
            (identical(other.authNotice, authNotice) ||
                other.authNotice == authNotice) &&
            (identical(other.problem, problem) || other.problem == problem) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.online, online) || other.online == online));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    step,
    preview,
    user,
    signingInWith,
    authNotice,
    problem,
    profile,
    result,
    online,
  );

  @override
  String toString() {
    return 'RedeemState(step: $step, preview: $preview, user: $user, signingInWith: $signingInWith, authNotice: $authNotice, problem: $problem, profile: $profile, result: $result, online: $online)';
  }
}

/// @nodoc
abstract mixin class $RedeemStateCopyWith<$Res> {
  factory $RedeemStateCopyWith(
    RedeemState value,
    $Res Function(RedeemState) _then,
  ) = _$RedeemStateCopyWithImpl;
  @useResult
  $Res call({
    RedeemStep step,
    InvitePreview? preview,
    SignedInUser? user,
    AuthProvider? signingInWith,
    AuthFailureKind? authNotice,
    InviteProblem? problem,
    RedeemProfile? profile,
    RedeemResult? result,
    bool online,
  });

  $InvitePreviewCopyWith<$Res>? get preview;
  $RedeemProfileCopyWith<$Res>? get profile;
  $RedeemResultCopyWith<$Res>? get result;
}

/// @nodoc
class _$RedeemStateCopyWithImpl<$Res> implements $RedeemStateCopyWith<$Res> {
  _$RedeemStateCopyWithImpl(this._self, this._then);

  final RedeemState _self;
  final $Res Function(RedeemState) _then;

  /// Create a copy of RedeemState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = null,
    Object? preview = freezed,
    Object? user = freezed,
    Object? signingInWith = freezed,
    Object? authNotice = freezed,
    Object? problem = freezed,
    Object? profile = freezed,
    Object? result = freezed,
    Object? online = null,
  }) {
    return _then(
      _self.copyWith(
        step: null == step
            ? _self.step
            : step // ignore: cast_nullable_to_non_nullable
                  as RedeemStep,
        preview: freezed == preview
            ? _self.preview
            : preview // ignore: cast_nullable_to_non_nullable
                  as InvitePreview?,
        user: freezed == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as SignedInUser?,
        signingInWith: freezed == signingInWith
            ? _self.signingInWith
            : signingInWith // ignore: cast_nullable_to_non_nullable
                  as AuthProvider?,
        authNotice: freezed == authNotice
            ? _self.authNotice
            : authNotice // ignore: cast_nullable_to_non_nullable
                  as AuthFailureKind?,
        problem: freezed == problem
            ? _self.problem
            : problem // ignore: cast_nullable_to_non_nullable
                  as InviteProblem?,
        profile: freezed == profile
            ? _self.profile
            : profile // ignore: cast_nullable_to_non_nullable
                  as RedeemProfile?,
        result: freezed == result
            ? _self.result
            : result // ignore: cast_nullable_to_non_nullable
                  as RedeemResult?,
        online: null == online
            ? _self.online
            : online // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of RedeemState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvitePreviewCopyWith<$Res>? get preview {
    if (_self.preview == null) {
      return null;
    }

    return $InvitePreviewCopyWith<$Res>(_self.preview!, (value) {
      return _then(_self.copyWith(preview: value));
    });
  }

  /// Create a copy of RedeemState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RedeemProfileCopyWith<$Res>? get profile {
    if (_self.profile == null) {
      return null;
    }

    return $RedeemProfileCopyWith<$Res>(_self.profile!, (value) {
      return _then(_self.copyWith(profile: value));
    });
  }

  /// Create a copy of RedeemState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RedeemResultCopyWith<$Res>? get result {
    if (_self.result == null) {
      return null;
    }

    return $RedeemResultCopyWith<$Res>(_self.result!, (value) {
      return _then(_self.copyWith(result: value));
    });
  }
}

/// Adds pattern-matching-related methods to [RedeemState].
extension RedeemStatePatterns on RedeemState {
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
    TResult Function(_RedeemState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RedeemState() when $default != null:
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
    TResult Function(_RedeemState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RedeemState():
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
    TResult? Function(_RedeemState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RedeemState() when $default != null:
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
      RedeemStep step,
      InvitePreview? preview,
      SignedInUser? user,
      AuthProvider? signingInWith,
      AuthFailureKind? authNotice,
      InviteProblem? problem,
      RedeemProfile? profile,
      RedeemResult? result,
      bool online,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RedeemState() when $default != null:
        return $default(
          _that.step,
          _that.preview,
          _that.user,
          _that.signingInWith,
          _that.authNotice,
          _that.problem,
          _that.profile,
          _that.result,
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
      RedeemStep step,
      InvitePreview? preview,
      SignedInUser? user,
      AuthProvider? signingInWith,
      AuthFailureKind? authNotice,
      InviteProblem? problem,
      RedeemProfile? profile,
      RedeemResult? result,
      bool online,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RedeemState():
        return $default(
          _that.step,
          _that.preview,
          _that.user,
          _that.signingInWith,
          _that.authNotice,
          _that.problem,
          _that.profile,
          _that.result,
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
      RedeemStep step,
      InvitePreview? preview,
      SignedInUser? user,
      AuthProvider? signingInWith,
      AuthFailureKind? authNotice,
      InviteProblem? problem,
      RedeemProfile? profile,
      RedeemResult? result,
      bool online,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RedeemState() when $default != null:
        return $default(
          _that.step,
          _that.preview,
          _that.user,
          _that.signingInWith,
          _that.authNotice,
          _that.problem,
          _that.profile,
          _that.result,
          _that.online,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _RedeemState extends RedeemState {
  const _RedeemState({
    this.step = RedeemStep.loading,
    this.preview,
    this.user,
    this.signingInWith,
    this.authNotice,
    this.problem,
    this.profile,
    this.result,
    this.online = true,
  }) : super._();

  @override
  @JsonKey()
  final RedeemStep step;
  @override
  final InvitePreview? preview;
  @override
  final SignedInUser? user;

  /// Provider screen is open.
  @override
  final AuthProvider? signingInWith;

  /// Provider sign-in did not complete (cancelled, offline…).
  @override
  final AuthFailureKind? authNotice;
  @override
  final InviteProblem? problem;
  @override
  final RedeemProfile? profile;
  @override
  final RedeemResult? result;
  @override
  @JsonKey()
  final bool online;

  /// Create a copy of RedeemState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RedeemStateCopyWith<_RedeemState> get copyWith =>
      __$RedeemStateCopyWithImpl<_RedeemState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RedeemState &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.preview, preview) || other.preview == preview) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.signingInWith, signingInWith) ||
                other.signingInWith == signingInWith) &&
            (identical(other.authNotice, authNotice) ||
                other.authNotice == authNotice) &&
            (identical(other.problem, problem) || other.problem == problem) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.online, online) || other.online == online));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    step,
    preview,
    user,
    signingInWith,
    authNotice,
    problem,
    profile,
    result,
    online,
  );

  @override
  String toString() {
    return 'RedeemState(step: $step, preview: $preview, user: $user, signingInWith: $signingInWith, authNotice: $authNotice, problem: $problem, profile: $profile, result: $result, online: $online)';
  }
}

/// @nodoc
abstract mixin class _$RedeemStateCopyWith<$Res>
    implements $RedeemStateCopyWith<$Res> {
  factory _$RedeemStateCopyWith(
    _RedeemState value,
    $Res Function(_RedeemState) _then,
  ) = __$RedeemStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    RedeemStep step,
    InvitePreview? preview,
    SignedInUser? user,
    AuthProvider? signingInWith,
    AuthFailureKind? authNotice,
    InviteProblem? problem,
    RedeemProfile? profile,
    RedeemResult? result,
    bool online,
  });

  @override
  $InvitePreviewCopyWith<$Res>? get preview;
  @override
  $RedeemProfileCopyWith<$Res>? get profile;
  @override
  $RedeemResultCopyWith<$Res>? get result;
}

/// @nodoc
class __$RedeemStateCopyWithImpl<$Res> implements _$RedeemStateCopyWith<$Res> {
  __$RedeemStateCopyWithImpl(this._self, this._then);

  final _RedeemState _self;
  final $Res Function(_RedeemState) _then;

  /// Create a copy of RedeemState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? step = null,
    Object? preview = freezed,
    Object? user = freezed,
    Object? signingInWith = freezed,
    Object? authNotice = freezed,
    Object? problem = freezed,
    Object? profile = freezed,
    Object? result = freezed,
    Object? online = null,
  }) {
    return _then(
      _RedeemState(
        step: null == step
            ? _self.step
            : step // ignore: cast_nullable_to_non_nullable
                  as RedeemStep,
        preview: freezed == preview
            ? _self.preview
            : preview // ignore: cast_nullable_to_non_nullable
                  as InvitePreview?,
        user: freezed == user
            ? _self.user
            : user // ignore: cast_nullable_to_non_nullable
                  as SignedInUser?,
        signingInWith: freezed == signingInWith
            ? _self.signingInWith
            : signingInWith // ignore: cast_nullable_to_non_nullable
                  as AuthProvider?,
        authNotice: freezed == authNotice
            ? _self.authNotice
            : authNotice // ignore: cast_nullable_to_non_nullable
                  as AuthFailureKind?,
        problem: freezed == problem
            ? _self.problem
            : problem // ignore: cast_nullable_to_non_nullable
                  as InviteProblem?,
        profile: freezed == profile
            ? _self.profile
            : profile // ignore: cast_nullable_to_non_nullable
                  as RedeemProfile?,
        result: freezed == result
            ? _self.result
            : result // ignore: cast_nullable_to_non_nullable
                  as RedeemResult?,
        online: null == online
            ? _self.online
            : online // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of RedeemState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvitePreviewCopyWith<$Res>? get preview {
    if (_self.preview == null) {
      return null;
    }

    return $InvitePreviewCopyWith<$Res>(_self.preview!, (value) {
      return _then(_self.copyWith(preview: value));
    });
  }

  /// Create a copy of RedeemState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RedeemProfileCopyWith<$Res>? get profile {
    if (_self.profile == null) {
      return null;
    }

    return $RedeemProfileCopyWith<$Res>(_self.profile!, (value) {
      return _then(_self.copyWith(profile: value));
    });
  }

  /// Create a copy of RedeemState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RedeemResultCopyWith<$Res>? get result {
    if (_self.result == null) {
      return null;
    }

    return $RedeemResultCopyWith<$Res>(_self.result!, (value) {
      return _then(_self.copyWith(result: value));
    });
  }
}
