// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MyAccount {
  List<UserProfile> get people;

  /// Create a copy of MyAccount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MyAccountCopyWith<MyAccount> get copyWith =>
      _$MyAccountCopyWithImpl<MyAccount>(this as MyAccount, _$identity);

  /// Serializes this MyAccount to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MyAccount &&
            const DeepCollectionEquality().equals(other.people, people));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(people));

  @override
  String toString() {
    return 'MyAccount(people: $people)';
  }
}

/// @nodoc
abstract mixin class $MyAccountCopyWith<$Res> {
  factory $MyAccountCopyWith(MyAccount value, $Res Function(MyAccount) _then) =
      _$MyAccountCopyWithImpl;
  @useResult
  $Res call({List<UserProfile> people});
}

/// @nodoc
class _$MyAccountCopyWithImpl<$Res> implements $MyAccountCopyWith<$Res> {
  _$MyAccountCopyWithImpl(this._self, this._then);

  final MyAccount _self;
  final $Res Function(MyAccount) _then;

  /// Create a copy of MyAccount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? people = null}) {
    return _then(
      _self.copyWith(
        people: null == people
            ? _self.people
            : people // ignore: cast_nullable_to_non_nullable
                  as List<UserProfile>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [MyAccount].
extension MyAccountPatterns on MyAccount {
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
    TResult Function(_MyAccount value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MyAccount() when $default != null:
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
    TResult Function(_MyAccount value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MyAccount():
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
    TResult? Function(_MyAccount value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MyAccount() when $default != null:
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
    TResult Function(List<UserProfile> people)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MyAccount() when $default != null:
        return $default(_that.people);
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
    TResult Function(List<UserProfile> people) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MyAccount():
        return $default(_that.people);
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
    TResult? Function(List<UserProfile> people)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MyAccount() when $default != null:
        return $default(_that.people);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MyAccount implements MyAccount {
  const _MyAccount({final List<UserProfile> people = const []})
    : _people = people;
  factory _MyAccount.fromJson(Map<String, dynamic> json) =>
      _$MyAccountFromJson(json);

  final List<UserProfile> _people;
  @override
  @JsonKey()
  List<UserProfile> get people {
    if (_people is EqualUnmodifiableListView) return _people;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_people);
  }

  /// Create a copy of MyAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MyAccountCopyWith<_MyAccount> get copyWith =>
      __$MyAccountCopyWithImpl<_MyAccount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MyAccountToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MyAccount &&
            const DeepCollectionEquality().equals(other._people, _people));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_people));

  @override
  String toString() {
    return 'MyAccount(people: $people)';
  }
}

/// @nodoc
abstract mixin class _$MyAccountCopyWith<$Res>
    implements $MyAccountCopyWith<$Res> {
  factory _$MyAccountCopyWith(
    _MyAccount value,
    $Res Function(_MyAccount) _then,
  ) = __$MyAccountCopyWithImpl;
  @override
  @useResult
  $Res call({List<UserProfile> people});
}

/// @nodoc
class __$MyAccountCopyWithImpl<$Res> implements _$MyAccountCopyWith<$Res> {
  __$MyAccountCopyWithImpl(this._self, this._then);

  final _MyAccount _self;
  final $Res Function(_MyAccount) _then;

  /// Create a copy of MyAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? people = null}) {
    return _then(
      _MyAccount(
        people: null == people
            ? _self._people
            : people // ignore: cast_nullable_to_non_nullable
                  as List<UserProfile>,
      ),
    );
  }
}
