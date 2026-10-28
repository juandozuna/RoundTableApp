// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeSession {
  String get id;
  String get roundTableId;
  String get tableName;
  DateTime get scheduledAt;
  bool get isOpen;
  int get seatsTaken;
  String? get valueName;
  int? get valueSequence;
  String? get followUpValueName;

  /// An extra meeting added by the coordination (RF-30).
  bool get isExtraordinary;

  /// Regular slot this session was moved from, when it was rescheduled.
  DateTime? get rescheduledFrom;

  /// Slot of a session cancelled since the last one held: the next session
  /// carries the same value.
  DateTime? get cancelledNoticeFor;

  /// `null` when there is not enough history to judge.
  HealthStatus? get health;

  /// Create a copy of HomeSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeSessionCopyWith<HomeSession> get copyWith =>
      _$HomeSessionCopyWithImpl<HomeSession>(this as HomeSession, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeSession &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.roundTableId, roundTableId) ||
                other.roundTableId == roundTableId) &&
            (identical(other.tableName, tableName) ||
                other.tableName == tableName) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen) &&
            (identical(other.seatsTaken, seatsTaken) ||
                other.seatsTaken == seatsTaken) &&
            (identical(other.valueName, valueName) ||
                other.valueName == valueName) &&
            (identical(other.valueSequence, valueSequence) ||
                other.valueSequence == valueSequence) &&
            (identical(other.followUpValueName, followUpValueName) ||
                other.followUpValueName == followUpValueName) &&
            (identical(other.isExtraordinary, isExtraordinary) ||
                other.isExtraordinary == isExtraordinary) &&
            (identical(other.rescheduledFrom, rescheduledFrom) ||
                other.rescheduledFrom == rescheduledFrom) &&
            (identical(other.cancelledNoticeFor, cancelledNoticeFor) ||
                other.cancelledNoticeFor == cancelledNoticeFor) &&
            (identical(other.health, health) || other.health == health));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    roundTableId,
    tableName,
    scheduledAt,
    isOpen,
    seatsTaken,
    valueName,
    valueSequence,
    followUpValueName,
    isExtraordinary,
    rescheduledFrom,
    cancelledNoticeFor,
    health,
  );

  @override
  String toString() {
    return 'HomeSession(id: $id, roundTableId: $roundTableId, tableName: $tableName, scheduledAt: $scheduledAt, isOpen: $isOpen, seatsTaken: $seatsTaken, valueName: $valueName, valueSequence: $valueSequence, followUpValueName: $followUpValueName, isExtraordinary: $isExtraordinary, rescheduledFrom: $rescheduledFrom, cancelledNoticeFor: $cancelledNoticeFor, health: $health)';
  }
}

/// @nodoc
abstract mixin class $HomeSessionCopyWith<$Res> {
  factory $HomeSessionCopyWith(
    HomeSession value,
    $Res Function(HomeSession) _then,
  ) = _$HomeSessionCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String roundTableId,
    String tableName,
    DateTime scheduledAt,
    bool isOpen,
    int seatsTaken,
    String? valueName,
    int? valueSequence,
    String? followUpValueName,
    bool isExtraordinary,
    DateTime? rescheduledFrom,
    DateTime? cancelledNoticeFor,
    HealthStatus? health,
  });
}

/// @nodoc
class _$HomeSessionCopyWithImpl<$Res> implements $HomeSessionCopyWith<$Res> {
  _$HomeSessionCopyWithImpl(this._self, this._then);

  final HomeSession _self;
  final $Res Function(HomeSession) _then;

