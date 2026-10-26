// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'person_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PersonDetailState {
  PersonDetailStatus get status;
  AdminPerson? get person;
  ApiException? get error;
  bool get working;

  /// Status the person was just moved to (drives the success toast).
  PersonStatus? get changedTo;
  ApiException? get actionError;

  /// Create a copy of PersonDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PersonDetailStateCopyWith<PersonDetailState> get copyWith =>
      _$PersonDetailStateCopyWithImpl<PersonDetailState>(
        this as PersonDetailState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PersonDetailState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.person, person) || other.person == person) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.working, working) || other.working == working) &&
            (identical(other.changedTo, changedTo) ||
                other.changedTo == changedTo) &&
            (identical(other.actionError, actionError) ||
                other.actionError == actionError));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    person,
    error,
    working,
    changedTo,
    actionError,
  );

  @override
  String toString() {
    return 'PersonDetailState(status: $status, person: $person, error: $error, working: $working, changedTo: $changedTo, actionError: $actionError)';
  }
}

/// @nodoc
abstract mixin class $PersonDetailStateCopyWith<$Res> {
  factory $PersonDetailStateCopyWith(
    PersonDetailState value,
    $Res Function(PersonDetailState) _then,
  ) = _$PersonDetailStateCopyWithImpl;
  @useResult
  $Res call({
    PersonDetailStatus status,
    AdminPerson? person,
    ApiException? error,
    bool working,
    PersonStatus? changedTo,
    ApiException? actionError,
  });

  $AdminPersonCopyWith<$Res>? get person;
}

/// @nodoc
class _$PersonDetailStateCopyWithImpl<$Res>
    implements $PersonDetailStateCopyWith<$Res> {
  _$PersonDetailStateCopyWithImpl(this._self, this._then);

  final PersonDetailState _self;
  final $Res Function(PersonDetailState) _then;

  /// Create a copy of PersonDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? person = freezed,
    Object? error = freezed,
    Object? working = null,
    Object? changedTo = freezed,
    Object? actionError = freezed,
  }) {
    return _then(
      _self.copyWith(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as PersonDetailStatus,
        person: freezed == person
            ? _self.person
            : person // ignore: cast_nullable_to_non_nullable
                  as AdminPerson?,
        error: freezed == error
            ? _self.error
            : error // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
        working: null == working
            ? _self.working
            : working // ignore: cast_nullable_to_non_nullable
                  as bool,
        changedTo: freezed == changedTo
            ? _self.changedTo
            : changedTo // ignore: cast_nullable_to_non_nullable
                  as PersonStatus?,
        actionError: freezed == actionError
            ? _self.actionError
            : actionError // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
      ),
    );
  }

  /// Create a copy of PersonDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AdminPersonCopyWith<$Res>? get person {
    if (_self.person == null) {
      return null;
    }

    return $AdminPersonCopyWith<$Res>(_self.person!, (value) {
      return _then(_self.copyWith(person: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PersonDetailState].
extension PersonDetailStatePatterns on PersonDetailState {
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
    TResult Function(_PersonDetailState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PersonDetailState() when $default != null:
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
    TResult Function(_PersonDetailState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PersonDetailState():
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
    TResult? Function(_PersonDetailState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PersonDetailState() when $default != null:
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
      PersonDetailStatus status,
      AdminPerson? person,
      ApiException? error,
      bool working,
      PersonStatus? changedTo,
      ApiException? actionError,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PersonDetailState() when $default != null:
        return $default(
          _that.status,
          _that.person,
          _that.error,
          _that.working,
          _that.changedTo,
          _that.actionError,
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
      PersonDetailStatus status,
      AdminPerson? person,
      ApiException? error,
      bool working,
      PersonStatus? changedTo,
      ApiException? actionError,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PersonDetailState():
        return $default(
          _that.status,
          _that.person,
          _that.error,
          _that.working,
          _that.changedTo,
          _that.actionError,
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
      PersonDetailStatus status,
      AdminPerson? person,
      ApiException? error,
      bool working,
      PersonStatus? changedTo,
      ApiException? actionError,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PersonDetailState() when $default != null:
        return $default(
          _that.status,
          _that.person,
          _that.error,
          _that.working,
          _that.changedTo,
          _that.actionError,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PersonDetailState implements PersonDetailState {
  const _PersonDetailState({
    this.status = PersonDetailStatus.loading,
    this.person,
    this.error,
    this.working = false,
    this.changedTo,
    this.actionError,
  });

  @override
  @JsonKey()
  final PersonDetailStatus status;
  @override
  final AdminPerson? person;
  @override
  final ApiException? error;
  @override
  @JsonKey()
  final bool working;

  /// Status the person was just moved to (drives the success toast).
  @override
  final PersonStatus? changedTo;
  @override
  final ApiException? actionError;

  /// Create a copy of PersonDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PersonDetailStateCopyWith<_PersonDetailState> get copyWith =>
      __$PersonDetailStateCopyWithImpl<_PersonDetailState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PersonDetailState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.person, person) || other.person == person) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.working, working) || other.working == working) &&
            (identical(other.changedTo, changedTo) ||
                other.changedTo == changedTo) &&
            (identical(other.actionError, actionError) ||
                other.actionError == actionError));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    person,
    error,
    working,
    changedTo,
    actionError,
  );

  @override
  String toString() {
    return 'PersonDetailState(status: $status, person: $person, error: $error, working: $working, changedTo: $changedTo, actionError: $actionError)';
  }
}

/// @nodoc
abstract mixin class _$PersonDetailStateCopyWith<$Res>
    implements $PersonDetailStateCopyWith<$Res> {
  factory _$PersonDetailStateCopyWith(
    _PersonDetailState value,
    $Res Function(_PersonDetailState) _then,
  ) = __$PersonDetailStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    PersonDetailStatus status,
    AdminPerson? person,
    ApiException? error,
    bool working,
    PersonStatus? changedTo,
    ApiException? actionError,
  });

  @override
  $AdminPersonCopyWith<$Res>? get person;
}

/// @nodoc
class __$PersonDetailStateCopyWithImpl<$Res>
    implements _$PersonDetailStateCopyWith<$Res> {
  __$PersonDetailStateCopyWithImpl(this._self, this._then);

  final _PersonDetailState _self;
  final $Res Function(_PersonDetailState) _then;

  /// Create a copy of PersonDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? person = freezed,
    Object? error = freezed,
    Object? working = null,
    Object? changedTo = freezed,
    Object? actionError = freezed,
  }) {
    return _then(
      _PersonDetailState(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as PersonDetailStatus,
        person: freezed == person
            ? _self.person
            : person // ignore: cast_nullable_to_non_nullable
                  as AdminPerson?,
        error: freezed == error
            ? _self.error
            : error // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
        working: null == working
            ? _self.working
            : working // ignore: cast_nullable_to_non_nullable
                  as bool,
        changedTo: freezed == changedTo
            ? _self.changedTo
            : changedTo // ignore: cast_nullable_to_non_nullable
                  as PersonStatus?,
        actionError: freezed == actionError
            ? _self.actionError
            : actionError // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
      ),
    );
  }

  /// Create a copy of PersonDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AdminPersonCopyWith<$Res>? get person {
    if (_self.person == null) {
      return null;
    }

    return $AdminPersonCopyWith<$Res>(_self.person!, (value) {
      return _then(_self.copyWith(person: value));
    });
  }
}
