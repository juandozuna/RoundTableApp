// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_person.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountPerson {
  String get id;
  String? get organizationId;
  String get firstName;
  String get lastName;
  String? get position;
  String? get email;
  String? get phone;
  @JsonKey(unknownEnumValue: PersonStatus.active)
  PersonStatus get status;
  bool get linked;

  /// Create a copy of AccountPerson
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AccountPersonCopyWith<AccountPerson> get copyWith =>
      _$AccountPersonCopyWithImpl<AccountPerson>(
        this as AccountPerson,
        _$identity,
      );

  /// Serializes this AccountPerson to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AccountPerson &&
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
            (identical(other.linked, linked) || other.linked == linked));
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
  );

  @override
  String toString() {
    return 'AccountPerson(id: $id, organizationId: $organizationId, firstName: $firstName, lastName: $lastName, position: $position, email: $email, phone: $phone, status: $status, linked: $linked)';
  }
}

/// @nodoc
abstract mixin class $AccountPersonCopyWith<$Res> {
  factory $AccountPersonCopyWith(
    AccountPerson value,
    $Res Function(AccountPerson) _then,
  ) = _$AccountPersonCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String? organizationId,
    String firstName,
    String lastName,
    String? position,
    String? email,
    String? phone,
    @JsonKey(unknownEnumValue: PersonStatus.active) PersonStatus status,
    bool linked,
  });
}

/// @nodoc
class _$AccountPersonCopyWithImpl<$Res>
    implements $AccountPersonCopyWith<$Res> {
  _$AccountPersonCopyWithImpl(this._self, this._then);

  final AccountPerson _self;
  final $Res Function(AccountPerson) _then;

  /// Create a copy of AccountPerson
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
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [AccountPerson].
extension AccountPersonPatterns on AccountPerson {
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
    TResult Function(_AccountPerson value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AccountPerson() when $default != null:
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
    TResult Function(_AccountPerson value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AccountPerson():
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
    TResult? Function(_AccountPerson value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AccountPerson() when $default != null:
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
      @JsonKey(unknownEnumValue: PersonStatus.active) PersonStatus status,
      bool linked,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AccountPerson() when $default != null:
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
      @JsonKey(unknownEnumValue: PersonStatus.active) PersonStatus status,
      bool linked,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AccountPerson():
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
      @JsonKey(unknownEnumValue: PersonStatus.active) PersonStatus status,
      bool linked,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AccountPerson() when $default != null:
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
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AccountPerson implements AccountPerson {
  const _AccountPerson({
    required this.id,
    this.organizationId,
    required this.firstName,
    required this.lastName,
    this.position,
    this.email,
    this.phone,
    @JsonKey(unknownEnumValue: PersonStatus.active)
    this.status = PersonStatus.active,
    this.linked = true,
  });
  factory _AccountPerson.fromJson(Map<String, dynamic> json) =>
      _$AccountPersonFromJson(json);

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
  @JsonKey(unknownEnumValue: PersonStatus.active)
  final PersonStatus status;
  @override
  @JsonKey()
  final bool linked;

  /// Create a copy of AccountPerson
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AccountPersonCopyWith<_AccountPerson> get copyWith =>
      __$AccountPersonCopyWithImpl<_AccountPerson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AccountPersonToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AccountPerson &&
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
            (identical(other.linked, linked) || other.linked == linked));
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
  );

  @override
  String toString() {
    return 'AccountPerson(id: $id, organizationId: $organizationId, firstName: $firstName, lastName: $lastName, position: $position, email: $email, phone: $phone, status: $status, linked: $linked)';
  }
}

/// @nodoc
abstract mixin class _$AccountPersonCopyWith<$Res>
    implements $AccountPersonCopyWith<$Res> {
  factory _$AccountPersonCopyWith(
    _AccountPerson value,
    $Res Function(_AccountPerson) _then,
  ) = __$AccountPersonCopyWithImpl;
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
    @JsonKey(unknownEnumValue: PersonStatus.active) PersonStatus status,
    bool linked,
  });
}

/// @nodoc
class __$AccountPersonCopyWithImpl<$Res>
    implements _$AccountPersonCopyWith<$Res> {
  __$AccountPersonCopyWithImpl(this._self, this._then);

  final _AccountPerson _self;
  final $Res Function(_AccountPerson) _then;

  /// Create a copy of AccountPerson
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
  }) {
    return _then(
      _AccountPerson(
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
      ),
    );
  }
}
