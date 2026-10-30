// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocationRecord {
  String get id;
  String get organizationId;
  String get name;
  String? get city;
  String? get region;
  String get status;

  /// Create a copy of LocationRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LocationRecordCopyWith<LocationRecord> get copyWith =>
      _$LocationRecordCopyWithImpl<LocationRecord>(
        this as LocationRecord,
        _$identity,
      );

  /// Serializes this LocationRecord to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LocationRecord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, organizationId, name, city, region, status);

  @override
  String toString() {
    return 'LocationRecord(id: $id, organizationId: $organizationId, name: $name, city: $city, region: $region, status: $status)';
  }
}

/// @nodoc
abstract mixin class $LocationRecordCopyWith<$Res> {
  factory $LocationRecordCopyWith(
    LocationRecord value,
    $Res Function(LocationRecord) _then,
  ) = _$LocationRecordCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String organizationId,
    String name,
    String? city,
    String? region,
    String status,
  });
}

/// @nodoc
class _$LocationRecordCopyWithImpl<$Res>
    implements $LocationRecordCopyWith<$Res> {
  _$LocationRecordCopyWithImpl(this._self, this._then);

  final LocationRecord _self;
  final $Res Function(LocationRecord) _then;

  /// Create a copy of LocationRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? organizationId = null,
    Object? name = null,
    Object? city = freezed,
    Object? region = freezed,
    Object? status = null,
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
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        city: freezed == city
            ? _self.city
            : city // ignore: cast_nullable_to_non_nullable
                  as String?,
        region: freezed == region
            ? _self.region
            : region // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [LocationRecord].
extension LocationRecordPatterns on LocationRecord {
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
    TResult Function(_LocationRecord value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocationRecord() when $default != null:
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
    TResult Function(_LocationRecord value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationRecord():
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
    TResult? Function(_LocationRecord value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationRecord() when $default != null:
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
      String name,
      String? city,
      String? region,
      String status,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocationRecord() when $default != null:
        return $default(
          _that.id,
          _that.organizationId,
          _that.name,
          _that.city,
          _that.region,
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
      String organizationId,
      String name,
      String? city,
      String? region,
      String status,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationRecord():
        return $default(
          _that.id,
          _that.organizationId,
          _that.name,
          _that.city,
          _that.region,
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
      String organizationId,
      String name,
      String? city,
      String? region,
      String status,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationRecord() when $default != null:
        return $default(
          _that.id,
          _that.organizationId,
          _that.name,
          _that.city,
          _that.region,
          _that.status,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LocationRecord implements LocationRecord {
  const _LocationRecord({
    required this.id,
    required this.organizationId,
    required this.name,
    this.city,
    this.region,
    required this.status,
  });
  factory _LocationRecord.fromJson(Map<String, dynamic> json) =>
      _$LocationRecordFromJson(json);

  @override
  final String id;
  @override
  final String organizationId;
  @override
  final String name;
  @override
  final String? city;
  @override
  final String? region;
  @override
  final String status;

  /// Create a copy of LocationRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LocationRecordCopyWith<_LocationRecord> get copyWith =>
      __$LocationRecordCopyWithImpl<_LocationRecord>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LocationRecordToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocationRecord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, organizationId, name, city, region, status);

  @override
  String toString() {
    return 'LocationRecord(id: $id, organizationId: $organizationId, name: $name, city: $city, region: $region, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$LocationRecordCopyWith<$Res>
    implements $LocationRecordCopyWith<$Res> {
  factory _$LocationRecordCopyWith(
    _LocationRecord value,
    $Res Function(_LocationRecord) _then,
  ) = __$LocationRecordCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String organizationId,
    String name,
    String? city,
    String? region,
    String status,
  });
}

/// @nodoc
class __$LocationRecordCopyWithImpl<$Res>
    implements _$LocationRecordCopyWith<$Res> {
  __$LocationRecordCopyWithImpl(this._self, this._then);

  final _LocationRecord _self;
  final $Res Function(_LocationRecord) _then;

  /// Create a copy of LocationRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? organizationId = null,
    Object? name = null,
    Object? city = freezed,
    Object? region = freezed,
    Object? status = null,
  }) {
    return _then(
      _LocationRecord(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        organizationId: null == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        city: freezed == city
            ? _self.city
            : city // ignore: cast_nullable_to_non_nullable
                  as String?,
        region: freezed == region
            ? _self.region
            : region // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}
