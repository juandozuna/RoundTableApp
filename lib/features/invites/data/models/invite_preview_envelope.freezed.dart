// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invite_preview_envelope.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InvitePreviewEnvelope {
  InvitePreview get invite;

  /// Create a copy of InvitePreviewEnvelope
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InvitePreviewEnvelopeCopyWith<InvitePreviewEnvelope> get copyWith =>
      _$InvitePreviewEnvelopeCopyWithImpl<InvitePreviewEnvelope>(
        this as InvitePreviewEnvelope,
        _$identity,
      );

  /// Serializes this InvitePreviewEnvelope to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvitePreviewEnvelope &&
            (identical(other.invite, invite) || other.invite == invite));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, invite);

  @override
  String toString() {
    return 'InvitePreviewEnvelope(invite: $invite)';
  }
}

/// @nodoc
abstract mixin class $InvitePreviewEnvelopeCopyWith<$Res> {
  factory $InvitePreviewEnvelopeCopyWith(
    InvitePreviewEnvelope value,
    $Res Function(InvitePreviewEnvelope) _then,
  ) = _$InvitePreviewEnvelopeCopyWithImpl;
  @useResult
  $Res call({InvitePreview invite});

  $InvitePreviewCopyWith<$Res> get invite;
}

/// @nodoc
class _$InvitePreviewEnvelopeCopyWithImpl<$Res>
    implements $InvitePreviewEnvelopeCopyWith<$Res> {
  _$InvitePreviewEnvelopeCopyWithImpl(this._self, this._then);

  final InvitePreviewEnvelope _self;
  final $Res Function(InvitePreviewEnvelope) _then;

  /// Create a copy of InvitePreviewEnvelope
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? invite = null}) {
    return _then(
      _self.copyWith(
        invite: null == invite
            ? _self.invite
            : invite // ignore: cast_nullable_to_non_nullable
                  as InvitePreview,
      ),
    );
  }

  /// Create a copy of InvitePreviewEnvelope
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvitePreviewCopyWith<$Res> get invite {
    return $InvitePreviewCopyWith<$Res>(_self.invite, (value) {
      return _then(_self.copyWith(invite: value));
    });
  }
}

/// Adds pattern-matching-related methods to [InvitePreviewEnvelope].
extension InvitePreviewEnvelopePatterns on InvitePreviewEnvelope {
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
    TResult Function(_InvitePreviewEnvelope value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvitePreviewEnvelope() when $default != null:
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
    TResult Function(_InvitePreviewEnvelope value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvitePreviewEnvelope():
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
    TResult? Function(_InvitePreviewEnvelope value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvitePreviewEnvelope() when $default != null:
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
    TResult Function(InvitePreview invite)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvitePreviewEnvelope() when $default != null:
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
    TResult Function(InvitePreview invite) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvitePreviewEnvelope():
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
    TResult? Function(InvitePreview invite)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvitePreviewEnvelope() when $default != null:
        return $default(_that.invite);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _InvitePreviewEnvelope implements InvitePreviewEnvelope {
  const _InvitePreviewEnvelope({required this.invite});
  factory _InvitePreviewEnvelope.fromJson(Map<String, dynamic> json) =>
      _$InvitePreviewEnvelopeFromJson(json);

  @override
  final InvitePreview invite;

  /// Create a copy of InvitePreviewEnvelope
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InvitePreviewEnvelopeCopyWith<_InvitePreviewEnvelope> get copyWith =>
      __$InvitePreviewEnvelopeCopyWithImpl<_InvitePreviewEnvelope>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$InvitePreviewEnvelopeToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InvitePreviewEnvelope &&
            (identical(other.invite, invite) || other.invite == invite));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, invite);

  @override
  String toString() {
    return 'InvitePreviewEnvelope(invite: $invite)';
  }
}

/// @nodoc
abstract mixin class _$InvitePreviewEnvelopeCopyWith<$Res>
    implements $InvitePreviewEnvelopeCopyWith<$Res> {
  factory _$InvitePreviewEnvelopeCopyWith(
    _InvitePreviewEnvelope value,
    $Res Function(_InvitePreviewEnvelope) _then,
  ) = __$InvitePreviewEnvelopeCopyWithImpl;
  @override
  @useResult
  $Res call({InvitePreview invite});

  @override
  $InvitePreviewCopyWith<$Res> get invite;
}

/// @nodoc
class __$InvitePreviewEnvelopeCopyWithImpl<$Res>
    implements _$InvitePreviewEnvelopeCopyWith<$Res> {
  __$InvitePreviewEnvelopeCopyWithImpl(this._self, this._then);

  final _InvitePreviewEnvelope _self;
  final $Res Function(_InvitePreviewEnvelope) _then;

  /// Create a copy of InvitePreviewEnvelope
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? invite = null}) {
    return _then(
      _InvitePreviewEnvelope(
        invite: null == invite
            ? _self.invite
            : invite // ignore: cast_nullable_to_non_nullable
                  as InvitePreview,
      ),
    );
  }

  /// Create a copy of InvitePreviewEnvelope
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvitePreviewCopyWith<$Res> get invite {
    return $InvitePreviewCopyWith<$Res>(_self.invite, (value) {
      return _then(_self.copyWith(invite: value));
    });
  }
}
