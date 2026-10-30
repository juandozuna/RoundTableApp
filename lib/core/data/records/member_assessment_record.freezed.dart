// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_assessment_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MemberAssessmentRecord {
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
  String get valueId;
  AssessmentKind get kind;
  int get score;
  String? get justification;

  /// Create a copy of MemberAssessmentRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MemberAssessmentRecordCopyWith<MemberAssessmentRecord> get copyWith =>
      _$MemberAssessmentRecordCopyWithImpl<MemberAssessmentRecord>(
        this as MemberAssessmentRecord,
        _$identity,
      );

  /// Serializes this MemberAssessmentRecord to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MemberAssessmentRecord &&
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
            (identical(other.valueId, valueId) || other.valueId == valueId) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.justification, justification) ||
                other.justification == justification));
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
    valueId,
    kind,
    score,
    justification,
  );

  @override
  String toString() {
    return 'MemberAssessmentRecord(id: $id, organizationId: $organizationId, roundTableId: $roundTableId, deviceCreatedAt: $deviceCreatedAt, deviceModifiedAt: $deviceModifiedAt, receivedAt: $receivedAt, syncedLate: $syncedLate, archivedAt: $archivedAt, createdAt: $createdAt, updatedAt: $updatedAt, sessionId: $sessionId, personId: $personId, valueId: $valueId, kind: $kind, score: $score, justification: $justification)';
  }
}

/// @nodoc
abstract mixin class $MemberAssessmentRecordCopyWith<$Res> {
  factory $MemberAssessmentRecordCopyWith(
    MemberAssessmentRecord value,
    $Res Function(MemberAssessmentRecord) _then,
  ) = _$MemberAssessmentRecordCopyWithImpl;
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
    String valueId,
    AssessmentKind kind,
    int score,
    String? justification,
  });
}

/// @nodoc
class _$MemberAssessmentRecordCopyWithImpl<$Res>
    implements $MemberAssessmentRecordCopyWith<$Res> {
  _$MemberAssessmentRecordCopyWithImpl(this._self, this._then);

  final MemberAssessmentRecord _self;
  final $Res Function(MemberAssessmentRecord) _then;

  /// Create a copy of MemberAssessmentRecord
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
    Object? valueId = null,
    Object? kind = null,
    Object? score = null,
    Object? justification = freezed,
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
        valueId: null == valueId
            ? _self.valueId
            : valueId // ignore: cast_nullable_to_non_nullable
                  as String,
        kind: null == kind
            ? _self.kind
            : kind // ignore: cast_nullable_to_non_nullable
                  as AssessmentKind,
        score: null == score
            ? _self.score
            : score // ignore: cast_nullable_to_non_nullable
                  as int,
        justification: freezed == justification
            ? _self.justification
            : justification // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [MemberAssessmentRecord].
extension MemberAssessmentRecordPatterns on MemberAssessmentRecord {
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
    TResult Function(_MemberAssessmentRecord value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MemberAssessmentRecord() when $default != null:
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
    TResult Function(_MemberAssessmentRecord value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberAssessmentRecord():
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
    TResult? Function(_MemberAssessmentRecord value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberAssessmentRecord() when $default != null:
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
      String valueId,
      AssessmentKind kind,
      int score,
      String? justification,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MemberAssessmentRecord() when $default != null:
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
          _that.valueId,
          _that.kind,
          _that.score,
          _that.justification,
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
      String valueId,
      AssessmentKind kind,
      int score,
      String? justification,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberAssessmentRecord():
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
          _that.valueId,
          _that.kind,
          _that.score,
          _that.justification,
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
      String valueId,
      AssessmentKind kind,
      int score,
      String? justification,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberAssessmentRecord() when $default != null:
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
          _that.valueId,
          _that.kind,
          _that.score,
          _that.justification,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MemberAssessmentRecord implements MemberAssessmentRecord {
  const _MemberAssessmentRecord({
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
    required this.valueId,
    required this.kind,
    required this.score,
    this.justification,
  });
  factory _MemberAssessmentRecord.fromJson(Map<String, dynamic> json) =>
      _$MemberAssessmentRecordFromJson(json);

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
  final String valueId;
  @override
  final AssessmentKind kind;
  @override
  final int score;
  @override
  final String? justification;

  /// Create a copy of MemberAssessmentRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MemberAssessmentRecordCopyWith<_MemberAssessmentRecord> get copyWith =>
      __$MemberAssessmentRecordCopyWithImpl<_MemberAssessmentRecord>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$MemberAssessmentRecordToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MemberAssessmentRecord &&
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
            (identical(other.valueId, valueId) || other.valueId == valueId) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.justification, justification) ||
                other.justification == justification));
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
    valueId,
    kind,
    score,
    justification,
  );

  @override
  String toString() {
    return 'MemberAssessmentRecord(id: $id, organizationId: $organizationId, roundTableId: $roundTableId, deviceCreatedAt: $deviceCreatedAt, deviceModifiedAt: $deviceModifiedAt, receivedAt: $receivedAt, syncedLate: $syncedLate, archivedAt: $archivedAt, createdAt: $createdAt, updatedAt: $updatedAt, sessionId: $sessionId, personId: $personId, valueId: $valueId, kind: $kind, score: $score, justification: $justification)';
  }
}

/// @nodoc
abstract mixin class _$MemberAssessmentRecordCopyWith<$Res>
    implements $MemberAssessmentRecordCopyWith<$Res> {
  factory _$MemberAssessmentRecordCopyWith(
    _MemberAssessmentRecord value,
    $Res Function(_MemberAssessmentRecord) _then,
  ) = __$MemberAssessmentRecordCopyWithImpl;
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
    String valueId,
    AssessmentKind kind,
    int score,
    String? justification,
  });
}

/// @nodoc
class __$MemberAssessmentRecordCopyWithImpl<$Res>
    implements _$MemberAssessmentRecordCopyWith<$Res> {
  __$MemberAssessmentRecordCopyWithImpl(this._self, this._then);

  final _MemberAssessmentRecord _self;
  final $Res Function(_MemberAssessmentRecord) _then;

  /// Create a copy of MemberAssessmentRecord
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
    Object? valueId = null,
    Object? kind = null,
    Object? score = null,
    Object? justification = freezed,
  }) {
    return _then(
      _MemberAssessmentRecord(
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
        valueId: null == valueId
            ? _self.valueId
            : valueId // ignore: cast_nullable_to_non_nullable
                  as String,
        kind: null == kind
            ? _self.kind
            : kind // ignore: cast_nullable_to_non_nullable
                  as AssessmentKind,
        score: null == score
            ? _self.score
            : score // ignore: cast_nullable_to_non_nullable
                  as int,
        justification: freezed == justification
            ? _self.justification
            : justification // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}
