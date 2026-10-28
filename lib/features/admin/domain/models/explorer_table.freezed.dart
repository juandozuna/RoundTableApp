// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'explorer_table.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExplorerTable {
  String get id;
  String get code;
  String get name;
  String get organizationId;
  String get organizationName;
  String? get countryCode;
  String? get locationId;
  String? get locationName;
  int get weekday;
  String get startTime;
  String get timezone;
  RoundTableStatus get status;
  HealthStatus get health;
  String? get facilitatorPersonId;
  String? get facilitatorName;
  int get activePeople;
  int get maxPeople;
  int get valuesCompleted;
  double? get attendancePct;
  double? get improvementAvg;
  int get syncedLateRows;
  DateTime? get lastSessionAt;
  int? get currentValueSequence;
  String? get currentValueName;

  /// Create a copy of ExplorerTable
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExplorerTableCopyWith<ExplorerTable> get copyWith =>
      _$ExplorerTableCopyWithImpl<ExplorerTable>(
        this as ExplorerTable,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExplorerTable &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.organizationName, organizationName) ||
                other.organizationName == organizationName) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.locationName, locationName) ||
                other.locationName == locationName) &&
            (identical(other.weekday, weekday) || other.weekday == weekday) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.health, health) || other.health == health) &&
            (identical(other.facilitatorPersonId, facilitatorPersonId) ||
                other.facilitatorPersonId == facilitatorPersonId) &&
            (identical(other.facilitatorName, facilitatorName) ||
                other.facilitatorName == facilitatorName) &&
            (identical(other.activePeople, activePeople) ||
                other.activePeople == activePeople) &&
            (identical(other.maxPeople, maxPeople) ||
                other.maxPeople == maxPeople) &&
            (identical(other.valuesCompleted, valuesCompleted) ||
                other.valuesCompleted == valuesCompleted) &&
            (identical(other.attendancePct, attendancePct) ||
                other.attendancePct == attendancePct) &&
            (identical(other.improvementAvg, improvementAvg) ||
                other.improvementAvg == improvementAvg) &&
            (identical(other.syncedLateRows, syncedLateRows) ||
                other.syncedLateRows == syncedLateRows) &&
            (identical(other.lastSessionAt, lastSessionAt) ||
                other.lastSessionAt == lastSessionAt) &&
            (identical(other.currentValueSequence, currentValueSequence) ||
                other.currentValueSequence == currentValueSequence) &&
            (identical(other.currentValueName, currentValueName) ||
                other.currentValueName == currentValueName));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    code,
    name,
    organizationId,
    organizationName,
    countryCode,
    locationId,
    locationName,
    weekday,
    startTime,
    timezone,
    status,
    health,
    facilitatorPersonId,
    facilitatorName,
    activePeople,
    maxPeople,
    valuesCompleted,
    attendancePct,
    improvementAvg,
    syncedLateRows,
    lastSessionAt,
    currentValueSequence,
    currentValueName,
  ]);

  @override
  String toString() {
    return 'ExplorerTable(id: $id, code: $code, name: $name, organizationId: $organizationId, organizationName: $organizationName, countryCode: $countryCode, locationId: $locationId, locationName: $locationName, weekday: $weekday, startTime: $startTime, timezone: $timezone, status: $status, health: $health, facilitatorPersonId: $facilitatorPersonId, facilitatorName: $facilitatorName, activePeople: $activePeople, maxPeople: $maxPeople, valuesCompleted: $valuesCompleted, attendancePct: $attendancePct, improvementAvg: $improvementAvg, syncedLateRows: $syncedLateRows, lastSessionAt: $lastSessionAt, currentValueSequence: $currentValueSequence, currentValueName: $currentValueName)';
  }
}

/// @nodoc
abstract mixin class $ExplorerTableCopyWith<$Res> {
  factory $ExplorerTableCopyWith(
    ExplorerTable value,
    $Res Function(ExplorerTable) _then,
  ) = _$ExplorerTableCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String code,
    String name,
    String organizationId,
    String organizationName,
    String? countryCode,
    String? locationId,
    String? locationName,
    int weekday,
    String startTime,
    String timezone,
    RoundTableStatus status,
    HealthStatus health,
    String? facilitatorPersonId,
    String? facilitatorName,
    int activePeople,
    int maxPeople,
    int valuesCompleted,
    double? attendancePct,
    double? improvementAvg,
    int syncedLateRows,
    DateTime? lastSessionAt,
    int? currentValueSequence,
    String? currentValueName,
  });
}

