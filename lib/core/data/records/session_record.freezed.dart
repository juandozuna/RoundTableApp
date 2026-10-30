// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionRecord {
  String get id;
  String get organizationId;
  String get roundTableId;
  String get valueId;
  String? get followUpValueId;
  SessionStatus get status;
  SessionStage get stage;
  DateTime get scheduledAt;
  DateTime? get startedAt;
  DateTime? get endedAt;
  DateTime? get answersClosedAt;
  String? get cancelledReason;
  String? get completion;
  String? get incompleteReason;
  String get kind;
  DateTime? get originalScheduledAt;
  String? get facilitatorPersonId;
  DateTime? get deviceModifiedAt;
  DateTime? get archivedAt;
  DateTime? get createdAt;
  DateTime? get updatedAt;

  /// Create a copy of SessionRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SessionRecordCopyWith<SessionRecord> get copyWith =>
      _$SessionRecordCopyWithImpl<SessionRecord>(
        this as SessionRecord,
        _$identity,
      );

  /// Serializes this SessionRecord to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SessionRecord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.roundTableId, roundTableId) ||
                other.roundTableId == roundTableId) &&
            (identical(other.valueId, valueId) || other.valueId == valueId) &&
            (identical(other.followUpValueId, followUpValueId) ||
                other.followUpValueId == followUpValueId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.endedAt, endedAt) || other.endedAt == endedAt) &&
            (identical(other.answersClosedAt, answersClosedAt) ||
                other.answersClosedAt == answersClosedAt) &&
            (identical(other.cancelledReason, cancelledReason) ||
                other.cancelledReason == cancelledReason) &&
            (identical(other.completion, completion) ||
                other.completion == completion) &&
            (identical(other.incompleteReason, incompleteReason) ||
                other.incompleteReason == incompleteReason) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.originalScheduledAt, originalScheduledAt) ||
                other.originalScheduledAt == originalScheduledAt) &&
            (identical(other.facilitatorPersonId, facilitatorPersonId) ||
                other.facilitatorPersonId == facilitatorPersonId) &&
            (identical(other.deviceModifiedAt, deviceModifiedAt) ||
                other.deviceModifiedAt == deviceModifiedAt) &&
            (identical(other.archivedAt, archivedAt) ||
                other.archivedAt == archivedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    organizationId,
    roundTableId,
    valueId,
    followUpValueId,
    status,
    stage,
    scheduledAt,
    startedAt,
    endedAt,
    answersClosedAt,
    cancelledReason,
    completion,
    incompleteReason,
    kind,
    originalScheduledAt,
    facilitatorPersonId,
    deviceModifiedAt,
    archivedAt,
    createdAt,
    updatedAt,
  ]);

  @override
  String toString() {
    return 'SessionRecord(id: $id, organizationId: $organizationId, roundTableId: $roundTableId, valueId: $valueId, followUpValueId: $followUpValueId, status: $status, stage: $stage, scheduledAt: $scheduledAt, startedAt: $startedAt, endedAt: $endedAt, answersClosedAt: $answersClosedAt, cancelledReason: $cancelledReason, completion: $completion, incompleteReason: $incompleteReason, kind: $kind, originalScheduledAt: $originalScheduledAt, facilitatorPersonId: $facilitatorPersonId, deviceModifiedAt: $deviceModifiedAt, archivedAt: $archivedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $SessionRecordCopyWith<$Res> {
  factory $SessionRecordCopyWith(
    SessionRecord value,
    $Res Function(SessionRecord) _then,
  ) = _$SessionRecordCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String organizationId,
    String roundTableId,
    String valueId,
    String? followUpValueId,
    SessionStatus status,
    SessionStage stage,
    DateTime scheduledAt,
    DateTime? startedAt,
    DateTime? endedAt,
    DateTime? answersClosedAt,
    String? cancelledReason,
    String? completion,
    String? incompleteReason,
    String kind,
    DateTime? originalScheduledAt,
    String? facilitatorPersonId,
    DateTime? deviceModifiedAt,
    DateTime? archivedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$SessionRecordCopyWithImpl<$Res>
    implements $SessionRecordCopyWith<$Res> {
  _$SessionRecordCopyWithImpl(this._self, this._then);

  final SessionRecord _self;
  final $Res Function(SessionRecord) _then;

  /// Create a copy of SessionRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? organizationId = null,
    Object? roundTableId = null,
    Object? valueId = null,
    Object? followUpValueId = freezed,
    Object? status = null,
    Object? stage = null,
    Object? scheduledAt = null,
    Object? startedAt = freezed,
    Object? endedAt = freezed,
    Object? answersClosedAt = freezed,
    Object? cancelledReason = freezed,
    Object? completion = freezed,
    Object? incompleteReason = freezed,
    Object? kind = null,
    Object? originalScheduledAt = freezed,
    Object? facilitatorPersonId = freezed,
    Object? deviceModifiedAt = freezed,
    Object? archivedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
        valueId: null == valueId
            ? _self.valueId
            : valueId // ignore: cast_nullable_to_non_nullable
                  as String,
        followUpValueId: freezed == followUpValueId
            ? _self.followUpValueId
            : followUpValueId // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as SessionStatus,
        stage: null == stage
            ? _self.stage
            : stage // ignore: cast_nullable_to_non_nullable
                  as SessionStage,
        scheduledAt: null == scheduledAt
            ? _self.scheduledAt
            : scheduledAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        startedAt: freezed == startedAt
            ? _self.startedAt
            : startedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        endedAt: freezed == endedAt
            ? _self.endedAt
            : endedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        answersClosedAt: freezed == answersClosedAt
            ? _self.answersClosedAt
            : answersClosedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        cancelledReason: freezed == cancelledReason
            ? _self.cancelledReason
            : cancelledReason // ignore: cast_nullable_to_non_nullable
                  as String?,
        completion: freezed == completion
            ? _self.completion
            : completion // ignore: cast_nullable_to_non_nullable
                  as String?,
        incompleteReason: freezed == incompleteReason
            ? _self.incompleteReason
            : incompleteReason // ignore: cast_nullable_to_non_nullable
                  as String?,
        kind: null == kind
            ? _self.kind
            : kind // ignore: cast_nullable_to_non_nullable
                  as String,
        originalScheduledAt: freezed == originalScheduledAt
            ? _self.originalScheduledAt
            : originalScheduledAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        facilitatorPersonId: freezed == facilitatorPersonId
            ? _self.facilitatorPersonId
            : facilitatorPersonId // ignore: cast_nullable_to_non_nullable
                  as String?,
        deviceModifiedAt: freezed == deviceModifiedAt
            ? _self.deviceModifiedAt
            : deviceModifiedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
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
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [SessionRecord].
extension SessionRecordPatterns on SessionRecord {
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
    TResult Function(_SessionRecord value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SessionRecord() when $default != null:
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
    TResult Function(_SessionRecord value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionRecord():
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
    TResult? Function(_SessionRecord value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionRecord() when $default != null:
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
      String valueId,
      String? followUpValueId,
      SessionStatus status,
      SessionStage stage,
      DateTime scheduledAt,
      DateTime? startedAt,
      DateTime? endedAt,
      DateTime? answersClosedAt,
      String? cancelledReason,
      String? completion,
      String? incompleteReason,
      String kind,
      DateTime? originalScheduledAt,
      String? facilitatorPersonId,
      DateTime? deviceModifiedAt,
      DateTime? archivedAt,
      DateTime? createdAt,
      DateTime? updatedAt,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SessionRecord() when $default != null:
        return $default(
          _that.id,
          _that.organizationId,
          _that.roundTableId,
          _that.valueId,
          _that.followUpValueId,
          _that.status,
          _that.stage,
          _that.scheduledAt,
          _that.startedAt,
          _that.endedAt,
          _that.answersClosedAt,
          _that.cancelledReason,
          _that.completion,
          _that.incompleteReason,
          _that.kind,
          _that.originalScheduledAt,
          _that.facilitatorPersonId,
          _that.deviceModifiedAt,
          _that.archivedAt,
          _that.createdAt,
          _that.updatedAt,
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
      String valueId,
      String? followUpValueId,
      SessionStatus status,
      SessionStage stage,
      DateTime scheduledAt,
      DateTime? startedAt,
      DateTime? endedAt,
      DateTime? answersClosedAt,
      String? cancelledReason,
      String? completion,
      String? incompleteReason,
      String kind,
      DateTime? originalScheduledAt,
      String? facilitatorPersonId,
      DateTime? deviceModifiedAt,
      DateTime? archivedAt,
      DateTime? createdAt,
      DateTime? updatedAt,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionRecord():
        return $default(
          _that.id,
          _that.organizationId,
          _that.roundTableId,
          _that.valueId,
          _that.followUpValueId,
          _that.status,
          _that.stage,
          _that.scheduledAt,
          _that.startedAt,
          _that.endedAt,
          _that.answersClosedAt,
          _that.cancelledReason,
          _that.completion,
          _that.incompleteReason,
          _that.kind,
          _that.originalScheduledAt,
          _that.facilitatorPersonId,
          _that.deviceModifiedAt,
          _that.archivedAt,
          _that.createdAt,
          _that.updatedAt,
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
      String valueId,
      String? followUpValueId,
      SessionStatus status,
      SessionStage stage,
      DateTime scheduledAt,
      DateTime? startedAt,
      DateTime? endedAt,
      DateTime? answersClosedAt,
      String? cancelledReason,
      String? completion,
      String? incompleteReason,
      String kind,
      DateTime? originalScheduledAt,
      String? facilitatorPersonId,
      DateTime? deviceModifiedAt,
      DateTime? archivedAt,
      DateTime? createdAt,
      DateTime? updatedAt,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionRecord() when $default != null:
        return $default(
          _that.id,
          _that.organizationId,
          _that.roundTableId,
          _that.valueId,
          _that.followUpValueId,
          _that.status,
          _that.stage,
          _that.scheduledAt,
          _that.startedAt,
          _that.endedAt,
          _that.answersClosedAt,
          _that.cancelledReason,
          _that.completion,
          _that.incompleteReason,
          _that.kind,
          _that.originalScheduledAt,
          _that.facilitatorPersonId,
          _that.deviceModifiedAt,
          _that.archivedAt,
          _that.createdAt,
          _that.updatedAt,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SessionRecord implements SessionRecord {
  const _SessionRecord({
    required this.id,
    required this.organizationId,
    required this.roundTableId,
    required this.valueId,
    this.followUpValueId,
    required this.status,
    required this.stage,
    required this.scheduledAt,
    this.startedAt,
    this.endedAt,
    this.answersClosedAt,
    this.cancelledReason,
    this.completion,
    this.incompleteReason,
    this.kind = 'regular',
    this.originalScheduledAt,
    this.facilitatorPersonId,
    this.deviceModifiedAt,
    this.archivedAt,
    this.createdAt,
    this.updatedAt,
  });
  factory _SessionRecord.fromJson(Map<String, dynamic> json) =>
      _$SessionRecordFromJson(json);

  @override
  final String id;
  @override
  final String organizationId;
  @override
  final String roundTableId;
  @override
  final String valueId;
  @override
  final String? followUpValueId;
  @override
  final SessionStatus status;
  @override
  final SessionStage stage;
  @override
  final DateTime scheduledAt;
  @override
  final DateTime? startedAt;
  @override
  final DateTime? endedAt;
  @override
  final DateTime? answersClosedAt;
  @override
  final String? cancelledReason;
  @override
  final String? completion;
  @override
  final String? incompleteReason;
  @override
  @JsonKey()
  final String kind;
  @override
  final DateTime? originalScheduledAt;
  @override
  final String? facilitatorPersonId;
  @override
  final DateTime? deviceModifiedAt;
  @override
  final DateTime? archivedAt;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  /// Create a copy of SessionRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SessionRecordCopyWith<_SessionRecord> get copyWith =>
      __$SessionRecordCopyWithImpl<_SessionRecord>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SessionRecordToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SessionRecord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.roundTableId, roundTableId) ||
                other.roundTableId == roundTableId) &&
            (identical(other.valueId, valueId) || other.valueId == valueId) &&
            (identical(other.followUpValueId, followUpValueId) ||
                other.followUpValueId == followUpValueId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.endedAt, endedAt) || other.endedAt == endedAt) &&
            (identical(other.answersClosedAt, answersClosedAt) ||
                other.answersClosedAt == answersClosedAt) &&
            (identical(other.cancelledReason, cancelledReason) ||
                other.cancelledReason == cancelledReason) &&
            (identical(other.completion, completion) ||
                other.completion == completion) &&
            (identical(other.incompleteReason, incompleteReason) ||
                other.incompleteReason == incompleteReason) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.originalScheduledAt, originalScheduledAt) ||
                other.originalScheduledAt == originalScheduledAt) &&
            (identical(other.facilitatorPersonId, facilitatorPersonId) ||
                other.facilitatorPersonId == facilitatorPersonId) &&
            (identical(other.deviceModifiedAt, deviceModifiedAt) ||
                other.deviceModifiedAt == deviceModifiedAt) &&
            (identical(other.archivedAt, archivedAt) ||
                other.archivedAt == archivedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    organizationId,
    roundTableId,
    valueId,
    followUpValueId,
    status,
    stage,
    scheduledAt,
    startedAt,
    endedAt,
    answersClosedAt,
    cancelledReason,
    completion,
    incompleteReason,
    kind,
    originalScheduledAt,
    facilitatorPersonId,
    deviceModifiedAt,
    archivedAt,
    createdAt,
    updatedAt,
  ]);

  @override
  String toString() {
    return 'SessionRecord(id: $id, organizationId: $organizationId, roundTableId: $roundTableId, valueId: $valueId, followUpValueId: $followUpValueId, status: $status, stage: $stage, scheduledAt: $scheduledAt, startedAt: $startedAt, endedAt: $endedAt, answersClosedAt: $answersClosedAt, cancelledReason: $cancelledReason, completion: $completion, incompleteReason: $incompleteReason, kind: $kind, originalScheduledAt: $originalScheduledAt, facilitatorPersonId: $facilitatorPersonId, deviceModifiedAt: $deviceModifiedAt, archivedAt: $archivedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$SessionRecordCopyWith<$Res>
    implements $SessionRecordCopyWith<$Res> {
  factory _$SessionRecordCopyWith(
    _SessionRecord value,
    $Res Function(_SessionRecord) _then,
  ) = __$SessionRecordCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String organizationId,
    String roundTableId,
    String valueId,
    String? followUpValueId,
    SessionStatus status,
    SessionStage stage,
    DateTime scheduledAt,
    DateTime? startedAt,
    DateTime? endedAt,
    DateTime? answersClosedAt,
    String? cancelledReason,
    String? completion,
    String? incompleteReason,
    String kind,
    DateTime? originalScheduledAt,
    String? facilitatorPersonId,
    DateTime? deviceModifiedAt,
    DateTime? archivedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$SessionRecordCopyWithImpl<$Res>
    implements _$SessionRecordCopyWith<$Res> {
  __$SessionRecordCopyWithImpl(this._self, this._then);

  final _SessionRecord _self;
  final $Res Function(_SessionRecord) _then;

  /// Create a copy of SessionRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? organizationId = null,
    Object? roundTableId = null,
    Object? valueId = null,
    Object? followUpValueId = freezed,
    Object? status = null,
    Object? stage = null,
    Object? scheduledAt = null,
    Object? startedAt = freezed,
    Object? endedAt = freezed,
    Object? answersClosedAt = freezed,
    Object? cancelledReason = freezed,
    Object? completion = freezed,
    Object? incompleteReason = freezed,
    Object? kind = null,
    Object? originalScheduledAt = freezed,
    Object? facilitatorPersonId = freezed,
    Object? deviceModifiedAt = freezed,
    Object? archivedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _SessionRecord(
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
        valueId: null == valueId
            ? _self.valueId
            : valueId // ignore: cast_nullable_to_non_nullable
                  as String,
        followUpValueId: freezed == followUpValueId
            ? _self.followUpValueId
            : followUpValueId // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as SessionStatus,
        stage: null == stage
            ? _self.stage
            : stage // ignore: cast_nullable_to_non_nullable
                  as SessionStage,
        scheduledAt: null == scheduledAt
            ? _self.scheduledAt
            : scheduledAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        startedAt: freezed == startedAt
            ? _self.startedAt
            : startedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        endedAt: freezed == endedAt
            ? _self.endedAt
            : endedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        answersClosedAt: freezed == answersClosedAt
            ? _self.answersClosedAt
            : answersClosedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        cancelledReason: freezed == cancelledReason
            ? _self.cancelledReason
            : cancelledReason // ignore: cast_nullable_to_non_nullable
                  as String?,
        completion: freezed == completion
            ? _self.completion
            : completion // ignore: cast_nullable_to_non_nullable
                  as String?,
        incompleteReason: freezed == incompleteReason
            ? _self.incompleteReason
            : incompleteReason // ignore: cast_nullable_to_non_nullable
                  as String?,
        kind: null == kind
            ? _self.kind
            : kind // ignore: cast_nullable_to_non_nullable
                  as String,
        originalScheduledAt: freezed == originalScheduledAt
            ? _self.originalScheduledAt
            : originalScheduledAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        facilitatorPersonId: freezed == facilitatorPersonId
            ? _self.facilitatorPersonId
            : facilitatorPersonId // ignore: cast_nullable_to_non_nullable
                  as String?,
        deviceModifiedAt: freezed == deviceModifiedAt
            ? _self.deviceModifiedAt
            : deviceModifiedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
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
      ),
    );
  }
}
