// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'code_entry_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CodeEntryState {
  CodeEntryStatus get status;
  InviteProblem? get problem;

  /// Last code that was checked.
  String? get code;

  /// Typing is locked until this instant ([InviteProblem.lockedOut]).
  DateTime? get lockedUntil;
  int get remainingAttempts;

  /// Set when [status] is verified; the page opens the confirm step.
  InvitePreview? get verified;

  /// Create a copy of CodeEntryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CodeEntryStateCopyWith<CodeEntryState> get copyWith =>
      _$CodeEntryStateCopyWithImpl<CodeEntryState>(
        this as CodeEntryState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CodeEntryState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.problem, problem) || other.problem == problem) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.lockedUntil, lockedUntil) ||
                other.lockedUntil == lockedUntil) &&
            (identical(other.remainingAttempts, remainingAttempts) ||
                other.remainingAttempts == remainingAttempts) &&
            (identical(other.verified, verified) ||
                other.verified == verified));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    problem,
    code,
    lockedUntil,
    remainingAttempts,
    verified,
  );

  @override
  String toString() {
    return 'CodeEntryState(status: $status, problem: $problem, code: $code, lockedUntil: $lockedUntil, remainingAttempts: $remainingAttempts, verified: $verified)';
  }
}

/// @nodoc
abstract mixin class $CodeEntryStateCopyWith<$Res> {
  factory $CodeEntryStateCopyWith(
    CodeEntryState value,
    $Res Function(CodeEntryState) _then,
  ) = _$CodeEntryStateCopyWithImpl;
  @useResult
  $Res call({
    CodeEntryStatus status,
    InviteProblem? problem,
    String? code,
    DateTime? lockedUntil,
    int remainingAttempts,
    InvitePreview? verified,
  });

  $InvitePreviewCopyWith<$Res>? get verified;
}

