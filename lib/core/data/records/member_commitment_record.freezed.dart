// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_commitment_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MemberCommitmentRecord {
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
  String get actionText;
  String? get measureText;
  String? get followUpSessionId;
  CommitmentFollowUpStatus? get followUpStatus;
  String? get followUpNote;
  DateTime? get followUpDeviceAt;
  DateTime? get followUpReceivedAt;
  bool get followUpSyncedLate;

  /// Create a copy of MemberCommitmentRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MemberCommitmentRecordCopyWith<MemberCommitmentRecord> get copyWith =>
      _$MemberCommitmentRecordCopyWithImpl<MemberCommitmentRecord>(
        this as MemberCommitmentRecord,
        _$identity,
      );

  /// Serializes this MemberCommitmentRecord to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MemberCommitmentRecord &&
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
            (identical(other.actionText, actionText) ||
                other.actionText == actionText) &&
            (identical(other.measureText, measureText) ||
                other.measureText == measureText) &&
            (identical(other.followUpSessionId, followUpSessionId) ||
                other.followUpSessionId == followUpSessionId) &&
            (identical(other.followUpStatus, followUpStatus) ||
                other.followUpStatus == followUpStatus) &&
            (identical(other.followUpNote, followUpNote) ||
                other.followUpNote == followUpNote) &&
            (identical(other.followUpDeviceAt, followUpDeviceAt) ||
                other.followUpDeviceAt == followUpDeviceAt) &&
            (identical(other.followUpReceivedAt, followUpReceivedAt) ||
                other.followUpReceivedAt == followUpReceivedAt) &&
            (identical(other.followUpSyncedLate, followUpSyncedLate) ||
                other.followUpSyncedLate == followUpSyncedLate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
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
    actionText,
    measureText,
    followUpSessionId,
    followUpStatus,
    followUpNote,
    followUpDeviceAt,
    followUpReceivedAt,
    followUpSyncedLate,
  ]);

  @override
  String toString() {
    return 'MemberCommitmentRecord(id: $id, organizationId: $organizationId, roundTableId: $roundTableId, deviceCreatedAt: $deviceCreatedAt, deviceModifiedAt: $deviceModifiedAt, receivedAt: $receivedAt, syncedLate: $syncedLate, archivedAt: $archivedAt, createdAt: $createdAt, updatedAt: $updatedAt, sessionId: $sessionId, personId: $personId, valueId: $valueId, actionText: $actionText, measureText: $measureText, followUpSessionId: $followUpSessionId, followUpStatus: $followUpStatus, followUpNote: $followUpNote, followUpDeviceAt: $followUpDeviceAt, followUpReceivedAt: $followUpReceivedAt, followUpSyncedLate: $followUpSyncedLate)';
  }
}

/// @nodoc
abstract mixin class $MemberCommitmentRecordCopyWith<$Res> {
  factory $MemberCommitmentRecordCopyWith(
    MemberCommitmentRecord value,
    $Res Function(MemberCommitmentRecord) _then,
  ) = _$MemberCommitmentRecordCopyWithImpl;
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
    String actionText,
    String? measureText,
    String? followUpSessionId,
    CommitmentFollowUpStatus? followUpStatus,
    String? followUpNote,
    DateTime? followUpDeviceAt,
    DateTime? followUpReceivedAt,
    bool followUpSyncedLate,
  });
}