/// @nodoc
class _$ExplorerTableCopyWithImpl<$Res>
    implements $ExplorerTableCopyWith<$Res> {
  _$ExplorerTableCopyWithImpl(this._self, this._then);

  final ExplorerTable _self;
  final $Res Function(ExplorerTable) _then;

  /// Create a copy of ExplorerTable
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? organizationId = null,
    Object? organizationName = null,
    Object? countryCode = freezed,
    Object? locationId = freezed,
    Object? locationName = freezed,
    Object? weekday = null,
    Object? startTime = null,
    Object? timezone = null,
    Object? status = null,
    Object? health = null,
    Object? facilitatorPersonId = freezed,
    Object? facilitatorName = freezed,
    Object? activePeople = null,
    Object? maxPeople = null,
    Object? valuesCompleted = null,
    Object? attendancePct = freezed,
    Object? improvementAvg = freezed,
    Object? syncedLateRows = null,
    Object? lastSessionAt = freezed,
    Object? currentValueSequence = freezed,
    Object? currentValueName = freezed,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        code: null == code
            ? _self.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        organizationId: null == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String,
        organizationName: null == organizationName
            ? _self.organizationName
            : organizationName // ignore: cast_nullable_to_non_nullable
                  as String,
        countryCode: freezed == countryCode
            ? _self.countryCode
            : countryCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        locationId: freezed == locationId
            ? _self.locationId
            : locationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        locationName: freezed == locationName
            ? _self.locationName
            : locationName // ignore: cast_nullable_to_non_nullable
                  as String?,
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
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as RoundTableStatus,
        health: null == health
            ? _self.health
            : health // ignore: cast_nullable_to_non_nullable
                  as HealthStatus,
        facilitatorPersonId: freezed == facilitatorPersonId
            ? _self.facilitatorPersonId
            : facilitatorPersonId // ignore: cast_nullable_to_non_nullable
                  as String?,
        facilitatorName: freezed == facilitatorName
            ? _self.facilitatorName
            : facilitatorName // ignore: cast_nullable_to_non_nullable
                  as String?,
        activePeople: null == activePeople
            ? _self.activePeople
            : activePeople // ignore: cast_nullable_to_non_nullable
                  as int,
        maxPeople: null == maxPeople
            ? _self.maxPeople
            : maxPeople // ignore: cast_nullable_to_non_nullable
                  as int,
        valuesCompleted: null == valuesCompleted
            ? _self.valuesCompleted
            : valuesCompleted // ignore: cast_nullable_to_non_nullable
                  as int,
        attendancePct: freezed == attendancePct
            ? _self.attendancePct
            : attendancePct // ignore: cast_nullable_to_non_nullable
                  as double?,
        improvementAvg: freezed == improvementAvg
            ? _self.improvementAvg
            : improvementAvg // ignore: cast_nullable_to_non_nullable
                  as double?,
        syncedLateRows: null == syncedLateRows
            ? _self.syncedLateRows
            : syncedLateRows // ignore: cast_nullable_to_non_nullable
                  as int,
        lastSessionAt: freezed == lastSessionAt
            ? _self.lastSessionAt
            : lastSessionAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        currentValueSequence: freezed == currentValueSequence
            ? _self.currentValueSequence
            : currentValueSequence // ignore: cast_nullable_to_non_nullable
                  as int?,
        currentValueName: freezed == currentValueName
            ? _self.currentValueName
            : currentValueName // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [ExplorerTable].
extension ExplorerTablePatterns on ExplorerTable {
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
    TResult Function(_ExplorerTable value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExplorerTable() when $default != null:
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
    TResult Function(_ExplorerTable value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExplorerTable():
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
    TResult? Function(_ExplorerTable value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExplorerTable() when $default != null:
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
      String code,
      String name,
      String organizationId,
      String organizationName,
      String? countryCode,
      String? locationId,
      String? locationName,
      int weekday,
      String startTime,
      String timezone,
      RoundTableStatus status,
      HealthStatus health,
      String? facilitatorPersonId,
      String? facilitatorName,
      int activePeople,
      int maxPeople,
      int valuesCompleted,
      double? attendancePct,
      double? improvementAvg,
      int syncedLateRows,
      DateTime? lastSessionAt,
      int? currentValueSequence,
      String? currentValueName,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExplorerTable() when $default != null:
        return $default(
          _that.id,
          _that.code,
          _that.name,
          _that.organizationId,
          _that.organizationName,
          _that.countryCode,
          _that.locationId,
          _that.locationName,
          _that.weekday,
          _that.startTime,
          _that.timezone,
          _that.status,
          _that.health,
          _that.facilitatorPersonId,
          _that.facilitatorName,
          _that.activePeople,
          _that.maxPeople,
          _that.valuesCompleted,
          _that.attendancePct,
          _that.improvementAvg,
          _that.syncedLateRows,
          _that.lastSessionAt,
          _that.currentValueSequence,
          _that.currentValueName,
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
      String code,
      String name,
      String organizationId,
      String organizationName,
      String? countryCode,
      String? locationId,
      String? locationName,
      int weekday,
      String startTime,
      String timezone,
      RoundTableStatus status,
      HealthStatus health,
      String? facilitatorPersonId,
      String? facilitatorName,
      int activePeople,
      int maxPeople,
      int valuesCompleted,
      double? attendancePct,
      double? improvementAvg,
      int syncedLateRows,
      DateTime? lastSessionAt,
      int? currentValueSequence,
      String? currentValueName,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExplorerTable():
        return $default(
          _that.id,
          _that.code,
          _that.name,
          _that.organizationId,
          _that.organizationName,
          _that.countryCode,
          _that.locationId,
          _that.locationName,
          _that.weekday,
          _that.startTime,
          _that.timezone,
          _that.status,
          _that.health,
          _that.facilitatorPersonId,
          _that.facilitatorName,
          _that.activePeople,
          _that.maxPeople,
          _that.valuesCompleted,
          _that.attendancePct,
          _that.improvementAvg,
          _that.syncedLateRows,
          _that.lastSessionAt,
          _that.currentValueSequence,
          _that.currentValueName,
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
      String code,
      String name,
      String organizationId,
      String organizationName,
      String? countryCode,
      String? locationId,
      String? locationName,
      int weekday,
      String startTime,
      String timezone,
      RoundTableStatus status,
      HealthStatus health,
      String? facilitatorPersonId,
      String? facilitatorName,
      int activePeople,
      int maxPeople,
      int valuesCompleted,
      double? attendancePct,
      double? improvementAvg,
      int syncedLateRows,
      DateTime? lastSessionAt,
      int? currentValueSequence,
      String? currentValueName,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExplorerTable() when $default != null:
        return $default(
          _that.id,
          _that.code,
          _that.name,
          _that.organizationId,
          _that.organizationName,
          _that.countryCode,
          _that.locationId,
          _that.locationName,
          _that.weekday,
          _that.startTime,
          _that.timezone,
          _that.status,
          _that.health,
          _that.facilitatorPersonId,
          _that.facilitatorName,
          _that.activePeople,
          _that.maxPeople,
          _that.valuesCompleted,
          _that.attendancePct,
          _that.improvementAvg,
          _that.syncedLateRows,
          _that.lastSessionAt,
          _that.currentValueSequence,
          _that.currentValueName,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ExplorerTable extends ExplorerTable {
  const _ExplorerTable({
    required this.id,
    required this.code,
    required this.name,
    required this.organizationId,
    required this.organizationName,
    this.countryCode,
    this.locationId,
    this.locationName,
    required this.weekday,
    required this.startTime,
    required this.timezone,
    required this.status,
    required this.health,
    this.facilitatorPersonId,
    this.facilitatorName,
    required this.activePeople,
    required this.maxPeople,
    this.valuesCompleted = 0,
    this.attendancePct,
    this.improvementAvg,
    this.syncedLateRows = 0,
    this.lastSessionAt,
    this.currentValueSequence,
    this.currentValueName,
  }) : super._();

  @override
  final String id;
  @override
  final String code;
  @override
  final String name;
  @override
  final String organizationId;
  @override
  final String organizationName;
  @override
  final String? countryCode;
  @override
  final String? locationId;
  @override
  final String? locationName;
  @override
  final int weekday;
  @override
  final String startTime;
  @override
  final String timezone;
  @override
  final RoundTableStatus status;
  @override
  final HealthStatus health;
  @override
  final String? facilitatorPersonId;
  @override
  final String? facilitatorName;
  @override
  final int activePeople;
  @override
  final int maxPeople;
  @override
  @JsonKey()
  final int valuesCompleted;
  @override
  final double? attendancePct;
  @override
  final double? improvementAvg;
  @override
  @JsonKey()
  final int syncedLateRows;
  @override
  final DateTime? lastSessionAt;
  @override
  final int? currentValueSequence;
  @override
  final String? currentValueName;

  /// Create a copy of ExplorerTable
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ExplorerTableCopyWith<_ExplorerTable> get copyWith =>
      __$ExplorerTableCopyWithImpl<_ExplorerTable>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExplorerTable &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.organizationName, organizationName) ||
                other.organizationName == organizationName) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.locationName, locationName) ||
                other.locationName == locationName) &&
            (identical(other.weekday, weekday) || other.weekday == weekday) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.health, health) || other.health == health) &&
            (identical(other.facilitatorPersonId, facilitatorPersonId) ||
                other.facilitatorPersonId == facilitatorPersonId) &&
            (identical(other.facilitatorName, facilitatorName) ||
                other.facilitatorName == facilitatorName) &&
            (identical(other.activePeople, activePeople) ||
                other.activePeople == activePeople) &&
            (identical(other.maxPeople, maxPeople) ||
                other.maxPeople == maxPeople) &&
            (identical(other.valuesCompleted, valuesCompleted) ||
                other.valuesCompleted == valuesCompleted) &&
            (identical(other.attendancePct, attendancePct) ||
                other.attendancePct == attendancePct) &&
            (identical(other.improvementAvg, improvementAvg) ||
                other.improvementAvg == improvementAvg) &&
            (identical(other.syncedLateRows, syncedLateRows) ||
                other.syncedLateRows == syncedLateRows) &&
            (identical(other.lastSessionAt, lastSessionAt) ||
                other.lastSessionAt == lastSessionAt) &&
            (identical(other.currentValueSequence, currentValueSequence) ||
                other.currentValueSequence == currentValueSequence) &&
            (identical(other.currentValueName, currentValueName) ||
                other.currentValueName == currentValueName));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    code,
    name,
    organizationId,
    organizationName,
    countryCode,
    locationId,
    locationName,
    weekday,
    startTime,
    timezone,
    status,
    health,
    facilitatorPersonId,
    facilitatorName,
    activePeople,
    maxPeople,
    valuesCompleted,
    attendancePct,
    improvementAvg,
    syncedLateRows,
    lastSessionAt,
    currentValueSequence,
    currentValueName,
  ]);

  @override
  String toString() {
    return 'ExplorerTable(id: $id, code: $code, name: $name, organizationId: $organizationId, organizationName: $organizationName, countryCode: $countryCode, locationId: $locationId, locationName: $locationName, weekday: $weekday, startTime: $startTime, timezone: $timezone, status: $status, health: $health, facilitatorPersonId: $facilitatorPersonId, facilitatorName: $facilitatorName, activePeople: $activePeople, maxPeople: $maxPeople, valuesCompleted: $valuesCompleted, attendancePct: $attendancePct, improvementAvg: $improvementAvg, syncedLateRows: $syncedLateRows, lastSessionAt: $lastSessionAt, currentValueSequence: $currentValueSequence, currentValueName: $currentValueName)';
  }
}

