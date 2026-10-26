// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Invite {
  String get id;
  String get code;
  InviteRoleKind get roleKind;
  @JsonKey(unknownEnumValue: InviteStatus.pending)
  InviteStatus get status;
  String get organizationId;
  String? get organizationName;
  String? get roundTableId;
  String? get roundTableName;
  String? get roundTableCode;
  InvitePerson get person;
  String? get invitedByPersonId;
  String? get invitedByName;
  DateTime get expiresAt;
  DateTime? get acceptedAt;
  DateTime? get revokedAt;
  DateTime? get createdAt;
  String? get inviteUrl;

  /// Create a copy of Invite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InviteCopyWith<Invite> get copyWith =>
      _$InviteCopyWithImpl<Invite>(this as Invite, _$identity);

  /// Serializes this Invite to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Invite &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.roleKind, roleKind) ||
                other.roleKind == roleKind) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.organizationName, organizationName) ||
                other.organizationName == organizationName) &&
            (identical(other.roundTableId, roundTableId) ||
                other.roundTableId == roundTableId) &&
            (identical(other.roundTableName, roundTableName) ||
                other.roundTableName == roundTableName) &&
            (identical(other.roundTableCode, roundTableCode) ||
                other.roundTableCode == roundTableCode) &&
            (identical(other.person, person) || other.person == person) &&
            (identical(other.invitedByPersonId, invitedByPersonId) ||
                other.invitedByPersonId == invitedByPersonId) &&
            (identical(other.invitedByName, invitedByName) ||
                other.invitedByName == invitedByName) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.acceptedAt, acceptedAt) ||
                other.acceptedAt == acceptedAt) &&
            (identical(other.revokedAt, revokedAt) ||
                other.revokedAt == revokedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.inviteUrl, inviteUrl) ||
                other.inviteUrl == inviteUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    code,
    roleKind,
    status,
    organizationId,
    organizationName,
    roundTableId,
    roundTableName,
    roundTableCode,
    person,
    invitedByPersonId,
    invitedByName,
    expiresAt,
    acceptedAt,
    revokedAt,
    createdAt,
    inviteUrl,
  );

  @override
  String toString() {
    return 'Invite(id: $id, code: $code, roleKind: $roleKind, status: $status, organizationId: $organizationId, organizationName: $organizationName, roundTableId: $roundTableId, roundTableName: $roundTableName, roundTableCode: $roundTableCode, person: $person, invitedByPersonId: $invitedByPersonId, invitedByName: $invitedByName, expiresAt: $expiresAt, acceptedAt: $acceptedAt, revokedAt: $revokedAt, createdAt: $createdAt, inviteUrl: $inviteUrl)';
  }
}

/// @nodoc
abstract mixin class $InviteCopyWith<$Res> {
  factory $InviteCopyWith(Invite value, $Res Function(Invite) _then) =
      _$InviteCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String code,
    InviteRoleKind roleKind,
    @JsonKey(unknownEnumValue: InviteStatus.pending) InviteStatus status,
    String organizationId,
    String? organizationName,
    String? roundTableId,
    String? roundTableName,
    String? roundTableCode,
    InvitePerson person,
    String? invitedByPersonId,
    String? invitedByName,
    DateTime expiresAt,
    DateTime? acceptedAt,
    DateTime? revokedAt,
    DateTime? createdAt,
    String? inviteUrl,
  });

  $InvitePersonCopyWith<$Res> get person;
}

/// @nodoc
class _$InviteCopyWithImpl<$Res> implements $InviteCopyWith<$Res> {
  _$InviteCopyWithImpl(this._self, this._then);

  final Invite _self;
  final $Res Function(Invite) _then;

