// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'round_table_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoundTableRecord {
  String get id;
  String get organizationId;
  String get locationId;
  String get name;
  String get code;
  int get weekday;
  String get startTime;
  String get timezone;
  int get durationMinutes;
  String get status;
  String? get currentValueId;

  /// Create a copy of RoundTableRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RoundTableRecordCopyWith<RoundTableRecord> get copyWith =>
      _$RoundTableRecordCopyWithImpl<RoundTableRecord>(
        this as RoundTableRecord,
        _$identity,
      );

  /// Serializes this RoundTableRecord to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RoundTableRecord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.weekday, weekday) || other.weekday == weekday) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.currentValueId, currentValueId) ||
                other.currentValueId == currentValueId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    organizationId,
    locationId,
    name,
    code,
    weekday,
    startTime,
    timezone,
    durationMinutes,
    status,
    currentValueId,
  );

  @override
  String toString() {
    return 'RoundTableRecord(id: $id, organizationId: $organizationId, locationId: $locationId, name: $name, code: $code, weekday: $weekday, startTime: $startTime, timezone: $timezone, durationMinutes: $durationMinutes, status: $status, currentValueId: $currentValueId)';
  }
}

/// @nodoc
abstract mixin class $RoundTableRecordCopyWith<$Res> {
  factory $RoundTableRecordCopyWith(
    RoundTableRecord value,
    $Res Function(RoundTableRecord) _then,
  ) = _$RoundTableRecordCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String organizationId,
    String locationId,
    String name,
    String code,
    int weekday,
    String startTime,
    String timezone,
    int durationMinutes,
    String status,
    String? currentValueId,
  });
}

