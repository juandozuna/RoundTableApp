// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_membership.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TableMembership {
  String get id;
  String get personId;
  @JsonKey(unknownEnumValue: MembershipRole.member)
  MembershipRole get role;
  DateTime? get joinedAt;
  DateTime? get leftAt;
  String? get leftReason;
  String? get movedToRoundTableId;
  @JsonKey(unknownEnumValue: RecordStatus.inactive)
  RecordStatus get status;
  String get firstName;
  String get lastName;

  /// Create a copy of TableMembership
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TableMembershipCopyWith<TableMembership> get copyWith =>
      _$TableMembershipCopyWithImpl<TableMembership>(
        this as TableMembership,
        _$identity,
      );

  /// Serializes this TableMembership to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TableMembership &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.personId, personId) ||
                other.personId == personId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.joinedAt, joinedAt) ||
                other.joinedAt == joinedAt) &&
            (identical(other.leftAt, leftAt) || other.leftAt == leftAt) &&
            (identical(other.leftReason, leftReason) ||
                other.leftReason == leftReason) &&
            (identical(other.movedToRoundTableId, movedToRoundTableId) ||
                other.movedToRoundTableId == movedToRoundTableId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    personId,
    role,
    joinedAt,
    leftAt,
    leftReason,
    movedToRoundTableId,
    status,
    firstName,
    lastName,
  );

  @override
  String toString() {
    return 'TableMembership(id: $id, personId: $personId, role: $role, joinedAt: $joinedAt, leftAt: $leftAt, leftReason: $leftReason, movedToRoundTableId: $movedToRoundTableId, status: $status, firstName: $firstName, lastName: $lastName)';
  }
}

/// @nodoc
abstract mixin class $TableMembershipCopyWith<$Res> {
  factory $TableMembershipCopyWith(
    TableMembership value,
    $Res Function(TableMembership) _then,
  ) = _$TableMembershipCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String personId,
    @JsonKey(unknownEnumValue: MembershipRole.member) MembershipRole role,
    DateTime? joinedAt,
    DateTime? leftAt,
    String? leftReason,
    String? movedToRoundTableId,
    @JsonKey(unknownEnumValue: RecordStatus.inactive) RecordStatus status,
    String firstName,
    String lastName,
  });
}

