// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invite_list_envelope.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InviteListEnvelope {
  List<Invite> get invites;

  /// Create a copy of InviteListEnvelope
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InviteListEnvelopeCopyWith<InviteListEnvelope> get copyWith =>
      _$InviteListEnvelopeCopyWithImpl<InviteListEnvelope>(
        this as InviteListEnvelope,
        _$identity,
      );

  /// Serializes this InviteListEnvelope to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InviteListEnvelope &&
            const DeepCollectionEquality().equals(other.invites, invites));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(invites));

  @override
  String toString() {
    return 'InviteListEnvelope(invites: $invites)';
  }
}

/// @nodoc
abstract mixin class $InviteListEnvelopeCopyWith<$Res> {
  factory $InviteListEnvelopeCopyWith(
    InviteListEnvelope value,
    $Res Function(InviteListEnvelope) _then,
  ) = _$InviteListEnvelopeCopyWithImpl;
  @useResult
  $Res call({List<Invite> invites});
}

/// @nodoc
class _$InviteListEnvelopeCopyWithImpl<$Res>
    implements $InviteListEnvelopeCopyWith<$Res> {
  _$InviteListEnvelopeCopyWithImpl(this._self, this._then);

  final InviteListEnvelope _self;
  final $Res Function(InviteListEnvelope) _then;

  /// Create a copy of InviteListEnvelope
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? invites = null}) {
    return _then(
      _self.copyWith(
        invites: null == invites
            ? _self.invites
            : invites // ignore: cast_nullable_to_non_nullable
                  as List<Invite>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [InviteListEnvelope].
extension InviteListEnvelopePatterns on InviteListEnvelope {
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
    TResult Function(_InviteListEnvelope value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InviteListEnvelope() when $default != null:
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
    TResult Function(_InviteListEnvelope value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InviteListEnvelope():
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
    TResult? Function(_InviteListEnvelope value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InviteListEnvelope() when $default != null:
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
    TResult Function(List<Invite> invites)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InviteListEnvelope() when $default != null:
        return $default(_that.invites);
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
    TResult Function(List<Invite> invites) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InviteListEnvelope():
        return $default(_that.invites);
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
    TResult? Function(List<Invite> invites)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InviteListEnvelope() when $default != null:
        return $default(_that.invites);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _InviteListEnvelope implements InviteListEnvelope {
  const _InviteListEnvelope({final List<Invite> invites = const []})
    : _invites = invites;
  factory _InviteListEnvelope.fromJson(Map<String, dynamic> json) =>
      _$InviteListEnvelopeFromJson(json);

  final List<Invite> _invites;
  @override
  @JsonKey()
  List<Invite> get invites {
    if (_invites is EqualUnmodifiableListView) return _invites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invites);
  }

  /// Create a copy of InviteListEnvelope
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InviteListEnvelopeCopyWith<_InviteListEnvelope> get copyWith =>
      __$InviteListEnvelopeCopyWithImpl<_InviteListEnvelope>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InviteListEnvelopeToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InviteListEnvelope &&
            const DeepCollectionEquality().equals(other._invites, _invites));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_invites));

  @override
  String toString() {
    return 'InviteListEnvelope(invites: $invites)';
  }
}

/// @nodoc
abstract mixin class _$InviteListEnvelopeCopyWith<$Res>
    implements $InviteListEnvelopeCopyWith<$Res> {
  factory _$InviteListEnvelopeCopyWith(
    _InviteListEnvelope value,
    $Res Function(_InviteListEnvelope) _then,
  ) = __$InviteListEnvelopeCopyWithImpl;
  @override
  @useResult
  $Res call({List<Invite> invites});
}

/// @nodoc
class __$InviteListEnvelopeCopyWithImpl<$Res>
    implements _$InviteListEnvelopeCopyWith<$Res> {
  __$InviteListEnvelopeCopyWithImpl(this._self, this._then);

  final _InviteListEnvelope _self;
  final $Res Function(_InviteListEnvelope) _then;

  /// Create a copy of InviteListEnvelope
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? invites = null}) {
    return _then(
      _InviteListEnvelope(
        invites: null == invites
            ? _self._invites
            : invites // ignore: cast_nullable_to_non_nullable
                  as List<Invite>,
      ),
    );
  }
}