/// @nodoc
class _$RoundTableRecordCopyWithImpl<$Res>
    implements $RoundTableRecordCopyWith<$Res> {
  _$RoundTableRecordCopyWithImpl(this._self, this._then);

  final RoundTableRecord _self;
  final $Res Function(RoundTableRecord) _then;

  /// Create a copy of RoundTableRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? organizationId = null,
    Object? locationId = null,
    Object? name = null,
    Object? code = null,
    Object? weekday = null,
    Object? startTime = null,
    Object? timezone = null,
    Object? durationMinutes = null,
    Object? status = null,
    Object? currentValueId = freezed,
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
        locationId: null == locationId
            ? _self.locationId
            : locationId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        code: null == code
            ? _self.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        weekday: null == weekday
            ? _self.weekday
            : weekday // ignore: cast_nullable_to_non_nullable
                  as int,
        startTime: null == startTime
            ? _self.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as String,
        timezone: null == timezone
            ? _self.timezone
            : timezone // ignore: cast_nullable_to_non_nullable
                  as String,
        durationMinutes: null == durationMinutes
            ? _self.durationMinutes
            : durationMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        currentValueId: freezed == currentValueId
            ? _self.currentValueId
            : currentValueId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [RoundTableRecord].
extension RoundTableRecordPatterns on RoundTableRecord {
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
    TResult Function(_RoundTableRecord value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RoundTableRecord() when $default != null:
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
    TResult Function(_RoundTableRecord value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RoundTableRecord():
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
    TResult? Function(_RoundTableRecord value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RoundTableRecord() when $default != null:
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
      String locationId,
      String name,
      String code,
      int weekday,
      String startTime,
      String timezone,
      int durationMinutes,
      String status,
      String? currentValueId,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RoundTableRecord() when $default != null:
        return $default(
          _that.id,
          _that.organizationId,
          _that.locationId,
          _that.name,
          _that.code,
          _that.weekday,
          _that.startTime,
          _that.timezone,
          _that.durationMinutes,
          _that.status,
          _that.currentValueId,
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
      String locationId,
      String name,
      String code,
      int weekday,
      String startTime,
      String timezone,
      int durationMinutes,
      String status,
      String? currentValueId,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RoundTableRecord():
        return $default(
          _that.id,
          _that.organizationId,
          _that.locationId,
          _that.name,
          _that.code,
          _that.weekday,
          _that.startTime,
          _that.timezone,
          _that.durationMinutes,
          _that.status,
          _that.currentValueId,
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
      String locationId,
      String name,
      String code,
      int weekday,
      String startTime,
      String timezone,
      int durationMinutes,
      String status,
      String? currentValueId,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RoundTableRecord() when $default != null:
        return $default(
          _that.id,
          _that.organizationId,
          _that.locationId,
          _that.name,
          _that.code,
          _that.weekday,
          _that.startTime,
          _that.timezone,
          _that.durationMinutes,
          _that.status,
          _that.currentValueId,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RoundTableRecord implements RoundTableRecord {
  const _RoundTableRecord({
    required this.id,
    required this.organizationId,
    required this.locationId,
    required this.name,
    required this.code,
    required this.weekday,
    required this.startTime,
    required this.timezone,
    required this.durationMinutes,
    required this.status,
    this.currentValueId,
  });
  factory _RoundTableRecord.fromJson(Map<String, dynamic> json) =>
      _$RoundTableRecordFromJson(json);

  @override
  final String id;
  @override
  final String organizationId;
  @override
  final String locationId;
  @override
  final String name;
  @override
  final String code;
  @override
  final int weekday;
  @override
  final String startTime;
  @override
  final String timezone;
  @override
  final int durationMinutes;
  @override
  final String status;
  @override
  final String? currentValueId;

  /// Create a copy of RoundTableRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RoundTableRecordCopyWith<_RoundTableRecord> get copyWith =>
      __$RoundTableRecordCopyWithImpl<_RoundTableRecord>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RoundTableRecordToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RoundTableRecord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.weekday, weekday) || other.weekday == weekday) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.currentValueId, currentValueId) ||
                other.currentValueId == currentValueId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    organizationId,
    locationId,
    name,
    code,
    weekday,
    startTime,
    timezone,
    durationMinutes,
    status,
    currentValueId,
  );

  @override
  String toString() {
    return 'RoundTableRecord(id: $id, organizationId: $organizationId, locationId: $locationId, name: $name, code: $code, weekday: $weekday, startTime: $startTime, timezone: $timezone, durationMinutes: $durationMinutes, status: $status, currentValueId: $currentValueId)';
  }
}

/// @nodoc
abstract mixin class _$RoundTableRecordCopyWith<$Res>
    implements $RoundTableRecordCopyWith<$Res> {
  factory _$RoundTableRecordCopyWith(
    _RoundTableRecord value,
    $Res Function(_RoundTableRecord) _then,
  ) = __$RoundTableRecordCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String organizationId,
    String locationId,
    String name,
    String code,
    int weekday,
    String startTime,
    String timezone,
    int durationMinutes,
    String status,
    String? currentValueId,
  });
}

/// @nodoc
class __$RoundTableRecordCopyWithImpl<$Res>
    implements _$RoundTableRecordCopyWith<$Res> {
  __$RoundTableRecordCopyWithImpl(this._self, this._then);

  final _RoundTableRecord _self;
  final $Res Function(_RoundTableRecord) _then;

  /// Create a copy of RoundTableRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? organizationId = null,
    Object? locationId = null,
    Object? name = null,
    Object? code = null,
    Object? weekday = null,
    Object? startTime = null,
    Object? timezone = null,
    Object? durationMinutes = null,
    Object? status = null,
    Object? currentValueId = freezed,
  }) {
    return _then(
      _RoundTableRecord(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        organizationId: null == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String,
        locationId: null == locationId
            ? _self.locationId
            : locationId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        code: null == code
            ? _self.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        weekday: null == weekday
            ? _self.weekday
            : weekday // ignore: cast_nullable_to_non_nullable
                  as int,
        startTime: null == startTime
            ? _self.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as String,
        timezone: null == timezone
            ? _self.timezone
            : timezone // ignore: cast_nullable_to_non_nullable
                  as String,
        durationMinutes: null == durationMinutes
            ? _self.durationMinutes
            : durationMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        currentValueId: freezed == currentValueId
            ? _self.currentValueId
            : currentValueId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}
