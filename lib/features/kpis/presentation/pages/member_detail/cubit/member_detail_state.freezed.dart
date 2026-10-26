// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MemberDetailState {
  MemberDetailStatus get status;
  KpiMemberDetail? get member;
  ApiException? get error;

  /// Individual answers, only after the user pressed "Mostrar respuestas".
  RevealedPerson? get revealed;
  bool get revealing;
  ApiException? get revealError;

  /// Create a copy of MemberDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MemberDetailStateCopyWith<MemberDetailState> get copyWith =>
      _$MemberDetailStateCopyWithImpl<MemberDetailState>(
        this as MemberDetailState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MemberDetailState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.member, member) || other.member == member) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.revealed, revealed) ||
                other.revealed == revealed) &&
            (identical(other.revealing, revealing) ||
                other.revealing == revealing) &&
            (identical(other.revealError, revealError) ||
                other.revealError == revealError));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    member,
    error,
    revealed,
    revealing,
    revealError,
  );

  @override
  String toString() {
    return 'MemberDetailState(status: $status, member: $member, error: $error, revealed: $revealed, revealing: $revealing, revealError: $revealError)';
  }
}

/// @nodoc
abstract mixin class $MemberDetailStateCopyWith<$Res> {
  factory $MemberDetailStateCopyWith(
    MemberDetailState value,
    $Res Function(MemberDetailState) _then,
  ) = _$MemberDetailStateCopyWithImpl;
  @useResult
  $Res call({
    MemberDetailStatus status,
    KpiMemberDetail? member,
    ApiException? error,
    RevealedPerson? revealed,
    bool revealing,
    ApiException? revealError,
  });

  $KpiMemberDetailCopyWith<$Res>? get member;
  $RevealedPersonCopyWith<$Res>? get revealed;
}

/// @nodoc
class _$MemberDetailStateCopyWithImpl<$Res>
    implements $MemberDetailStateCopyWith<$Res> {
  _$MemberDetailStateCopyWithImpl(this._self, this._then);

  final MemberDetailState _self;
  final $Res Function(MemberDetailState) _then;

  /// Create a copy of MemberDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? member = freezed,
    Object? error = freezed,
    Object? revealed = freezed,
    Object? revealing = null,
    Object? revealError = freezed,
  }) {
    return _then(
      _self.copyWith(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as MemberDetailStatus,
        member: freezed == member
            ? _self.member
            : member // ignore: cast_nullable_to_non_nullable
                  as KpiMemberDetail?,
        error: freezed == error
            ? _self.error
            : error // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
        revealed: freezed == revealed
            ? _self.revealed
            : revealed // ignore: cast_nullable_to_non_nullable
                  as RevealedPerson?,
        revealing: null == revealing
            ? _self.revealing
            : revealing // ignore: cast_nullable_to_non_nullable
                  as bool,
        revealError: freezed == revealError
            ? _self.revealError
            : revealError // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
      ),
    );
  }

  /// Create a copy of MemberDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KpiMemberDetailCopyWith<$Res>? get member {
    if (_self.member == null) {
      return null;
    }

    return $KpiMemberDetailCopyWith<$Res>(_self.member!, (value) {
      return _then(_self.copyWith(member: value));
    });
  }

  /// Create a copy of MemberDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RevealedPersonCopyWith<$Res>? get revealed {
    if (_self.revealed == null) {
      return null;
    }

    return $RevealedPersonCopyWith<$Res>(_self.revealed!, (value) {
      return _then(_self.copyWith(revealed: value));
    });
  }
}

