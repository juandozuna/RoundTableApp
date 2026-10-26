// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audit_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuditEvent {
  String get id;
  String? get organizationId;
  String? get organizationName;
  String? get actorPersonId;
  String? get actorName;
  String get eventType;
  String? get entityType;
  String? get entityId;
  Map<String, dynamic> get payload;
  DateTime get createdAt;

  /// Create a copy of AuditEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuditEventCopyWith<AuditEvent> get copyWith =>
      _$AuditEventCopyWithImpl<AuditEvent>(this as AuditEvent, _$identity);

  /// Serializes this AuditEvent to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuditEvent &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.organizationName, organizationName) ||
                other.organizationName == organizationName) &&
            (identical(other.actorPersonId, actorPersonId) ||
                other.actorPersonId == actorPersonId) &&
            (identical(other.actorName, actorName) ||
                other.actorName == actorName) &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.entityType, entityType) ||
                other.entityType == entityType) &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            const DeepCollectionEquality().equals(other.payload, payload) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    organizationId,
    organizationName,
    actorPersonId,
    actorName,
    eventType,
    entityType,
    entityId,
    const DeepCollectionEquality().hash(payload),
    createdAt,
  );

  @override
  String toString() {
    return 'AuditEvent(id: $id, organizationId: $organizationId, organizationName: $organizationName, actorPersonId: $actorPersonId, actorName: $actorName, eventType: $eventType, entityType: $entityType, entityId: $entityId, payload: $payload, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $AuditEventCopyWith<$Res> {
  factory $AuditEventCopyWith(
    AuditEvent value,
    $Res Function(AuditEvent) _then,
  ) = _$AuditEventCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String? organizationId,
    String? organizationName,
    String? actorPersonId,
    String? actorName,
    String eventType,
    String? entityType,
    String? entityId,
    Map<String, dynamic> payload,
    DateTime createdAt,
  });
}

/// @nodoc
class _$AuditEventCopyWithImpl<$Res> implements $AuditEventCopyWith<$Res> {
  _$AuditEventCopyWithImpl(this._self, this._then);

  final AuditEvent _self;
  final $Res Function(AuditEvent) _then;

