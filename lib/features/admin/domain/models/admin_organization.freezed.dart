// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_organization.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdminOrganization {
  String get id;
  String get name;
  String get kind;
  String get countryCode;
  String get countryName;
  String? get region;
  String? get contactName;
  String? get contactEmail;
  String? get contactPhone;
  @JsonKey(unknownEnumValue: OrganizationStatus.inactive)
  OrganizationStatus get status;

  /// Create a copy of AdminOrganization
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AdminOrganizationCopyWith<AdminOrganization> get copyWith =>
      _$AdminOrganizationCopyWithImpl<AdminOrganization>(
        this as AdminOrganization,
        _$identity,
      );

  /// Serializes this AdminOrganization to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AdminOrganization &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.countryName, countryName) ||
                other.countryName == countryName) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.contactName, contactName) ||
                other.contactName == contactName) &&
            (identical(other.contactEmail, contactEmail) ||
                other.contactEmail == contactEmail) &&
            (identical(other.contactPhone, contactPhone) ||
                other.contactPhone == contactPhone) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    kind,
    countryCode,
    countryName,
    region,
    contactName,
    contactEmail,
    contactPhone,
    status,
  );

  @override
  String toString() {
    return 'AdminOrganization(id: $id, name: $name, kind: $kind, countryCode: $countryCode, countryName: $countryName, region: $region, contactName: $contactName, contactEmail: $contactEmail, contactPhone: $contactPhone, status: $status)';
  }
}

/// @nodoc
abstract mixin class $AdminOrganizationCopyWith<$Res> {
  factory $AdminOrganizationCopyWith(
    AdminOrganization value,
    $Res Function(AdminOrganization) _then,
  ) = _$AdminOrganizationCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String name,
    String kind,
    String countryCode,
    String countryName,
    String? region,
    String? contactName,
    String? contactEmail,
    String? contactPhone,
    @JsonKey(unknownEnumValue: OrganizationStatus.inactive)
    OrganizationStatus status,
  });
}

