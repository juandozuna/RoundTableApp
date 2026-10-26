// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'access_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccessState {
  AccessStatus get status;
  List<AccountContext> get contexts;
  List<AccountPerson> get people;
  AccountContext? get active;
  ApiException? get failure;

  /// Contexts come from the device cache because the server was unreachable.
  bool get fromCache;

  /// Create a copy of AccessState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AccessStateCopyWith<AccessState> get copyWith =>
      _$AccessStateCopyWithImpl<AccessState>(this as AccessState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AccessState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.contexts, contexts) &&
            const DeepCollectionEquality().equals(other.people, people) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.fromCache, fromCache) ||
                other.fromCache == fromCache));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    const DeepCollectionEquality().hash(contexts),
    const DeepCollectionEquality().hash(people),
    active,
    failure,
    fromCache,
  );

  @override
  String toString() {
    return 'AccessState(status: $status, contexts: $contexts, people: $people, active: $active, failure: $failure, fromCache: $fromCache)';
  }
}

/// @nodoc
abstract mixin class $AccessStateCopyWith<$Res> {
  factory $AccessStateCopyWith(
    AccessState value,
    $Res Function(AccessState) _then,
  ) = _$AccessStateCopyWithImpl;
  @useResult
  $Res call({
    AccessStatus status,
    List<AccountContext> contexts,
    List<AccountPerson> people,
    AccountContext? active,
    ApiException? failure,
    bool fromCache,
  });

  $AccountContextCopyWith<$Res>? get active;
}

/// @nodoc
class _$AccessStateCopyWithImpl<$Res> implements $AccessStateCopyWith<$Res> {
  _$AccessStateCopyWithImpl(this._self, this._then);

  final AccessState _self;
  final $Res Function(AccessState) _then;

  /// Create a copy of AccessState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? contexts = null,
    Object? people = null,
    Object? active = freezed,
    Object? failure = freezed,
    Object? fromCache = null,
  }) {
    return _then(
      _self.copyWith(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as AccessStatus,
        contexts: null == contexts
            ? _self.contexts
            : contexts // ignore: cast_nullable_to_non_nullable
                  as List<AccountContext>,
        people: null == people
            ? _self.people
            : people // ignore: cast_nullable_to_non_nullable
                  as List<AccountPerson>,
        active: freezed == active
            ? _self.active
            : active // ignore: cast_nullable_to_non_nullable
                  as AccountContext?,
        failure: freezed == failure
            ? _self.failure
            : failure // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
        fromCache: null == fromCache
            ? _self.fromCache
            : fromCache // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of AccessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AccountContextCopyWith<$Res>? get active {
    if (_self.active == null) {
      return null;
    }

    return $AccountContextCopyWith<$Res>(_self.active!, (value) {
      return _then(_self.copyWith(active: value));
    });
  }
}

/// Adds pattern-matching-related methods to [AccessState].
extension AccessStatePatterns on AccessState {
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
    TResult Function(_AccessState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AccessState() when $default != null:
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
    TResult Function(_AccessState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AccessState():
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
    TResult? Function(_AccessState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AccessState() when $default != null:
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
      AccessStatus status,
      List<AccountContext> contexts,
      List<AccountPerson> people,
      AccountContext? active,
      ApiException? failure,
      bool fromCache,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AccessState() when $default != null:
        return $default(
          _that.status,
          _that.contexts,
          _that.people,
          _that.active,
          _that.failure,
          _that.fromCache,
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
      AccessStatus status,
      List<AccountContext> contexts,
      List<AccountPerson> people,
      AccountContext? active,
      ApiException? failure,
      bool fromCache,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AccessState():
        return $default(
          _that.status,
          _that.contexts,
          _that.people,
          _that.active,
          _that.failure,
          _that.fromCache,
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
      AccessStatus status,
      List<AccountContext> contexts,
      List<AccountPerson> people,
      AccountContext? active,
      ApiException? failure,
      bool fromCache,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AccessState() when $default != null:
        return $default(
          _that.status,
          _that.contexts,
          _that.people,
          _that.active,
          _that.failure,
          _that.fromCache,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AccessState extends AccessState {
  const _AccessState({
    this.status = AccessStatus.signedOut,
    final List<AccountContext> contexts = const [],
    final List<AccountPerson> people = const [],
    this.active,
    this.failure,
    this.fromCache = false,
  }) : _contexts = contexts,
       _people = people,
       super._();

  @override
  @JsonKey()
  final AccessStatus status;
  final List<AccountContext> _contexts;
  @override
  @JsonKey()
  List<AccountContext> get contexts {
    if (_contexts is EqualUnmodifiableListView) return _contexts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contexts);
  }

  final List<AccountPerson> _people;
  @override
  @JsonKey()
  List<AccountPerson> get people {
    if (_people is EqualUnmodifiableListView) return _people;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_people);
  }

  @override
  final AccountContext? active;
  @override
  final ApiException? failure;

  /// Contexts come from the device cache because the server was unreachable.
  @override
  @JsonKey()
  final bool fromCache;

  /// Create a copy of AccessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AccessStateCopyWith<_AccessState> get copyWith =>
      __$AccessStateCopyWithImpl<_AccessState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AccessState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._contexts, _contexts) &&
            const DeepCollectionEquality().equals(other._people, _people) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(other.fromCache, fromCache) ||
                other.fromCache == fromCache));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    const DeepCollectionEquality().hash(_contexts),
    const DeepCollectionEquality().hash(_people),
    active,
    failure,
    fromCache,
  );

  @override
  String toString() {
    return 'AccessState(status: $status, contexts: $contexts, people: $people, active: $active, failure: $failure, fromCache: $fromCache)';
  }
}

/// @nodoc
abstract mixin class _$AccessStateCopyWith<$Res>
    implements $AccessStateCopyWith<$Res> {
  factory _$AccessStateCopyWith(
    _AccessState value,
    $Res Function(_AccessState) _then,
  ) = __$AccessStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    AccessStatus status,
    List<AccountContext> contexts,
    List<AccountPerson> people,
    AccountContext? active,
    ApiException? failure,
    bool fromCache,
  });

  @override
  $AccountContextCopyWith<$Res>? get active;
}

/// @nodoc
class __$AccessStateCopyWithImpl<$Res> implements _$AccessStateCopyWith<$Res> {
  __$AccessStateCopyWithImpl(this._self, this._then);

  final _AccessState _self;
  final $Res Function(_AccessState) _then;

  /// Create a copy of AccessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? contexts = null,
    Object? people = null,
    Object? active = freezed,
    Object? failure = freezed,
    Object? fromCache = null,
  }) {
    return _then(
      _AccessState(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as AccessStatus,
        contexts: null == contexts
            ? _self._contexts
            : contexts // ignore: cast_nullable_to_non_nullable
                  as List<AccountContext>,
        people: null == people
            ? _self._people
            : people // ignore: cast_nullable_to_non_nullable
                  as List<AccountPerson>,
        active: freezed == active
            ? _self.active
            : active // ignore: cast_nullable_to_non_nullable
                  as AccountContext?,
        failure: freezed == failure
            ? _self.failure
            : failure // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
        fromCache: null == fromCache
            ? _self.fromCache
            : fromCache // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of AccessState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AccountContextCopyWith<$Res>? get active {
    if (_self.active == null) {
      return null;
    }

    return $AccountContextCopyWith<$Res>(_self.active!, (value) {
      return _then(_self.copyWith(active: value));
    });
  }
}