  /// Create a copy of HomeSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? roundTableId = null,
    Object? tableName = null,
    Object? scheduledAt = null,
    Object? isOpen = null,
    Object? seatsTaken = null,
    Object? valueName = freezed,
    Object? valueSequence = freezed,
    Object? followUpValueName = freezed,
    Object? isExtraordinary = null,
    Object? rescheduledFrom = freezed,
    Object? cancelledNoticeFor = freezed,
    Object? health = freezed,
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
        scheduledAt: null == scheduledAt
            ? _self.scheduledAt
            : scheduledAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        isOpen: null == isOpen
            ? _self.isOpen
            : isOpen // ignore: cast_nullable_to_non_nullable
                  as bool,
        seatsTaken: null == seatsTaken
            ? _self.seatsTaken
            : seatsTaken // ignore: cast_nullable_to_non_nullable
                  as int,
        valueName: freezed == valueName
            ? _self.valueName
            : valueName // ignore: cast_nullable_to_non_nullable
                  as String?,
        valueSequence: freezed == valueSequence
            ? _self.valueSequence
            : valueSequence // ignore: cast_nullable_to_non_nullable
                  as int?,
        followUpValueName: freezed == followUpValueName
            ? _self.followUpValueName
            : followUpValueName // ignore: cast_nullable_to_non_nullable
                  as String?,
        isExtraordinary: null == isExtraordinary
            ? _self.isExtraordinary
            : isExtraordinary // ignore: cast_nullable_to_non_nullable
                  as bool,
        rescheduledFrom: freezed == rescheduledFrom
            ? _self.rescheduledFrom
            : rescheduledFrom // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        cancelledNoticeFor: freezed == cancelledNoticeFor
            ? _self.cancelledNoticeFor
            : cancelledNoticeFor // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        health: freezed == health
            ? _self.health
            : health // ignore: cast_nullable_to_non_nullable
                  as HealthStatus?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [HomeSession].
extension HomeSessionPatterns on HomeSession {
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
    TResult Function(_HomeSession value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeSession() when $default != null:
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
    TResult Function(_HomeSession value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeSession():
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
    TResult? Function(_HomeSession value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeSession() when $default != null:
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
      DateTime scheduledAt,
      bool isOpen,
      int seatsTaken,
      String? valueName,
      int? valueSequence,
      String? followUpValueName,
      bool isExtraordinary,
      DateTime? rescheduledFrom,
      DateTime? cancelledNoticeFor,
      HealthStatus? health,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeSession() when $default != null:
        return $default(
          _that.id,
          _that.roundTableId,
          _that.tableName,
          _that.scheduledAt,
          _that.isOpen,
          _that.seatsTaken,
          _that.valueName,
          _that.valueSequence,
          _that.followUpValueName,
          _that.isExtraordinary,
          _that.rescheduledFrom,
          _that.cancelledNoticeFor,
          _that.health,
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
      DateTime scheduledAt,
      bool isOpen,
      int seatsTaken,
      String? valueName,
      int? valueSequence,
      String? followUpValueName,
      bool isExtraordinary,
      DateTime? rescheduledFrom,
      DateTime? cancelledNoticeFor,
      HealthStatus? health,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeSession():
        return $default(
          _that.id,
          _that.roundTableId,
          _that.tableName,
          _that.scheduledAt,
          _that.isOpen,
          _that.seatsTaken,
          _that.valueName,
          _that.valueSequence,
          _that.followUpValueName,
          _that.isExtraordinary,
          _that.rescheduledFrom,
          _that.cancelledNoticeFor,
          _that.health,
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
      DateTime scheduledAt,
      bool isOpen,
      int seatsTaken,
      String? valueName,
      int? valueSequence,
      String? followUpValueName,
      bool isExtraordinary,
      DateTime? rescheduledFrom,
      DateTime? cancelledNoticeFor,
      HealthStatus? health,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeSession() when $default != null:
        return $default(
          _that.id,
          _that.roundTableId,
          _that.tableName,
          _that.scheduledAt,
          _that.isOpen,
          _that.seatsTaken,
          _that.valueName,
          _that.valueSequence,
          _that.followUpValueName,
          _that.isExtraordinary,
          _that.rescheduledFrom,
          _that.cancelledNoticeFor,
          _that.health,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _HomeSession implements HomeSession {
  const _HomeSession({
    required this.id,
    required this.roundTableId,
    required this.tableName,
    required this.scheduledAt,
    required this.isOpen,
    required this.seatsTaken,
    this.valueName,
    this.valueSequence,
    this.followUpValueName,
    this.isExtraordinary = false,
    this.rescheduledFrom,
    this.cancelledNoticeFor,
    this.health,
  });

  @override
  final String id;
  @override
  final String roundTableId;
  @override
  final String tableName;
  @override
  final DateTime scheduledAt;
  @override
  final bool isOpen;
  @override
  final int seatsTaken;
  @override
  final String? valueName;
  @override
  final int? valueSequence;
  @override
  final String? followUpValueName;

  /// An extra meeting added by the coordination (RF-30).
  @override
  @JsonKey()
  final bool isExtraordinary;

  /// Regular slot this session was moved from, when it was rescheduled.
  @override
  final DateTime? rescheduledFrom;

  /// Slot of a session cancelled since the last one held: the next session
  /// carries the same value.
  @override
  final DateTime? cancelledNoticeFor;

  /// `null` when there is not enough history to judge.
  @override
  final HealthStatus? health;

  /// Create a copy of HomeSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomeSessionCopyWith<_HomeSession> get copyWith =>
      __$HomeSessionCopyWithImpl<_HomeSession>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeSession &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.roundTableId, roundTableId) ||
                other.roundTableId == roundTableId) &&
            (identical(other.tableName, tableName) ||
                other.tableName == tableName) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen) &&
            (identical(other.seatsTaken, seatsTaken) ||
                other.seatsTaken == seatsTaken) &&
            (identical(other.valueName, valueName) ||
                other.valueName == valueName) &&
            (identical(other.valueSequence, valueSequence) ||
                other.valueSequence == valueSequence) &&
            (identical(other.followUpValueName, followUpValueName) ||
                other.followUpValueName == followUpValueName) &&
            (identical(other.isExtraordinary, isExtraordinary) ||
                other.isExtraordinary == isExtraordinary) &&
            (identical(other.rescheduledFrom, rescheduledFrom) ||
                other.rescheduledFrom == rescheduledFrom) &&
            (identical(other.cancelledNoticeFor, cancelledNoticeFor) ||
                other.cancelledNoticeFor == cancelledNoticeFor) &&
            (identical(other.health, health) || other.health == health));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    roundTableId,
    tableName,
    scheduledAt,
    isOpen,
    seatsTaken,
    valueName,
    valueSequence,
    followUpValueName,
    isExtraordinary,
    rescheduledFrom,
    cancelledNoticeFor,
    health,
  );

  @override
  String toString() {
    return 'HomeSession(id: $id, roundTableId: $roundTableId, tableName: $tableName, scheduledAt: $scheduledAt, isOpen: $isOpen, seatsTaken: $seatsTaken, valueName: $valueName, valueSequence: $valueSequence, followUpValueName: $followUpValueName, isExtraordinary: $isExtraordinary, rescheduledFrom: $rescheduledFrom, cancelledNoticeFor: $cancelledNoticeFor, health: $health)';
  }
}

/// @nodoc
abstract mixin class _$HomeSessionCopyWith<$Res>
    implements $HomeSessionCopyWith<$Res> {
  factory _$HomeSessionCopyWith(
    _HomeSession value,
    $Res Function(_HomeSession) _then,
  ) = __$HomeSessionCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String roundTableId,
    String tableName,
    DateTime scheduledAt,
    bool isOpen,
    int seatsTaken,
    String? valueName,
    int? valueSequence,
    String? followUpValueName,
    bool isExtraordinary,
    DateTime? rescheduledFrom,
    DateTime? cancelledNoticeFor,
    HealthStatus? health,
  });
}

/// @nodoc
class __$HomeSessionCopyWithImpl<$Res> implements _$HomeSessionCopyWith<$Res> {
  __$HomeSessionCopyWithImpl(this._self, this._then);

