// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_commitment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeCommitment {
  String get actionText;
  String? get measureText;
  String? get valueName;
  CommitmentOutcome? get outcome;

  /// Create a copy of HomeCommitment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeCommitmentCopyWith<HomeCommitment> get copyWith =>
      _$HomeCommitmentCopyWithImpl<HomeCommitment>(
        this as HomeCommitment,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeCommitment &&
            (identical(other.actionText, actionText) ||
                other.actionText == actionText) &&
            (identical(other.measureText, measureText) ||
                other.measureText == measureText) &&
            (identical(other.valueName, valueName) ||
                other.valueName == valueName) &&
            (identical(other.outcome, outcome) || other.outcome == outcome));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, actionText, measureText, valueName, outcome);

  @override
  String toString() {
    return 'HomeCommitment(actionText: $actionText, measureText: $measureText, valueName: $valueName, outcome: $outcome)';
  }
}

/// @nodoc
abstract mixin class $HomeCommitmentCopyWith<$Res> {
  factory $HomeCommitmentCopyWith(
    HomeCommitment value,
    $Res Function(HomeCommitment) _then,
  ) = _$HomeCommitmentCopyWithImpl;
  @useResult
  $Res call({
    String actionText,
    String? measureText,
    String? valueName,
    CommitmentOutcome? outcome,
  });
}

/// @nodoc
class _$HomeCommitmentCopyWithImpl<$Res>
    implements $HomeCommitmentCopyWith<$Res> {
  _$HomeCommitmentCopyWithImpl(this._self, this._then);

  final HomeCommitment _self;
  final $Res Function(HomeCommitment) _then;

  /// Create a copy of HomeCommitment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? actionText = null,
    Object? measureText = freezed,
    Object? valueName = freezed,
    Object? outcome = freezed,
  }) {
    return _then(
      _self.copyWith(
        actionText: null == actionText
            ? _self.actionText
            : actionText // ignore: cast_nullable_to_non_nullable
                  as String,
        measureText: freezed == measureText
            ? _self.measureText
            : measureText // ignore: cast_nullable_to_non_nullable
                  as String?,
        valueName: freezed == valueName
            ? _self.valueName
            : valueName // ignore: cast_nullable_to_non_nullable
                  as String?,
        outcome: freezed == outcome
            ? _self.outcome
            : outcome // ignore: cast_nullable_to_non_nullable
                  as CommitmentOutcome?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [HomeCommitment].
extension HomeCommitmentPatterns on HomeCommitment {
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
    TResult Function(_HomeCommitment value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeCommitment() when $default != null:
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
    TResult Function(_HomeCommitment value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeCommitment():
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
    TResult? Function(_HomeCommitment value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeCommitment() when $default != null:
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
      String actionText,
      String? measureText,
      String? valueName,
      CommitmentOutcome? outcome,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeCommitment() when $default != null:
        return $default(
          _that.actionText,
          _that.measureText,
          _that.valueName,
          _that.outcome,
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
      String actionText,
      String? measureText,
      String? valueName,
      CommitmentOutcome? outcome,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeCommitment():
        return $default(
          _that.actionText,
          _that.measureText,
          _that.valueName,
          _that.outcome,
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
      String actionText,
      String? measureText,
      String? valueName,
      CommitmentOutcome? outcome,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeCommitment() when $default != null:
        return $default(
          _that.actionText,
          _that.measureText,
          _that.valueName,
          _that.outcome,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _HomeCommitment implements HomeCommitment {
  const _HomeCommitment({
    required this.actionText,
    this.measureText,
    this.valueName,
    this.outcome,
  });

  @override
  final String actionText;
  @override
  final String? measureText;
  @override
  final String? valueName;
  @override
  final CommitmentOutcome? outcome;

  /// Create a copy of HomeCommitment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomeCommitmentCopyWith<_HomeCommitment> get copyWith =>
      __$HomeCommitmentCopyWithImpl<_HomeCommitment>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeCommitment &&
            (identical(other.actionText, actionText) ||
                other.actionText == actionText) &&
            (identical(other.measureText, measureText) ||
                other.measureText == measureText) &&
            (identical(other.valueName, valueName) ||
                other.valueName == valueName) &&
            (identical(other.outcome, outcome) || other.outcome == outcome));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, actionText, measureText, valueName, outcome);

  @override
  String toString() {
    return 'HomeCommitment(actionText: $actionText, measureText: $measureText, valueName: $valueName, outcome: $outcome)';
  }
}

/// @nodoc
abstract mixin class _$HomeCommitmentCopyWith<$Res>
    implements $HomeCommitmentCopyWith<$Res> {
  factory _$HomeCommitmentCopyWith(
    _HomeCommitment value,
    $Res Function(_HomeCommitment) _then,
  ) = __$HomeCommitmentCopyWithImpl;
  @override
  @useResult
  $Res call({
    String actionText,
    String? measureText,
    String? valueName,
    CommitmentOutcome? outcome,
  });
}

/// @nodoc
class __$HomeCommitmentCopyWithImpl<$Res>
    implements _$HomeCommitmentCopyWith<$Res> {
  __$HomeCommitmentCopyWithImpl(this._self, this._then);

  final _HomeCommitment _self;
  final $Res Function(_HomeCommitment) _then;

  /// Create a copy of HomeCommitment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? actionText = null,
    Object? measureText = freezed,
    Object? valueName = freezed,
    Object? outcome = freezed,
  }) {
    return _then(
      _HomeCommitment(
        actionText: null == actionText
            ? _self.actionText
            : actionText // ignore: cast_nullable_to_non_nullable
                  as String,
        measureText: freezed == measureText
            ? _self.measureText
            : measureText // ignore: cast_nullable_to_non_nullable
                  as String?,
        valueName: freezed == valueName
            ? _self.valueName
            : valueName // ignore: cast_nullable_to_non_nullable
                  as String?,
        outcome: freezed == outcome
            ? _self.outcome
            : outcome // ignore: cast_nullable_to_non_nullable
                  as CommitmentOutcome?,
      ),
    );
  }
}