/// @nodoc
class _$MemberCommitmentRecordCopyWithImpl<$Res>
    implements $MemberCommitmentRecordCopyWith<$Res> {
  _$MemberCommitmentRecordCopyWithImpl(this._self, this._then);

  final MemberCommitmentRecord _self;
  final $Res Function(MemberCommitmentRecord) _then;

  /// Create a copy of MemberCommitmentRecord
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
    Object? actionText = null,
    Object? measureText = freezed,
    Object? followUpSessionId = freezed,
    Object? followUpStatus = freezed,
    Object? followUpNote = freezed,
    Object? followUpDeviceAt = freezed,
    Object? followUpReceivedAt = freezed,
    Object? followUpSyncedLate = null,
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
        actionText: null == actionText
            ? _self.actionText
            : actionText // ignore: cast_nullable_to_non_nullable
                  as String,
        measureText: freezed == measureText
            ? _self.measureText
            : measureText // ignore: cast_nullable_to_non_nullable
                  as String?,
        followUpSessionId: freezed == followUpSessionId
            ? _self.followUpSessionId
            : followUpSessionId // ignore: cast_nullable_to_non_nullable
                  as String?,
        followUpStatus: freezed == followUpStatus
            ? _self.followUpStatus
            : followUpStatus // ignore: cast_nullable_to_non_nullable
                  as CommitmentFollowUpStatus?,
        followUpNote: freezed == followUpNote
            ? _self.followUpNote
            : followUpNote // ignore: cast_nullable_to_non_nullable
                  as String?,
        followUpDeviceAt: freezed == followUpDeviceAt
            ? _self.followUpDeviceAt
            : followUpDeviceAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        followUpReceivedAt: freezed == followUpReceivedAt
            ? _self.followUpReceivedAt
            : followUpReceivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        followUpSyncedLate: null == followUpSyncedLate
            ? _self.followUpSyncedLate
            : followUpSyncedLate // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [MemberCommitmentRecord].
extension MemberCommitmentRecordPatterns on MemberCommitmentRecord {
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
    TResult Function(_MemberCommitmentRecord value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MemberCommitmentRecord() when $default != null:
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
    TResult Function(_MemberCommitmentRecord value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberCommitmentRecord():
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
    TResult? Function(_MemberCommitmentRecord value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberCommitmentRecord() when $default != null:
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
      String actionText,
      String? measureText,
      String? followUpSessionId,
      CommitmentFollowUpStatus? followUpStatus,
      String? followUpNote,
      DateTime? followUpDeviceAt,
      DateTime? followUpReceivedAt,
      bool followUpSyncedLate,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MemberCommitmentRecord() when $default != null:
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
          _that.actionText,
          _that.measureText,
          _that.followUpSessionId,
          _that.followUpStatus,
          _that.followUpNote,
          _that.followUpDeviceAt,
          _that.followUpReceivedAt,
          _that.followUpSyncedLate,
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
      String actionText,
      String? measureText,
      String? followUpSessionId,
      CommitmentFollowUpStatus? followUpStatus,
      String? followUpNote,
      DateTime? followUpDeviceAt,
      DateTime? followUpReceivedAt,
      bool followUpSyncedLate,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberCommitmentRecord():
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
          _that.actionText,
          _that.measureText,
          _that.followUpSessionId,
          _that.followUpStatus,
          _that.followUpNote,
          _that.followUpDeviceAt,
          _that.followUpReceivedAt,
          _that.followUpSyncedLate,
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
      String actionText,
      String? measureText,
      String? followUpSessionId,
      CommitmentFollowUpStatus? followUpStatus,
      String? followUpNote,
      DateTime? followUpDeviceAt,
      DateTime? followUpReceivedAt,
      bool followUpSyncedLate,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberCommitmentRecord() when $default != null:
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
          _that.actionText,
          _that.measureText,
          _that.followUpSessionId,
          _that.followUpStatus,
          _that.followUpNote,
          _that.followUpDeviceAt,
          _that.followUpReceivedAt,
          _that.followUpSyncedLate,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MemberCommitmentRecord implements MemberCommitmentRecord {
  const _MemberCommitmentRecord({
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
    required this.actionText,
    this.measureText,
    this.followUpSessionId,
    this.followUpStatus,
    this.followUpNote,
    this.followUpDeviceAt,
    this.followUpReceivedAt,
    this.followUpSyncedLate = false,
  });
  factory _MemberCommitmentRecord.fromJson(Map<String, dynamic> json) =>
      _$MemberCommitmentRecordFromJson(json);

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
  final String actionText;
  @override
  final String? measureText;
  @override
  final String? followUpSessionId;
  @override
  final CommitmentFollowUpStatus? followUpStatus;
  @override
  final String? followUpNote;
  @override
  final DateTime? followUpDeviceAt;
  @override
  final DateTime? followUpReceivedAt;
  @override
  @JsonKey()
  final bool followUpSyncedLate;

  /// Create a copy of MemberCommitmentRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MemberCommitmentRecordCopyWith<_MemberCommitmentRecord> get copyWith =>
      __$MemberCommitmentRecordCopyWithImpl<_MemberCommitmentRecord>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$MemberCommitmentRecordToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MemberCommitmentRecord &&
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
            (identical(other.actionText, actionText) ||
                other.actionText == actionText) &&
            (identical(other.measureText, measureText) ||
                other.measureText == measureText) &&
            (identical(other.followUpSessionId, followUpSessionId) ||
                other.followUpSessionId == followUpSessionId) &&
            (identical(other.followUpStatus, followUpStatus) ||
                other.followUpStatus == followUpStatus) &&
            (identical(other.followUpNote, followUpNote) ||
                other.followUpNote == followUpNote) &&
            (identical(other.followUpDeviceAt, followUpDeviceAt) ||
                other.followUpDeviceAt == followUpDeviceAt) &&
            (identical(other.followUpReceivedAt, followUpReceivedAt) ||
                other.followUpReceivedAt == followUpReceivedAt) &&
            (identical(other.followUpSyncedLate, followUpSyncedLate) ||
                other.followUpSyncedLate == followUpSyncedLate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
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
    actionText,
    measureText,
    followUpSessionId,
    followUpStatus,
    followUpNote,
    followUpDeviceAt,
    followUpReceivedAt,
    followUpSyncedLate,
  ]);

  @override
  String toString() {
    return 'MemberCommitmentRecord(id: $id, organizationId: $organizationId, roundTableId: $roundTableId, deviceCreatedAt: $deviceCreatedAt, deviceModifiedAt: $deviceModifiedAt, receivedAt: $receivedAt, syncedLate: $syncedLate, archivedAt: $archivedAt, createdAt: $createdAt, updatedAt: $updatedAt, sessionId: $sessionId, personId: $personId, valueId: $valueId, actionText: $actionText, measureText: $measureText, followUpSessionId: $followUpSessionId, followUpStatus: $followUpStatus, followUpNote: $followUpNote, followUpDeviceAt: $followUpDeviceAt, followUpReceivedAt: $followUpReceivedAt, followUpSyncedLate: $followUpSyncedLate)';
  }
}

/// @nodoc
abstract mixin class _$MemberCommitmentRecordCopyWith<$Res>
    implements $MemberCommitmentRecordCopyWith<$Res> {
  factory _$MemberCommitmentRecordCopyWith(
    _MemberCommitmentRecord value,
    $Res Function(_MemberCommitmentRecord) _then,
  ) = __$MemberCommitmentRecordCopyWithImpl;
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
    String actionText,
    String? measureText,
    String? followUpSessionId,
    CommitmentFollowUpStatus? followUpStatus,
    String? followUpNote,
    DateTime? followUpDeviceAt,
    DateTime? followUpReceivedAt,
    bool followUpSyncedLate,
  });
}

/// @nodoc
class __$MemberCommitmentRecordCopyWithImpl<$Res>
    implements _$MemberCommitmentRecordCopyWith<$Res> {
  __$MemberCommitmentRecordCopyWithImpl(this._self, this._then);

  final _MemberCommitmentRecord _self;
  final $Res Function(_MemberCommitmentRecord) _then;

  /// Create a copy of MemberCommitmentRecord
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
    Object? actionText = null,
    Object? measureText = freezed,
    Object? followUpSessionId = freezed,
    Object? followUpStatus = freezed,
    Object? followUpNote = freezed,
    Object? followUpDeviceAt = freezed,
    Object? followUpReceivedAt = freezed,
    Object? followUpSyncedLate = null,
  }) {
    return _then(
      _MemberCommitmentRecord(
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
        actionText: null == actionText
            ? _self.actionText
            : actionText // ignore: cast_nullable_to_non_nullable
                  as String,
        measureText: freezed == measureText
            ? _self.measureText
            : measureText // ignore: cast_nullable_to_non_nullable
                  as String?,
        followUpSessionId: freezed == followUpSessionId
            ? _self.followUpSessionId
            : followUpSessionId // ignore: cast_nullable_to_non_nullable
                  as String?,
        followUpStatus: freezed == followUpStatus
            ? _self.followUpStatus
            : followUpStatus // ignore: cast_nullable_to_non_nullable
                  as CommitmentFollowUpStatus?,
        followUpNote: freezed == followUpNote
            ? _self.followUpNote
            : followUpNote // ignore: cast_nullable_to_non_nullable
                  as String?,
        followUpDeviceAt: freezed == followUpDeviceAt
            ? _self.followUpDeviceAt
            : followUpDeviceAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        followUpReceivedAt: freezed == followUpReceivedAt
            ? _self.followUpReceivedAt
            : followUpReceivedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        followUpSyncedLate: null == followUpSyncedLate
            ? _self.followUpSyncedLate
            : followUpSyncedLate // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}
