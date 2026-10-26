// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionInfo {
  String get id;
  String get tableId;
  SessionStatus get status;
  SessionStage get stage;
  DateTime get scheduledAt;
  String get valueId;

  /// Value whose commitment is reviewed today; null for a table's first
  /// session.
  String? get followUpValueId;
  DateTime? get startedAt;
  DateTime? get endedAt;
  DateTime? get answersClosedAt;

  /// Create a copy of SessionInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SessionInfoCopyWith<SessionInfo> get copyWith =>
      _$SessionInfoCopyWithImpl<SessionInfo>(this as SessionInfo, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SessionInfo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tableId, tableId) || other.tableId == tableId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.valueId, valueId) || other.valueId == valueId) &&
            (identical(other.followUpValueId, followUpValueId) ||
                other.followUpValueId == followUpValueId) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.endedAt, endedAt) || other.endedAt == endedAt) &&
            (identical(other.answersClosedAt, answersClosedAt) ||
                other.answersClosedAt == answersClosedAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    tableId,
    status,
    stage,
    scheduledAt,
    valueId,
    followUpValueId,
    startedAt,
    endedAt,
    answersClosedAt,
  );

  @override
  String toString() {
    return 'SessionInfo(id: $id, tableId: $tableId, status: $status, stage: $stage, scheduledAt: $scheduledAt, valueId: $valueId, followUpValueId: $followUpValueId, startedAt: $startedAt, endedAt: $endedAt, answersClosedAt: $answersClosedAt)';
  }
}

/// @nodoc
abstract mixin class $SessionInfoCopyWith<$Res> {
  factory $SessionInfoCopyWith(
    SessionInfo value,
    $Res Function(SessionInfo) _then,
  ) = _$SessionInfoCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String tableId,
    SessionStatus status,
    SessionStage stage,
    DateTime scheduledAt,
    String valueId,
    String? followUpValueId,
    DateTime? startedAt,
    DateTime? endedAt,
    DateTime? answersClosedAt,
  });
}

/// @nodoc
class _$SessionInfoCopyWithImpl<$Res> implements $SessionInfoCopyWith<$Res> {
  _$SessionInfoCopyWithImpl(this._self, this._then);

  final SessionInfo _self;
  final $Res Function(SessionInfo) _then;

