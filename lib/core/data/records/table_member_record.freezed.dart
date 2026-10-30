// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_member_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TableMemberRecord {
  String get id;
  String get organizationId;
  String get roundTableId;
  String get personId;
  UserRole get role;
  DateTime get joinedAt;
  DateTime? get leftAt;
  String? get leftReason;
  String get status;
  String get firstName;
  String get lastName;

  /// Create a copy of TableMemberRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TableMemberRecordCopyWith<TableMemberRecord> get copyWith =>
      _$TableMemberRecordCopyWithImpl<TableMemberRecord>(
        this as TableMemberRecord,
        _$identity,
      );

  /// Serializes this TableMemberRecord to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TableMemberRecord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.roundTableId, roundTableId) ||
                other.roundTableId == roundTableId) &&
            (identical(other.personId, personId) ||
                other.personId == personId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.joinedAt, joinedAt) ||
                other.joinedAt == joinedAt) &&
            (identical(other.leftAt, leftAt) || other.leftAt == leftAt) &&
            (identical(other.leftReason, leftReason) ||
                other.leftReason == leftReason) &&
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
    organizationId,
    roundTableId,
    personId,
    role,
    joinedAt,
    leftAt,
    leftReason,
    status,
    firstName,
    lastName,
  );

  @override
  String toString() {
    return 'TableMemberRecord(id: $id, organizationId: $organizationId, roundTableId: $roundTableId, personId: $personId, role: $role, joinedAt: $joinedAt, leftAt: $leftAt, leftReason: $leftReason, status: $status, firstName: $firstName, lastName: $lastName)';
  }
}

/// @nodoc
abstract mixin class $TableMemberRecordCopyWith<$Res> {
  factory $TableMemberRecordCopyWith(
    TableMemberRecord value,
    $Res Function(TableMemberRecord) _then,
  ) = _$TableMemberRecordCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String organizationId,
    String roundTableId,
    String personId,
    UserRole role,
    DateTime joinedAt,
    DateTime? leftAt,
    String? leftReason,
    String status,
    String firstName,
    String lastName,
  });
}