  /// Create a copy of Invite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? roleKind = null,
    Object? status = null,
    Object? organizationId = null,
    Object? organizationName = freezed,
    Object? roundTableId = freezed,
    Object? roundTableName = freezed,
    Object? roundTableCode = freezed,
    Object? person = null,
    Object? invitedByPersonId = freezed,
    Object? invitedByName = freezed,
    Object? expiresAt = null,
    Object? acceptedAt = freezed,
    Object? revokedAt = freezed,
    Object? createdAt = freezed,
    Object? inviteUrl = freezed,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        code: null == code
            ? _self.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        roleKind: null == roleKind
            ? _self.roleKind
            : roleKind // ignore: cast_nullable_to_non_nullable
                  as InviteRoleKind,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as InviteStatus,
        organizationId: null == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String,
        organizationName: freezed == organizationName
            ? _self.organizationName
            : organizationName // ignore: cast_nullable_to_non_nullable
                  as String?,
        roundTableId: freezed == roundTableId
            ? _self.roundTableId
            : roundTableId // ignore: cast_nullable_to_non_nullable
                  as String?,
        roundTableName: freezed == roundTableName
            ? _self.roundTableName
            : roundTableName // ignore: cast_nullable_to_non_nullable
                  as String?,
        roundTableCode: freezed == roundTableCode
            ? _self.roundTableCode
            : roundTableCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        person: null == person
            ? _self.person
            : person // ignore: cast_nullable_to_non_nullable
                  as InvitePerson,
        invitedByPersonId: freezed == invitedByPersonId
            ? _self.invitedByPersonId
            : invitedByPersonId // ignore: cast_nullable_to_non_nullable
                  as String?,
        invitedByName: freezed == invitedByName
            ? _self.invitedByName
            : invitedByName // ignore: cast_nullable_to_non_nullable
                  as String?,
        expiresAt: null == expiresAt
            ? _self.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        acceptedAt: freezed == acceptedAt
            ? _self.acceptedAt
            : acceptedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        revokedAt: freezed == revokedAt
            ? _self.revokedAt
            : revokedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        createdAt: freezed == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        inviteUrl: freezed == inviteUrl
            ? _self.inviteUrl
            : inviteUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }

  /// Create a copy of Invite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvitePersonCopyWith<$Res> get person {
    return $InvitePersonCopyWith<$Res>(_self.person, (value) {
      return _then(_self.copyWith(person: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Invite].
extension InvitePatterns on Invite {
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
    TResult Function(_Invite value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Invite() when $default != null:
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
    TResult Function(_Invite value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Invite():
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
    TResult? Function(_Invite value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Invite() when $default != null:
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
      String id,
      String code,
      InviteRoleKind roleKind,
      @JsonKey(unknownEnumValue: InviteStatus.pending) InviteStatus status,
      String organizationId,
      String? organizationName,
      String? roundTableId,
      String? roundTableName,
      String? roundTableCode,
      InvitePerson person,
      String? invitedByPersonId,
      String? invitedByName,
      DateTime expiresAt,
      DateTime? acceptedAt,
      DateTime? revokedAt,
      DateTime? createdAt,
      String? inviteUrl,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Invite() when $default != null:
        return $default(
          _that.id,
          _that.code,
          _that.roleKind,
          _that.status,
          _that.organizationId,
          _that.organizationName,
          _that.roundTableId,
          _that.roundTableName,
          _that.roundTableCode,
          _that.person,
          _that.invitedByPersonId,
          _that.invitedByName,
          _that.expiresAt,
          _that.acceptedAt,
          _that.revokedAt,
          _that.createdAt,
          _that.inviteUrl,
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
      String id,
      String code,
      InviteRoleKind roleKind,
      @JsonKey(unknownEnumValue: InviteStatus.pending) InviteStatus status,
      String organizationId,
      String? organizationName,
      String? roundTableId,
      String? roundTableName,
      String? roundTableCode,
      InvitePerson person,
      String? invitedByPersonId,
      String? invitedByName,
      DateTime expiresAt,
      DateTime? acceptedAt,
      DateTime? revokedAt,
      DateTime? createdAt,
      String? inviteUrl,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Invite():
        return $default(
          _that.id,
          _that.code,
          _that.roleKind,
          _that.status,
          _that.organizationId,
          _that.organizationName,
          _that.roundTableId,
          _that.roundTableName,
          _that.roundTableCode,
          _that.person,
          _that.invitedByPersonId,
          _that.invitedByName,
          _that.expiresAt,
          _that.acceptedAt,
          _that.revokedAt,
          _that.createdAt,
          _that.inviteUrl,
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
      String id,
      String code,
      InviteRoleKind roleKind,
      @JsonKey(unknownEnumValue: InviteStatus.pending) InviteStatus status,
      String organizationId,
      String? organizationName,
      String? roundTableId,
      String? roundTableName,
      String? roundTableCode,
      InvitePerson person,
      String? invitedByPersonId,
      String? invitedByName,
      DateTime expiresAt,
      DateTime? acceptedAt,
      DateTime? revokedAt,
      DateTime? createdAt,
      String? inviteUrl,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Invite() when $default != null:
        return $default(
          _that.id,
          _that.code,
          _that.roleKind,
          _that.status,
          _that.organizationId,
          _that.organizationName,
          _that.roundTableId,
          _that.roundTableName,
          _that.roundTableCode,
          _that.person,
          _that.invitedByPersonId,
          _that.invitedByName,
          _that.expiresAt,
          _that.acceptedAt,
          _that.revokedAt,
          _that.createdAt,
          _that.inviteUrl,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Invite extends Invite {
  const _Invite({
    required this.id,
    required this.code,
    required this.roleKind,
    @JsonKey(unknownEnumValue: InviteStatus.pending) required this.status,
    required this.organizationId,
    this.organizationName,
    this.roundTableId,
    this.roundTableName,
    this.roundTableCode,
    required this.person,
    this.invitedByPersonId,
    this.invitedByName,
    required this.expiresAt,
    this.acceptedAt,
    this.revokedAt,
    this.createdAt,
    this.inviteUrl,
  }) : super._();
  factory _Invite.fromJson(Map<String, dynamic> json) => _$InviteFromJson(json);

  @override
  final String id;
  @override
  final String code;
  @override
  final InviteRoleKind roleKind;
  @override
  @JsonKey(unknownEnumValue: InviteStatus.pending)
  final InviteStatus status;
  @override
  final String organizationId;
  @override
  final String? organizationName;
  @override
  final String? roundTableId;
  @override
  final String? roundTableName;
  @override
  final String? roundTableCode;
  @override
  final InvitePerson person;
  @override
  final String? invitedByPersonId;
  @override
  final String? invitedByName;
  @override
  final DateTime expiresAt;
  @override
  final DateTime? acceptedAt;
  @override
  final DateTime? revokedAt;
  @override
  final DateTime? createdAt;
  @override
  final String? inviteUrl;

  /// Create a copy of Invite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InviteCopyWith<_Invite> get copyWith =>
      __$InviteCopyWithImpl<_Invite>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InviteToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Invite &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.roleKind, roleKind) ||
                other.roleKind == roleKind) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.organizationName, organizationName) ||
                other.organizationName == organizationName) &&
            (identical(other.roundTableId, roundTableId) ||
                other.roundTableId == roundTableId) &&
            (identical(other.roundTableName, roundTableName) ||
                other.roundTableName == roundTableName) &&
            (identical(other.roundTableCode, roundTableCode) ||
                other.roundTableCode == roundTableCode) &&
            (identical(other.person, person) || other.person == person) &&
            (identical(other.invitedByPersonId, invitedByPersonId) ||
                other.invitedByPersonId == invitedByPersonId) &&
            (identical(other.invitedByName, invitedByName) ||
                other.invitedByName == invitedByName) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.acceptedAt, acceptedAt) ||
                other.acceptedAt == acceptedAt) &&
            (identical(other.revokedAt, revokedAt) ||
                other.revokedAt == revokedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.inviteUrl, inviteUrl) ||
                other.inviteUrl == inviteUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    code,
    roleKind,
    status,
    organizationId,
    organizationName,
    roundTableId,
    roundTableName,
    roundTableCode,
    person,
    invitedByPersonId,
    invitedByName,
    expiresAt,
    acceptedAt,
    revokedAt,
    createdAt,
    inviteUrl,
  );

  @override
  String toString() {
    return 'Invite(id: $id, code: $code, roleKind: $roleKind, status: $status, organizationId: $organizationId, organizationName: $organizationName, roundTableId: $roundTableId, roundTableName: $roundTableName, roundTableCode: $roundTableCode, person: $person, invitedByPersonId: $invitedByPersonId, invitedByName: $invitedByName, expiresAt: $expiresAt, acceptedAt: $acceptedAt, revokedAt: $revokedAt, createdAt: $createdAt, inviteUrl: $inviteUrl)';
  }
}

/// @nodoc
abstract mixin class _$InviteCopyWith<$Res> implements $InviteCopyWith<$Res> {
  factory _$InviteCopyWith(_Invite value, $Res Function(_Invite) _then) =
      __$InviteCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String code,
    InviteRoleKind roleKind,
    @JsonKey(unknownEnumValue: InviteStatus.pending) InviteStatus status,
    String organizationId,
    String? organizationName,
    String? roundTableId,
    String? roundTableName,
    String? roundTableCode,
    InvitePerson person,
    String? invitedByPersonId,
    String? invitedByName,
    DateTime expiresAt,
    DateTime? acceptedAt,
    DateTime? revokedAt,
    DateTime? createdAt,
    String? inviteUrl,
  });

  @override
  $InvitePersonCopyWith<$Res> get person;
}

/// @nodoc
class __$InviteCopyWithImpl<$Res> implements _$InviteCopyWith<$Res> {
  __$InviteCopyWithImpl(this._self, this._then);

  final _Invite _self;
  final $Res Function(_Invite) _then;

  /// Create a copy of Invite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? roleKind = null,
    Object? status = null,
    Object? organizationId = null,
    Object? organizationName = freezed,
    Object? roundTableId = freezed,
    Object? roundTableName = freezed,
    Object? roundTableCode = freezed,
    Object? person = null,
    Object? invitedByPersonId = freezed,
    Object? invitedByName = freezed,
    Object? expiresAt = null,
    Object? acceptedAt = freezed,
    Object? revokedAt = freezed,
    Object? createdAt = freezed,
    Object? inviteUrl = freezed,
  }) {
    return _then(
      _Invite(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        code: null == code
            ? _self.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        roleKind: null == roleKind
            ? _self.roleKind
            : roleKind // ignore: cast_nullable_to_non_nullable
                  as InviteRoleKind,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as InviteStatus,
        organizationId: null == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String,
        organizationName: freezed == organizationName
            ? _self.organizationName
            : organizationName // ignore: cast_nullable_to_non_nullable
                  as String?,
        roundTableId: freezed == roundTableId
            ? _self.roundTableId
            : roundTableId // ignore: cast_nullable_to_non_nullable
                  as String?,
        roundTableName: freezed == roundTableName
            ? _self.roundTableName
            : roundTableName // ignore: cast_nullable_to_non_nullable
                  as String?,
        roundTableCode: freezed == roundTableCode
            ? _self.roundTableCode
            : roundTableCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        person: null == person
            ? _self.person
            : person // ignore: cast_nullable_to_non_nullable
                  as InvitePerson,
        invitedByPersonId: freezed == invitedByPersonId
            ? _self.invitedByPersonId
            : invitedByPersonId // ignore: cast_nullable_to_non_nullable
                  as String?,
        invitedByName: freezed == invitedByName
            ? _self.invitedByName
            : invitedByName // ignore: cast_nullable_to_non_nullable
                  as String?,
        expiresAt: null == expiresAt
            ? _self.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        acceptedAt: freezed == acceptedAt
            ? _self.acceptedAt
            : acceptedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        revokedAt: freezed == revokedAt
            ? _self.revokedAt
            : revokedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        createdAt: freezed == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        inviteUrl: freezed == inviteUrl
            ? _self.inviteUrl
            : inviteUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }

  /// Create a copy of Invite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvitePersonCopyWith<$Res> get person {
    return $InvitePersonCopyWith<$Res>(_self.person, (value) {
      return _then(_self.copyWith(person: value));
    });
  }
}
