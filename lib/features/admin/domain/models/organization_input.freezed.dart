// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'organization_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrganizationInput {
  String? get name;
  String? get kind;
  String? get countryCode;
  String? get countryName;
  String? get region;
  String? get contactName;
  String? get contactEmail;
  String? get contactPhone;

  /// Create a copy of OrganizationInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrganizationInputCopyWith<OrganizationInput> get copyWith =>
      _$OrganizationInputCopyWithImpl<OrganizationInput>(
        this as OrganizationInput,
        _$identity,
      );

  /// Serializes this OrganizationInput to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrganizationInput &&
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
                other.contactPhone == contactPhone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    kind,
    countryCode,
    countryName,
    region,
    contactName,
    contactEmail,
    contactPhone,
  );

  @override
  String toString() {
    return 'OrganizationInput(name: $name, kind: $kind, countryCode: $countryCode, countryName: $countryName, region: $region, contactName: $contactName, contactEmail: $contactEmail, contactPhone: $contactPhone)';
  }
}

/// @nodoc
abstract mixin class $OrganizationInputCopyWith<$Res> {
  factory $OrganizationInputCopyWith(
    OrganizationInput value,
    $Res Function(OrganizationInput) _then,
  ) = _$OrganizationInputCopyWithImpl;
  @useResult
  $Res call({
    String? name,
    String? kind,
    String? countryCode,
    String? countryName,
    String? region,
    String? contactName,
    String? contactEmail,
    String? contactPhone,
  });
}

/// @nodoc
class _$OrganizationInputCopyWithImpl<$Res>
    implements $OrganizationInputCopyWith<$Res> {
  _$OrganizationInputCopyWithImpl(this._self, this._then);

  final OrganizationInput _self;
  final $Res Function(OrganizationInput) _then;

  /// Create a copy of OrganizationInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? kind = freezed,
    Object? countryCode = freezed,
    Object? countryName = freezed,
    Object? region = freezed,
    Object? contactName = freezed,
    Object? contactEmail = freezed,
    Object? contactPhone = freezed,
  }) {
    return _then(
      _self.copyWith(
        name: freezed == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        kind: freezed == kind
            ? _self.kind
            : kind // ignore: cast_nullable_to_non_nullable
                  as String?,
        countryCode: freezed == countryCode
            ? _self.countryCode
            : countryCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        countryName: freezed == countryName
            ? _self.countryName
            : countryName // ignore: cast_nullable_to_non_nullable
                  as String?,
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
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [OrganizationInput].
extension OrganizationInputPatterns on OrganizationInput {
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
    TResult Function(_OrganizationInput value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrganizationInput() when $default != null:
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
    TResult Function(_OrganizationInput value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrganizationInput():
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
    TResult? Function(_OrganizationInput value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrganizationInput() when $default != null:
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
      String? name,
      String? kind,
      String? countryCode,
      String? countryName,
      String? region,
      String? contactName,
      String? contactEmail,
      String? contactPhone,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrganizationInput() when $default != null:
        return $default(
          _that.name,
          _that.kind,
          _that.countryCode,
          _that.countryName,
          _that.region,
          _that.contactName,
          _that.contactEmail,
          _that.contactPhone,
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
      String? name,
      String? kind,
      String? countryCode,
      String? countryName,
      String? region,
      String? contactName,
      String? contactEmail,
      String? contactPhone,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrganizationInput():
        return $default(
          _that.name,
          _that.kind,
          _that.countryCode,
          _that.countryName,
          _that.region,
          _that.contactName,
          _that.contactEmail,
          _that.contactPhone,
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
      String? name,
      String? kind,
      String? countryCode,
      String? countryName,
      String? region,
      String? contactName,
      String? contactEmail,
      String? contactPhone,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrganizationInput() when $default != null:
        return $default(
          _that.name,
          _that.kind,
          _that.countryCode,
          _that.countryName,
          _that.region,
          _that.contactName,
          _that.contactEmail,
          _that.contactPhone,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OrganizationInput implements OrganizationInput {
  const _OrganizationInput({
    this.name,
    this.kind,
    this.countryCode,
    this.countryName,
    this.region,
    this.contactName,
    this.contactEmail,
    this.contactPhone,
  });
  factory _OrganizationInput.fromJson(Map<String, dynamic> json) =>
      _$OrganizationInputFromJson(json);

  @override
  final String? name;
  @override
  final String? kind;
  @override
  final String? countryCode;
  @override
  final String? countryName;
  @override
  final String? region;
  @override
  final String? contactName;
  @override
  final String? contactEmail;
  @override
  final String? contactPhone;

  /// Create a copy of OrganizationInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrganizationInputCopyWith<_OrganizationInput> get copyWith =>
      __$OrganizationInputCopyWithImpl<_OrganizationInput>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OrganizationInputToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrganizationInput &&
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
                other.contactPhone == contactPhone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    kind,
    countryCode,
    countryName,
    region,
    contactName,
    contactEmail,
    contactPhone,
  );

  @override
  String toString() {
    return 'OrganizationInput(name: $name, kind: $kind, countryCode: $countryCode, countryName: $countryName, region: $region, contactName: $contactName, contactEmail: $contactEmail, contactPhone: $contactPhone)';
  }
}

/// @nodoc
abstract mixin class _$OrganizationInputCopyWith<$Res>
    implements $OrganizationInputCopyWith<$Res> {
  factory _$OrganizationInputCopyWith(
    _OrganizationInput value,
    $Res Function(_OrganizationInput) _then,
  ) = __$OrganizationInputCopyWithImpl;
  @override
  @useResult
  $Res call({
    String? name,
    String? kind,
    String? countryCode,
    String? countryName,
    String? region,
    String? contactName,
    String? contactEmail,
    String? contactPhone,
  });
}

/// @nodoc
class __$OrganizationInputCopyWithImpl<$Res>
    implements _$OrganizationInputCopyWith<$Res> {
  __$OrganizationInputCopyWithImpl(this._self, this._then);

  final _OrganizationInput _self;
  final $Res Function(_OrganizationInput) _then;

  /// Create a copy of OrganizationInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = freezed,
    Object? kind = freezed,
    Object? countryCode = freezed,
    Object? countryName = freezed,
    Object? region = freezed,
    Object? contactName = freezed,
    Object? contactEmail = freezed,
    Object? contactPhone = freezed,
  }) {
    return _then(
      _OrganizationInput(
        name: freezed == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        kind: freezed == kind
            ? _self.kind
            : kind // ignore: cast_nullable_to_non_nullable
                  as String?,
        countryCode: freezed == countryCode
            ? _self.countryCode
            : countryCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        countryName: freezed == countryName
            ? _self.countryName
            : countryName // ignore: cast_nullable_to_non_nullable
                  as String?,
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
      ),
    );
  }
}
