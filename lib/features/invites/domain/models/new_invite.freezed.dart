// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_invite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewInvite {
  InviteRoleKind get roleKind;

  /// Coordinator invites.
  String? get organizationId;

  /// Facilitator and member invites.
  String? get roundTableId;
  PersonDraft get person;
  int? get expiresInDays;

  /// Create a copy of NewInvite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NewInviteCopyWith<NewInvite> get copyWith =>
      _$NewInviteCopyWithImpl<NewInvite>(this as NewInvite, _$identity);

  /// Serializes this NewInvite to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NewInvite &&
            (identical(other.roleKind, roleKind) ||
                other.roleKind == roleKind) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.roundTableId, roundTableId) ||
                other.roundTableId == roundTableId) &&
            (identical(other.person, person) || other.person == person) &&
            (identical(other.expiresInDays, expiresInDays) ||
                other.expiresInDays == expiresInDays));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    roleKind,
    organizationId,
    roundTableId,
    person,
    expiresInDays,
  );

  @override
  String toString() {
    return 'NewInvite(roleKind: $roleKind, organizationId: $organizationId, roundTableId: $roundTableId, person: $person, expiresInDays: $expiresInDays)';
  }
}

/// @nodoc
abstract mixin class $NewInviteCopyWith<$Res> {
  factory $NewInviteCopyWith(NewInvite value, $Res Function(NewInvite) _then) =
      _$NewInviteCopyWithImpl;
  @useResult
  $Res call({
    InviteRoleKind roleKind,
    String? organizationId,
    String? roundTableId,
    PersonDraft person,
    int? expiresInDays,
  });

  $PersonDraftCopyWith<$Res> get person;
}

/// @nodoc
class _$NewInviteCopyWithImpl<$Res> implements $NewInviteCopyWith<$Res> {
  _$NewInviteCopyWithImpl(this._self, this._then);

  final NewInvite _self;
  final $Res Function(NewInvite) _then;

  /// Create a copy of NewInvite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roleKind = null,
    Object? organizationId = freezed,
    Object? roundTableId = freezed,
    Object? person = null,
    Object? expiresInDays = freezed,
  }) {
    return _then(
      _self.copyWith(
        roleKind: null == roleKind
            ? _self.roleKind
            : roleKind // ignore: cast_nullable_to_non_nullable
                  as InviteRoleKind,
        organizationId: freezed == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        roundTableId: freezed == roundTableId
            ? _self.roundTableId
            : roundTableId // ignore: cast_nullable_to_non_nullable
                  as String?,
        person: null == person
            ? _self.person
            : person // ignore: cast_nullable_to_non_nullable
                  as PersonDraft,
        expiresInDays: freezed == expiresInDays
            ? _self.expiresInDays
            : expiresInDays // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }

  /// Create a copy of NewInvite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PersonDraftCopyWith<$Res> get person {
    return $PersonDraftCopyWith<$Res>(_self.person, (value) {
      return _then(_self.copyWith(person: value));
    });
  }
}

/// Adds pattern-matching-related methods to [NewInvite].
extension NewInvitePatterns on NewInvite {
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
    TResult Function(_NewInvite value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NewInvite() when $default != null:
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
    TResult Function(_NewInvite value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewInvite():
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
    TResult? Function(_NewInvite value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewInvite() when $default != null:
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
      InviteRoleKind roleKind,
      String? organizationId,
      String? roundTableId,
      PersonDraft person,
      int? expiresInDays,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NewInvite() when $default != null:
        return $default(
          _that.roleKind,
          _that.organizationId,
          _that.roundTableId,
          _that.person,
          _that.expiresInDays,
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
      InviteRoleKind roleKind,
      String? organizationId,
      String? roundTableId,
      PersonDraft person,
      int? expiresInDays,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewInvite():
        return $default(
          _that.roleKind,
          _that.organizationId,
          _that.roundTableId,
          _that.person,
          _that.expiresInDays,
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
      InviteRoleKind roleKind,
      String? organizationId,
      String? roundTableId,
      PersonDraft person,
      int? expiresInDays,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewInvite() when $default != null:
        return $default(
          _that.roleKind,
          _that.organizationId,
          _that.roundTableId,
          _that.person,
          _that.expiresInDays,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _NewInvite implements NewInvite {
  const _NewInvite({
    required this.roleKind,
    this.organizationId,
    this.roundTableId,
    required this.person,
    this.expiresInDays,
  });
  factory _NewInvite.fromJson(Map<String, dynamic> json) =>
      _$NewInviteFromJson(json);

  @override
  final InviteRoleKind roleKind;

  /// Coordinator invites.
  @override
  final String? organizationId;

  /// Facilitator and member invites.
  @override
  final String? roundTableId;
  @override
  final PersonDraft person;
  @override
  final int? expiresInDays;

  /// Create a copy of NewInvite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NewInviteCopyWith<_NewInvite> get copyWith =>
      __$NewInviteCopyWithImpl<_NewInvite>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NewInviteToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NewInvite &&
            (identical(other.roleKind, roleKind) ||
                other.roleKind == roleKind) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.roundTableId, roundTableId) ||
                other.roundTableId == roundTableId) &&
            (identical(other.person, person) || other.person == person) &&
            (identical(other.expiresInDays, expiresInDays) ||
                other.expiresInDays == expiresInDays));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    roleKind,
    organizationId,
    roundTableId,
    person,
    expiresInDays,
  );

  @override
  String toString() {
    return 'NewInvite(roleKind: $roleKind, organizationId: $organizationId, roundTableId: $roundTableId, person: $person, expiresInDays: $expiresInDays)';
  }
}

/// @nodoc
abstract mixin class _$NewInviteCopyWith<$Res>
    implements $NewInviteCopyWith<$Res> {
  factory _$NewInviteCopyWith(
    _NewInvite value,
    $Res Function(_NewInvite) _then,
  ) = __$NewInviteCopyWithImpl;
  @override
  @useResult
  $Res call({
    InviteRoleKind roleKind,
    String? organizationId,
    String? roundTableId,
    PersonDraft person,
    int? expiresInDays,
  });

  @override
  $PersonDraftCopyWith<$Res> get person;
}

/// @nodoc
class __$NewInviteCopyWithImpl<$Res> implements _$NewInviteCopyWith<$Res> {
  __$NewInviteCopyWithImpl(this._self, this._then);

  final _NewInvite _self;
  final $Res Function(_NewInvite) _then;

  /// Create a copy of NewInvite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? roleKind = null,
    Object? organizationId = freezed,
    Object? roundTableId = freezed,
    Object? person = null,
    Object? expiresInDays = freezed,
  }) {
    return _then(
      _NewInvite(
        roleKind: null == roleKind
            ? _self.roleKind
            : roleKind // ignore: cast_nullable_to_non_nullable
                  as InviteRoleKind,
        organizationId: freezed == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        roundTableId: freezed == roundTableId
            ? _self.roundTableId
            : roundTableId // ignore: cast_nullable_to_non_nullable
                  as String?,
        person: null == person
            ? _self.person
            : person // ignore: cast_nullable_to_non_nullable
                  as PersonDraft,
        expiresInDays: freezed == expiresInDays
            ? _self.expiresInDays
            : expiresInDays // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }

  /// Create a copy of NewInvite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PersonDraftCopyWith<$Res> get person {
    return $PersonDraftCopyWith<$Res>(_self.person, (value) {
      return _then(_self.copyWith(person: value));
    });
  }
}