/// @nodoc
class _$AdminOrganizationCopyWithImpl<$Res>
    implements $AdminOrganizationCopyWith<$Res> {
  _$AdminOrganizationCopyWithImpl(this._self, this._then);

  final AdminOrganization _self;
  final $Res Function(AdminOrganization) _then;

  /// Create a copy of AdminOrganization
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? kind = null,
    Object? countryCode = null,
    Object? countryName = null,
    Object? region = freezed,
    Object? contactName = freezed,
    Object? contactEmail = freezed,
    Object? contactPhone = freezed,
    Object? status = null,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        kind: null == kind
            ? _self.kind
            : kind // ignore: cast_nullable_to_non_nullable
                  as String,
        countryCode: null == countryCode
            ? _self.countryCode
            : countryCode // ignore: cast_nullable_to_non_nullable
                  as String,
        countryName: null == countryName
            ? _self.countryName
            : countryName // ignore: cast_nullable_to_non_nullable
                  as String,
        region: freezed == region
            ? _self.region
            : region // ignore: cast_nullable_to_non_nullable
                  as String?,
        contactName: freezed == contactName
            ? _self.contactName
            : contactName // ignore: cast_nullable_to_non_nullable
                  as String?,
        contactEmail: freezed == contactEmail
            ? _self.contactEmail
            : contactEmail // ignore: cast_nullable_to_non_nullable
                  as String?,
        contactPhone: freezed == contactPhone
            ? _self.contactPhone
            : contactPhone // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as OrganizationStatus,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [AdminOrganization].
extension AdminOrganizationPatterns on AdminOrganization {
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
    TResult Function(_AdminOrganization value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdminOrganization() when $default != null:
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
    TResult Function(_AdminOrganization value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminOrganization():
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
    TResult? Function(_AdminOrganization value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminOrganization() when $default != null:
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
      String name,
      String kind,
      String countryCode,
      String countryName,
      String? region,
      String? contactName,
      String? contactEmail,
      String? contactPhone,
      @JsonKey(unknownEnumValue: OrganizationStatus.inactive)
      OrganizationStatus status,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdminOrganization() when $default != null:
        return $default(
          _that.id,
          _that.name,
          _that.kind,
          _that.countryCode,
          _that.countryName,
          _that.region,
          _that.contactName,
          _that.contactEmail,
          _that.contactPhone,
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
      String name,
      String kind,
      String countryCode,
      String countryName,
      String? region,
      String? contactName,
      String? contactEmail,
      String? contactPhone,
      @JsonKey(unknownEnumValue: OrganizationStatus.inactive)
      OrganizationStatus status,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminOrganization():
        return $default(
          _that.id,
          _that.name,
          _that.kind,
          _that.countryCode,
          _that.countryName,
          _that.region,
          _that.contactName,
          _that.contactEmail,
          _that.contactPhone,
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
      String name,
      String kind,
      String countryCode,
      String countryName,
      String? region,
      String? contactName,
      String? contactEmail,
      String? contactPhone,
      @JsonKey(unknownEnumValue: OrganizationStatus.inactive)
      OrganizationStatus status,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminOrganization() when $default != null:
        return $default(
          _that.id,
          _that.name,
          _that.kind,
          _that.countryCode,
          _that.countryName,
          _that.region,
          _that.contactName,
          _that.contactEmail,
          _that.contactPhone,
          _that.status,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AdminOrganization implements AdminOrganization {
  const _AdminOrganization({
    required this.id,
    required this.name,
    this.kind = 'other',
    required this.countryCode,
    required this.countryName,
    this.region,
    this.contactName,
    this.contactEmail,
    this.contactPhone,
    @JsonKey(unknownEnumValue: OrganizationStatus.inactive)
    this.status = OrganizationStatus.active,
  });
  factory _AdminOrganization.fromJson(Map<String, dynamic> json) =>
      _$AdminOrganizationFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey()
  final String kind;
  @override
  final String countryCode;
  @override
  final String countryName;
  @override
  final String? region;
  @override
  final String? contactName;
  @override
  final String? contactEmail;
  @override
  final String? contactPhone;
  @override
  @JsonKey(unknownEnumValue: OrganizationStatus.inactive)
  final OrganizationStatus status;

  /// Create a copy of AdminOrganization
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AdminOrganizationCopyWith<_AdminOrganization> get copyWith =>
      __$AdminOrganizationCopyWithImpl<_AdminOrganization>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AdminOrganizationToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AdminOrganization &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.countryName, countryName) ||
                other.countryName == countryName) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.contactName, contactName) ||
                other.contactName == contactName) &&
            (identical(other.contactEmail, contactEmail) ||
                other.contactEmail == contactEmail) &&
            (identical(other.contactPhone, contactPhone) ||
                other.contactPhone == contactPhone) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    kind,
    countryCode,
    countryName,
    region,
    contactName,
    contactEmail,
    contactPhone,
    status,
  );

  @override
  String toString() {
    return 'AdminOrganization(id: $id, name: $name, kind: $kind, countryCode: $countryCode, countryName: $countryName, region: $region, contactName: $contactName, contactEmail: $contactEmail, contactPhone: $contactPhone, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$AdminOrganizationCopyWith<$Res>
    implements $AdminOrganizationCopyWith<$Res> {
  factory _$AdminOrganizationCopyWith(
    _AdminOrganization value,
    $Res Function(_AdminOrganization) _then,
  ) = __$AdminOrganizationCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String kind,
    String countryCode,
    String countryName,
    String? region,
    String? contactName,
    String? contactEmail,
    String? contactPhone,
    @JsonKey(unknownEnumValue: OrganizationStatus.inactive)
    OrganizationStatus status,
  });
}

/// @nodoc
class __$AdminOrganizationCopyWithImpl<$Res>
    implements _$AdminOrganizationCopyWith<$Res> {
  __$AdminOrganizationCopyWithImpl(this._self, this._then);

  final _AdminOrganization _self;
  final $Res Function(_AdminOrganization) _then;

  /// Create a copy of AdminOrganization
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? kind = null,
    Object? countryCode = null,
    Object? countryName = null,
    Object? region = freezed,
    Object? contactName = freezed,
    Object? contactEmail = freezed,
    Object? contactPhone = freezed,
    Object? status = null,
  }) {
    return _then(
      _AdminOrganization(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        kind: null == kind
            ? _self.kind
            : kind // ignore: cast_nullable_to_non_nullable
                  as String,
        countryCode: null == countryCode
            ? _self.countryCode
            : countryCode // ignore: cast_nullable_to_non_nullable
                  as String,
        countryName: null == countryName
            ? _self.countryName
            : countryName // ignore: cast_nullable_to_non_nullable
                  as String,
        region: freezed == region
            ? _self.region
            : region // ignore: cast_nullable_to_non_nullable
                  as String?,
        contactName: freezed == contactName
            ? _self.contactName
            : contactName // ignore: cast_nullable_to_non_nullable
                  as String?,
        contactEmail: freezed == contactEmail
            ? _self.contactEmail
            : contactEmail // ignore: cast_nullable_to_non_nullable
                  as String?,
        contactPhone: freezed == contactPhone
            ? _self.contactPhone
            : contactPhone // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as OrganizationStatus,
      ),
    );
  }
}
