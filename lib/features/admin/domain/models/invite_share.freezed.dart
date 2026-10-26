// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invite_share.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InvitePerson {
  String? get id;
  String get firstName;
  String get lastName;

  /// Create a copy of InvitePerson
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InvitePersonCopyWith<InvitePerson> get copyWith =>
      _$InvitePersonCopyWithImpl<InvitePerson>(
        this as InvitePerson,
        _$identity,
      );

  /// Serializes this InvitePerson to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvitePerson &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName);

  @override
  String toString() {
    return 'InvitePerson(id: $id, firstName: $firstName, lastName: $lastName)';
  }
}

/// @nodoc
abstract mixin class $InvitePersonCopyWith<$Res> {
  factory $InvitePersonCopyWith(
    InvitePerson value,
    $Res Function(InvitePerson) _then,
  ) = _$InvitePersonCopyWithImpl;
  @useResult
  $Res call({String? id, String firstName, String lastName});
}

/// @nodoc
class _$InvitePersonCopyWithImpl<$Res> implements $InvitePersonCopyWith<$Res> {
  _$InvitePersonCopyWithImpl(this._self, this._then);

  final InvitePerson _self;
  final $Res Function(InvitePerson) _then;

  /// Create a copy of InvitePerson
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = null,
    Object? lastName = null,
  }) {
    return _then(
      _self.copyWith(
        id: freezed == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
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

/// Adds pattern-matching-related methods to [InvitePerson].
extension InvitePersonPatterns on InvitePerson {
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
    TResult Function(_InvitePerson value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvitePerson() when $default != null:
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
    TResult Function(_InvitePerson value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvitePerson():
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
    TResult? Function(_InvitePerson value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvitePerson() when $default != null:
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
    TResult Function(String? id, String firstName, String lastName)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvitePerson() when $default != null:
        return $default(_that.id, _that.firstName, _that.lastName);
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
    TResult Function(String? id, String firstName, String lastName) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvitePerson():
        return $default(_that.id, _that.firstName, _that.lastName);
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
    TResult? Function(String? id, String firstName, String lastName)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvitePerson() when $default != null:
        return $default(_that.id, _that.firstName, _that.lastName);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _InvitePerson implements InvitePerson {
  const _InvitePerson({this.id, this.firstName = '', this.lastName = ''});
  factory _InvitePerson.fromJson(Map<String, dynamic> json) =>
      _$InvitePersonFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey()
  final String firstName;
  @override
  @JsonKey()
  final String lastName;

  /// Create a copy of InvitePerson
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InvitePersonCopyWith<_InvitePerson> get copyWith =>
      __$InvitePersonCopyWithImpl<_InvitePerson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InvitePersonToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InvitePerson &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName);

  @override
  String toString() {
    return 'InvitePerson(id: $id, firstName: $firstName, lastName: $lastName)';
  }
}

/// @nodoc
abstract mixin class _$InvitePersonCopyWith<$Res>
    implements $InvitePersonCopyWith<$Res> {
  factory _$InvitePersonCopyWith(
    _InvitePerson value,
    $Res Function(_InvitePerson) _then,
  ) = __$InvitePersonCopyWithImpl;
  @override
  @useResult
  $Res call({String? id, String firstName, String lastName});
}

/// @nodoc
class __$InvitePersonCopyWithImpl<$Res>
    implements _$InvitePersonCopyWith<$Res> {
  __$InvitePersonCopyWithImpl(this._self, this._then);

  final _InvitePerson _self;
  final $Res Function(_InvitePerson) _then;

  /// Create a copy of InvitePerson
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? firstName = null,
    Object? lastName = null,
  }) {
    return _then(
      _InvitePerson(
        id: freezed == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
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

/// @nodoc
mixin _$InviteShare {
  String get id;
  String get code;
  String get roleKind;
  String? get status;
  String? get organizationName;
  String? get roundTableName;
  InvitePerson? get person;
  DateTime? get expiresAt;
  String? get inviteUrl;

  /// Create a copy of InviteShare
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InviteShareCopyWith<InviteShare> get copyWith =>
      _$InviteShareCopyWithImpl<InviteShare>(this as InviteShare, _$identity);

  /// Serializes this InviteShare to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InviteShare &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.roleKind, roleKind) ||
                other.roleKind == roleKind) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.organizationName, organizationName) ||
                other.organizationName == organizationName) &&
            (identical(other.roundTableName, roundTableName) ||
                other.roundTableName == roundTableName) &&
            (identical(other.person, person) || other.person == person) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
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
    organizationName,
    roundTableName,
    person,
    expiresAt,
    inviteUrl,
  );

  @override
  String toString() {
    return 'InviteShare(id: $id, code: $code, roleKind: $roleKind, status: $status, organizationName: $organizationName, roundTableName: $roundTableName, person: $person, expiresAt: $expiresAt, inviteUrl: $inviteUrl)';
  }
}

/// @nodoc
abstract mixin class $InviteShareCopyWith<$Res> {
  factory $InviteShareCopyWith(
    InviteShare value,
    $Res Function(InviteShare) _then,
  ) = _$InviteShareCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String code,
    String roleKind,
    String? status,
    String? organizationName,
    String? roundTableName,
    InvitePerson? person,
    DateTime? expiresAt,
    String? inviteUrl,
  });

  $InvitePersonCopyWith<$Res>? get person;
}

/// @nodoc
class _$InviteShareCopyWithImpl<$Res> implements $InviteShareCopyWith<$Res> {
  _$InviteShareCopyWithImpl(this._self, this._then);

  final InviteShare _self;
  final $Res Function(InviteShare) _then;

  /// Create a copy of InviteShare
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? roleKind = null,
    Object? status = freezed,
    Object? organizationName = freezed,
    Object? roundTableName = freezed,
    Object? person = freezed,
    Object? expiresAt = freezed,
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
                  as String,
        status: freezed == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        organizationName: freezed == organizationName
            ? _self.organizationName
            : organizationName // ignore: cast_nullable_to_non_nullable
                  as String?,
        roundTableName: freezed == roundTableName
            ? _self.roundTableName
            : roundTableName // ignore: cast_nullable_to_non_nullable
                  as String?,
        person: freezed == person
            ? _self.person
            : person // ignore: cast_nullable_to_non_nullable
                  as InvitePerson?,
        expiresAt: freezed == expiresAt
            ? _self.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        inviteUrl: freezed == inviteUrl
            ? _self.inviteUrl
            : inviteUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }

  /// Create a copy of InviteShare
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvitePersonCopyWith<$Res>? get person {
    if (_self.person == null) {
      return null;
    }

    return $InvitePersonCopyWith<$Res>(_self.person!, (value) {
      return _then(_self.copyWith(person: value));
    });
  }
}

/// Adds pattern-matching-related methods to [InviteShare].
extension InviteSharePatterns on InviteShare {
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
    TResult Function(_InviteShare value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InviteShare() when $default != null:
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
    TResult Function(_InviteShare value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InviteShare():
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
    TResult? Function(_InviteShare value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InviteShare() when $default != null:
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
      String roleKind,
      String? status,
      String? organizationName,
      String? roundTableName,
      InvitePerson? person,
      DateTime? expiresAt,
      String? inviteUrl,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InviteShare() when $default != null:
        return $default(
          _that.id,
          _that.code,
          _that.roleKind,
          _that.status,
          _that.organizationName,
          _that.roundTableName,
          _that.person,
          _that.expiresAt,
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
      String roleKind,
      String? status,
      String? organizationName,
      String? roundTableName,
      InvitePerson? person,
      DateTime? expiresAt,
      String? inviteUrl,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InviteShare():
        return $default(
          _that.id,
          _that.code,
          _that.roleKind,
          _that.status,
          _that.organizationName,
          _that.roundTableName,
          _that.person,
          _that.expiresAt,
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
      String roleKind,
      String? status,
      String? organizationName,
      String? roundTableName,
      InvitePerson? person,
      DateTime? expiresAt,
      String? inviteUrl,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InviteShare() when $default != null:
        return $default(
          _that.id,
          _that.code,
          _that.roleKind,
          _that.status,
          _that.organizationName,
          _that.roundTableName,
          _that.person,
          _that.expiresAt,
          _that.inviteUrl,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _InviteShare extends InviteShare {
  const _InviteShare({
    required this.id,
    required this.code,
    required this.roleKind,
    this.status,
    this.organizationName,
    this.roundTableName,
    this.person,
    this.expiresAt,
    this.inviteUrl,
  }) : super._();
  factory _InviteShare.fromJson(Map<String, dynamic> json) =>
      _$InviteShareFromJson(json);

  @override
  final String id;
  @override
  final String code;
  @override
  final String roleKind;
  @override
  final String? status;
  @override
  final String? organizationName;
  @override
  final String? roundTableName;
  @override
  final InvitePerson? person;
  @override
  final DateTime? expiresAt;
  @override
  final String? inviteUrl;

  /// Create a copy of InviteShare
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InviteShareCopyWith<_InviteShare> get copyWith =>
      __$InviteShareCopyWithImpl<_InviteShare>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InviteShareToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InviteShare &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.roleKind, roleKind) ||
                other.roleKind == roleKind) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.organizationName, organizationName) ||
                other.organizationName == organizationName) &&
            (identical(other.roundTableName, roundTableName) ||
                other.roundTableName == roundTableName) &&
            (identical(other.person, person) || other.person == person) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
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
    organizationName,
    roundTableName,
    person,
    expiresAt,
    inviteUrl,
  );

  @override
  String toString() {
    return 'InviteShare(id: $id, code: $code, roleKind: $roleKind, status: $status, organizationName: $organizationName, roundTableName: $roundTableName, person: $person, expiresAt: $expiresAt, inviteUrl: $inviteUrl)';
  }
}

/// @nodoc
abstract mixin class _$InviteShareCopyWith<$Res>
    implements $InviteShareCopyWith<$Res> {
  factory _$InviteShareCopyWith(
    _InviteShare value,
    $Res Function(_InviteShare) _then,
  ) = __$InviteShareCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String code,
    String roleKind,
    String? status,
    String? organizationName,
    String? roundTableName,
    InvitePerson? person,
    DateTime? expiresAt,
    String? inviteUrl,
  });

  @override
  $InvitePersonCopyWith<$Res>? get person;
}

/// @nodoc
class __$InviteShareCopyWithImpl<$Res> implements _$InviteShareCopyWith<$Res> {
  __$InviteShareCopyWithImpl(this._self, this._then);

  final _InviteShare _self;
  final $Res Function(_InviteShare) _then;

  /// Create a copy of InviteShare
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? roleKind = null,
    Object? status = freezed,
    Object? organizationName = freezed,
    Object? roundTableName = freezed,
    Object? person = freezed,
    Object? expiresAt = freezed,
    Object? inviteUrl = freezed,
  }) {
    return _then(
      _InviteShare(
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
                  as String,
        status: freezed == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        organizationName: freezed == organizationName
            ? _self.organizationName
            : organizationName // ignore: cast_nullable_to_non_nullable
                  as String?,
        roundTableName: freezed == roundTableName
            ? _self.roundTableName
            : roundTableName // ignore: cast_nullable_to_non_nullable
                  as String?,
        person: freezed == person
            ? _self.person
            : person // ignore: cast_nullable_to_non_nullable
                  as InvitePerson?,
        expiresAt: freezed == expiresAt
            ? _self.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        inviteUrl: freezed == inviteUrl
            ? _self.inviteUrl
            : inviteUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }

  /// Create a copy of InviteShare
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvitePersonCopyWith<$Res>? get person {
    if (_self.person == null) {
      return null;
    }

    return $InvitePersonCopyWith<$Res>(_self.person!, (value) {
      return _then(_self.copyWith(person: value));
    });
  }
}