/// @nodoc
class _$CodeEntryStateCopyWithImpl<$Res>
    implements $CodeEntryStateCopyWith<$Res> {
  _$CodeEntryStateCopyWithImpl(this._self, this._then);

  final CodeEntryState _self;
  final $Res Function(CodeEntryState) _then;

  /// Create a copy of CodeEntryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? problem = freezed,
    Object? code = freezed,
    Object? lockedUntil = freezed,
    Object? remainingAttempts = null,
    Object? verified = freezed,
  }) {
    return _then(
      _self.copyWith(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as CodeEntryStatus,
        problem: freezed == problem
            ? _self.problem
            : problem // ignore: cast_nullable_to_non_nullable
                  as InviteProblem?,
        code: freezed == code
            ? _self.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String?,
        lockedUntil: freezed == lockedUntil
            ? _self.lockedUntil
            : lockedUntil // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        remainingAttempts: null == remainingAttempts
            ? _self.remainingAttempts
            : remainingAttempts // ignore: cast_nullable_to_non_nullable
                  as int,
        verified: freezed == verified
            ? _self.verified
            : verified // ignore: cast_nullable_to_non_nullable
                  as InvitePreview?,
      ),
    );
  }

  /// Create a copy of CodeEntryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvitePreviewCopyWith<$Res>? get verified {
    if (_self.verified == null) {
      return null;
    }

    return $InvitePreviewCopyWith<$Res>(_self.verified!, (value) {
      return _then(_self.copyWith(verified: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CodeEntryState].
extension CodeEntryStatePatterns on CodeEntryState {
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
    TResult Function(_CodeEntryState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CodeEntryState() when $default != null:
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
    TResult Function(_CodeEntryState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CodeEntryState():
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
    TResult? Function(_CodeEntryState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CodeEntryState() when $default != null:
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
      CodeEntryStatus status,
      InviteProblem? problem,
      String? code,
      DateTime? lockedUntil,
      int remainingAttempts,
      InvitePreview? verified,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CodeEntryState() when $default != null:
        return $default(
          _that.status,
          _that.problem,
          _that.code,
          _that.lockedUntil,
          _that.remainingAttempts,
          _that.verified,
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
      CodeEntryStatus status,
      InviteProblem? problem,
      String? code,
      DateTime? lockedUntil,
      int remainingAttempts,
      InvitePreview? verified,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CodeEntryState():
        return $default(
          _that.status,
          _that.problem,
          _that.code,
          _that.lockedUntil,
          _that.remainingAttempts,
          _that.verified,
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
      CodeEntryStatus status,
      InviteProblem? problem,
      String? code,
      DateTime? lockedUntil,
      int remainingAttempts,
      InvitePreview? verified,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CodeEntryState() when $default != null:
        return $default(
          _that.status,
          _that.problem,
          _that.code,
          _that.lockedUntil,
          _that.remainingAttempts,
          _that.verified,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CodeEntryState extends CodeEntryState {
  const _CodeEntryState({
    this.status = CodeEntryStatus.idle,
    this.problem,
    this.code,
    this.lockedUntil,
    required this.remainingAttempts,
    this.verified,
  }) : super._();

  @override
  @JsonKey()
  final CodeEntryStatus status;
  @override
  final InviteProblem? problem;

  /// Last code that was checked.
  @override
  final String? code;

  /// Typing is locked until this instant ([InviteProblem.lockedOut]).
  @override
  final DateTime? lockedUntil;
  @override
  final int remainingAttempts;

  /// Set when [status] is verified; the page opens the confirm step.
  @override
  final InvitePreview? verified;

  /// Create a copy of CodeEntryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CodeEntryStateCopyWith<_CodeEntryState> get copyWith =>
      __$CodeEntryStateCopyWithImpl<_CodeEntryState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CodeEntryState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.problem, problem) || other.problem == problem) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.lockedUntil, lockedUntil) ||
                other.lockedUntil == lockedUntil) &&
            (identical(other.remainingAttempts, remainingAttempts) ||
                other.remainingAttempts == remainingAttempts) &&
            (identical(other.verified, verified) ||
                other.verified == verified));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    problem,
    code,
    lockedUntil,
    remainingAttempts,
    verified,
  );

  @override
  String toString() {
    return 'CodeEntryState(status: $status, problem: $problem, code: $code, lockedUntil: $lockedUntil, remainingAttempts: $remainingAttempts, verified: $verified)';
  }
}

/// @nodoc
abstract mixin class _$CodeEntryStateCopyWith<$Res>
    implements $CodeEntryStateCopyWith<$Res> {
  factory _$CodeEntryStateCopyWith(
    _CodeEntryState value,
    $Res Function(_CodeEntryState) _then,
  ) = __$CodeEntryStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    CodeEntryStatus status,
    InviteProblem? problem,
    String? code,
    DateTime? lockedUntil,
    int remainingAttempts,
    InvitePreview? verified,
  });

  @override
  $InvitePreviewCopyWith<$Res>? get verified;
}

/// @nodoc
class __$CodeEntryStateCopyWithImpl<$Res>
    implements _$CodeEntryStateCopyWith<$Res> {
  __$CodeEntryStateCopyWithImpl(this._self, this._then);

  final _CodeEntryState _self;
  final $Res Function(_CodeEntryState) _then;

  /// Create a copy of CodeEntryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? problem = freezed,
    Object? code = freezed,
    Object? lockedUntil = freezed,
    Object? remainingAttempts = null,
    Object? verified = freezed,
  }) {
    return _then(
      _CodeEntryState(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as CodeEntryStatus,
        problem: freezed == problem
            ? _self.problem
            : problem // ignore: cast_nullable_to_non_nullable
                  as InviteProblem?,
        code: freezed == code
            ? _self.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String?,
        lockedUntil: freezed == lockedUntil
            ? _self.lockedUntil
            : lockedUntil // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        remainingAttempts: null == remainingAttempts
            ? _self.remainingAttempts
            : remainingAttempts // ignore: cast_nullable_to_non_nullable
                  as int,
        verified: freezed == verified
            ? _self.verified
            : verified // ignore: cast_nullable_to_non_nullable
                  as InvitePreview?,
      ),
    );
  }

  /// Create a copy of CodeEntryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvitePreviewCopyWith<$Res>? get verified {
    if (_self.verified == null) {
      return null;
    }

    return $InvitePreviewCopyWith<$Res>(_self.verified!, (value) {
      return _then(_self.copyWith(verified: value));
    });
  }
}
