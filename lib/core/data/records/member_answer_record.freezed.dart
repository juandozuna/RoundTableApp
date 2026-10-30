// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_answer_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MemberAnswerRecord {
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
  String get questionId;
  String get answerText;
  String? get answerPersonId;

  /// Create a copy of MemberAnswerRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MemberAnswerRecordCopyWith<MemberAnswerRecord> get copyWith =>
      _$MemberAnswerRecordCopyWithImpl<MemberAnswerRecord>(
        this as MemberAnswerRecord,
        _$identity,
      );

  /// Serializes this MemberAnswerRecord to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MemberAnswerRecord &&
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
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.answerText, answerText) ||
                other.answerText == answerText) &&
            (identical(other.answerPersonId, answerPersonId) ||
                other.answerPersonId == answerPersonId));
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
    questionId,
    answerText,
    answerPersonId,
  );

  @override
  String toString() {
    return 'MemberAnswerRecord(id: $id, organizationId: $organizationId, roundTableId: $roundTableId, deviceCreatedAt: $deviceCreatedAt, deviceModifiedAt: $deviceModifiedAt, receivedAt: $receivedAt, syncedLate: $syncedLate, archivedAt: $archivedAt, createdAt: $createdAt, updatedAt: $updatedAt, sessionId: $sessionId, personId: $personId, valueId: $valueId, questionId: $questionId, answerText: $answerText, answerPersonId: $answerPersonId)';
  }
}

/// @nodoc
abstract mixin class $MemberAnswerRecordCopyWith<$Res> {
  factory $MemberAnswerRecordCopyWith(
    MemberAnswerRecord value,
    $Res Function(MemberAnswerRecord) _then,
  ) = _$MemberAnswerRecordCopyWithImpl;
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
    String questionId,
    String answerText,
    String? answerPersonId,
  });
}

/// @nodoc
class _$MemberAnswerRecordCopyWithImpl<$Res>
    implements $MemberAnswerRecordCopyWith<$Res> {
  _$MemberAnswerRecordCopyWithImpl(this._self, this._then);

  final MemberAnswerRecord _self;
  final $Res Function(MemberAnswerRecord) _then;

  /// Create a copy of MemberAnswerRecord
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
    Object? questionId = null,
    Object? answerText = null,
    Object? answerPersonId = freezed,
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
        questionId: null == questionId
            ? _self.questionId
            : questionId // ignore: cast_nullable_to_non_nullable
                  as String,
        answerText: null == answerText
            ? _self.answerText
            : answerText // ignore: cast_nullable_to_non_nullable
                  as String,
        answerPersonId: freezed == answerPersonId
            ? _self.answerPersonId
            : answerPersonId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [MemberAnswerRecord].
extension MemberAnswerRecordPatterns on MemberAnswerRecord {
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
    TResult Function(_MemberAnswerRecord value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MemberAnswerRecord() when $default != null:
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
    TResult Function(_MemberAnswerRecord value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberAnswerRecord():
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
    TResult? Function(_MemberAnswerRecord value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberAnswerRecord() when $default != null:
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
      String questionId,
      String answerText,
      String? answerPersonId,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MemberAnswerRecord() when $default != null:
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
          _that.questionId,
          _that.answerText,
          _that.answerPersonId,
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
      String questionId,
      String answerText,
      String? answerPersonId,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberAnswerRecord():
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
          _that.questionId,
          _that.answerText,
          _that.answerPersonId,
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
      String questionId,
      String answerText,
      String? answerPersonId,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberAnswerRecord() when $default != null:
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
          _that.questionId,
          _that.answerText,
          _that.answerPersonId,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MemberAnswerRecord implements MemberAnswerRecord {
  const _MemberAnswerRecord({
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
    required this.questionId,
    required this.answerText,
    this.answerPersonId,
  });
  factory _MemberAnswerRecord.fromJson(Map<String, dynamic> json) =>
      _$MemberAnswerRecordFromJson(json);

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
  final String questionId;
  @override
  final String answerText;
  @override
  final String? answerPersonId;

  /// Create a copy of MemberAnswerRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MemberAnswerRecordCopyWith<_MemberAnswerRecord> get copyWith =>
      __$MemberAnswerRecordCopyWithImpl<_MemberAnswerRecord>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MemberAnswerRecordToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MemberAnswerRecord &&
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
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.answerText, answerText) ||
                other.answerText == answerText) &&
            (identical(other.answerPersonId, answerPersonId) ||
                other.answerPersonId == answerPersonId));
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
    questionId,
    answerText,
    answerPersonId,
  );

  @override
  String toString() {
    return 'MemberAnswerRecord(id: $id, organizationId: $organizationId, roundTableId: $roundTableId, deviceCreatedAt: $deviceCreatedAt, deviceModifiedAt: $deviceModifiedAt, receivedAt: $receivedAt, syncedLate: $syncedLate, archivedAt: $archivedAt, createdAt: $createdAt, updatedAt: $updatedAt, sessionId: $sessionId, personId: $personId, valueId: $valueId, questionId: $questionId, answerText: $answerText, answerPersonId: $answerPersonId)';
  }
}

/// @nodoc
abstract mixin class _$MemberAnswerRecordCopyWith<$Res>
    implements $MemberAnswerRecordCopyWith<$Res> {
  factory _$MemberAnswerRecordCopyWith(
    _MemberAnswerRecord value,
    $Res Function(_MemberAnswerRecord) _then,
  ) = __$MemberAnswerRecordCopyWithImpl;
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
    String questionId,
    String answerText,
    String? answerPersonId,
  });
}

/// @nodoc
class __$MemberAnswerRecordCopyWithImpl<$Res>
    implements _$MemberAnswerRecordCopyWith<$Res> {
  __$MemberAnswerRecordCopyWithImpl(this._self, this._then);

  final _MemberAnswerRecord _self;
  final $Res Function(_MemberAnswerRecord) _then;

  /// Create a copy of MemberAnswerRecord
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
    Object? questionId = null,
    Object? answerText = null,
    Object? answerPersonId = freezed,
  }) {
    return _then(
      _MemberAnswerRecord(
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
        questionId: null == questionId
            ? _self.questionId
            : questionId // ignore: cast_nullable_to_non_nullable
                  as String,
        answerText: null == answerText
            ? _self.answerText
            : answerText // ignore: cast_nullable_to_non_nullable
                  as String,
        answerPersonId: freezed == answerPersonId
            ? _self.answerPersonId
            : answerPersonId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}
