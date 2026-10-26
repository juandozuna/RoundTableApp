// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invite_envelope.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InviteEnvelope {
  Invite get invite;

  /// Create a copy of InviteEnvelope
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InviteEnvelopeCopyWith<InviteEnvelope> get copyWith =>
      _$InviteEnvelopeCopyWithImpl<InviteEnvelope>(
        this as InviteEnvelope,
        _$identity,
      );

  /// Serializes this InviteEnvelope to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InviteEnvelope &&
            (identical(other.invite, invite) || other.invite == invite));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, invite);

  @override
  String toString() {
    return 'InviteEnvelope(invite: $invite)';
  }
}

/// @nodoc
abstract mixin class $InviteEnvelopeCopyWith<$Res> {
  factory $InviteEnvelopeCopyWith(
    InviteEnvelope value,
    $Res Function(InviteEnvelope) _then,
  ) = _$InviteEnvelopeCopyWithImpl;
  @useResult
  $Res call({Invite invite});

  $InviteCopyWith<$Res> get invite;
}

/// @nodoc
class _$InviteEnvelopeCopyWithImpl<$Res>
    implements $InviteEnvelopeCopyWith<$Res> {
  _$InviteEnvelopeCopyWithImpl(this._self, this._then);

  final InviteEnvelope _self;
  final $Res Function(InviteEnvelope) _then;

  /// Create a copy of InviteEnvelope
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? invite = null}) {
    return _then(
      _self.copyWith(
        invite: null == invite
            ? _self.invite
            : invite // ignore: cast_nullable_to_non_nullable
                  as Invite,
      ),
    );
  }

  /// Create a copy of InviteEnvelope
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InviteCopyWith<$Res> get invite {
    return $InviteCopyWith<$Res>(_self.invite, (value) {
      return _then(_self.copyWith(invite: value));
    });
  }
}

/// Adds pattern-matching-related methods to [InviteEnvelope].
extension InviteEnvelopePatterns on InviteEnvelope {
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
    TResult Function(_InviteEnvelope value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InviteEnvelope() when $default != null:
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
    TResult Function(_InviteEnvelope value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InviteEnvelope():
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
    TResult? Function(_InviteEnvelope value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InviteEnvelope() when $default != null:
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
    TResult Function(Invite invite)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InviteEnvelope() when $default != null:
        return $default(_that.invite);
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
    TResult Function(Invite invite) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InviteEnvelope():
        return $default(_that.invite);
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
    TResult? Function(Invite invite)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InviteEnvelope() when $default != null:
        return $default(_that.invite);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _InviteEnvelope implements InviteEnvelope {
  const _InviteEnvelope({required this.invite});
  factory _InviteEnvelope.fromJson(Map<String, dynamic> json) =>
      _$InviteEnvelopeFromJson(json);

  @override
  final Invite invite;

  /// Create a copy of InviteEnvelope
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InviteEnvelopeCopyWith<_InviteEnvelope> get copyWith =>
      __$InviteEnvelopeCopyWithImpl<_InviteEnvelope>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InviteEnvelopeToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InviteEnvelope &&
            (identical(other.invite, invite) || other.invite == invite));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, invite);

  @override
  String toString() {
    return 'InviteEnvelope(invite: $invite)';
  }
}

/// @nodoc
abstract mixin class _$InviteEnvelopeCopyWith<$Res>
    implements $InviteEnvelopeCopyWith<$Res> {
  factory _$InviteEnvelopeCopyWith(
    _InviteEnvelope value,
    $Res Function(_InviteEnvelope) _then,
  ) = __$InviteEnvelopeCopyWithImpl;
  @override
  @useResult
  $Res call({Invite invite});

  @override
  $InviteCopyWith<$Res> get invite;
}

/// @nodoc
class __$InviteEnvelopeCopyWithImpl<$Res>
    implements _$InviteEnvelopeCopyWith<$Res> {
  __$InviteEnvelopeCopyWithImpl(this._self, this._then);

  final _InviteEnvelope _self;
  final $Res Function(_InviteEnvelope) _then;

  /// Create a copy of InviteEnvelope
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? invite = null}) {
    return _then(
      _InviteEnvelope(
        invite: null == invite
            ? _self.invite
            : invite // ignore: cast_nullable_to_non_nullable
                  as Invite,
      ),
    );
  }

  /// Create a copy of InviteEnvelope
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InviteCopyWith<$Res> get invite {
    return $InviteCopyWith<$Res>(_self.invite, (value) {
      return _then(_self.copyWith(invite: value));
    });
  }
}
