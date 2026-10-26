// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scan_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScanState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ScanState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ScanState()';
  }
}

/// @nodoc
class $ScanStateCopyWith<$Res> {
  $ScanStateCopyWith(ScanState _, $Res Function(ScanState) __);
}

/// Adds pattern-matching-related methods to [ScanState].
extension ScanStatePatterns on ScanState {
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
    TResult Function(ScanScanning value)? scanning,
    TResult Function(ScanChecking value)? checking,
    TResult Function(ScanNotInvite value)? notInvite,
    TResult Function(ScanFailed value)? failed,
    TResult Function(ScanVerified value)? verified,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ScanScanning() when scanning != null:
        return scanning(_that);
      case ScanChecking() when checking != null:
        return checking(_that);
      case ScanNotInvite() when notInvite != null:
        return notInvite(_that);
      case ScanFailed() when failed != null:
        return failed(_that);
      case ScanVerified() when verified != null:
        return verified(_that);
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
    required TResult Function(ScanScanning value) scanning,
    required TResult Function(ScanChecking value) checking,
    required TResult Function(ScanNotInvite value) notInvite,
    required TResult Function(ScanFailed value) failed,
    required TResult Function(ScanVerified value) verified,
  }) {
    final _that = this;
    switch (_that) {
      case ScanScanning():
        return scanning(_that);
      case ScanChecking():
        return checking(_that);
      case ScanNotInvite():
        return notInvite(_that);
      case ScanFailed():
        return failed(_that);
      case ScanVerified():
        return verified(_that);
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
    TResult? Function(ScanScanning value)? scanning,
    TResult? Function(ScanChecking value)? checking,
    TResult? Function(ScanNotInvite value)? notInvite,
    TResult? Function(ScanFailed value)? failed,
    TResult? Function(ScanVerified value)? verified,
  }) {
    final _that = this;
    switch (_that) {
      case ScanScanning() when scanning != null:
        return scanning(_that);
      case ScanChecking() when checking != null:
        return checking(_that);
      case ScanNotInvite() when notInvite != null:
        return notInvite(_that);
      case ScanFailed() when failed != null:
        return failed(_that);
      case ScanVerified() when verified != null:
        return verified(_that);
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
    TResult Function()? scanning,
    TResult Function()? checking,
    TResult Function()? notInvite,
    TResult Function(InviteProblem problem)? failed,
    TResult Function(InvitePreview preview)? verified,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ScanScanning() when scanning != null:
        return scanning();
      case ScanChecking() when checking != null:
        return checking();
      case ScanNotInvite() when notInvite != null:
        return notInvite();
      case ScanFailed() when failed != null:
        return failed(_that.problem);
      case ScanVerified() when verified != null:
        return verified(_that.preview);
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
    required TResult Function() scanning,
    required TResult Function() checking,
    required TResult Function() notInvite,
    required TResult Function(InviteProblem problem) failed,
    required TResult Function(InvitePreview preview) verified,
  }) {
    final _that = this;
    switch (_that) {
      case ScanScanning():
        return scanning();
      case ScanChecking():
        return checking();
      case ScanNotInvite():
        return notInvite();
      case ScanFailed():
        return failed(_that.problem);
      case ScanVerified():
        return verified(_that.preview);
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
    TResult? Function()? scanning,
    TResult? Function()? checking,
    TResult? Function()? notInvite,
    TResult? Function(InviteProblem problem)? failed,
    TResult? Function(InvitePreview preview)? verified,
  }) {
    final _that = this;
    switch (_that) {
      case ScanScanning() when scanning != null:
        return scanning();
      case ScanChecking() when checking != null:
        return checking();
      case ScanNotInvite() when notInvite != null:
        return notInvite();
      case ScanFailed() when failed != null:
        return failed(_that.problem);
      case ScanVerified() when verified != null:
        return verified(_that.preview);
      case _:
        return null;
    }
  }
}

/// @nodoc

class ScanScanning implements ScanState {
  const ScanScanning();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ScanScanning);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ScanState.scanning()';
  }
}

/// @nodoc

class ScanChecking implements ScanState {
  const ScanChecking();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ScanChecking);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ScanState.checking()';
  }
}

/// @nodoc

class ScanNotInvite implements ScanState {
  const ScanNotInvite();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ScanNotInvite);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ScanState.notInvite()';
  }
}

/// @nodoc

class ScanFailed implements ScanState {
  const ScanFailed(this.problem);

  final InviteProblem problem;

  /// Create a copy of ScanState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScanFailedCopyWith<ScanFailed> get copyWith =>
      _$ScanFailedCopyWithImpl<ScanFailed>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScanFailed &&
            (identical(other.problem, problem) || other.problem == problem));
  }

  @override
  int get hashCode => Object.hash(runtimeType, problem);

  @override
  String toString() {
    return 'ScanState.failed(problem: $problem)';
  }
}

/// @nodoc
abstract mixin class $ScanFailedCopyWith<$Res>
    implements $ScanStateCopyWith<$Res> {
  factory $ScanFailedCopyWith(
    ScanFailed value,
    $Res Function(ScanFailed) _then,
  ) = _$ScanFailedCopyWithImpl;
  @useResult
  $Res call({InviteProblem problem});
}

/// @nodoc
class _$ScanFailedCopyWithImpl<$Res> implements $ScanFailedCopyWith<$Res> {
  _$ScanFailedCopyWithImpl(this._self, this._then);

  final ScanFailed _self;
  final $Res Function(ScanFailed) _then;

  /// Create a copy of ScanState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? problem = null}) {
    return _then(
      ScanFailed(
        null == problem
            ? _self.problem
            : problem // ignore: cast_nullable_to_non_nullable
                  as InviteProblem,
      ),
    );
  }
}

/// @nodoc

class ScanVerified implements ScanState {
  const ScanVerified(this.preview);

  final InvitePreview preview;

  /// Create a copy of ScanState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScanVerifiedCopyWith<ScanVerified> get copyWith =>
      _$ScanVerifiedCopyWithImpl<ScanVerified>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScanVerified &&
            (identical(other.preview, preview) || other.preview == preview));
  }

  @override
  int get hashCode => Object.hash(runtimeType, preview);

  @override
  String toString() {
    return 'ScanState.verified(preview: $preview)';
  }
}

/// @nodoc
abstract mixin class $ScanVerifiedCopyWith<$Res>
    implements $ScanStateCopyWith<$Res> {
  factory $ScanVerifiedCopyWith(
    ScanVerified value,
    $Res Function(ScanVerified) _then,
  ) = _$ScanVerifiedCopyWithImpl;
  @useResult
  $Res call({InvitePreview preview});

  $InvitePreviewCopyWith<$Res> get preview;
}

/// @nodoc
class _$ScanVerifiedCopyWithImpl<$Res> implements $ScanVerifiedCopyWith<$Res> {
  _$ScanVerifiedCopyWithImpl(this._self, this._then);

  final ScanVerified _self;
  final $Res Function(ScanVerified) _then;

  /// Create a copy of ScanState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? preview = null}) {
    return _then(
      ScanVerified(
        null == preview
            ? _self.preview
            : preview // ignore: cast_nullable_to_non_nullable
                  as InvitePreview,
      ),
    );
  }

  /// Create a copy of ScanState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvitePreviewCopyWith<$Res> get preview {
    return $InvitePreviewCopyWith<$Res>(_self.preview, (value) {
      return _then(_self.copyWith(preview: value));
    });
  }
}
