// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upcoming_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpcomingSession {
  String get id;
  String get roundTableId;
  String get tableName;
  UpcomingSessionState get state;

  /// The instant, in UTC.
  DateTime get scheduledAt;

  /// The same instant as wall-clock time in the table's [timezone]; what
  /// people at the table see, whatever zone the viewer is in.
  DateTime get localStart;

  /// IANA name of the table's timezone.
  String get timezone;
  String? get locationId;
  String? get locationName;
  String? get facilitatorId;
  String? get facilitatorName;

  /// An extra meeting added by the coordination (RF-30).
  bool get isExtraordinary;

  /// Regular slot this session was moved from, in the table's timezone.
  DateTime? get rescheduledFromLocal;

  /// Create a copy of UpcomingSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpcomingSessionCopyWith<UpcomingSession> get copyWith =>
      _$UpcomingSessionCopyWithImpl<UpcomingSession>(
        this as UpcomingSession,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpcomingSession &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.roundTableId, roundTableId) ||
                other.roundTableId == roundTableId) &&
            (identical(other.tableName, tableName) ||
                other.tableName == tableName) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.localStart, localStart) ||
                other.localStart == localStart) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.locationName, locationName) ||
                other.locationName == locationName) &&
            (identical(other.facilitatorId, facilitatorId) ||
                other.facilitatorId == facilitatorId) &&
            (identical(other.facilitatorName, facilitatorName) ||
                other.facilitatorName == facilitatorName) &&
            (identical(other.isExtraordinary, isExtraordinary) ||
                other.isExtraordinary == isExtraordinary) &&
            (identical(other.rescheduledFromLocal, rescheduledFromLocal) ||
                other.rescheduledFromLocal == rescheduledFromLocal));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    roundTableId,
    tableName,
    state,
    scheduledAt,
    localStart,
    timezone,
    locationId,
    locationName,
    facilitatorId,
    facilitatorName,
    isExtraordinary,
    rescheduledFromLocal,
  );

  @override
  String toString() {
    return 'UpcomingSession(id: $id, roundTableId: $roundTableId, tableName: $tableName, state: $state, scheduledAt: $scheduledAt, localStart: $localStart, timezone: $timezone, locationId: $locationId, locationName: $locationName, facilitatorId: $facilitatorId, facilitatorName: $facilitatorName, isExtraordinary: $isExtraordinary, rescheduledFromLocal: $rescheduledFromLocal)';
  }
}

/// @nodoc
abstract mixin class $UpcomingSessionCopyWith<$Res> {
  factory $UpcomingSessionCopyWith(
    UpcomingSession value,
    $Res Function(UpcomingSession) _then,
  ) = _$UpcomingSessionCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String roundTableId,
    String tableName,
    UpcomingSessionState state,
    DateTime scheduledAt,
    DateTime localStart,
    String timezone,
    String? locationId,
    String? locationName,
    String? facilitatorId,
    String? facilitatorName,
    bool isExtraordinary,
    DateTime? rescheduledFromLocal,
  });
}

