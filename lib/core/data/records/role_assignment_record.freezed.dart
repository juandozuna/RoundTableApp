// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'role_assignment_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoleAssignmentRecord {
  String get id;
  String get personId;
  UserRole get role;
  String? get organizationId;
  String? get locationId;
  String get status;

  /// Create a copy of RoleAssignmentRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RoleAssignmentRecordCopyWith<RoleAssignmentRecord> get copyWith =>
      _$RoleAssignmentRecordCopyWithImpl<RoleAssignmentRecord>(
        this as RoleAssignmentRecord,
        _$identity,
      );

  /// Serializes this RoleAssignmentRecord to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RoleAssignmentRecord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.personId, personId) ||
                other.personId == personId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    personId,
    role,
    organizationId,
    locationId,
    status,
  );

  @override
  String toString() {
    return 'RoleAssignmentRecord(id: $id, personId: $personId, role: $role, organizationId: $organizationId, locationId: $locationId, status: $status)';
  }
}

/// @nodoc
abstract mixin class $RoleAssignmentRecordCopyWith<$Res> {
  factory $RoleAssignmentRecordCopyWith(
    RoleAssignmentRecord value,
    $Res Function(RoleAssignmentRecord) _then,
  ) = _$RoleAssignmentRecordCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String personId,
    UserRole role,
    String? organizationId,
    String? locationId,
    String status,
  });
}

/// @nodoc
class _$RoleAssignmentRecordCopyWithImpl<$Res>
    implements $RoleAssignmentRecordCopyWith<$Res> {
  _$RoleAssignmentRecordCopyWithImpl(this._self, this._then);

  final RoleAssignmentRecord _self;
  final $Res Function(RoleAssignmentRecord) _then;

  /// Create a copy of RoleAssignmentRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? personId = null,
    Object? role = null,
    Object? organizationId = freezed,
    Object? locationId = freezed,
    Object? status = null,
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
                  as UserRole,
        organizationId: freezed == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        locationId: freezed == locationId
            ? _self.locationId
            : locationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [RoleAssignmentRecord].
extension RoleAssignmentRecordPatterns on RoleAssignmentRecord {
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
    TResult Function(_RoleAssignmentRecord value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RoleAssignmentRecord() when $default != null:
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
    TResult Function(_RoleAssignmentRecord value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RoleAssignmentRecord():
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
    TResult? Function(_RoleAssignmentRecord value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RoleAssignmentRecord() when $default != null:
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
      UserRole role,
      String? organizationId,
      String? locationId,
      String status,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RoleAssignmentRecord() when $default != null:
        return $default(
          _that.id,
          _that.personId,
          _that.role,
          _that.organizationId,
          _that.locationId,
          _that.status,
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
      UserRole role,
      String? organizationId,
      String? locationId,
      String status,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RoleAssignmentRecord():
        return $default(
          _that.id,
          _that.personId,
          _that.role,
          _that.organizationId,
          _that.locationId,
          _that.status,
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
      UserRole role,
      String? organizationId,
      String? locationId,
      String status,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RoleAssignmentRecord() when $default != null:
        return $default(
          _that.id,
          _that.personId,
          _that.role,
          _that.organizationId,
          _that.locationId,
          _that.status,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RoleAssignmentRecord implements RoleAssignmentRecord {
  const _RoleAssignmentRecord({
    required this.id,
    required this.personId,
    required this.role,
    this.organizationId,
    this.locationId,
    required this.status,
  });
  factory _RoleAssignmentRecord.fromJson(Map<String, dynamic> json) =>
      _$RoleAssignmentRecordFromJson(json);

  @override
  final String id;
  @override
  final String personId;
  @override
  final UserRole role;
  @override
  final String? organizationId;
  @override
  final String? locationId;
  @override
  final String status;

  /// Create a copy of RoleAssignmentRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RoleAssignmentRecordCopyWith<_RoleAssignmentRecord> get copyWith =>
      __$RoleAssignmentRecordCopyWithImpl<_RoleAssignmentRecord>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$RoleAssignmentRecordToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RoleAssignmentRecord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.personId, personId) ||
                other.personId == personId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    personId,
    role,
    organizationId,
    locationId,
    status,
  );

  @override
  String toString() {
    return 'RoleAssignmentRecord(id: $id, personId: $personId, role: $role, organizationId: $organizationId, locationId: $locationId, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$RoleAssignmentRecordCopyWith<$Res>
    implements $RoleAssignmentRecordCopyWith<$Res> {
  factory _$RoleAssignmentRecordCopyWith(
    _RoleAssignmentRecord value,
    $Res Function(_RoleAssignmentRecord) _then,
  ) = __$RoleAssignmentRecordCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String personId,
    UserRole role,
    String? organizationId,
    String? locationId,
    String status,
  });
}

/// @nodoc
class __$RoleAssignmentRecordCopyWithImpl<$Res>
    implements _$RoleAssignmentRecordCopyWith<$Res> {
  __$RoleAssignmentRecordCopyWithImpl(this._self, this._then);

  final _RoleAssignmentRecord _self;
  final $Res Function(_RoleAssignmentRecord) _then;

  /// Create a copy of RoleAssignmentRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? personId = null,
    Object? role = null,
    Object? organizationId = freezed,
    Object? locationId = freezed,
    Object? status = null,
  }) {
    return _then(
      _RoleAssignmentRecord(
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
                  as UserRole,
        organizationId: freezed == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        locationId: freezed == locationId
            ? _self.locationId
            : locationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}
