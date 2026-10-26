// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Account {
  String get authUserId;
  bool get isPlatformAdmin;
  List<AccountPerson> get people;
  List<AccountContext> get contexts;

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AccountCopyWith<Account> get copyWith =>
      _$AccountCopyWithImpl<Account>(this as Account, _$identity);

  /// Serializes this Account to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Account &&
            (identical(other.authUserId, authUserId) ||
                other.authUserId == authUserId) &&
            (identical(other.isPlatformAdmin, isPlatformAdmin) ||
                other.isPlatformAdmin == isPlatformAdmin) &&
            const DeepCollectionEquality().equals(other.people, people) &&
            const DeepCollectionEquality().equals(other.contexts, contexts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    authUserId,
    isPlatformAdmin,
    const DeepCollectionEquality().hash(people),
    const DeepCollectionEquality().hash(contexts),
  );

  @override
  String toString() {
    return 'Account(authUserId: $authUserId, isPlatformAdmin: $isPlatformAdmin, people: $people, contexts: $contexts)';
  }
}

/// @nodoc
abstract mixin class $AccountCopyWith<$Res> {
  factory $AccountCopyWith(Account value, $Res Function(Account) _then) =
      _$AccountCopyWithImpl;
  @useResult
  $Res call({
    String authUserId,
    bool isPlatformAdmin,
    List<AccountPerson> people,
    List<AccountContext> contexts,
  });
}

/// @nodoc
class _$AccountCopyWithImpl<$Res> implements $AccountCopyWith<$Res> {
  _$AccountCopyWithImpl(this._self, this._then);

  final Account _self;
  final $Res Function(Account) _then;

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authUserId = null,
    Object? isPlatformAdmin = null,
    Object? people = null,
    Object? contexts = null,
  }) {
    return _then(
      _self.copyWith(
        authUserId: null == authUserId
            ? _self.authUserId
            : authUserId // ignore: cast_nullable_to_non_nullable
                  as String,
        isPlatformAdmin: null == isPlatformAdmin
            ? _self.isPlatformAdmin
            : isPlatformAdmin // ignore: cast_nullable_to_non_nullable
                  as bool,
        people: null == people
            ? _self.people
            : people // ignore: cast_nullable_to_non_nullable
                  as List<AccountPerson>,
        contexts: null == contexts
            ? _self.contexts
            : contexts // ignore: cast_nullable_to_non_nullable
                  as List<AccountContext>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [Account].
extension AccountPatterns on Account {
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
    TResult Function(_Account value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Account() when $default != null:
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
    TResult Function(_Account value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Account():
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
    TResult? Function(_Account value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Account() when $default != null:
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
      String authUserId,
      bool isPlatformAdmin,
      List<AccountPerson> people,
      List<AccountContext> contexts,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Account() when $default != null:
        return $default(
          _that.authUserId,
          _that.isPlatformAdmin,
          _that.people,
          _that.contexts,
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
      String authUserId,
      bool isPlatformAdmin,
      List<AccountPerson> people,
      List<AccountContext> contexts,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Account():
        return $default(
          _that.authUserId,
          _that.isPlatformAdmin,
          _that.people,
          _that.contexts,
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
      String authUserId,
      bool isPlatformAdmin,
      List<AccountPerson> people,
      List<AccountContext> contexts,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Account() when $default != null:
        return $default(
          _that.authUserId,
          _that.isPlatformAdmin,
          _that.people,
          _that.contexts,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Account extends Account {
  const _Account({
    required this.authUserId,
    this.isPlatformAdmin = false,
    final List<AccountPerson> people = const [],
    final List<AccountContext> contexts = const [],
  }) : _people = people,
       _contexts = contexts,
       super._();
  factory _Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  @override
  final String authUserId;
  @override
  @JsonKey()
  final bool isPlatformAdmin;
  final List<AccountPerson> _people;
  @override
  @JsonKey()
  List<AccountPerson> get people {
    if (_people is EqualUnmodifiableListView) return _people;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_people);
  }

  final List<AccountContext> _contexts;
  @override
  @JsonKey()
  List<AccountContext> get contexts {
    if (_contexts is EqualUnmodifiableListView) return _contexts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contexts);
  }

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AccountCopyWith<_Account> get copyWith =>
      __$AccountCopyWithImpl<_Account>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AccountToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Account &&
            (identical(other.authUserId, authUserId) ||
                other.authUserId == authUserId) &&
            (identical(other.isPlatformAdmin, isPlatformAdmin) ||
                other.isPlatformAdmin == isPlatformAdmin) &&
            const DeepCollectionEquality().equals(other._people, _people) &&
            const DeepCollectionEquality().equals(other._contexts, _contexts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    authUserId,
    isPlatformAdmin,
    const DeepCollectionEquality().hash(_people),
    const DeepCollectionEquality().hash(_contexts),
  );

  @override
  String toString() {
    return 'Account(authUserId: $authUserId, isPlatformAdmin: $isPlatformAdmin, people: $people, contexts: $contexts)';
  }
}

/// @nodoc
abstract mixin class _$AccountCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory _$AccountCopyWith(_Account value, $Res Function(_Account) _then) =
      __$AccountCopyWithImpl;
  @override
  @useResult
  $Res call({
    String authUserId,
    bool isPlatformAdmin,
    List<AccountPerson> people,
    List<AccountContext> contexts,
  });
}

/// @nodoc
class __$AccountCopyWithImpl<$Res> implements _$AccountCopyWith<$Res> {
  __$AccountCopyWithImpl(this._self, this._then);

  final _Account _self;
  final $Res Function(_Account) _then;

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? authUserId = null,
    Object? isPlatformAdmin = null,
    Object? people = null,
    Object? contexts = null,
  }) {
    return _then(
      _Account(
        authUserId: null == authUserId
            ? _self.authUserId
            : authUserId // ignore: cast_nullable_to_non_nullable
                  as String,
        isPlatformAdmin: null == isPlatformAdmin
            ? _self.isPlatformAdmin
            : isPlatformAdmin // ignore: cast_nullable_to_non_nullable
                  as bool,
        people: null == people
            ? _self._people
            : people // ignore: cast_nullable_to_non_nullable
                  as List<AccountPerson>,
        contexts: null == contexts
            ? _self._contexts
            : contexts // ignore: cast_nullable_to_non_nullable
                  as List<AccountContext>,
      ),
    );
  }
}