/// @nodoc
class _$UpcomingSessionCopyWithImpl<$Res>
    implements $UpcomingSessionCopyWith<$Res> {
  _$UpcomingSessionCopyWithImpl(this._self, this._then);

  final UpcomingSession _self;
  final $Res Function(UpcomingSession) _then;

  /// Create a copy of UpcomingSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? roundTableId = null,
    Object? tableName = null,
    Object? state = null,
    Object? scheduledAt = null,
    Object? localStart = null,
    Object? timezone = null,
    Object? locationId = freezed,
    Object? locationName = freezed,
    Object? facilitatorId = freezed,
    Object? facilitatorName = freezed,
    Object? isExtraordinary = null,
    Object? rescheduledFromLocal = freezed,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        roundTableId: null == roundTableId
            ? _self.roundTableId
            : roundTableId // ignore: cast_nullable_to_non_nullable
                  as String,
        tableName: null == tableName
            ? _self.tableName
            : tableName // ignore: cast_nullable_to_non_nullable
                  as String,
        state: null == state
            ? _self.state
            : state // ignore: cast_nullable_to_non_nullable
                  as UpcomingSessionState,
        scheduledAt: null == scheduledAt
            ? _self.scheduledAt
            : scheduledAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        localStart: null == localStart
            ? _self.localStart
            : localStart // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        timezone: null == timezone
            ? _self.timezone
            : timezone // ignore: cast_nullable_to_non_nullable
                  as String,
        locationId: freezed == locationId
            ? _self.locationId
            : locationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        locationName: freezed == locationName
            ? _self.locationName
            : locationName // ignore: cast_nullable_to_non_nullable
                  as String?,
        facilitatorId: freezed == facilitatorId
            ? _self.facilitatorId
            : facilitatorId // ignore: cast_nullable_to_non_nullable
                  as String?,
        facilitatorName: freezed == facilitatorName
            ? _self.facilitatorName
            : facilitatorName // ignore: cast_nullable_to_non_nullable
                  as String?,
        isExtraordinary: null == isExtraordinary
            ? _self.isExtraordinary
            : isExtraordinary // ignore: cast_nullable_to_non_nullable
                  as bool,
        rescheduledFromLocal: freezed == rescheduledFromLocal
            ? _self.rescheduledFromLocal
            : rescheduledFromLocal // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [UpcomingSession].
extension UpcomingSessionPatterns on UpcomingSession {
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
    TResult Function(_UpcomingSession value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpcomingSession() when $default != null:
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
    TResult Function(_UpcomingSession value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpcomingSession():
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
    TResult? Function(_UpcomingSession value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpcomingSession() when $default != null:
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
      String roundTableId,
      String tableName,
      UpcomingSessionState state,
      DateTime scheduledAt,
      DateTime localStart,
      String timezone,
      String? locationId,
      String? locationName,
      String? facilitatorId,
      String? facilitatorName,
      bool isExtraordinary,
      DateTime? rescheduledFromLocal,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpcomingSession() when $default != null:
        return $default(
          _that.id,
          _that.roundTableId,
          _that.tableName,
          _that.state,
          _that.scheduledAt,
          _that.localStart,
          _that.timezone,
          _that.locationId,
          _that.locationName,
          _that.facilitatorId,
          _that.facilitatorName,
          _that.isExtraordinary,
          _that.rescheduledFromLocal,
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
      String roundTableId,
      String tableName,
      UpcomingSessionState state,
      DateTime scheduledAt,
      DateTime localStart,
      String timezone,
      String? locationId,
      String? locationName,
      String? facilitatorId,
      String? facilitatorName,
      bool isExtraordinary,
      DateTime? rescheduledFromLocal,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpcomingSession():
        return $default(
          _that.id,
          _that.roundTableId,
          _that.tableName,
          _that.state,
          _that.scheduledAt,
          _that.localStart,
          _that.timezone,
          _that.locationId,
          _that.locationName,
          _that.facilitatorId,
          _that.facilitatorName,
          _that.isExtraordinary,
          _that.rescheduledFromLocal,
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
      String roundTableId,
      String tableName,
      UpcomingSessionState state,
      DateTime scheduledAt,
      DateTime localStart,
      String timezone,
      String? locationId,
      String? locationName,
      String? facilitatorId,
      String? facilitatorName,
      bool isExtraordinary,
      DateTime? rescheduledFromLocal,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpcomingSession() when $default != null:
        return $default(
          _that.id,
          _that.roundTableId,
          _that.tableName,
          _that.state,
          _that.scheduledAt,
          _that.localStart,
          _that.timezone,
          _that.locationId,
          _that.locationName,
          _that.facilitatorId,
          _that.facilitatorName,
          _that.isExtraordinary,
          _that.rescheduledFromLocal,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _UpcomingSession extends UpcomingSession {
  const _UpcomingSession({
    required this.id,
    required this.roundTableId,
    required this.tableName,
    required this.state,
    required this.scheduledAt,
    required this.localStart,
    required this.timezone,
    this.locationId,
    this.locationName,
    this.facilitatorId,
    this.facilitatorName,
    this.isExtraordinary = false,
    this.rescheduledFromLocal,
  }) : super._();

  @override
  final String id;
  @override
  final String roundTableId;
  @override
  final String tableName;
  @override
  final UpcomingSessionState state;

  /// The instant, in UTC.
  @override
  final DateTime scheduledAt;

  /// The same instant as wall-clock time in the table's [timezone]; what
  /// people at the table see, whatever zone the viewer is in.
  @override
  final DateTime localStart;

  /// IANA name of the table's timezone.
  @override
  final String timezone;
  @override
  final String? locationId;
  @override
  final String? locationName;
  @override
  final String? facilitatorId;
  @override
  final String? facilitatorName;

  /// An extra meeting added by the coordination (RF-30).
  @override
  @JsonKey()
  final bool isExtraordinary;

  /// Regular slot this session was moved from, in the table's timezone.
  @override
  final DateTime? rescheduledFromLocal;

  /// Create a copy of UpcomingSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpcomingSessionCopyWith<_UpcomingSession> get copyWith =>
      __$UpcomingSessionCopyWithImpl<_UpcomingSession>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpcomingSession &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.roundTableId, roundTableId) ||
                other.roundTableId == roundTableId) &&
            (identical(other.tableName, tableName) ||
                other.tableName == tableName) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.localStart, localStart) ||
                other.localStart == localStart) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.locationName, locationName) ||
                other.locationName == locationName) &&
            (identical(other.facilitatorId, facilitatorId) ||
                other.facilitatorId == facilitatorId) &&
            (identical(other.facilitatorName, facilitatorName) ||
                other.facilitatorName == facilitatorName) &&
            (identical(other.isExtraordinary, isExtraordinary) ||
                other.isExtraordinary == isExtraordinary) &&
            (identical(other.rescheduledFromLocal, rescheduledFromLocal) ||
                other.rescheduledFromLocal == rescheduledFromLocal));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    roundTableId,
    tableName,
    state,
    scheduledAt,
    localStart,
    timezone,
    locationId,
    locationName,
    facilitatorId,
    facilitatorName,
    isExtraordinary,
    rescheduledFromLocal,
  );

  @override
  String toString() {
    return 'UpcomingSession(id: $id, roundTableId: $roundTableId, tableName: $tableName, state: $state, scheduledAt: $scheduledAt, localStart: $localStart, timezone: $timezone, locationId: $locationId, locationName: $locationName, facilitatorId: $facilitatorId, facilitatorName: $facilitatorName, isExtraordinary: $isExtraordinary, rescheduledFromLocal: $rescheduledFromLocal)';
  }
}

