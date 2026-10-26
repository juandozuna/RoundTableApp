// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facilitator_board_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FacilitatorBoardState {
  FacilitatorTab get tab;

  /// Stage whose progress the board shows; null follows the current one.
  FacilitatorStage? get viewing;
  bool get isSaving;
  Object? get failure;

  /// Create a copy of FacilitatorBoardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FacilitatorBoardStateCopyWith<FacilitatorBoardState> get copyWith =>
      _$FacilitatorBoardStateCopyWithImpl<FacilitatorBoardState>(
        this as FacilitatorBoardState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FacilitatorBoardState &&
            (identical(other.tab, tab) || other.tab == tab) &&
            (identical(other.viewing, viewing) || other.viewing == viewing) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    tab,
    viewing,
    isSaving,
    const DeepCollectionEquality().hash(failure),
  );

  @override
  String toString() {
    return 'FacilitatorBoardState(tab: $tab, viewing: $viewing, isSaving: $isSaving, failure: $failure)';
  }
}

/// @nodoc
abstract mixin class $FacilitatorBoardStateCopyWith<$Res> {
  factory $FacilitatorBoardStateCopyWith(
    FacilitatorBoardState value,
    $Res Function(FacilitatorBoardState) _then,
  ) = _$FacilitatorBoardStateCopyWithImpl;
  @useResult
  $Res call({
    FacilitatorTab tab,
    FacilitatorStage? viewing,
    bool isSaving,
    Object? failure,
  });
}

/// @nodoc
class _$FacilitatorBoardStateCopyWithImpl<$Res>
    implements $FacilitatorBoardStateCopyWith<$Res> {
  _$FacilitatorBoardStateCopyWithImpl(this._self, this._then);

  final FacilitatorBoardState _self;
  final $Res Function(FacilitatorBoardState) _then;

  /// Create a copy of FacilitatorBoardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tab = null,
    Object? viewing = freezed,
    Object? isSaving = null,
    Object? failure = freezed,
  }) {
    return _then(
      _self.copyWith(
        tab: null == tab
            ? _self.tab
            : tab // ignore: cast_nullable_to_non_nullable
                  as FacilitatorTab,
        viewing: freezed == viewing
            ? _self.viewing
            : viewing // ignore: cast_nullable_to_non_nullable
                  as FacilitatorStage?,
        isSaving: null == isSaving
            ? _self.isSaving
            : isSaving // ignore: cast_nullable_to_non_nullable
                  as bool,
        failure: freezed == failure ? _self.failure : failure,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [FacilitatorBoardState].
extension FacilitatorBoardStatePatterns on FacilitatorBoardState {
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
    TResult Function(_FacilitatorBoardState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FacilitatorBoardState() when $default != null:
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
    TResult Function(_FacilitatorBoardState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FacilitatorBoardState():
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
    TResult? Function(_FacilitatorBoardState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FacilitatorBoardState() when $default != null:
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
      FacilitatorTab tab,
      FacilitatorStage? viewing,
      bool isSaving,
      Object? failure,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FacilitatorBoardState() when $default != null:
        return $default(
          _that.tab,
          _that.viewing,
          _that.isSaving,
          _that.failure,
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
      FacilitatorTab tab,
      FacilitatorStage? viewing,
      bool isSaving,
      Object? failure,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FacilitatorBoardState():
        return $default(
          _that.tab,
          _that.viewing,
          _that.isSaving,
          _that.failure,
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
      FacilitatorTab tab,
      FacilitatorStage? viewing,
      bool isSaving,
      Object? failure,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FacilitatorBoardState() when $default != null:
        return $default(
          _that.tab,
          _that.viewing,
          _that.isSaving,
          _that.failure,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FacilitatorBoardState implements FacilitatorBoardState {
  const _FacilitatorBoardState({
    this.tab = FacilitatorTab.board,
    this.viewing,
    this.isSaving = false,
    this.failure,
  });

  @override
  @JsonKey()
  final FacilitatorTab tab;

  /// Stage whose progress the board shows; null follows the current one.
  @override
  final FacilitatorStage? viewing;
  @override
  @JsonKey()
  final bool isSaving;
  @override
  final Object? failure;

  /// Create a copy of FacilitatorBoardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FacilitatorBoardStateCopyWith<_FacilitatorBoardState> get copyWith =>
      __$FacilitatorBoardStateCopyWithImpl<_FacilitatorBoardState>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FacilitatorBoardState &&
            (identical(other.tab, tab) || other.tab == tab) &&
            (identical(other.viewing, viewing) || other.viewing == viewing) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    tab,
    viewing,
    isSaving,
    const DeepCollectionEquality().hash(failure),
  );

  @override
  String toString() {
    return 'FacilitatorBoardState(tab: $tab, viewing: $viewing, isSaving: $isSaving, failure: $failure)';
  }
}

/// @nodoc
abstract mixin class _$FacilitatorBoardStateCopyWith<$Res>
    implements $FacilitatorBoardStateCopyWith<$Res> {
  factory _$FacilitatorBoardStateCopyWith(
    _FacilitatorBoardState value,
    $Res Function(_FacilitatorBoardState) _then,
  ) = __$FacilitatorBoardStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    FacilitatorTab tab,
    FacilitatorStage? viewing,
    bool isSaving,
    Object? failure,
  });
}

/// @nodoc
class __$FacilitatorBoardStateCopyWithImpl<$Res>
    implements _$FacilitatorBoardStateCopyWith<$Res> {
  __$FacilitatorBoardStateCopyWithImpl(this._self, this._then);

  final _FacilitatorBoardState _self;
  final $Res Function(_FacilitatorBoardState) _then;

  /// Create a copy of FacilitatorBoardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tab = null,
    Object? viewing = freezed,
    Object? isSaving = null,
    Object? failure = freezed,
  }) {
    return _then(
      _FacilitatorBoardState(
        tab: null == tab
            ? _self.tab
            : tab // ignore: cast_nullable_to_non_nullable
                  as FacilitatorTab,
        viewing: freezed == viewing
            ? _self.viewing
            : viewing // ignore: cast_nullable_to_non_nullable
                  as FacilitatorStage?,
        isSaving: null == isSaving
            ? _self.isSaving
            : isSaving // ignore: cast_nullable_to_non_nullable
                  as bool,
        failure: freezed == failure ? _self.failure : failure,
      ),
    );
  }
}