/// @nodoc
abstract mixin class _$ExplorerTableCopyWith<$Res>
    implements $ExplorerTableCopyWith<$Res> {
  factory _$ExplorerTableCopyWith(
    _ExplorerTable value,
    $Res Function(_ExplorerTable) _then,
  ) = __$ExplorerTableCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String code,
    String name,
    String organizationId,
    String organizationName,
    String? countryCode,
    String? locationId,
    String? locationName,
    int weekday,
    String startTime,
    String timezone,
    RoundTableStatus status,
    HealthStatus health,
    String? facilitatorPersonId,
    String? facilitatorName,
    int activePeople,
    int maxPeople,
    int valuesCompleted,
    double? attendancePct,
    double? improvementAvg,
    int syncedLateRows,
    DateTime? lastSessionAt,
    int? currentValueSequence,
    String? currentValueName,
  });
}

/// @nodoc
class __$ExplorerTableCopyWithImpl<$Res>
    implements _$ExplorerTableCopyWith<$Res> {
  __$ExplorerTableCopyWithImpl(this._self, this._then);

  final _ExplorerTable _self;
  final $Res Function(_ExplorerTable) _then;

  /// Create a copy of ExplorerTable
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? organizationId = null,
    Object? organizationName = null,
    Object? countryCode = freezed,
    Object? locationId = freezed,
    Object? locationName = freezed,
    Object? weekday = null,
    Object? startTime = null,
    Object? timezone = null,
    Object? status = null,
    Object? health = null,
    Object? facilitatorPersonId = freezed,
    Object? facilitatorName = freezed,
    Object? activePeople = null,
    Object? maxPeople = null,
    Object? valuesCompleted = null,
    Object? attendancePct = freezed,
    Object? improvementAvg = freezed,
    Object? syncedLateRows = null,
    Object? lastSessionAt = freezed,
    Object? currentValueSequence = freezed,
    Object? currentValueName = freezed,
  }) {
    return _then(
      _ExplorerTable(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        code: null == code
            ? _self.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        organizationId: null == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String,
        organizationName: null == organizationName
            ? _self.organizationName
            : organizationName // ignore: cast_nullable_to_non_nullable
                  as String,
        countryCode: freezed == countryCode
            ? _self.countryCode
            : countryCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        locationId: freezed == locationId
            ? _self.locationId
            : locationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        locationName: freezed == locationName
            ? _self.locationName
            : locationName // ignore: cast_nullable_to_non_nullable
                  as String?,
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
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as RoundTableStatus,
        health: null == health
            ? _self.health
            : health // ignore: cast_nullable_to_non_nullable
                  as HealthStatus,
        facilitatorPersonId: freezed == facilitatorPersonId
            ? _self.facilitatorPersonId
            : facilitatorPersonId // ignore: cast_nullable_to_non_nullable
                  as String?,
        facilitatorName: freezed == facilitatorName
            ? _self.facilitatorName
            : facilitatorName // ignore: cast_nullable_to_non_nullable
                  as String?,
        activePeople: null == activePeople
            ? _self.activePeople
            : activePeople // ignore: cast_nullable_to_non_nullable
                  as int,
        maxPeople: null == maxPeople
            ? _self.maxPeople
            : maxPeople // ignore: cast_nullable_to_non_nullable
                  as int,
        valuesCompleted: null == valuesCompleted
            ? _self.valuesCompleted
            : valuesCompleted // ignore: cast_nullable_to_non_nullable
                  as int,
        attendancePct: freezed == attendancePct
            ? _self.attendancePct
            : attendancePct // ignore: cast_nullable_to_non_nullable
                  as double?,
        improvementAvg: freezed == improvementAvg
            ? _self.improvementAvg
            : improvementAvg // ignore: cast_nullable_to_non_nullable
                  as double?,
        syncedLateRows: null == syncedLateRows
            ? _self.syncedLateRows
            : syncedLateRows // ignore: cast_nullable_to_non_nullable
                  as int,
        lastSessionAt: freezed == lastSessionAt
            ? _self.lastSessionAt
            : lastSessionAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        currentValueSequence: freezed == currentValueSequence
            ? _self.currentValueSequence
            : currentValueSequence // ignore: cast_nullable_to_non_nullable
                  as int?,
        currentValueName: freezed == currentValueName
            ? _self.currentValueName
            : currentValueName // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}