/// @nodoc
abstract mixin class _$UpcomingSessionCopyWith<$Res>
    implements $UpcomingSessionCopyWith<$Res> {
  factory _$UpcomingSessionCopyWith(
    _UpcomingSession value,
    $Res Function(_UpcomingSession) _then,
  ) = __$UpcomingSessionCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String roundTableId,
    String tableName,
    UpcomingSessionState state,
    DateTime scheduledAt,
    DateTime localStart,
    String timezone,
    String? locationId,
    String? locationName,
    String? facilitatorId,
    String? facilitatorName,
    bool isExtraordinary,
    DateTime? rescheduledFromLocal,
  });
}

/// @nodoc
class __$UpcomingSessionCopyWithImpl<$Res>
    implements _$UpcomingSessionCopyWith<$Res> {
  __$UpcomingSessionCopyWithImpl(this._self, this._then);

  final _UpcomingSession _self;
  final $Res Function(_UpcomingSession) _then;

  /// Create a copy of UpcomingSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? roundTableId = null,
    Object? tableName = null,
    Object? state = null,
    Object? scheduledAt = null,
    Object? localStart = null,
    Object? timezone = null,
    Object? locationId = freezed,
    Object? locationName = freezed,
    Object? facilitatorId = freezed,
    Object? facilitatorName = freezed,
    Object? isExtraordinary = null,
    Object? rescheduledFromLocal = freezed,
  }) {
    return _then(
      _UpcomingSession(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        roundTableId: null == roundTableId
            ? _self.roundTableId
            : roundTableId // ignore: cast_nullable_to_non_nullable
                  as String,
        tableName: null == tableName
            ? _self.tableName
            : tableName // ignore: cast_nullable_to_non_nullable
                  as String,
        state: null == state
            ? _self.state
            : state // ignore: cast_nullable_to_non_nullable
                  as UpcomingSessionState,
        scheduledAt: null == scheduledAt
            ? _self.scheduledAt
            : scheduledAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        localStart: null == localStart
            ? _self.localStart
            : localStart // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        timezone: null == timezone
            ? _self.timezone
            : timezone // ignore: cast_nullable_to_non_nullable
                  as String,
        locationId: freezed == locationId
            ? _self.locationId
            : locationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        locationName: freezed == locationName
            ? _self.locationName
            : locationName // ignore: cast_nullable_to_non_nullable
                  as String?,
        facilitatorId: freezed == facilitatorId
            ? _self.facilitatorId
            : facilitatorId // ignore: cast_nullable_to_non_nullable
                  as String?,
        facilitatorName: freezed == facilitatorName
            ? _self.facilitatorName
            : facilitatorName // ignore: cast_nullable_to_non_nullable
                  as String?,
        isExtraordinary: null == isExtraordinary
            ? _self.isExtraordinary
            : isExtraordinary // ignore: cast_nullable_to_non_nullable
                  as bool,
        rescheduledFromLocal: freezed == rescheduledFromLocal
            ? _self.rescheduledFromLocal
            : rescheduledFromLocal // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}
