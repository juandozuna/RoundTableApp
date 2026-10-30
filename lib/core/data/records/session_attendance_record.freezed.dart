// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_attendance_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionAttendanceRecord {
  String get id;
  String get organizationId;
  String get roundTableId;
  DateTime? get deviceCreatedAt;
  DateTime? get deviceModifiedAt;
  DateTime? get receivedAt;
  bool get syncedLate;
  DateTime? get archivedAt;
  DateTime? get createdAt;
  DateTime? get updatedAt;
  String get sessionId;
  String get personId;
  AttendanceStatus get status;
  String get source;
  String? get recordedByPersonId;

  /// Create a copy of SessionAttendanceRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SessionAttendanceRecordCopyWith<SessionAttendanceRecord> get copyWith =>
      _$SessionAttendanceRecordCopyWithImpl<SessionAttendanceRecord>(
        this as SessionAttendanceRecord,
        _$identity,
      );

  /// Serializes this SessionAttendanceRecord to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SessionAttendanceRecord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.roundTableId, roundTableId) ||
                other.roundTableId == roundTableId) &&
            (identical(other.deviceCreatedAt, deviceCreatedAt) ||
                other.deviceCreatedAt == deviceCreatedAt) &&
            (identical(other.deviceModifiedAt, deviceModifiedAt) ||
                other.deviceModifiedAt == deviceModifiedAt) &&
            (identical(other.receivedAt, receivedAt) ||
                other.receivedAt == receivedAt) &&
            (identical(other.syncedLate, syncedLate) ||
                other.syncedLate == syncedLate) &&
            (identical(other.archivedAt, archivedAt) ||
                other.archivedAt == archivedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.personId, personId) ||
                other.personId == personId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.recordedByPersonId, recordedByPersonId) ||
                other.recordedByPersonId == recordedByPersonId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    organizationId,
    roundTableId,
    deviceCreatedAt,
    deviceModifiedAt,
    receivedAt,
    syncedLate,
    archivedAt,
    createdAt,
    updatedAt,
    sessionId,
    personId,
    status,
    source,
    recordedByPersonId,
  );

  @override
  String toString() {
    return 'SessionAttendanceRecord(id: $id, organizationId: $organizationId, roundTableId: $roundTableId, deviceCreatedAt: $deviceCreatedAt, deviceModifiedAt: $deviceModifiedAt, receivedAt: $receivedAt, syncedLate: $syncedLate, archivedAt: $archivedAt, createdAt: $createdAt, updatedAt: $updatedAt, sessionId: $sessionId, personId: $personId, status: $status, source: $source, recordedByPersonId: $recordedByPersonId)';
  }
}

/// @nodoc
abstract mixin class $SessionAttendanceRecordCopyWith<$Res> {
  factory $SessionAttendanceRecordCopyWith(
    SessionAttendanceRecord value,
    $Res Function(SessionAttendanceRecord) _then,
  ) = _$SessionAttendanceRecordCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String organizationId,
    String roundTableId,
    DateTime? deviceCreatedAt,
    DateTime? deviceModifiedAt,
    DateTime? receivedAt,
    bool syncedLate,
    DateTime? archivedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    String sessionId,
    String personId,
    AttendanceStatus status,
    String source,
    String? recordedByPersonId,
  });
}

