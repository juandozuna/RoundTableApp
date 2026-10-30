// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'organization_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrganizationRecord {
  String get id;
  String get name;
  String get kind;
  String get countryCode;
  String get countryName;
  String? get region;
  String get status;

  /// Create a copy of OrganizationRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrganizationRecordCopyWith<OrganizationRecord> get copyWith =>
      _$OrganizationRecordCopyWithImpl<OrganizationRecord>(
        this as OrganizationRecord,
        _$identity,
      );

  /// Serializes this OrganizationRecord to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrganizationRecord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.countryName, countryName) ||
                other.countryName == countryName) &&
            (identical(other.region, region) || other.region == region) &&
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
    status,
  );

  @override
  String toString() {
    return 'OrganizationRecord(id: $id, name: $name, kind: $kind, countryCode: $countryCode, countryName: $countryName, region: $region, status: $status)';
  }
}

/// @nodoc
abstract mixin class $OrganizationRecordCopyWith<$Res> {
  factory $OrganizationRecordCopyWith(
    OrganizationRecord value,
    $Res Function(OrganizationRecord) _then,
  ) = _$OrganizationRecordCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String name,
    String kind,
    String countryCode,
    String countryName,
    String? region,
    String status,
  });
}

/// @nodoc
class _$OrganizationRecordCopyWithImpl<$Res>
    implements $OrganizationRecordCopyWith<$Res> {
  _$OrganizationRecordCopyWithImpl(this._self, this._then);

  final OrganizationRecord _self;
  final $Res Function(OrganizationRecord) _then;

  /// Create a copy of OrganizationRecord
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
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [OrganizationRecord].
extension OrganizationRecordPatterns on OrganizationRecord {
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
    TResult Function(_OrganizationRecord value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrganizationRecord() when $default != null:
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
    TResult Function(_OrganizationRecord value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrganizationRecord():
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
    TResult? Function(_OrganizationRecord value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrganizationRecord() when $default != null:
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
      String status,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrganizationRecord() when $default != null:
        return $default(
          _that.id,
          _that.name,
          _that.kind,
          _that.countryCode,
          _that.countryName,
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
      String name,
      String kind,
      String countryCode,
      String countryName,
      String? region,
      String status,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrganizationRecord():
        return $default(
          _that.id,
          _that.name,
          _that.kind,
          _that.countryCode,
          _that.countryName,
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
      String name,
      String kind,
      String countryCode,
      String countryName,
      String? region,
      String status,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrganizationRecord() when $default != null:
        return $default(
          _that.id,
          _that.name,
          _that.kind,
          _that.countryCode,
          _that.countryName,
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
class _OrganizationRecord implements OrganizationRecord {
  const _OrganizationRecord({
    required this.id,
    required this.name,
    required this.kind,
    required this.countryCode,
    required this.countryName,
    this.region,
    required this.status,
  });
  factory _OrganizationRecord.fromJson(Map<String, dynamic> json) =>
      _$OrganizationRecordFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String kind;
  @override
  final String countryCode;
  @override
  final String countryName;
  @override
  final String? region;
  @override
  final String status;

  /// Create a copy of OrganizationRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrganizationRecordCopyWith<_OrganizationRecord> get copyWith =>
      __$OrganizationRecordCopyWithImpl<_OrganizationRecord>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OrganizationRecordToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrganizationRecord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.countryName, countryName) ||
                other.countryName == countryName) &&
            (identical(other.region, region) || other.region == region) &&
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
    status,
  );

  @override
  String toString() {
    return 'OrganizationRecord(id: $id, name: $name, kind: $kind, countryCode: $countryCode, countryName: $countryName, region: $region, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$OrganizationRecordCopyWith<$Res>
    implements $OrganizationRecordCopyWith<$Res> {
  factory _$OrganizationRecordCopyWith(
    _OrganizationRecord value,
    $Res Function(_OrganizationRecord) _then,
  ) = __$OrganizationRecordCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String kind,
    String countryCode,
    String countryName,
    String? region,
    String status,
  });
}

/// @nodoc
class __$OrganizationRecordCopyWithImpl<$Res>
    implements _$OrganizationRecordCopyWith<$Res> {
  __$OrganizationRecordCopyWithImpl(this._self, this._then);

  final _OrganizationRecord _self;
  final $Res Function(_OrganizationRecord) _then;

  /// Create a copy of OrganizationRecord
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
    Object? status = null,
  }) {
    return _then(
      _OrganizationRecord(
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
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}