/// @nodoc
class _$TableMemberRecordCopyWithImpl<$Res>
    implements $TableMemberRecordCopyWith<$Res> {
  _$TableMemberRecordCopyWithImpl(this._self, this._then);

  final TableMemberRecord _self;
  final $Res Function(TableMemberRecord) _then;

  /// Create a copy of TableMemberRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? organizationId = null,
    Object? roundTableId = null,
    Object? personId = null,
    Object? role = null,
    Object? joinedAt = null,
    Object? leftAt = freezed,
    Object? leftReason = freezed,
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
        organizationId: null == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String,
        roundTableId: null == roundTableId
            ? _self.roundTableId
            : roundTableId // ignore: cast_nullable_to_non_nullable
                  as String,
        personId: null == personId
            ? _self.personId
            : personId // ignore: cast_nullable_to_non_nullable
                  as String,
        role: null == role
            ? _self.role
            : role // ignore: cast_nullable_to_non_nullable
                  as UserRole,
        joinedAt: null == joinedAt
            ? _self.joinedAt
            : joinedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        leftAt: freezed == leftAt
            ? _self.leftAt
            : leftAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        leftReason: freezed == leftReason
            ? _self.leftReason
            : leftReason // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
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

/// Adds pattern-matching-related methods to [TableMemberRecord].
extension TableMemberRecordPatterns on TableMemberRecord {
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
    TResult Function(_TableMemberRecord value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TableMemberRecord() when $default != null:
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
    TResult Function(_TableMemberRecord value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableMemberRecord():
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
    TResult? Function(_TableMemberRecord value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableMemberRecord() when $default != null:
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
      String organizationId,
      String roundTableId,
      String personId,
      UserRole role,
      DateTime joinedAt,
      DateTime? leftAt,
      String? leftReason,
      String status,
      String firstName,
      String lastName,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TableMemberRecord() when $default != null:
        return $default(
          _that.id,
          _that.organizationId,
          _that.roundTableId,
          _that.personId,
          _that.role,
          _that.joinedAt,
          _that.leftAt,
          _that.leftReason,
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
      String organizationId,
      String roundTableId,
      String personId,
      UserRole role,
      DateTime joinedAt,
      DateTime? leftAt,
      String? leftReason,
      String status,
      String firstName,
      String lastName,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableMemberRecord():
        return $default(
          _that.id,
          _that.organizationId,
          _that.roundTableId,
          _that.personId,
          _that.role,
          _that.joinedAt,
          _that.leftAt,
          _that.leftReason,
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
      String organizationId,
      String roundTableId,
      String personId,
      UserRole role,
      DateTime joinedAt,
      DateTime? leftAt,
      String? leftReason,
      String status,
      String firstName,
      String lastName,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableMemberRecord() when $default != null:
        return $default(
          _that.id,
          _that.organizationId,
          _that.roundTableId,
          _that.personId,
          _that.role,
          _that.joinedAt,
          _that.leftAt,
          _that.leftReason,
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
class _TableMemberRecord implements TableMemberRecord {
  const _TableMemberRecord({
    required this.id,
    required this.organizationId,
    required this.roundTableId,
    required this.personId,
    required this.role,
    required this.joinedAt,
    this.leftAt,
    this.leftReason,
    required this.status,
    this.firstName = '',
    this.lastName = '',
  });
  factory _TableMemberRecord.fromJson(Map<String, dynamic> json) =>
      _$TableMemberRecordFromJson(json);

  @override
  final String id;
  @override
  final String organizationId;
  @override
  final String roundTableId;
  @override
  final String personId;
  @override
  final UserRole role;
  @override
  final DateTime joinedAt;
  @override
  final DateTime? leftAt;
  @override
  final String? leftReason;
  @override
  final String status;
  @override
  @JsonKey()
  final String firstName;
  @override
  @JsonKey()
  final String lastName;

  /// Create a copy of TableMemberRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TableMemberRecordCopyWith<_TableMemberRecord> get copyWith =>
      __$TableMemberRecordCopyWithImpl<_TableMemberRecord>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TableMemberRecordToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TableMemberRecord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.roundTableId, roundTableId) ||
                other.roundTableId == roundTableId) &&
            (identical(other.personId, personId) ||
                other.personId == personId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.joinedAt, joinedAt) ||
                other.joinedAt == joinedAt) &&
            (identical(other.leftAt, leftAt) || other.leftAt == leftAt) &&
            (identical(other.leftReason, leftReason) ||
                other.leftReason == leftReason) &&
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
    organizationId,
    roundTableId,
    personId,
    role,
    joinedAt,
    leftAt,
    leftReason,
    status,
    firstName,
    lastName,
  );

  @override
  String toString() {
    return 'TableMemberRecord(id: $id, organizationId: $organizationId, roundTableId: $roundTableId, personId: $personId, role: $role, joinedAt: $joinedAt, leftAt: $leftAt, leftReason: $leftReason, status: $status, firstName: $firstName, lastName: $lastName)';
  }
}

/// @nodoc
abstract mixin class _$TableMemberRecordCopyWith<$Res>
    implements $TableMemberRecordCopyWith<$Res> {
  factory _$TableMemberRecordCopyWith(
    _TableMemberRecord value,
    $Res Function(_TableMemberRecord) _then,
  ) = __$TableMemberRecordCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String organizationId,
    String roundTableId,
    String personId,
    UserRole role,
    DateTime joinedAt,
    DateTime? leftAt,
    String? leftReason,
    String status,
    String firstName,
    String lastName,
  });
}

/// @nodoc
class __$TableMemberRecordCopyWithImpl<$Res>
    implements _$TableMemberRecordCopyWith<$Res> {
  __$TableMemberRecordCopyWithImpl(this._self, this._then);

  final _TableMemberRecord _self;
  final $Res Function(_TableMemberRecord) _then;

  /// Create a copy of TableMemberRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? organizationId = null,
    Object? roundTableId = null,
    Object? personId = null,
    Object? role = null,
    Object? joinedAt = null,
    Object? leftAt = freezed,
    Object? leftReason = freezed,
    Object? status = null,
    Object? firstName = null,
    Object? lastName = null,
  }) {
    return _then(
      _TableMemberRecord(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        organizationId: null == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String,
        roundTableId: null == roundTableId
            ? _self.roundTableId
            : roundTableId // ignore: cast_nullable_to_non_nullable
                  as String,
        personId: null == personId
            ? _self.personId
            : personId // ignore: cast_nullable_to_non_nullable
                  as String,
        role: null == role
            ? _self.role
            : role // ignore: cast_nullable_to_non_nullable
                  as UserRole,
        joinedAt: null == joinedAt
            ? _self.joinedAt
            : joinedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        leftAt: freezed == leftAt
            ? _self.leftAt
            : leftAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        leftReason: freezed == leftReason
            ? _self.leftReason
            : leftReason // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
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
