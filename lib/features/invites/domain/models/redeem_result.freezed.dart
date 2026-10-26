// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'redeem_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RedeemResult {
  bool get alreadyRedeemed;
  InvitePerson get person;
  Invite get invite;
  List<AccountContext> get contexts;

  /// Create a copy of RedeemResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RedeemResultCopyWith<RedeemResult> get copyWith =>
      _$RedeemResultCopyWithImpl<RedeemResult>(
        this as RedeemResult,
        _$identity,
      );

  /// Serializes this RedeemResult to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RedeemResult &&
            (identical(other.alreadyRedeemed, alreadyRedeemed) ||
                other.alreadyRedeemed == alreadyRedeemed) &&
            (identical(other.person, person) || other.person == person) &&
            (identical(other.invite, invite) || other.invite == invite) &&
            const DeepCollectionEquality().equals(other.contexts, contexts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    alreadyRedeemed,
    person,
    invite,
    const DeepCollectionEquality().hash(contexts),
  );

  @override
  String toString() {
    return 'RedeemResult(alreadyRedeemed: $alreadyRedeemed, person: $person, invite: $invite, contexts: $contexts)';
  }
}

/// @nodoc
abstract mixin class $RedeemResultCopyWith<$Res> {
  factory $RedeemResultCopyWith(
    RedeemResult value,
    $Res Function(RedeemResult) _then,
  ) = _$RedeemResultCopyWithImpl;
  @useResult
  $Res call({
    bool alreadyRedeemed,
    InvitePerson person,
    Invite invite,
    List<AccountContext> contexts,
  });

  $InvitePersonCopyWith<$Res> get person;
  $InviteCopyWith<$Res> get invite;
}

/// @nodoc
class _$RedeemResultCopyWithImpl<$Res> implements $RedeemResultCopyWith<$Res> {
  _$RedeemResultCopyWithImpl(this._self, this._then);

  final RedeemResult _self;
  final $Res Function(RedeemResult) _then;

  /// Create a copy of RedeemResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alreadyRedeemed = null,
    Object? person = null,
    Object? invite = null,
    Object? contexts = null,
  }) {
    return _then(
      _self.copyWith(
        alreadyRedeemed: null == alreadyRedeemed
            ? _self.alreadyRedeemed
            : alreadyRedeemed // ignore: cast_nullable_to_non_nullable
                  as bool,
        person: null == person
            ? _self.person
            : person // ignore: cast_nullable_to_non_nullable
                  as InvitePerson,
        invite: null == invite
            ? _self.invite
            : invite // ignore: cast_nullable_to_non_nullable
                  as Invite,
        contexts: null == contexts
            ? _self.contexts
            : contexts // ignore: cast_nullable_to_non_nullable
                  as List<AccountContext>,
      ),
    );
  }

  /// Create a copy of RedeemResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvitePersonCopyWith<$Res> get person {
    return $InvitePersonCopyWith<$Res>(_self.person, (value) {
      return _then(_self.copyWith(person: value));
    });
  }

  /// Create a copy of RedeemResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InviteCopyWith<$Res> get invite {
    return $InviteCopyWith<$Res>(_self.invite, (value) {
      return _then(_self.copyWith(invite: value));
    });
  }
}