/// Adds pattern-matching-related methods to [MemberDetailState].
extension MemberDetailStatePatterns on MemberDetailState {
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
    TResult Function(_MemberDetailState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MemberDetailState() when $default != null:
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
    TResult Function(_MemberDetailState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberDetailState():
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
    TResult? Function(_MemberDetailState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberDetailState() when $default != null:
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
      MemberDetailStatus status,
      KpiMemberDetail? member,
      ApiException? error,
      RevealedPerson? revealed,
      bool revealing,
      ApiException? revealError,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MemberDetailState() when $default != null:
        return $default(
          _that.status,
          _that.member,
          _that.error,
          _that.revealed,
          _that.revealing,
          _that.revealError,
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
      MemberDetailStatus status,
      KpiMemberDetail? member,
      ApiException? error,
      RevealedPerson? revealed,
      bool revealing,
      ApiException? revealError,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberDetailState():
        return $default(
          _that.status,
          _that.member,
          _that.error,
          _that.revealed,
          _that.revealing,
          _that.revealError,
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
      MemberDetailStatus status,
      KpiMemberDetail? member,
      ApiException? error,
      RevealedPerson? revealed,
      bool revealing,
      ApiException? revealError,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberDetailState() when $default != null:
        return $default(
          _that.status,
          _that.member,
          _that.error,
          _that.revealed,
          _that.revealing,
          _that.revealError,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MemberDetailState implements MemberDetailState {
  const _MemberDetailState({
    this.status = MemberDetailStatus.loading,
    this.member,
    this.error,
    this.revealed,
    this.revealing = false,
    this.revealError,
  });

  @override
  @JsonKey()
  final MemberDetailStatus status;
  @override
  final KpiMemberDetail? member;
  @override
  final ApiException? error;

  /// Individual answers, only after the user pressed "Mostrar respuestas".
  @override
  final RevealedPerson? revealed;
  @override
  @JsonKey()
  final bool revealing;
  @override
  final ApiException? revealError;

  /// Create a copy of MemberDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MemberDetailStateCopyWith<_MemberDetailState> get copyWith =>
      __$MemberDetailStateCopyWithImpl<_MemberDetailState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MemberDetailState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.member, member) || other.member == member) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.revealed, revealed) ||
                other.revealed == revealed) &&
            (identical(other.revealing, revealing) ||
                other.revealing == revealing) &&
            (identical(other.revealError, revealError) ||
                other.revealError == revealError));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    member,
    error,
    revealed,
    revealing,
    revealError,
  );

  @override
  String toString() {
    return 'MemberDetailState(status: $status, member: $member, error: $error, revealed: $revealed, revealing: $revealing, revealError: $revealError)';
  }
}

/// @nodoc
abstract mixin class _$MemberDetailStateCopyWith<$Res>
    implements $MemberDetailStateCopyWith<$Res> {
  factory _$MemberDetailStateCopyWith(
    _MemberDetailState value,
    $Res Function(_MemberDetailState) _then,
  ) = __$MemberDetailStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    MemberDetailStatus status,
    KpiMemberDetail? member,
    ApiException? error,
    RevealedPerson? revealed,
    bool revealing,
    ApiException? revealError,
  });

  @override
  $KpiMemberDetailCopyWith<$Res>? get member;
  @override
  $RevealedPersonCopyWith<$Res>? get revealed;
}

/// @nodoc
class __$MemberDetailStateCopyWithImpl<$Res>
    implements _$MemberDetailStateCopyWith<$Res> {
  __$MemberDetailStateCopyWithImpl(this._self, this._then);

  final _MemberDetailState _self;
  final $Res Function(_MemberDetailState) _then;

  /// Create a copy of MemberDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? member = freezed,
    Object? error = freezed,
    Object? revealed = freezed,
    Object? revealing = null,
    Object? revealError = freezed,
  }) {
    return _then(
      _MemberDetailState(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as MemberDetailStatus,
        member: freezed == member
            ? _self.member
            : member // ignore: cast_nullable_to_non_nullable
                  as KpiMemberDetail?,
        error: freezed == error
            ? _self.error
            : error // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
        revealed: freezed == revealed
            ? _self.revealed
            : revealed // ignore: cast_nullable_to_non_nullable
                  as RevealedPerson?,
        revealing: null == revealing
            ? _self.revealing
            : revealing // ignore: cast_nullable_to_non_nullable
                  as bool,
        revealError: freezed == revealError
            ? _self.revealError
            : revealError // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
      ),
    );
  }

  /// Create a copy of MemberDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KpiMemberDetailCopyWith<$Res>? get member {
    if (_self.member == null) {
      return null;
    }

    return $KpiMemberDetailCopyWith<$Res>(_self.member!, (value) {
      return _then(_self.copyWith(member: value));
    });
  }

  /// Create a copy of MemberDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RevealedPersonCopyWith<$Res>? get revealed {
    if (_self.revealed == null) {
      return null;
    }

    return $RevealedPersonCopyWith<$Res>(_self.revealed!, (value) {
      return _then(_self.copyWith(revealed: value));
    });
  }
}