/// @nodoc
class _$TableMembershipCopyWithImpl<$Res>
    implements $TableMembershipCopyWith<$Res> {
  _$TableMembershipCopyWithImpl(this._self, this._then);

  final TableMembership _self;
  final $Res Function(TableMembership) _then;

  /// Create a copy of TableMembership
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? personId = null,
    Object? role = null,
    Object? joinedAt = freezed,
    Object? leftAt = freezed,
    Object? leftReason = freezed,
    Object? movedToRoundTableId = freezed,
    Object? status = null,
    Object? firstName = null,
    Object? lastName = null,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        personId: null == personId
            ? _self.personId
            : personId // ignore: cast_nullable_to_non_nullable
                  as String,
        role: null == role
            ? _self.role
            : role // ignore: cast_nullable_to_non_nullable
                  as MembershipRole,
        joinedAt: freezed == joinedAt
            ? _self.joinedAt
            : joinedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        leftAt: freezed == leftAt
            ? _self.leftAt
            : leftAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        leftReason: freezed == leftReason
            ? _self.leftReason
            : leftReason // ignore: cast_nullable_to_non_nullable
                  as String?,
        movedToRoundTableId: freezed == movedToRoundTableId
            ? _self.movedToRoundTableId
            : movedToRoundTableId // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as RecordStatus,
        firstName: null == firstName
            ? _self.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
        lastName: null == lastName
            ? _self.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [TableMembership].
extension TableMembershipPatterns on TableMembership {
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
    TResult Function(_TableMembership value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TableMembership() when $default != null:
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
    TResult Function(_TableMembership value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableMembership():
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
    TResult? Function(_TableMembership value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableMembership() when $default != null:
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
      String personId,
      @JsonKey(unknownEnumValue: MembershipRole.member) MembershipRole role,
      DateTime? joinedAt,
      DateTime? leftAt,
      String? leftReason,
      String? movedToRoundTableId,
      @JsonKey(unknownEnumValue: RecordStatus.inactive) RecordStatus status,
      String firstName,
      String lastName,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TableMembership() when $default != null:
        return $default(
          _that.id,
          _that.personId,
          _that.role,
          _that.joinedAt,
          _that.leftAt,
          _that.leftReason,
          _that.movedToRoundTableId,
          _that.status,
          _that.firstName,
          _that.lastName,
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
      String personId,
      @JsonKey(unknownEnumValue: MembershipRole.member) MembershipRole role,
      DateTime? joinedAt,
      DateTime? leftAt,
      String? leftReason,
      String? movedToRoundTableId,
      @JsonKey(unknownEnumValue: RecordStatus.inactive) RecordStatus status,
      String firstName,
      String lastName,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableMembership():
        return $default(
          _that.id,
          _that.personId,
          _that.role,
          _that.joinedAt,
          _that.leftAt,
          _that.leftReason,
          _that.movedToRoundTableId,
          _that.status,
          _that.firstName,
          _that.lastName,
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
      String personId,
      @JsonKey(unknownEnumValue: MembershipRole.member) MembershipRole role,
      DateTime? joinedAt,
      DateTime? leftAt,
      String? leftReason,
      String? movedToRoundTableId,
      @JsonKey(unknownEnumValue: RecordStatus.inactive) RecordStatus status,
      String firstName,
      String lastName,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableMembership() when $default != null:
        return $default(
          _that.id,
          _that.personId,
          _that.role,
          _that.joinedAt,
          _that.leftAt,
          _that.leftReason,
          _that.movedToRoundTableId,
          _that.status,
          _that.firstName,
          _that.lastName,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TableMembership extends TableMembership {
  const _TableMembership({
    required this.id,
    required this.personId,
    @JsonKey(unknownEnumValue: MembershipRole.member)
    this.role = MembershipRole.member,
    this.joinedAt,
    this.leftAt,
    this.leftReason,
    this.movedToRoundTableId,
    @JsonKey(unknownEnumValue: RecordStatus.inactive)
    this.status = RecordStatus.active,
    this.firstName = '',
    this.lastName = '',
  }) : super._();
  factory _TableMembership.fromJson(Map<String, dynamic> json) =>
      _$TableMembershipFromJson(json);

  @override
  final String id;
  @override
  final String personId;
  @override
  @JsonKey(unknownEnumValue: MembershipRole.member)
  final MembershipRole role;
  @override
  final DateTime? joinedAt;
  @override
  final DateTime? leftAt;
  @override
  final String? leftReason;
  @override
  final String? movedToRoundTableId;
  @override
  @JsonKey(unknownEnumValue: RecordStatus.inactive)
  final RecordStatus status;
  @override
  @JsonKey()
  final String firstName;
  @override
  @JsonKey()
  final String lastName;

  /// Create a copy of TableMembership
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TableMembershipCopyWith<_TableMembership> get copyWith =>
      __$TableMembershipCopyWithImpl<_TableMembership>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TableMembershipToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TableMembership &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.personId, personId) ||
                other.personId == personId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.joinedAt, joinedAt) ||
                other.joinedAt == joinedAt) &&
            (identical(other.leftAt, leftAt) || other.leftAt == leftAt) &&
            (identical(other.leftReason, leftReason) ||
                other.leftReason == leftReason) &&
            (identical(other.movedToRoundTableId, movedToRoundTableId) ||
                other.movedToRoundTableId == movedToRoundTableId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    personId,
    role,
    joinedAt,
    leftAt,
    leftReason,
    movedToRoundTableId,
    status,
    firstName,
    lastName,
  );

  @override
  String toString() {
    return 'TableMembership(id: $id, personId: $personId, role: $role, joinedAt: $joinedAt, leftAt: $leftAt, leftReason: $leftReason, movedToRoundTableId: $movedToRoundTableId, status: $status, firstName: $firstName, lastName: $lastName)';
  }
}

/// @nodoc
abstract mixin class _$TableMembershipCopyWith<$Res>
    implements $TableMembershipCopyWith<$Res> {
  factory _$TableMembershipCopyWith(
    _TableMembership value,
    $Res Function(_TableMembership) _then,
  ) = __$TableMembershipCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String personId,
    @JsonKey(unknownEnumValue: MembershipRole.member) MembershipRole role,
    DateTime? joinedAt,
    DateTime? leftAt,
    String? leftReason,
    String? movedToRoundTableId,
    @JsonKey(unknownEnumValue: RecordStatus.inactive) RecordStatus status,
    String firstName,
    String lastName,
  });
}

/// @nodoc
class __$TableMembershipCopyWithImpl<$Res>
    implements _$TableMembershipCopyWith<$Res> {
  __$TableMembershipCopyWithImpl(this._self, this._then);

  final _TableMembership _self;
  final $Res Function(_TableMembership) _then;

  /// Create a copy of TableMembership
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? personId = null,
    Object? role = null,
    Object? joinedAt = freezed,
    Object? leftAt = freezed,
    Object? leftReason = freezed,
    Object? movedToRoundTableId = freezed,
    Object? status = null,
    Object? firstName = null,
    Object? lastName = null,
  }) {
    return _then(
      _TableMembership(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        personId: null == personId
            ? _self.personId
            : personId // ignore: cast_nullable_to_non_nullable
                  as String,
        role: null == role
            ? _self.role
            : role // ignore: cast_nullable_to_non_nullable
                  as MembershipRole,
        joinedAt: freezed == joinedAt
            ? _self.joinedAt
            : joinedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        leftAt: freezed == leftAt
            ? _self.leftAt
            : leftAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        leftReason: freezed == leftReason
            ? _self.leftReason
            : leftReason // ignore: cast_nullable_to_non_nullable
                  as String?,
        movedToRoundTableId: freezed == movedToRoundTableId
            ? _self.movedToRoundTableId
            : movedToRoundTableId // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as RecordStatus,
        firstName: null == firstName
            ? _self.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
        lastName: null == lastName
            ? _self.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}