  /// Create a copy of AuditEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? organizationId = freezed,
    Object? organizationName = freezed,
    Object? actorPersonId = freezed,
    Object? actorName = freezed,
    Object? eventType = null,
    Object? entityType = freezed,
    Object? entityId = freezed,
    Object? payload = null,
    Object? createdAt = null,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        organizationId: freezed == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        organizationName: freezed == organizationName
            ? _self.organizationName
            : organizationName // ignore: cast_nullable_to_non_nullable
                  as String?,
        actorPersonId: freezed == actorPersonId
            ? _self.actorPersonId
            : actorPersonId // ignore: cast_nullable_to_non_nullable
                  as String?,
        actorName: freezed == actorName
            ? _self.actorName
            : actorName // ignore: cast_nullable_to_non_nullable
                  as String?,
        eventType: null == eventType
            ? _self.eventType
            : eventType // ignore: cast_nullable_to_non_nullable
                  as String,
        entityType: freezed == entityType
            ? _self.entityType
            : entityType // ignore: cast_nullable_to_non_nullable
                  as String?,
        entityId: freezed == entityId
            ? _self.entityId
            : entityId // ignore: cast_nullable_to_non_nullable
                  as String?,
        payload: null == payload
            ? _self.payload
            : payload // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [AuditEvent].
extension AuditEventPatterns on AuditEvent {
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
    TResult Function(_AuditEvent value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuditEvent() when $default != null:
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
    TResult Function(_AuditEvent value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuditEvent():
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
    TResult? Function(_AuditEvent value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuditEvent() when $default != null:
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
      String? organizationId,
      String? organizationName,
      String? actorPersonId,
      String? actorName,
      String eventType,
      String? entityType,
      String? entityId,
      Map<String, dynamic> payload,
      DateTime createdAt,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuditEvent() when $default != null:
        return $default(
          _that.id,
          _that.organizationId,
          _that.organizationName,
          _that.actorPersonId,
          _that.actorName,
          _that.eventType,
          _that.entityType,
          _that.entityId,
          _that.payload,
          _that.createdAt,
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
      String? organizationId,
      String? organizationName,
      String? actorPersonId,
      String? actorName,
      String eventType,
      String? entityType,
      String? entityId,
      Map<String, dynamic> payload,
      DateTime createdAt,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuditEvent():
        return $default(
          _that.id,
          _that.organizationId,
          _that.organizationName,
          _that.actorPersonId,
          _that.actorName,
          _that.eventType,
          _that.entityType,
          _that.entityId,
          _that.payload,
          _that.createdAt,
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
      String? organizationId,
      String? organizationName,
      String? actorPersonId,
      String? actorName,
      String eventType,
      String? entityType,
      String? entityId,
      Map<String, dynamic> payload,
      DateTime createdAt,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuditEvent() when $default != null:
        return $default(
          _that.id,
          _that.organizationId,
          _that.organizationName,
          _that.actorPersonId,
          _that.actorName,
          _that.eventType,
          _that.entityType,
          _that.entityId,
          _that.payload,
          _that.createdAt,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AuditEvent implements AuditEvent {
  const _AuditEvent({
    required this.id,
    this.organizationId,
    this.organizationName,
    this.actorPersonId,
    this.actorName,
    required this.eventType,
    this.entityType,
    this.entityId,
    final Map<String, dynamic> payload = const {},
    required this.createdAt,
  }) : _payload = payload;
  factory _AuditEvent.fromJson(Map<String, dynamic> json) =>
      _$AuditEventFromJson(json);

  @override
  final String id;
  @override
  final String? organizationId;
  @override
  final String? organizationName;
  @override
  final String? actorPersonId;
  @override
  final String? actorName;
  @override
  final String eventType;
  @override
  final String? entityType;
  @override
  final String? entityId;
  final Map<String, dynamic> _payload;
  @override
  @JsonKey()
  Map<String, dynamic> get payload {
    if (_payload is EqualUnmodifiableMapView) return _payload;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_payload);
  }

  @override
  final DateTime createdAt;

  /// Create a copy of AuditEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuditEventCopyWith<_AuditEvent> get copyWith =>
      __$AuditEventCopyWithImpl<_AuditEvent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AuditEventToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuditEvent &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.organizationName, organizationName) ||
                other.organizationName == organizationName) &&
            (identical(other.actorPersonId, actorPersonId) ||
                other.actorPersonId == actorPersonId) &&
            (identical(other.actorName, actorName) ||
                other.actorName == actorName) &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.entityType, entityType) ||
                other.entityType == entityType) &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            const DeepCollectionEquality().equals(other._payload, _payload) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    organizationId,
    organizationName,
    actorPersonId,
    actorName,
    eventType,
    entityType,
    entityId,
    const DeepCollectionEquality().hash(_payload),
    createdAt,
  );

  @override
  String toString() {
    return 'AuditEvent(id: $id, organizationId: $organizationId, organizationName: $organizationName, actorPersonId: $actorPersonId, actorName: $actorName, eventType: $eventType, entityType: $entityType, entityId: $entityId, payload: $payload, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$AuditEventCopyWith<$Res>
    implements $AuditEventCopyWith<$Res> {
  factory _$AuditEventCopyWith(
    _AuditEvent value,
    $Res Function(_AuditEvent) _then,
  ) = __$AuditEventCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String? organizationId,
    String? organizationName,
    String? actorPersonId,
    String? actorName,
    String eventType,
    String? entityType,
    String? entityId,
    Map<String, dynamic> payload,
    DateTime createdAt,
  });
}

/// @nodoc
class __$AuditEventCopyWithImpl<$Res> implements _$AuditEventCopyWith<$Res> {
  __$AuditEventCopyWithImpl(this._self, this._then);

  final _AuditEvent _self;
  final $Res Function(_AuditEvent) _then;

  /// Create a copy of AuditEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? organizationId = freezed,
    Object? organizationName = freezed,
    Object? actorPersonId = freezed,
    Object? actorName = freezed,
    Object? eventType = null,
    Object? entityType = freezed,
    Object? entityId = freezed,
    Object? payload = null,
    Object? createdAt = null,
  }) {
    return _then(
      _AuditEvent(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        organizationId: freezed == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        organizationName: freezed == organizationName
            ? _self.organizationName
            : organizationName // ignore: cast_nullable_to_non_nullable
                  as String?,
        actorPersonId: freezed == actorPersonId
            ? _self.actorPersonId
            : actorPersonId // ignore: cast_nullable_to_non_nullable
                  as String?,
        actorName: freezed == actorName
            ? _self.actorName
            : actorName // ignore: cast_nullable_to_non_nullable
                  as String?,
        eventType: null == eventType
            ? _self.eventType
            : eventType // ignore: cast_nullable_to_non_nullable
                  as String,
        entityType: freezed == entityType
            ? _self.entityType
            : entityType // ignore: cast_nullable_to_non_nullable
                  as String?,
        entityId: freezed == entityId
            ? _self.entityId
            : entityId // ignore: cast_nullable_to_non_nullable
                  as String?,
        payload: null == payload
            ? _self._payload
            : payload // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        createdAt: null == createdAt
            ? _self.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}