  final _HomeSession _self;
  final $Res Function(_HomeSession) _then;

  /// Create a copy of HomeSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? roundTableId = null,
    Object? tableName = null,
    Object? scheduledAt = null,
    Object? isOpen = null,
    Object? seatsTaken = null,
    Object? valueName = freezed,
    Object? valueSequence = freezed,
    Object? followUpValueName = freezed,
    Object? isExtraordinary = null,
    Object? rescheduledFrom = freezed,
    Object? cancelledNoticeFor = freezed,
    Object? health = freezed,
  }) {
    return _then(
      _HomeSession(
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
        scheduledAt: null == scheduledAt
            ? _self.scheduledAt
            : scheduledAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        isOpen: null == isOpen
            ? _self.isOpen
            : isOpen // ignore: cast_nullable_to_non_nullable
                  as bool,
        seatsTaken: null == seatsTaken
            ? _self.seatsTaken
            : seatsTaken // ignore: cast_nullable_to_non_nullable
                  as int,
        valueName: freezed == valueName
            ? _self.valueName
            : valueName // ignore: cast_nullable_to_non_nullable
                  as String?,
        valueSequence: freezed == valueSequence
            ? _self.valueSequence
            : valueSequence // ignore: cast_nullable_to_non_nullable
                  as int?,
        followUpValueName: freezed == followUpValueName
            ? _self.followUpValueName
            : followUpValueName // ignore: cast_nullable_to_non_nullable
                  as String?,
        isExtraordinary: null == isExtraordinary
            ? _self.isExtraordinary
            : isExtraordinary // ignore: cast_nullable_to_non_nullable
                  as bool,
        rescheduledFrom: freezed == rescheduledFrom
            ? _self.rescheduledFrom
            : rescheduledFrom // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        cancelledNoticeFor: freezed == cancelledNoticeFor
            ? _self.cancelledNoticeFor
            : cancelledNoticeFor // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        health: freezed == health
            ? _self.health
            : health // ignore: cast_nullable_to_non_nullable
                  as HealthStatus?,
      ),
    );
  }
}
