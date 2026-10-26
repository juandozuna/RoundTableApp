// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'share_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShareFeedback {
  ShareFeedbackKind get kind;
  int get serial;

  /// Create a copy of ShareFeedback
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ShareFeedbackCopyWith<ShareFeedback> get copyWith =>
      _$ShareFeedbackCopyWithImpl<ShareFeedback>(
        this as ShareFeedback,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShareFeedback &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.serial, serial) || other.serial == serial));
  }

  @override
  int get hashCode => Object.hash(runtimeType, kind, serial);

  @override
  String toString() {
    return 'ShareFeedback(kind: $kind, serial: $serial)';
  }
}

/// @nodoc
abstract mixin class $ShareFeedbackCopyWith<$Res> {
  factory $ShareFeedbackCopyWith(
    ShareFeedback value,
    $Res Function(ShareFeedback) _then,
  ) = _$ShareFeedbackCopyWithImpl;
  @useResult
  $Res call({ShareFeedbackKind kind, int serial});
}

/// @nodoc
class _$ShareFeedbackCopyWithImpl<$Res>
    implements $ShareFeedbackCopyWith<$Res> {
  _$ShareFeedbackCopyWithImpl(this._self, this._then);

  final ShareFeedback _self;
  final $Res Function(ShareFeedback) _then;

  /// Create a copy of ShareFeedback
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? kind = null, Object? serial = null}) {
    return _then(
      _self.copyWith(
        kind: null == kind
            ? _self.kind
            : kind // ignore: cast_nullable_to_non_nullable
                  as ShareFeedbackKind,
        serial: null == serial
            ? _self.serial
            : serial // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [ShareFeedback].
extension ShareFeedbackPatterns on ShareFeedback {
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
    TResult Function(_ShareFeedback value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ShareFeedback() when $default != null:
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
    TResult Function(_ShareFeedback value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShareFeedback():
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
    TResult? Function(_ShareFeedback value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShareFeedback() when $default != null:
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
    TResult Function(ShareFeedbackKind kind, int serial)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ShareFeedback() when $default != null:
        return $default(_that.kind, _that.serial);
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
    TResult Function(ShareFeedbackKind kind, int serial) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShareFeedback():
        return $default(_that.kind, _that.serial);
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
    TResult? Function(ShareFeedbackKind kind, int serial)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShareFeedback() when $default != null:
        return $default(_that.kind, _that.serial);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ShareFeedback implements ShareFeedback {
  const _ShareFeedback({required this.kind, required this.serial});

  @override
  final ShareFeedbackKind kind;
  @override
  final int serial;

  /// Create a copy of ShareFeedback
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ShareFeedbackCopyWith<_ShareFeedback> get copyWith =>
      __$ShareFeedbackCopyWithImpl<_ShareFeedback>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShareFeedback &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.serial, serial) || other.serial == serial));
  }

  @override
  int get hashCode => Object.hash(runtimeType, kind, serial);

  @override
  String toString() {
    return 'ShareFeedback(kind: $kind, serial: $serial)';
  }
}

/// @nodoc
abstract mixin class _$ShareFeedbackCopyWith<$Res>
    implements $ShareFeedbackCopyWith<$Res> {
  factory _$ShareFeedbackCopyWith(
    _ShareFeedback value,
    $Res Function(_ShareFeedback) _then,
  ) = __$ShareFeedbackCopyWithImpl;
  @override
  @useResult
  $Res call({ShareFeedbackKind kind, int serial});
}

/// @nodoc
class __$ShareFeedbackCopyWithImpl<$Res>
    implements _$ShareFeedbackCopyWith<$Res> {
  __$ShareFeedbackCopyWithImpl(this._self, this._then);

  final _ShareFeedback _self;
  final $Res Function(_ShareFeedback) _then;

  /// Create a copy of ShareFeedback
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? kind = null, Object? serial = null}) {
    return _then(
      _ShareFeedback(
        kind: null == kind
            ? _self.kind
            : kind // ignore: cast_nullable_to_non_nullable
                  as ShareFeedbackKind,
        serial: null == serial
            ? _self.serial
            : serial // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
mixin _$ShareState {
  Invite? get invite;
  bool get loading;
  InviteProblem? get problem;

  /// The invite no longer exists (or is not visible to this person).
  bool get missing;
  ShareFeedback? get feedback;

  /// Create a copy of ShareState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ShareStateCopyWith<ShareState> get copyWith =>
      _$ShareStateCopyWithImpl<ShareState>(this as ShareState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShareState &&
            (identical(other.invite, invite) || other.invite == invite) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.problem, problem) || other.problem == problem) &&
            (identical(other.missing, missing) || other.missing == missing) &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, invite, loading, problem, missing, feedback);

  @override
  String toString() {
    return 'ShareState(invite: $invite, loading: $loading, problem: $problem, missing: $missing, feedback: $feedback)';
  }
}

/// @nodoc
abstract mixin class $ShareStateCopyWith<$Res> {
  factory $ShareStateCopyWith(
    ShareState value,
    $Res Function(ShareState) _then,
  ) = _$ShareStateCopyWithImpl;
  @useResult
  $Res call({
    Invite? invite,
    bool loading,
    InviteProblem? problem,
    bool missing,
    ShareFeedback? feedback,
  });

  $InviteCopyWith<$Res>? get invite;
  $ShareFeedbackCopyWith<$Res>? get feedback;
}

/// @nodoc
class _$ShareStateCopyWithImpl<$Res> implements $ShareStateCopyWith<$Res> {
  _$ShareStateCopyWithImpl(this._self, this._then);

  final ShareState _self;
  final $Res Function(ShareState) _then;

  /// Create a copy of ShareState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invite = freezed,
    Object? loading = null,
    Object? problem = freezed,
    Object? missing = null,
    Object? feedback = freezed,
  }) {
    return _then(
      _self.copyWith(
        invite: freezed == invite
            ? _self.invite
            : invite // ignore: cast_nullable_to_non_nullable
                  as Invite?,
        loading: null == loading
            ? _self.loading
            : loading // ignore: cast_nullable_to_non_nullable
                  as bool,
        problem: freezed == problem
            ? _self.problem
            : problem // ignore: cast_nullable_to_non_nullable
                  as InviteProblem?,
        missing: null == missing
            ? _self.missing
            : missing // ignore: cast_nullable_to_non_nullable
                  as bool,
        feedback: freezed == feedback
            ? _self.feedback
            : feedback // ignore: cast_nullable_to_non_nullable
                  as ShareFeedback?,
      ),
    );
  }

  /// Create a copy of ShareState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InviteCopyWith<$Res>? get invite {
    if (_self.invite == null) {
      return null;
    }

    return $InviteCopyWith<$Res>(_self.invite!, (value) {
      return _then(_self.copyWith(invite: value));
    });
  }

  /// Create a copy of ShareState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShareFeedbackCopyWith<$Res>? get feedback {
    if (_self.feedback == null) {
      return null;
    }

    return $ShareFeedbackCopyWith<$Res>(_self.feedback!, (value) {
      return _then(_self.copyWith(feedback: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ShareState].
extension ShareStatePatterns on ShareState {
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
    TResult Function(_ShareState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ShareState() when $default != null:
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
    TResult Function(_ShareState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShareState():
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
    TResult? Function(_ShareState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShareState() when $default != null:
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
      Invite? invite,
      bool loading,
      InviteProblem? problem,
      bool missing,
      ShareFeedback? feedback,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ShareState() when $default != null:
        return $default(
          _that.invite,
          _that.loading,
          _that.problem,
          _that.missing,
          _that.feedback,
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
      Invite? invite,
      bool loading,
      InviteProblem? problem,
      bool missing,
      ShareFeedback? feedback,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShareState():
        return $default(
          _that.invite,
          _that.loading,
          _that.problem,
          _that.missing,
          _that.feedback,
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
      Invite? invite,
      bool loading,
      InviteProblem? problem,
      bool missing,
      ShareFeedback? feedback,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShareState() when $default != null:
        return $default(
          _that.invite,
          _that.loading,
          _that.problem,
          _that.missing,
          _that.feedback,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ShareState implements ShareState {
  const _ShareState({
    this.invite,
    this.loading = true,
    this.problem,
    this.missing = false,
    this.feedback,
  });

  @override
  final Invite? invite;
  @override
  @JsonKey()
  final bool loading;
  @override
  final InviteProblem? problem;

  /// The invite no longer exists (or is not visible to this person).
  @override
  @JsonKey()
  final bool missing;
  @override
  final ShareFeedback? feedback;

  /// Create a copy of ShareState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ShareStateCopyWith<_ShareState> get copyWith =>
      __$ShareStateCopyWithImpl<_ShareState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShareState &&
            (identical(other.invite, invite) || other.invite == invite) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.problem, problem) || other.problem == problem) &&
            (identical(other.missing, missing) || other.missing == missing) &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, invite, loading, problem, missing, feedback);

  @override
  String toString() {
    return 'ShareState(invite: $invite, loading: $loading, problem: $problem, missing: $missing, feedback: $feedback)';
  }
}

/// @nodoc
abstract mixin class _$ShareStateCopyWith<$Res>
    implements $ShareStateCopyWith<$Res> {
  factory _$ShareStateCopyWith(
    _ShareState value,
    $Res Function(_ShareState) _then,
  ) = __$ShareStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    Invite? invite,
    bool loading,
    InviteProblem? problem,
    bool missing,
    ShareFeedback? feedback,
  });

  @override
  $InviteCopyWith<$Res>? get invite;
  @override
  $ShareFeedbackCopyWith<$Res>? get feedback;
}

/// @nodoc
class __$ShareStateCopyWithImpl<$Res> implements _$ShareStateCopyWith<$Res> {
  __$ShareStateCopyWithImpl(this._self, this._then);

  final _ShareState _self;
  final $Res Function(_ShareState) _then;

  /// Create a copy of ShareState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? invite = freezed,
    Object? loading = null,
    Object? problem = freezed,
    Object? missing = null,
    Object? feedback = freezed,
  }) {
    return _then(
      _ShareState(
        invite: freezed == invite
            ? _self.invite
            : invite // ignore: cast_nullable_to_non_nullable
                  as Invite?,
        loading: null == loading
            ? _self.loading
            : loading // ignore: cast_nullable_to_non_nullable
                  as bool,
        problem: freezed == problem
            ? _self.problem
            : problem // ignore: cast_nullable_to_non_nullable
                  as InviteProblem?,
        missing: null == missing
            ? _self.missing
            : missing // ignore: cast_nullable_to_non_nullable
                  as bool,
        feedback: freezed == feedback
            ? _self.feedback
            : feedback // ignore: cast_nullable_to_non_nullable
                  as ShareFeedback?,
      ),
    );
  }

  /// Create a copy of ShareState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InviteCopyWith<$Res>? get invite {
    if (_self.invite == null) {
      return null;
    }

    return $InviteCopyWith<$Res>(_self.invite!, (value) {
      return _then(_self.copyWith(invite: value));
    });
  }

  /// Create a copy of ShareState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShareFeedbackCopyWith<$Res>? get feedback {
    if (_self.feedback == null) {
      return null;
    }

    return $ShareFeedbackCopyWith<$Res>(_self.feedback!, (value) {
      return _then(_self.copyWith(feedback: value));
    });
  }
}
