// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'context_chip_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContextChipState {
  SessionContext? get context;

  /// Create a copy of ContextChipState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ContextChipStateCopyWith<ContextChipState> get copyWith =>
      _$ContextChipStateCopyWithImpl<ContextChipState>(
        this as ContextChipState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ContextChipState &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context);

  @override
  String toString() {
    return 'ContextChipState(context: $context)';
  }
}

/// @nodoc
abstract mixin class $ContextChipStateCopyWith<$Res> {
  factory $ContextChipStateCopyWith(
    ContextChipState value,
    $Res Function(ContextChipState) _then,
  ) = _$ContextChipStateCopyWithImpl;
  @useResult
  $Res call({SessionContext? context});

  $SessionContextCopyWith<$Res>? get context;
}

/// @nodoc
class _$ContextChipStateCopyWithImpl<$Res>
    implements $ContextChipStateCopyWith<$Res> {
  _$ContextChipStateCopyWithImpl(this._self, this._then);

  final ContextChipState _self;
  final $Res Function(ContextChipState) _then;

  /// Create a copy of ContextChipState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? context = freezed}) {
    return _then(
      _self.copyWith(
        context: freezed == context
            ? _self.context
            : context // ignore: cast_nullable_to_non_nullable
                  as SessionContext?,
      ),
    );
  }

  /// Create a copy of ContextChipState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionContextCopyWith<$Res>? get context {
    if (_self.context == null) {
      return null;
    }

    return $SessionContextCopyWith<$Res>(_self.context!, (value) {
      return _then(_self.copyWith(context: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ContextChipState].
extension ContextChipStatePatterns on ContextChipState {
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
    TResult Function(_ContextChipState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ContextChipState() when $default != null:
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
    TResult Function(_ContextChipState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContextChipState():
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
    TResult? Function(_ContextChipState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContextChipState() when $default != null:
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
    TResult Function(SessionContext? context)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ContextChipState() when $default != null:
        return $default(_that.context);
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
    TResult Function(SessionContext? context) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContextChipState():
        return $default(_that.context);
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
    TResult? Function(SessionContext? context)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContextChipState() when $default != null:
        return $default(_that.context);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ContextChipState implements ContextChipState {
  const _ContextChipState({this.context});

  @override
  final SessionContext? context;

  /// Create a copy of ContextChipState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ContextChipStateCopyWith<_ContextChipState> get copyWith =>
      __$ContextChipStateCopyWithImpl<_ContextChipState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ContextChipState &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context);

  @override
  String toString() {
    return 'ContextChipState(context: $context)';
  }
}

/// @nodoc
abstract mixin class _$ContextChipStateCopyWith<$Res>
    implements $ContextChipStateCopyWith<$Res> {
  factory _$ContextChipStateCopyWith(
    _ContextChipState value,
    $Res Function(_ContextChipState) _then,
  ) = __$ContextChipStateCopyWithImpl;
  @override
  @useResult
  $Res call({SessionContext? context});

  @override
  $SessionContextCopyWith<$Res>? get context;
}

/// @nodoc
class __$ContextChipStateCopyWithImpl<$Res>
    implements _$ContextChipStateCopyWith<$Res> {
  __$ContextChipStateCopyWithImpl(this._self, this._then);

  final _ContextChipState _self;
  final $Res Function(_ContextChipState) _then;

  /// Create a copy of ContextChipState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? context = freezed}) {
    return _then(
      _ContextChipState(
        context: freezed == context
            ? _self.context
            : context // ignore: cast_nullable_to_non_nullable
                  as SessionContext?,
      ),
    );
  }

  /// Create a copy of ContextChipState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionContextCopyWith<$Res>? get context {
    if (_self.context == null) {
      return null;
    }

    return $SessionContextCopyWith<$Res>(_self.context!, (value) {
      return _then(_self.copyWith(context: value));
    });
  }
}
