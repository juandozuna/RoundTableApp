// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'previous_commitment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PreviousCommitment {
  String get id;
  String get actionText;
  String? get measureText;

  /// Create a copy of PreviousCommitment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PreviousCommitmentCopyWith<PreviousCommitment> get copyWith =>
      _$PreviousCommitmentCopyWithImpl<PreviousCommitment>(
        this as PreviousCommitment,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PreviousCommitment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.actionText, actionText) ||
                other.actionText == actionText) &&
            (identical(other.measureText, measureText) ||
                other.measureText == measureText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, actionText, measureText);

  @override
  String toString() {
    return 'PreviousCommitment(id: $id, actionText: $actionText, measureText: $measureText)';
  }
}

/// @nodoc
abstract mixin class $PreviousCommitmentCopyWith<$Res> {
  factory $PreviousCommitmentCopyWith(
    PreviousCommitment value,
    $Res Function(PreviousCommitment) _then,
  ) = _$PreviousCommitmentCopyWithImpl;
  @useResult
  $Res call({String id, String actionText, String? measureText});
}

/// @nodoc
class _$PreviousCommitmentCopyWithImpl<$Res>
    implements $PreviousCommitmentCopyWith<$Res> {
  _$PreviousCommitmentCopyWithImpl(this._self, this._then);

  final PreviousCommitment _self;
  final $Res Function(PreviousCommitment) _then;

  /// Create a copy of PreviousCommitment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? actionText = null,
    Object? measureText = freezed,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        actionText: null == actionText
            ? _self.actionText
            : actionText // ignore: cast_nullable_to_non_nullable
                  as String,
        measureText: freezed == measureText
            ? _self.measureText
            : measureText // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [PreviousCommitment].
extension PreviousCommitmentPatterns on PreviousCommitment {
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
    TResult Function(_PreviousCommitment value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PreviousCommitment() when $default != null:
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
    TResult Function(_PreviousCommitment value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PreviousCommitment():
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
    TResult? Function(_PreviousCommitment value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PreviousCommitment() when $default != null:
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
    TResult Function(String id, String actionText, String? measureText)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PreviousCommitment() when $default != null:
        return $default(_that.id, _that.actionText, _that.measureText);
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
    TResult Function(String id, String actionText, String? measureText)
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PreviousCommitment():
        return $default(_that.id, _that.actionText, _that.measureText);
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
    TResult? Function(String id, String actionText, String? measureText)?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PreviousCommitment() when $default != null:
        return $default(_that.id, _that.actionText, _that.measureText);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PreviousCommitment implements PreviousCommitment {
  const _PreviousCommitment({
    required this.id,
    required this.actionText,
    this.measureText,
  });

  @override
  final String id;
  @override
  final String actionText;
  @override
  final String? measureText;

  /// Create a copy of PreviousCommitment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PreviousCommitmentCopyWith<_PreviousCommitment> get copyWith =>
      __$PreviousCommitmentCopyWithImpl<_PreviousCommitment>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PreviousCommitment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.actionText, actionText) ||
                other.actionText == actionText) &&
            (identical(other.measureText, measureText) ||
                other.measureText == measureText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, actionText, measureText);

  @override
  String toString() {
    return 'PreviousCommitment(id: $id, actionText: $actionText, measureText: $measureText)';
  }
}

/// @nodoc
abstract mixin class _$PreviousCommitmentCopyWith<$Res>
    implements $PreviousCommitmentCopyWith<$Res> {
  factory _$PreviousCommitmentCopyWith(
    _PreviousCommitment value,
    $Res Function(_PreviousCommitment) _then,
  ) = __$PreviousCommitmentCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String actionText, String? measureText});
}

/// @nodoc
class __$PreviousCommitmentCopyWithImpl<$Res>
    implements _$PreviousCommitmentCopyWith<$Res> {
  __$PreviousCommitmentCopyWithImpl(this._self, this._then);

  final _PreviousCommitment _self;
  final $Res Function(_PreviousCommitment) _then;

  /// Create a copy of PreviousCommitment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? actionText = null,
    Object? measureText = freezed,
  }) {
    return _then(
      _PreviousCommitment(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        actionText: null == actionText
            ? _self.actionText
            : actionText // ignore: cast_nullable_to_non_nullable
                  as String,
        measureText: freezed == measureText
            ? _self.measureText
            : measureText // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}
