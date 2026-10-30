// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'person_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PersonRecord {
  String get id;
  String? get organizationId;
  String get firstName;
  String get lastName;
  String? get position;
  String? get email;
  String? get phone;
  String get status;

  /// Create a copy of PersonRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PersonRecordCopyWith<PersonRecord> get copyWith =>
      _$PersonRecordCopyWithImpl<PersonRecord>(
        this as PersonRecord,
        _$identity,
      );

  /// Serializes this PersonRecord to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PersonRecord &&
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
            (identical(other.status, status) || other.status == status));
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
  );

  @override
  String toString() {
    return 'PersonRecord(id: $id, organizationId: $organizationId, firstName: $firstName, lastName: $lastName, position: $position, email: $email, phone: $phone, status: $status)';
  }
}

/// @nodoc
abstract mixin class $PersonRecordCopyWith<$Res> {
  factory $PersonRecordCopyWith(
    PersonRecord value,
    $Res Function(PersonRecord) _then,
  ) = _$PersonRecordCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String? organizationId,
    String firstName,
    String lastName,
    String? position,
    String? email,
    String? phone,
    String status,
  });
}

/// @nodoc
class _$PersonRecordCopyWithImpl<$Res> implements $PersonRecordCopyWith<$Res> {
  _$PersonRecordCopyWithImpl(this._self, this._then);

  final PersonRecord _self;
  final $Res Function(PersonRecord) _then;

  /// Create a copy of PersonRecord
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
                  as String,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [PersonRecord].
extension PersonRecordPatterns on PersonRecord {
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
    TResult Function(_PersonRecord value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PersonRecord() when $default != null:
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
    TResult Function(_PersonRecord value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PersonRecord():
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
    TResult? Function(_PersonRecord value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PersonRecord() when $default != null:
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
      String status,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PersonRecord() when $default != null:
        return $default(
          _that.id,
          _that.organizationId,
          _that.firstName,
          _that.lastName,
          _that.position,
          _that.email,
          _that.phone,
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
      String? organizationId,
      String firstName,
      String lastName,
      String? position,
      String? email,
      String? phone,
      String status,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PersonRecord():
        return $default(
          _that.id,
          _that.organizationId,
          _that.firstName,
          _that.lastName,
          _that.position,
          _that.email,
          _that.phone,
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
      String? organizationId,
      String firstName,
      String lastName,
      String? position,
      String? email,
      String? phone,
      String status,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PersonRecord() when $default != null:
        return $default(
          _that.id,
          _that.organizationId,
          _that.firstName,
          _that.lastName,
          _that.position,
          _that.email,
          _that.phone,
          _that.status,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PersonRecord implements PersonRecord {
  const _PersonRecord({
    required this.id,
    this.organizationId,
    required this.firstName,
    required this.lastName,
    this.position,
    this.email,
    this.phone,
    required this.status,
  });
  factory _PersonRecord.fromJson(Map<String, dynamic> json) =>
      _$PersonRecordFromJson(json);

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
  final String status;

  /// Create a copy of PersonRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PersonRecordCopyWith<_PersonRecord> get copyWith =>
      __$PersonRecordCopyWithImpl<_PersonRecord>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PersonRecordToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PersonRecord &&
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
            (identical(other.status, status) || other.status == status));
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
  );

  @override
  String toString() {
    return 'PersonRecord(id: $id, organizationId: $organizationId, firstName: $firstName, lastName: $lastName, position: $position, email: $email, phone: $phone, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$PersonRecordCopyWith<$Res>
    implements $PersonRecordCopyWith<$Res> {
  factory _$PersonRecordCopyWith(
    _PersonRecord value,
    $Res Function(_PersonRecord) _then,
  ) = __$PersonRecordCopyWithImpl;
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
    String status,
  });
}

/// @nodoc
class __$PersonRecordCopyWithImpl<$Res>
    implements _$PersonRecordCopyWith<$Res> {
  __$PersonRecordCopyWithImpl(this._self, this._then);

  final _PersonRecord _self;
  final $Res Function(_PersonRecord) _then;

  /// Create a copy of PersonRecord
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
  }) {
    return _then(
      _PersonRecord(
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
                  as String,
      ),
    );
  }
}
