// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_person.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdminPersonRole {
  String get id;
  String get role;
  String? get organizationId;

  /// Create a copy of AdminPersonRole
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AdminPersonRoleCopyWith<AdminPersonRole> get copyWith =>
      _$AdminPersonRoleCopyWithImpl<AdminPersonRole>(
        this as AdminPersonRole,
        _$identity,
      );

  /// Serializes this AdminPersonRole to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AdminPersonRole &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, role, organizationId);

  @override
  String toString() {
    return 'AdminPersonRole(id: $id, role: $role, organizationId: $organizationId)';
  }
}

/// @nodoc
abstract mixin class $AdminPersonRoleCopyWith<$Res> {
  factory $AdminPersonRoleCopyWith(
    AdminPersonRole value,
    $Res Function(AdminPersonRole) _then,
  ) = _$AdminPersonRoleCopyWithImpl;
  @useResult
  $Res call({String id, String role, String? organizationId});
}

/// @nodoc
class _$AdminPersonRoleCopyWithImpl<$Res>
    implements $AdminPersonRoleCopyWith<$Res> {
  _$AdminPersonRoleCopyWithImpl(this._self, this._then);

  final AdminPersonRole _self;
  final $Res Function(AdminPersonRole) _then;

  /// Create a copy of AdminPersonRole
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? role = null,
    Object? organizationId = freezed,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        role: null == role
            ? _self.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String,
        organizationId: freezed == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [AdminPersonRole].
extension AdminPersonRolePatterns on AdminPersonRole {
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
    TResult Function(_AdminPersonRole value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdminPersonRole() when $default != null:
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
    TResult Function(_AdminPersonRole value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminPersonRole():
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
    TResult? Function(_AdminPersonRole value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminPersonRole() when $default != null:
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
    TResult Function(String id, String role, String? organizationId)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdminPersonRole() when $default != null:
        return $default(_that.id, _that.role, _that.organizationId);
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
    TResult Function(String id, String role, String? organizationId) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminPersonRole():
        return $default(_that.id, _that.role, _that.organizationId);
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
    TResult? Function(String id, String role, String? organizationId)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminPersonRole() when $default != null:
        return $default(_that.id, _that.role, _that.organizationId);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AdminPersonRole implements AdminPersonRole {
  const _AdminPersonRole({
    required this.id,
    required this.role,
    this.organizationId,
  });
  factory _AdminPersonRole.fromJson(Map<String, dynamic> json) =>
      _$AdminPersonRoleFromJson(json);

  @override
  final String id;
  @override
  final String role;
  @override
  final String? organizationId;

  /// Create a copy of AdminPersonRole
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AdminPersonRoleCopyWith<_AdminPersonRole> get copyWith =>
      __$AdminPersonRoleCopyWithImpl<_AdminPersonRole>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AdminPersonRoleToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AdminPersonRole &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, role, organizationId);

  @override
  String toString() {
    return 'AdminPersonRole(id: $id, role: $role, organizationId: $organizationId)';
  }
}

/// @nodoc
abstract mixin class _$AdminPersonRoleCopyWith<$Res>
    implements $AdminPersonRoleCopyWith<$Res> {
  factory _$AdminPersonRoleCopyWith(
    _AdminPersonRole value,
    $Res Function(_AdminPersonRole) _then,
  ) = __$AdminPersonRoleCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String role, String? organizationId});
}

/// @nodoc
class __$AdminPersonRoleCopyWithImpl<$Res>
    implements _$AdminPersonRoleCopyWith<$Res> {
  __$AdminPersonRoleCopyWithImpl(this._self, this._then);

  final _AdminPersonRole _self;
  final $Res Function(_AdminPersonRole) _then;

  /// Create a copy of AdminPersonRole
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? role = null,
    Object? organizationId = freezed,
  }) {
    return _then(
      _AdminPersonRole(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        role: null == role
            ? _self.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String,
        organizationId: freezed == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
mixin _$AdminPersonTable {
  String get tableMemberId;
  String get roundTableId;
  String? get roundTableName;
  @JsonKey(unknownEnumValue: MembershipRole.member)
  MembershipRole get role;

  /// Create a copy of AdminPersonTable
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AdminPersonTableCopyWith<AdminPersonTable> get copyWith =>
      _$AdminPersonTableCopyWithImpl<AdminPersonTable>(
        this as AdminPersonTable,
        _$identity,
      );

  /// Serializes this AdminPersonTable to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AdminPersonTable &&
            (identical(other.tableMemberId, tableMemberId) ||
                other.tableMemberId == tableMemberId) &&
            (identical(other.roundTableId, roundTableId) ||
                other.roundTableId == roundTableId) &&
            (identical(other.roundTableName, roundTableName) ||
                other.roundTableName == roundTableName) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    tableMemberId,
    roundTableId,
    roundTableName,
    role,
  );

  @override
  String toString() {
    return 'AdminPersonTable(tableMemberId: $tableMemberId, roundTableId: $roundTableId, roundTableName: $roundTableName, role: $role)';
  }
}

/// @nodoc
abstract mixin class $AdminPersonTableCopyWith<$Res> {
  factory $AdminPersonTableCopyWith(
    AdminPersonTable value,
    $Res Function(AdminPersonTable) _then,
  ) = _$AdminPersonTableCopyWithImpl;
  @useResult
  $Res call({
    String tableMemberId,
    String roundTableId,
    String? roundTableName,
    @JsonKey(unknownEnumValue: MembershipRole.member) MembershipRole role,
  });
}

/// @nodoc
class _$AdminPersonTableCopyWithImpl<$Res>
    implements $AdminPersonTableCopyWith<$Res> {
  _$AdminPersonTableCopyWithImpl(this._self, this._then);

  final AdminPersonTable _self;
  final $Res Function(AdminPersonTable) _then;

  /// Create a copy of AdminPersonTable
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tableMemberId = null,
    Object? roundTableId = null,
    Object? roundTableName = freezed,
    Object? role = null,
  }) {
    return _then(
      _self.copyWith(
        tableMemberId: null == tableMemberId
            ? _self.tableMemberId
            : tableMemberId // ignore: cast_nullable_to_non_nullable
                  as String,
        roundTableId: null == roundTableId
            ? _self.roundTableId
            : roundTableId // ignore: cast_nullable_to_non_nullable
                  as String,
        roundTableName: freezed == roundTableName
            ? _self.roundTableName
            : roundTableName // ignore: cast_nullable_to_non_nullable
                  as String?,
        role: null == role
            ? _self.role
            : role // ignore: cast_nullable_to_non_nullable
                  as MembershipRole,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [AdminPersonTable].
extension AdminPersonTablePatterns on AdminPersonTable {
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
    TResult Function(_AdminPersonTable value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdminPersonTable() when $default != null:
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
    TResult Function(_AdminPersonTable value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminPersonTable():
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
    TResult? Function(_AdminPersonTable value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminPersonTable() when $default != null:
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
      String tableMemberId,
      String roundTableId,
      String? roundTableName,
      @JsonKey(unknownEnumValue: MembershipRole.member) MembershipRole role,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdminPersonTable() when $default != null:
        return $default(
          _that.tableMemberId,
          _that.roundTableId,
          _that.roundTableName,
          _that.role,
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
      String tableMemberId,
      String roundTableId,
      String? roundTableName,
      @JsonKey(unknownEnumValue: MembershipRole.member) MembershipRole role,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminPersonTable():
        return $default(
          _that.tableMemberId,
          _that.roundTableId,
          _that.roundTableName,
          _that.role,
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
      String tableMemberId,
      String roundTableId,
      String? roundTableName,
      @JsonKey(unknownEnumValue: MembershipRole.member) MembershipRole role,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminPersonTable() when $default != null:
        return $default(
          _that.tableMemberId,
          _that.roundTableId,
          _that.roundTableName,
          _that.role,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AdminPersonTable implements AdminPersonTable {
  const _AdminPersonTable({
    required this.tableMemberId,
    required this.roundTableId,
    this.roundTableName,
    @JsonKey(unknownEnumValue: MembershipRole.member)
    this.role = MembershipRole.member,
  });
  factory _AdminPersonTable.fromJson(Map<String, dynamic> json) =>
      _$AdminPersonTableFromJson(json);

  @override
  final String tableMemberId;
  @override
  final String roundTableId;
  @override
  final String? roundTableName;
  @override
  @JsonKey(unknownEnumValue: MembershipRole.member)
  final MembershipRole role;

  /// Create a copy of AdminPersonTable
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AdminPersonTableCopyWith<_AdminPersonTable> get copyWith =>
      __$AdminPersonTableCopyWithImpl<_AdminPersonTable>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AdminPersonTableToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AdminPersonTable &&
            (identical(other.tableMemberId, tableMemberId) ||
                other.tableMemberId == tableMemberId) &&
            (identical(other.roundTableId, roundTableId) ||
                other.roundTableId == roundTableId) &&
            (identical(other.roundTableName, roundTableName) ||
                other.roundTableName == roundTableName) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    tableMemberId,
    roundTableId,
    roundTableName,
    role,
  );

  @override
  String toString() {
    return 'AdminPersonTable(tableMemberId: $tableMemberId, roundTableId: $roundTableId, roundTableName: $roundTableName, role: $role)';
  }
}

/// @nodoc
abstract mixin class _$AdminPersonTableCopyWith<$Res>
    implements $AdminPersonTableCopyWith<$Res> {
  factory _$AdminPersonTableCopyWith(
    _AdminPersonTable value,
    $Res Function(_AdminPersonTable) _then,
  ) = __$AdminPersonTableCopyWithImpl;
  @override
  @useResult
  $Res call({
    String tableMemberId,
    String roundTableId,
    String? roundTableName,
    @JsonKey(unknownEnumValue: MembershipRole.member) MembershipRole role,
  });
}

/// @nodoc
class __$AdminPersonTableCopyWithImpl<$Res>
    implements _$AdminPersonTableCopyWith<$Res> {
  __$AdminPersonTableCopyWithImpl(this._self, this._then);

  final _AdminPersonTable _self;
  final $Res Function(_AdminPersonTable) _then;

  /// Create a copy of AdminPersonTable
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tableMemberId = null,
    Object? roundTableId = null,
    Object? roundTableName = freezed,
    Object? role = null,
  }) {
    return _then(
      _AdminPersonTable(
        tableMemberId: null == tableMemberId
            ? _self.tableMemberId
            : tableMemberId // ignore: cast_nullable_to_non_nullable
                  as String,
        roundTableId: null == roundTableId
            ? _self.roundTableId
            : roundTableId // ignore: cast_nullable_to_non_nullable
                  as String,
        roundTableName: freezed == roundTableName
            ? _self.roundTableName
            : roundTableName // ignore: cast_nullable_to_non_nullable
                  as String?,
        role: null == role
            ? _self.role
            : role // ignore: cast_nullable_to_non_nullable
                  as MembershipRole,
      ),
    );
  }
}

/// @nodoc
mixin _$AdminPerson {
  String get id;
  String? get organizationId;
  String get firstName;
  String get lastName;
  String? get position;
  String? get email;
  String? get phone;
  @JsonKey(unknownEnumValue: PersonStatus.inactive)
  PersonStatus get status;
  bool get linked;
  List<AdminPersonRole> get roles;
  List<AdminPersonTable> get tables;

  /// Create a copy of AdminPerson
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AdminPersonCopyWith<AdminPerson> get copyWith =>
      _$AdminPersonCopyWithImpl<AdminPerson>(this as AdminPerson, _$identity);

  /// Serializes this AdminPerson to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AdminPerson &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.linked, linked) || other.linked == linked) &&
            const DeepCollectionEquality().equals(other.roles, roles) &&
            const DeepCollectionEquality().equals(other.tables, tables));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    organizationId,
    firstName,
    lastName,
    position,
    email,
    phone,
    status,
    linked,
    const DeepCollectionEquality().hash(roles),
    const DeepCollectionEquality().hash(tables),
  );

  @override
  String toString() {
    return 'AdminPerson(id: $id, organizationId: $organizationId, firstName: $firstName, lastName: $lastName, position: $position, email: $email, phone: $phone, status: $status, linked: $linked, roles: $roles, tables: $tables)';
  }
}

/// @nodoc
abstract mixin class $AdminPersonCopyWith<$Res> {
  factory $AdminPersonCopyWith(
    AdminPerson value,
    $Res Function(AdminPerson) _then,
  ) = _$AdminPersonCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String? organizationId,
    String firstName,
    String lastName,
    String? position,
    String? email,
    String? phone,
    @JsonKey(unknownEnumValue: PersonStatus.inactive) PersonStatus status,
    bool linked,
    List<AdminPersonRole> roles,
    List<AdminPersonTable> tables,
  });
}

/// @nodoc
class _$AdminPersonCopyWithImpl<$Res> implements $AdminPersonCopyWith<$Res> {
  _$AdminPersonCopyWithImpl(this._self, this._then);

  final AdminPerson _self;
  final $Res Function(AdminPerson) _then;

  /// Create a copy of AdminPerson
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? organizationId = freezed,
    Object? firstName = null,
    Object? lastName = null,
    Object? position = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? status = null,
    Object? linked = null,
    Object? roles = null,
    Object? tables = null,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        organizationId: freezed == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        firstName: null == firstName
            ? _self.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
        lastName: null == lastName
            ? _self.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String,
        position: freezed == position
            ? _self.position
            : position // ignore: cast_nullable_to_non_nullable
                  as String?,
        email: freezed == email
            ? _self.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        phone: freezed == phone
            ? _self.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as PersonStatus,
        linked: null == linked
            ? _self.linked
            : linked // ignore: cast_nullable_to_non_nullable
                  as bool,
        roles: null == roles
            ? _self.roles
            : roles // ignore: cast_nullable_to_non_nullable
                  as List<AdminPersonRole>,
        tables: null == tables
            ? _self.tables
            : tables // ignore: cast_nullable_to_non_nullable
                  as List<AdminPersonTable>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [AdminPerson].
extension AdminPersonPatterns on AdminPerson {
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
    TResult Function(_AdminPerson value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdminPerson() when $default != null:
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
    TResult Function(_AdminPerson value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminPerson():
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
    TResult? Function(_AdminPerson value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminPerson() when $default != null:
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
      String? organizationId,
      String firstName,
      String lastName,
      String? position,
      String? email,
      String? phone,
      @JsonKey(unknownEnumValue: PersonStatus.inactive) PersonStatus status,
      bool linked,
      List<AdminPersonRole> roles,
      List<AdminPersonTable> tables,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdminPerson() when $default != null:
        return $default(
          _that.id,
          _that.organizationId,
          _that.firstName,
          _that.lastName,
          _that.position,
          _that.email,
          _that.phone,
          _that.status,
          _that.linked,
          _that.roles,
          _that.tables,
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
      String? organizationId,
      String firstName,
      String lastName,
      String? position,
      String? email,
      String? phone,
      @JsonKey(unknownEnumValue: PersonStatus.inactive) PersonStatus status,
      bool linked,
      List<AdminPersonRole> roles,
      List<AdminPersonTable> tables,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminPerson():
        return $default(
          _that.id,
          _that.organizationId,
          _that.firstName,
          _that.lastName,
          _that.position,
          _that.email,
          _that.phone,
          _that.status,
          _that.linked,
          _that.roles,
          _that.tables,
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
      String? organizationId,
      String firstName,
      String lastName,
      String? position,
      String? email,
      String? phone,
      @JsonKey(unknownEnumValue: PersonStatus.inactive) PersonStatus status,
      bool linked,
      List<AdminPersonRole> roles,
      List<AdminPersonTable> tables,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminPerson() when $default != null:
        return $default(
          _that.id,
          _that.organizationId,
          _that.firstName,
          _that.lastName,
          _that.position,
          _that.email,
          _that.phone,
          _that.status,
          _that.linked,
          _that.roles,
          _that.tables,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AdminPerson extends AdminPerson {
  const _AdminPerson({
    required this.id,
    this.organizationId,
    required this.firstName,
    required this.lastName,
    this.position,
    this.email,
    this.phone,
    @JsonKey(unknownEnumValue: PersonStatus.inactive)
    this.status = PersonStatus.active,
    this.linked = false,
    final List<AdminPersonRole> roles = const [],
    final List<AdminPersonTable> tables = const [],
  }) : _roles = roles,
       _tables = tables,
       super._();
  factory _AdminPerson.fromJson(Map<String, dynamic> json) =>
      _$AdminPersonFromJson(json);

  @override
  final String id;
  @override
  final String? organizationId;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String? position;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  @JsonKey(unknownEnumValue: PersonStatus.inactive)
  final PersonStatus status;
  @override
  @JsonKey()
  final bool linked;
  final List<AdminPersonRole> _roles;
  @override
  @JsonKey()
  List<AdminPersonRole> get roles {
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roles);
  }

  final List<AdminPersonTable> _tables;
  @override
  @JsonKey()
  List<AdminPersonTable> get tables {
    if (_tables is EqualUnmodifiableListView) return _tables;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tables);
  }

  /// Create a copy of AdminPerson
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AdminPersonCopyWith<_AdminPerson> get copyWith =>
      __$AdminPersonCopyWithImpl<_AdminPerson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AdminPersonToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AdminPerson &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.linked, linked) || other.linked == linked) &&
            const DeepCollectionEquality().equals(other._roles, _roles) &&
            const DeepCollectionEquality().equals(other._tables, _tables));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    organizationId,
    firstName,
    lastName,
    position,
    email,
    phone,
    status,
    linked,
    const DeepCollectionEquality().hash(_roles),
    const DeepCollectionEquality().hash(_tables),
  );

  @override
  String toString() {
    return 'AdminPerson(id: $id, organizationId: $organizationId, firstName: $firstName, lastName: $lastName, position: $position, email: $email, phone: $phone, status: $status, linked: $linked, roles: $roles, tables: $tables)';
  }
}

/// @nodoc
abstract mixin class _$AdminPersonCopyWith<$Res>
    implements $AdminPersonCopyWith<$Res> {
  factory _$AdminPersonCopyWith(
    _AdminPerson value,
    $Res Function(_AdminPerson) _then,
  ) = __$AdminPersonCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String? organizationId,
    String firstName,
    String lastName,
    String? position,
    String? email,
    String? phone,
    @JsonKey(unknownEnumValue: PersonStatus.inactive) PersonStatus status,
    bool linked,
    List<AdminPersonRole> roles,
    List<AdminPersonTable> tables,
  });
}

/// @nodoc
class __$AdminPersonCopyWithImpl<$Res> implements _$AdminPersonCopyWith<$Res> {
  __$AdminPersonCopyWithImpl(this._self, this._then);

  final _AdminPerson _self;
  final $Res Function(_AdminPerson) _then;

  /// Create a copy of AdminPerson
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? organizationId = freezed,
    Object? firstName = null,
    Object? lastName = null,
    Object? position = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? status = null,
    Object? linked = null,
    Object? roles = null,
    Object? tables = null,
  }) {
    return _then(
      _AdminPerson(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        organizationId: freezed == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        firstName: null == firstName
            ? _self.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
        lastName: null == lastName
            ? _self.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String,
        position: freezed == position
            ? _self.position
            : position // ignore: cast_nullable_to_non_nullable
                  as String?,
        email: freezed == email
            ? _self.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        phone: freezed == phone
            ? _self.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as PersonStatus,
        linked: null == linked
            ? _self.linked
            : linked // ignore: cast_nullable_to_non_nullable
                  as bool,
        roles: null == roles
            ? _self._roles
            : roles // ignore: cast_nullable_to_non_nullable
                  as List<AdminPersonRole>,
        tables: null == tables
            ? _self._tables
            : tables // ignore: cast_nullable_to_non_nullable
                  as List<AdminPersonTable>,
      ),
    );
  }
}