/// Adds pattern-matching-related methods to [RedeemResult].
extension RedeemResultPatterns on RedeemResult {
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
    TResult Function(_RedeemResult value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RedeemResult() when $default != null:
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
    TResult Function(_RedeemResult value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RedeemResult():
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
    TResult? Function(_RedeemResult value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RedeemResult() when $default != null:
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
      bool alreadyRedeemed,
      InvitePerson person,
      Invite invite,
      List<AccountContext> contexts,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RedeemResult() when $default != null:
        return $default(
          _that.alreadyRedeemed,
          _that.person,
          _that.invite,
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
      bool alreadyRedeemed,
      InvitePerson person,
      Invite invite,
      List<AccountContext> contexts,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RedeemResult():
        return $default(
          _that.alreadyRedeemed,
          _that.person,
          _that.invite,
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
      bool alreadyRedeemed,
      InvitePerson person,
      Invite invite,
      List<AccountContext> contexts,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RedeemResult() when $default != null:
        return $default(
          _that.alreadyRedeemed,
          _that.person,
          _that.invite,
          _that.contexts,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RedeemResult extends RedeemResult {
  const _RedeemResult({
    this.alreadyRedeemed = false,
    required this.person,
    required this.invite,
    final List<AccountContext> contexts = const [],
  }) : _contexts = contexts,
       super._();
  factory _RedeemResult.fromJson(Map<String, dynamic> json) =>
      _$RedeemResultFromJson(json);

  @override
  @JsonKey()
  final bool alreadyRedeemed;
  @override
  final InvitePerson person;
  @override
  final Invite invite;
  final List<AccountContext> _contexts;
  @override
  @JsonKey()
  List<AccountContext> get contexts {
    if (_contexts is EqualUnmodifiableListView) return _contexts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contexts);
  }

  /// Create a copy of RedeemResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RedeemResultCopyWith<_RedeemResult> get copyWith =>
      __$RedeemResultCopyWithImpl<_RedeemResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RedeemResultToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RedeemResult &&
            (identical(other.alreadyRedeemed, alreadyRedeemed) ||
                other.alreadyRedeemed == alreadyRedeemed) &&
            (identical(other.person, person) || other.person == person) &&
            (identical(other.invite, invite) || other.invite == invite) &&
            const DeepCollectionEquality().equals(other._contexts, _contexts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    alreadyRedeemed,
    person,
    invite,
    const DeepCollectionEquality().hash(_contexts),
  );

  @override
  String toString() {
    return 'RedeemResult(alreadyRedeemed: $alreadyRedeemed, person: $person, invite: $invite, contexts: $contexts)';
  }
}

/// @nodoc
abstract mixin class _$RedeemResultCopyWith<$Res>
    implements $RedeemResultCopyWith<$Res> {
  factory _$RedeemResultCopyWith(
    _RedeemResult value,
    $Res Function(_RedeemResult) _then,
  ) = __$RedeemResultCopyWithImpl;
  @override
  @useResult
  $Res call({
    bool alreadyRedeemed,
    InvitePerson person,
    Invite invite,
    List<AccountContext> contexts,
  });

  @override
  $InvitePersonCopyWith<$Res> get person;
  @override
  $InviteCopyWith<$Res> get invite;
}

/// @nodoc
class __$RedeemResultCopyWithImpl<$Res>
    implements _$RedeemResultCopyWith<$Res> {
  __$RedeemResultCopyWithImpl(this._self, this._then);

  final _RedeemResult _self;
  final $Res Function(_RedeemResult) _then;

  /// Create a copy of RedeemResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? alreadyRedeemed = null,
    Object? person = null,
    Object? invite = null,
    Object? contexts = null,
  }) {
    return _then(
      _RedeemResult(
        alreadyRedeemed: null == alreadyRedeemed
            ? _self.alreadyRedeemed
            : alreadyRedeemed // ignore: cast_nullable_to_non_nullable
                  as bool,
        person: null == person
            ? _self.person
            : person // ignore: cast_nullable_to_non_nullable
                  as InvitePerson,
        invite: null == invite
            ? _self.invite
            : invite // ignore: cast_nullable_to_non_nullable
                  as Invite,
        contexts: null == contexts
            ? _self._contexts
            : contexts // ignore: cast_nullable_to_non_nullable
                  as List<AccountContext>,
      ),
    );
  }

  /// Create a copy of RedeemResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvitePersonCopyWith<$Res> get person {
    return $InvitePersonCopyWith<$Res>(_self.person, (value) {
      return _then(_self.copyWith(person: value));
    });
  }

  /// Create a copy of RedeemResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InviteCopyWith<$Res> get invite {
    return $InviteCopyWith<$Res>(_self.invite, (value) {
      return _then(_self.copyWith(invite: value));
    });
  }
}