  /// Create a copy of SessionInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tableId = null,
    Object? status = null,
    Object? stage = null,
    Object? scheduledAt = null,
    Object? valueId = null,
    Object? followUpValueId = freezed,
    Object? startedAt = freezed,
    Object? endedAt = freezed,
    Object? answersClosedAt = freezed,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        tableId: null == tableId
            ? _self.tableId
            : tableId // ignore: cast_nullable_to_non_nullable
                  as String,
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
        valueId: null == valueId
            ? _self.valueId
            : valueId // ignore: cast_nullable_to_non_nullable
                  as String,
        followUpValueId: freezed == followUpValueId
            ? _self.followUpValueId
            : followUpValueId // ignore: cast_nullable_to_non_nullable
                  as String?,
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
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [SessionInfo].
extension SessionInfoPatterns on SessionInfo {
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
    TResult Function(_SessionInfo value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SessionInfo() when $default != null:
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
    TResult Function(_SessionInfo value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionInfo():
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
    TResult? Function(_SessionInfo value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionInfo() when $default != null:
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
      String tableId,
      SessionStatus status,
      SessionStage stage,
      DateTime scheduledAt,
      String valueId,
      String? followUpValueId,
      DateTime? startedAt,
      DateTime? endedAt,
      DateTime? answersClosedAt,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SessionInfo() when $default != null:
        return $default(
          _that.id,
          _that.tableId,
          _that.status,
          _that.stage,
          _that.scheduledAt,
          _that.valueId,
          _that.followUpValueId,
          _that.startedAt,
          _that.endedAt,
          _that.answersClosedAt,
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
      String tableId,
      SessionStatus status,
      SessionStage stage,
      DateTime scheduledAt,
      String valueId,
      String? followUpValueId,
      DateTime? startedAt,
      DateTime? endedAt,
      DateTime? answersClosedAt,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionInfo():
        return $default(
          _that.id,
          _that.tableId,
          _that.status,
          _that.stage,
          _that.scheduledAt,
          _that.valueId,
          _that.followUpValueId,
          _that.startedAt,
          _that.endedAt,
          _that.answersClosedAt,
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
      String tableId,
      SessionStatus status,
      SessionStage stage,
      DateTime scheduledAt,
      String valueId,
      String? followUpValueId,
      DateTime? startedAt,
      DateTime? endedAt,
      DateTime? answersClosedAt,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionInfo() when $default != null:
        return $default(
          _that.id,
          _that.tableId,
          _that.status,
          _that.stage,
          _that.scheduledAt,
          _that.valueId,
          _that.followUpValueId,
          _that.startedAt,
          _that.endedAt,
          _that.answersClosedAt,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SessionInfo extends SessionInfo {
  const _SessionInfo({
    required this.id,
    required this.tableId,
    required this.status,
    required this.stage,
    required this.scheduledAt,
    required this.valueId,
    this.followUpValueId,
    this.startedAt,
    this.endedAt,
    this.answersClosedAt,
  }) : super._();

  @override
  final String id;
  @override
  final String tableId;
  @override
  final SessionStatus status;
  @override
  final SessionStage stage;
  @override
  final DateTime scheduledAt;
  @override
  final String valueId;

  /// Value whose commitment is reviewed today; null for a table's first
  /// session.
  @override
  final String? followUpValueId;
  @override
  final DateTime? startedAt;
  @override
  final DateTime? endedAt;
  @override
  final DateTime? answersClosedAt;

  /// Create a copy of SessionInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SessionInfoCopyWith<_SessionInfo> get copyWith =>
      __$SessionInfoCopyWithImpl<_SessionInfo>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SessionInfo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tableId, tableId) || other.tableId == tableId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.valueId, valueId) || other.valueId == valueId) &&
            (identical(other.followUpValueId, followUpValueId) ||
                other.followUpValueId == followUpValueId) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.endedAt, endedAt) || other.endedAt == endedAt) &&
            (identical(other.answersClosedAt, answersClosedAt) ||
                other.answersClosedAt == answersClosedAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    tableId,
    status,
    stage,
    scheduledAt,
    valueId,
    followUpValueId,
    startedAt,
    endedAt,
    answersClosedAt,
  );

  @override
  String toString() {
    return 'SessionInfo(id: $id, tableId: $tableId, status: $status, stage: $stage, scheduledAt: $scheduledAt, valueId: $valueId, followUpValueId: $followUpValueId, startedAt: $startedAt, endedAt: $endedAt, answersClosedAt: $answersClosedAt)';
  }
}

/// @nodoc
abstract mixin class _$SessionInfoCopyWith<$Res>
    implements $SessionInfoCopyWith<$Res> {
  factory _$SessionInfoCopyWith(
    _SessionInfo value,
    $Res Function(_SessionInfo) _then,
  ) = __$SessionInfoCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String tableId,
    SessionStatus status,
    SessionStage stage,
    DateTime scheduledAt,
    String valueId,
    String? followUpValueId,
    DateTime? startedAt,
    DateTime? endedAt,
    DateTime? answersClosedAt,
  });
}

/// @nodoc
class __$SessionInfoCopyWithImpl<$Res> implements _$SessionInfoCopyWith<$Res> {
  __$SessionInfoCopyWithImpl(this._self, this._then);

  final _SessionInfo _self;
  final $Res Function(_SessionInfo) _then;

  /// Create a copy of SessionInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? tableId = null,
    Object? status = null,
    Object? stage = null,
    Object? scheduledAt = null,
    Object? valueId = null,
    Object? followUpValueId = freezed,
    Object? startedAt = freezed,
    Object? endedAt = freezed,
    Object? answersClosedAt = freezed,
  }) {
    return _then(
      _SessionInfo(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        tableId: null == tableId
            ? _self.tableId
            : tableId // ignore: cast_nullable_to_non_nullable
                  as String,
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
        valueId: null == valueId
            ? _self.valueId
            : valueId // ignore: cast_nullable_to_non_nullable
                  as String,
        followUpValueId: freezed == followUpValueId
            ? _self.followUpValueId
            : followUpValueId // ignore: cast_nullable_to_non_nullable
                  as String?,
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
      ),
    );
  }
}