/// @nodoc
class _$SessionAttendanceRecordCopyWithImpl<$Res>
    implements $SessionAttendanceRecordCopyWith<$Res> {
  _$SessionAttendanceRecordCopyWithImpl(this._self, this._then);

  final SessionAttendanceRecord _self;
  final $Res Function(SessionAttendanceRecord) _then;

  /// Create a copy of SessionAttendanceRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? organizationId = null,
    Object? roundTableId = null,
    Object? deviceCreatedAt = freezed,
    Object? deviceModifiedAt = freezed,
    Object? receivedAt = freezed,
    Object? syncedLate = null,
    Object? archivedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? sessionId = null,
    Object? personId = null,
    Object? status = null,
    Object? source = null,
    Object? recordedByPersonId = freezed,
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
        roundTableId: null == roundTableId
            ? _self.roundTableId
            : roundTableId // ignore: cast_nullable_to_non_nullable
                  as String,
        deviceCreatedAt: freezed == deviceCreatedAt
            ? _self.deviceCreatedAt
            : deviceCreatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        deviceModifiedAt: freezed == deviceModifiedAt
            ? _self.deviceModifiedAt
            : deviceModifiedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        syncedLate: null == syncedLate
            ? _self.syncedLate
            : syncedLate // ignore: cast_nullable_to_non_nullable
                  as bool,
        archivedAt: freezed == archivedAt
            ? _self.archivedAt
            : archivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        createdAt: freezed == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _self.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        sessionId: null == sessionId
            ? _self.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String,
        personId: null == personId
            ? _self.personId
            : personId // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as AttendanceStatus,
        source: null == source
            ? _self.source
            : source // ignore: cast_nullable_to_non_nullable
                  as String,
        recordedByPersonId: freezed == recordedByPersonId
            ? _self.recordedByPersonId
            : recordedByPersonId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [SessionAttendanceRecord].
extension SessionAttendanceRecordPatterns on SessionAttendanceRecord {
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
    TResult Function(_SessionAttendanceRecord value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SessionAttendanceRecord() when $default != null:
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
    TResult Function(_SessionAttendanceRecord value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionAttendanceRecord():
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
    TResult? Function(_SessionAttendanceRecord value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionAttendanceRecord() when $default != null:
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
      String roundTableId,
      DateTime? deviceCreatedAt,
      DateTime? deviceModifiedAt,
      DateTime? receivedAt,
      bool syncedLate,
      DateTime? archivedAt,
      DateTime? createdAt,
      DateTime? updatedAt,
      String sessionId,
      String personId,
      AttendanceStatus status,
      String source,
      String? recordedByPersonId,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SessionAttendanceRecord() when $default != null:
        return $default(
          _that.id,
          _that.organizationId,
          _that.roundTableId,
          _that.deviceCreatedAt,
          _that.deviceModifiedAt,
          _that.receivedAt,
          _that.syncedLate,
          _that.archivedAt,
          _that.createdAt,
          _that.updatedAt,
          _that.sessionId,
          _that.personId,
          _that.status,
          _that.source,
          _that.recordedByPersonId,
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
      String roundTableId,
      DateTime? deviceCreatedAt,
      DateTime? deviceModifiedAt,
      DateTime? receivedAt,
      bool syncedLate,
      DateTime? archivedAt,
      DateTime? createdAt,
      DateTime? updatedAt,
      String sessionId,
      String personId,
      AttendanceStatus status,
      String source,
      String? recordedByPersonId,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionAttendanceRecord():
        return $default(
          _that.id,
          _that.organizationId,
          _that.roundTableId,
          _that.deviceCreatedAt,
          _that.deviceModifiedAt,
          _that.receivedAt,
          _that.syncedLate,
          _that.archivedAt,
          _that.createdAt,
          _that.updatedAt,
          _that.sessionId,
          _that.personId,
          _that.status,
          _that.source,
          _that.recordedByPersonId,
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
      String roundTableId,
      DateTime? deviceCreatedAt,
      DateTime? deviceModifiedAt,
      DateTime? receivedAt,
      bool syncedLate,
      DateTime? archivedAt,
      DateTime? createdAt,
      DateTime? updatedAt,
      String sessionId,
      String personId,
      AttendanceStatus status,
      String source,
      String? recordedByPersonId,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionAttendanceRecord() when $default != null:
        return $default(
          _that.id,
          _that.organizationId,
          _that.roundTableId,
          _that.deviceCreatedAt,
          _that.deviceModifiedAt,
          _that.receivedAt,
          _that.syncedLate,
          _that.archivedAt,
          _that.createdAt,
          _that.updatedAt,
          _that.sessionId,
          _that.personId,
          _that.status,
          _that.source,
          _that.recordedByPersonId,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SessionAttendanceRecord implements SessionAttendanceRecord {
  const _SessionAttendanceRecord({
    required this.id,
    required this.organizationId,
    required this.roundTableId,
    this.deviceCreatedAt,
    this.deviceModifiedAt,
    this.receivedAt,
    this.syncedLate = false,
    this.archivedAt,
    this.createdAt,
    this.updatedAt,
    required this.sessionId,
    required this.personId,
    required this.status,
    required this.source,
    this.recordedByPersonId,
  });
  factory _SessionAttendanceRecord.fromJson(Map<String, dynamic> json) =>
      _$SessionAttendanceRecordFromJson(json);

  @override
  final String id;
  @override
  final String organizationId;
  @override
  final String roundTableId;
  @override
  final DateTime? deviceCreatedAt;
  @override
  final DateTime? deviceModifiedAt;
  @override
  final DateTime? receivedAt;
  @override
  @JsonKey()
  final bool syncedLate;
  @override
  final DateTime? archivedAt;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final String sessionId;
  @override
  final String personId;
  @override
  final AttendanceStatus status;
  @override
  final String source;
  @override
  final String? recordedByPersonId;

  /// Create a copy of SessionAttendanceRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SessionAttendanceRecordCopyWith<_SessionAttendanceRecord> get copyWith =>
      __$SessionAttendanceRecordCopyWithImpl<_SessionAttendanceRecord>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$SessionAttendanceRecordToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SessionAttendanceRecord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.roundTableId, roundTableId) ||
                other.roundTableId == roundTableId) &&
            (identical(other.deviceCreatedAt, deviceCreatedAt) ||
                other.deviceCreatedAt == deviceCreatedAt) &&
            (identical(other.deviceModifiedAt, deviceModifiedAt) ||
                other.deviceModifiedAt == deviceModifiedAt) &&
            (identical(other.receivedAt, receivedAt) ||
                other.receivedAt == receivedAt) &&
            (identical(other.syncedLate, syncedLate) ||
                other.syncedLate == syncedLate) &&
            (identical(other.archivedAt, archivedAt) ||
                other.archivedAt == archivedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.personId, personId) ||
                other.personId == personId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.recordedByPersonId, recordedByPersonId) ||
                other.recordedByPersonId == recordedByPersonId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    organizationId,
    roundTableId,
    deviceCreatedAt,
    deviceModifiedAt,
    receivedAt,
    syncedLate,
    archivedAt,
    createdAt,
    updatedAt,
    sessionId,
    personId,
    status,
    source,
    recordedByPersonId,
  );

  @override
  String toString() {
    return 'SessionAttendanceRecord(id: $id, organizationId: $organizationId, roundTableId: $roundTableId, deviceCreatedAt: $deviceCreatedAt, deviceModifiedAt: $deviceModifiedAt, receivedAt: $receivedAt, syncedLate: $syncedLate, archivedAt: $archivedAt, createdAt: $createdAt, updatedAt: $updatedAt, sessionId: $sessionId, personId: $personId, status: $status, source: $source, recordedByPersonId: $recordedByPersonId)';
  }
}

/// @nodoc
abstract mixin class _$SessionAttendanceRecordCopyWith<$Res>
    implements $SessionAttendanceRecordCopyWith<$Res> {
  factory _$SessionAttendanceRecordCopyWith(
    _SessionAttendanceRecord value,
    $Res Function(_SessionAttendanceRecord) _then,
  ) = __$SessionAttendanceRecordCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String organizationId,
    String roundTableId,
    DateTime? deviceCreatedAt,
    DateTime? deviceModifiedAt,
    DateTime? receivedAt,
    bool syncedLate,
    DateTime? archivedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    String sessionId,
    String personId,
    AttendanceStatus status,
    String source,
    String? recordedByPersonId,
  });
}

/// @nodoc
class __$SessionAttendanceRecordCopyWithImpl<$Res>
    implements _$SessionAttendanceRecordCopyWith<$Res> {
  __$SessionAttendanceRecordCopyWithImpl(this._self, this._then);

  final _SessionAttendanceRecord _self;
  final $Res Function(_SessionAttendanceRecord) _then;

  /// Create a copy of SessionAttendanceRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? organizationId = null,
    Object? roundTableId = null,
    Object? deviceCreatedAt = freezed,
    Object? deviceModifiedAt = freezed,
    Object? receivedAt = freezed,
    Object? syncedLate = null,
    Object? archivedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? sessionId = null,
    Object? personId = null,
    Object? status = null,
    Object? source = null,
    Object? recordedByPersonId = freezed,
  }) {
    return _then(
      _SessionAttendanceRecord(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        organizationId: null == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String,
        roundTableId: null == roundTableId
            ? _self.roundTableId
            : roundTableId // ignore: cast_nullable_to_non_nullable
                  as String,
        deviceCreatedAt: freezed == deviceCreatedAt
            ? _self.deviceCreatedAt
            : deviceCreatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        deviceModifiedAt: freezed == deviceModifiedAt
            ? _self.deviceModifiedAt
            : deviceModifiedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        receivedAt: freezed == receivedAt
            ? _self.receivedAt
            : receivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        syncedLate: null == syncedLate
            ? _self.syncedLate
            : syncedLate // ignore: cast_nullable_to_non_nullable
                  as bool,
        archivedAt: freezed == archivedAt
            ? _self.archivedAt
            : archivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        createdAt: freezed == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _self.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        sessionId: null == sessionId
            ? _self.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String,
        personId: null == personId
            ? _self.personId
            : personId // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as AttendanceStatus,
        source: null == source
            ? _self.source
            : source // ignore: cast_nullable_to_non_nullable
                  as String,
        recordedByPersonId: freezed == recordedByPersonId
            ? _self.recordedByPersonId
            : recordedByPersonId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}
