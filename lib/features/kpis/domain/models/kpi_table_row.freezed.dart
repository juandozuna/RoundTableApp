// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kpi_table_row.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KpiTableRow {
  String get roundTableId;
  String get code;
  String get name;
  String get organizationId;
  String get organizationName;
  String? get countryCode;
  String? get locationId;
  String? get locationName;
  String? get facilitatorPersonId;
  String? get facilitatorName;
  String? get status;
  @JsonKey(unknownEnumValue: HealthStatus.inactive)
  HealthStatus get health;
  int get activePeople;
  int get valuesCompleted;
  String? get currentValueId;
  String? get currentValueLabel;
  double? get attendancePct;
  double? get improvementAvg;
  int get syncedLateRows;
  DateTime? get lastSessionAt;
  DateTime? get pendingSessionAt;
  double? get recentAttendancePct;
  @JsonKey(fromJson: HealthReason.listFromJson)
  List<HealthReason> get healthReasons;

  /// Create a copy of KpiTableRow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $KpiTableRowCopyWith<KpiTableRow> get copyWith =>
      _$KpiTableRowCopyWithImpl<KpiTableRow>(this as KpiTableRow, _$identity);

  /// Serializes this KpiTableRow to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is KpiTableRow &&
            (identical(other.roundTableId, roundTableId) ||
                other.roundTableId == roundTableId) &&
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
            (identical(other.facilitatorPersonId, facilitatorPersonId) ||
                other.facilitatorPersonId == facilitatorPersonId) &&
            (identical(other.facilitatorName, facilitatorName) ||
                other.facilitatorName == facilitatorName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.health, health) || other.health == health) &&
            (identical(other.activePeople, activePeople) ||
                other.activePeople == activePeople) &&
            (identical(other.valuesCompleted, valuesCompleted) ||
                other.valuesCompleted == valuesCompleted) &&
            (identical(other.currentValueId, currentValueId) ||
                other.currentValueId == currentValueId) &&
            (identical(other.currentValueLabel, currentValueLabel) ||
                other.currentValueLabel == currentValueLabel) &&
            (identical(other.attendancePct, attendancePct) ||
                other.attendancePct == attendancePct) &&
            (identical(other.improvementAvg, improvementAvg) ||
                other.improvementAvg == improvementAvg) &&
            (identical(other.syncedLateRows, syncedLateRows) ||
                other.syncedLateRows == syncedLateRows) &&
            (identical(other.lastSessionAt, lastSessionAt) ||
                other.lastSessionAt == lastSessionAt) &&
            (identical(other.pendingSessionAt, pendingSessionAt) ||
                other.pendingSessionAt == pendingSessionAt) &&
            (identical(other.recentAttendancePct, recentAttendancePct) ||
                other.recentAttendancePct == recentAttendancePct) &&
            const DeepCollectionEquality().equals(
              other.healthReasons,
              healthReasons,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    roundTableId,
    code,
    name,
    organizationId,
    organizationName,
    countryCode,
    locationId,
    locationName,
    facilitatorPersonId,
    facilitatorName,
    status,
    health,
    activePeople,
    valuesCompleted,
    currentValueId,
    currentValueLabel,
    attendancePct,
    improvementAvg,
    syncedLateRows,
    lastSessionAt,
    pendingSessionAt,
    recentAttendancePct,
    const DeepCollectionEquality().hash(healthReasons),
  ]);

  @override
  String toString() {
    return 'KpiTableRow(roundTableId: $roundTableId, code: $code, name: $name, organizationId: $organizationId, organizationName: $organizationName, countryCode: $countryCode, locationId: $locationId, locationName: $locationName, facilitatorPersonId: $facilitatorPersonId, facilitatorName: $facilitatorName, status: $status, health: $health, activePeople: $activePeople, valuesCompleted: $valuesCompleted, currentValueId: $currentValueId, currentValueLabel: $currentValueLabel, attendancePct: $attendancePct, improvementAvg: $improvementAvg, syncedLateRows: $syncedLateRows, lastSessionAt: $lastSessionAt, pendingSessionAt: $pendingSessionAt, recentAttendancePct: $recentAttendancePct, healthReasons: $healthReasons)';
  }
}

/// @nodoc
abstract mixin class $KpiTableRowCopyWith<$Res> {
  factory $KpiTableRowCopyWith(
    KpiTableRow value,
    $Res Function(KpiTableRow) _then,
  ) = _$KpiTableRowCopyWithImpl;
  @useResult
  $Res call({
    String roundTableId,
    String code,
    String name,
    String organizationId,
    String organizationName,
    String? countryCode,
    String? locationId,
    String? locationName,
    String? facilitatorPersonId,
    String? facilitatorName,
    String? status,
    @JsonKey(unknownEnumValue: HealthStatus.inactive) HealthStatus health,
    int activePeople,
    int valuesCompleted,
    String? currentValueId,
    String? currentValueLabel,
    double? attendancePct,
    double? improvementAvg,
    int syncedLateRows,
    DateTime? lastSessionAt,
    DateTime? pendingSessionAt,
    double? recentAttendancePct,
    @JsonKey(fromJson: HealthReason.listFromJson)
    List<HealthReason> healthReasons,
  });
}

/// @nodoc
class _$KpiTableRowCopyWithImpl<$Res> implements $KpiTableRowCopyWith<$Res> {
  _$KpiTableRowCopyWithImpl(this._self, this._then);

  final KpiTableRow _self;
  final $Res Function(KpiTableRow) _then;

  /// Create a copy of KpiTableRow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roundTableId = null,
    Object? code = null,
    Object? name = null,
    Object? organizationId = null,
    Object? organizationName = null,
    Object? countryCode = freezed,
    Object? locationId = freezed,
    Object? locationName = freezed,
    Object? facilitatorPersonId = freezed,
    Object? facilitatorName = freezed,
    Object? status = freezed,
    Object? health = null,
    Object? activePeople = null,
    Object? valuesCompleted = null,
    Object? currentValueId = freezed,
    Object? currentValueLabel = freezed,
    Object? attendancePct = freezed,
    Object? improvementAvg = freezed,
    Object? syncedLateRows = null,
    Object? lastSessionAt = freezed,
    Object? pendingSessionAt = freezed,
    Object? recentAttendancePct = freezed,
    Object? healthReasons = null,
  }) {
    return _then(
      _self.copyWith(
        roundTableId: null == roundTableId
            ? _self.roundTableId
            : roundTableId // ignore: cast_nullable_to_non_nullable
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
        facilitatorPersonId: freezed == facilitatorPersonId
            ? _self.facilitatorPersonId
            : facilitatorPersonId // ignore: cast_nullable_to_non_nullable
                  as String?,
        facilitatorName: freezed == facilitatorName
            ? _self.facilitatorName
            : facilitatorName // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        health: null == health
            ? _self.health
            : health // ignore: cast_nullable_to_non_nullable
                  as HealthStatus,
        activePeople: null == activePeople
            ? _self.activePeople
            : activePeople // ignore: cast_nullable_to_non_nullable
                  as int,
        valuesCompleted: null == valuesCompleted
            ? _self.valuesCompleted
            : valuesCompleted // ignore: cast_nullable_to_non_nullable
                  as int,
        currentValueId: freezed == currentValueId
            ? _self.currentValueId
            : currentValueId // ignore: cast_nullable_to_non_nullable
                  as String?,
        currentValueLabel: freezed == currentValueLabel
            ? _self.currentValueLabel
            : currentValueLabel // ignore: cast_nullable_to_non_nullable
                  as String?,
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
        pendingSessionAt: freezed == pendingSessionAt
            ? _self.pendingSessionAt
            : pendingSessionAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        recentAttendancePct: freezed == recentAttendancePct
            ? _self.recentAttendancePct
            : recentAttendancePct // ignore: cast_nullable_to_non_nullable
                  as double?,
        healthReasons: null == healthReasons
            ? _self.healthReasons
            : healthReasons // ignore: cast_nullable_to_non_nullable
                  as List<HealthReason>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [KpiTableRow].
extension KpiTableRowPatterns on KpiTableRow {
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
    TResult Function(_KpiTableRow value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _KpiTableRow() when $default != null:
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
    TResult Function(_KpiTableRow value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KpiTableRow():
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
    TResult? Function(_KpiTableRow value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KpiTableRow() when $default != null:
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
      String roundTableId,
      String code,
      String name,
      String organizationId,
      String organizationName,
      String? countryCode,
      String? locationId,
      String? locationName,
      String? facilitatorPersonId,
      String? facilitatorName,
      String? status,
      @JsonKey(unknownEnumValue: HealthStatus.inactive) HealthStatus health,
      int activePeople,
      int valuesCompleted,
      String? currentValueId,
      String? currentValueLabel,
      double? attendancePct,
      double? improvementAvg,
      int syncedLateRows,
      DateTime? lastSessionAt,
      DateTime? pendingSessionAt,
      double? recentAttendancePct,
      @JsonKey(fromJson: HealthReason.listFromJson)
      List<HealthReason> healthReasons,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _KpiTableRow() when $default != null:
        return $default(
          _that.roundTableId,
          _that.code,
          _that.name,
          _that.organizationId,
          _that.organizationName,
          _that.countryCode,
          _that.locationId,
          _that.locationName,
          _that.facilitatorPersonId,
          _that.facilitatorName,
          _that.status,
          _that.health,
          _that.activePeople,
          _that.valuesCompleted,
          _that.currentValueId,
          _that.currentValueLabel,
          _that.attendancePct,
          _that.improvementAvg,
          _that.syncedLateRows,
          _that.lastSessionAt,
          _that.pendingSessionAt,
          _that.recentAttendancePct,
          _that.healthReasons,
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
      String roundTableId,
      String code,
      String name,
      String organizationId,
      String organizationName,
      String? countryCode,
      String? locationId,
      String? locationName,
      String? facilitatorPersonId,
      String? facilitatorName,
      String? status,
      @JsonKey(unknownEnumValue: HealthStatus.inactive) HealthStatus health,
      int activePeople,
      int valuesCompleted,
      String? currentValueId,
      String? currentValueLabel,
      double? attendancePct,
      double? improvementAvg,
      int syncedLateRows,
      DateTime? lastSessionAt,
      DateTime? pendingSessionAt,
      double? recentAttendancePct,
      @JsonKey(fromJson: HealthReason.listFromJson)
      List<HealthReason> healthReasons,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KpiTableRow():
        return $default(
          _that.roundTableId,
          _that.code,
          _that.name,
          _that.organizationId,
          _that.organizationName,
          _that.countryCode,
          _that.locationId,
          _that.locationName,
          _that.facilitatorPersonId,
          _that.facilitatorName,
          _that.status,
          _that.health,
          _that.activePeople,
          _that.valuesCompleted,
          _that.currentValueId,
          _that.currentValueLabel,
          _that.attendancePct,
          _that.improvementAvg,
          _that.syncedLateRows,
          _that.lastSessionAt,
          _that.pendingSessionAt,
          _that.recentAttendancePct,
          _that.healthReasons,
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
      String roundTableId,
      String code,
      String name,
      String organizationId,
      String organizationName,
      String? countryCode,
      String? locationId,
      String? locationName,
      String? facilitatorPersonId,
      String? facilitatorName,
      String? status,
      @JsonKey(unknownEnumValue: HealthStatus.inactive) HealthStatus health,
      int activePeople,
      int valuesCompleted,
      String? currentValueId,
      String? currentValueLabel,
      double? attendancePct,
      double? improvementAvg,
      int syncedLateRows,
      DateTime? lastSessionAt,
      DateTime? pendingSessionAt,
      double? recentAttendancePct,
      @JsonKey(fromJson: HealthReason.listFromJson)
      List<HealthReason> healthReasons,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KpiTableRow() when $default != null:
        return $default(
          _that.roundTableId,
          _that.code,
          _that.name,
          _that.organizationId,
          _that.organizationName,
          _that.countryCode,
          _that.locationId,
          _that.locationName,
          _that.facilitatorPersonId,
          _that.facilitatorName,
          _that.status,
          _that.health,
          _that.activePeople,
          _that.valuesCompleted,
          _that.currentValueId,
          _that.currentValueLabel,
          _that.attendancePct,
          _that.improvementAvg,
          _that.syncedLateRows,
          _that.lastSessionAt,
          _that.pendingSessionAt,
          _that.recentAttendancePct,
          _that.healthReasons,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _KpiTableRow implements KpiTableRow {
  const _KpiTableRow({
    required this.roundTableId,
    required this.code,
    required this.name,
    required this.organizationId,
    required this.organizationName,
    this.countryCode,
    this.locationId,
    this.locationName,
    this.facilitatorPersonId,
    this.facilitatorName,
    this.status,
    @JsonKey(unknownEnumValue: HealthStatus.inactive)
    this.health = HealthStatus.active,
    this.activePeople = 0,
    this.valuesCompleted = 0,
    this.currentValueId,
    this.currentValueLabel,
    this.attendancePct,
    this.improvementAvg,
    this.syncedLateRows = 0,
    this.lastSessionAt,
    this.pendingSessionAt,
    this.recentAttendancePct,
    @JsonKey(fromJson: HealthReason.listFromJson)
    final List<HealthReason> healthReasons = const [],
  }) : _healthReasons = healthReasons;
  factory _KpiTableRow.fromJson(Map<String, dynamic> json) =>
      _$KpiTableRowFromJson(json);

  @override
  final String roundTableId;
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
  final String? facilitatorPersonId;
  @override
  final String? facilitatorName;
  @override
  final String? status;
  @override
  @JsonKey(unknownEnumValue: HealthStatus.inactive)
  final HealthStatus health;
  @override
  @JsonKey()
  final int activePeople;
  @override
  @JsonKey()
  final int valuesCompleted;
  @override
  final String? currentValueId;
  @override
  final String? currentValueLabel;
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
  final DateTime? pendingSessionAt;
  @override
  final double? recentAttendancePct;
  final List<HealthReason> _healthReasons;
  @override
  @JsonKey(fromJson: HealthReason.listFromJson)
  List<HealthReason> get healthReasons {
    if (_healthReasons is EqualUnmodifiableListView) return _healthReasons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_healthReasons);
  }

  /// Create a copy of KpiTableRow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$KpiTableRowCopyWith<_KpiTableRow> get copyWith =>
      __$KpiTableRowCopyWithImpl<_KpiTableRow>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$KpiTableRowToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _KpiTableRow &&
            (identical(other.roundTableId, roundTableId) ||
                other.roundTableId == roundTableId) &&
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
            (identical(other.facilitatorPersonId, facilitatorPersonId) ||
                other.facilitatorPersonId == facilitatorPersonId) &&
            (identical(other.facilitatorName, facilitatorName) ||
                other.facilitatorName == facilitatorName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.health, health) || other.health == health) &&
            (identical(other.activePeople, activePeople) ||
                other.activePeople == activePeople) &&
            (identical(other.valuesCompleted, valuesCompleted) ||
                other.valuesCompleted == valuesCompleted) &&
            (identical(other.currentValueId, currentValueId) ||
                other.currentValueId == currentValueId) &&
            (identical(other.currentValueLabel, currentValueLabel) ||
                other.currentValueLabel == currentValueLabel) &&
            (identical(other.attendancePct, attendancePct) ||
                other.attendancePct == attendancePct) &&
            (identical(other.improvementAvg, improvementAvg) ||
                other.improvementAvg == improvementAvg) &&
            (identical(other.syncedLateRows, syncedLateRows) ||
                other.syncedLateRows == syncedLateRows) &&
            (identical(other.lastSessionAt, lastSessionAt) ||
                other.lastSessionAt == lastSessionAt) &&
            (identical(other.pendingSessionAt, pendingSessionAt) ||
                other.pendingSessionAt == pendingSessionAt) &&
            (identical(other.recentAttendancePct, recentAttendancePct) ||
                other.recentAttendancePct == recentAttendancePct) &&
            const DeepCollectionEquality().equals(
              other._healthReasons,
              _healthReasons,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    roundTableId,
    code,
    name,
    organizationId,
    organizationName,
    countryCode,
    locationId,
    locationName,
    facilitatorPersonId,
    facilitatorName,
    status,
    health,
    activePeople,
    valuesCompleted,
    currentValueId,
    currentValueLabel,
    attendancePct,
    improvementAvg,
    syncedLateRows,
    lastSessionAt,
    pendingSessionAt,
    recentAttendancePct,
    const DeepCollectionEquality().hash(_healthReasons),
  ]);

  @override
  String toString() {
    return 'KpiTableRow(roundTableId: $roundTableId, code: $code, name: $name, organizationId: $organizationId, organizationName: $organizationName, countryCode: $countryCode, locationId: $locationId, locationName: $locationName, facilitatorPersonId: $facilitatorPersonId, facilitatorName: $facilitatorName, status: $status, health: $health, activePeople: $activePeople, valuesCompleted: $valuesCompleted, currentValueId: $currentValueId, currentValueLabel: $currentValueLabel, attendancePct: $attendancePct, improvementAvg: $improvementAvg, syncedLateRows: $syncedLateRows, lastSessionAt: $lastSessionAt, pendingSessionAt: $pendingSessionAt, recentAttendancePct: $recentAttendancePct, healthReasons: $healthReasons)';
  }
}

/// @nodoc
abstract mixin class _$KpiTableRowCopyWith<$Res>
    implements $KpiTableRowCopyWith<$Res> {
  factory _$KpiTableRowCopyWith(
    _KpiTableRow value,
    $Res Function(_KpiTableRow) _then,
  ) = __$KpiTableRowCopyWithImpl;
  @override
  @useResult
  $Res call({
    String roundTableId,
    String code,
    String name,
    String organizationId,
    String organizationName,
    String? countryCode,
    String? locationId,
    String? locationName,
    String? facilitatorPersonId,
    String? facilitatorName,
    String? status,
    @JsonKey(unknownEnumValue: HealthStatus.inactive) HealthStatus health,
    int activePeople,
    int valuesCompleted,
    String? currentValueId,
    String? currentValueLabel,
    double? attendancePct,
    double? improvementAvg,
    int syncedLateRows,
    DateTime? lastSessionAt,
    DateTime? pendingSessionAt,
    double? recentAttendancePct,
    @JsonKey(fromJson: HealthReason.listFromJson)
    List<HealthReason> healthReasons,
  });
}

/// @nodoc
class __$KpiTableRowCopyWithImpl<$Res> implements _$KpiTableRowCopyWith<$Res> {
  __$KpiTableRowCopyWithImpl(this._self, this._then);

  final _KpiTableRow _self;
  final $Res Function(_KpiTableRow) _then;

  /// Create a copy of KpiTableRow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? roundTableId = null,
    Object? code = null,
    Object? name = null,
    Object? organizationId = null,
    Object? organizationName = null,
    Object? countryCode = freezed,
    Object? locationId = freezed,
    Object? locationName = freezed,
    Object? facilitatorPersonId = freezed,
    Object? facilitatorName = freezed,
    Object? status = freezed,
    Object? health = null,
    Object? activePeople = null,
    Object? valuesCompleted = null,
    Object? currentValueId = freezed,
    Object? currentValueLabel = freezed,
    Object? attendancePct = freezed,
    Object? improvementAvg = freezed,
    Object? syncedLateRows = null,
    Object? lastSessionAt = freezed,
    Object? pendingSessionAt = freezed,
    Object? recentAttendancePct = freezed,
    Object? healthReasons = null,
  }) {
    return _then(
      _KpiTableRow(
        roundTableId: null == roundTableId
            ? _self.roundTableId
            : roundTableId // ignore: cast_nullable_to_non_nullable
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
        facilitatorPersonId: freezed == facilitatorPersonId
            ? _self.facilitatorPersonId
            : facilitatorPersonId // ignore: cast_nullable_to_non_nullable
                  as String?,
        facilitatorName: freezed == facilitatorName
            ? _self.facilitatorName
            : facilitatorName // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        health: null == health
            ? _self.health
            : health // ignore: cast_nullable_to_non_nullable
                  as HealthStatus,
        activePeople: null == activePeople
            ? _self.activePeople
            : activePeople // ignore: cast_nullable_to_non_nullable
                  as int,
        valuesCompleted: null == valuesCompleted
            ? _self.valuesCompleted
            : valuesCompleted // ignore: cast_nullable_to_non_nullable
                  as int,
        currentValueId: freezed == currentValueId
            ? _self.currentValueId
            : currentValueId // ignore: cast_nullable_to_non_nullable
                  as String?,
        currentValueLabel: freezed == currentValueLabel
            ? _self.currentValueLabel
            : currentValueLabel // ignore: cast_nullable_to_non_nullable
                  as String?,
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
        pendingSessionAt: freezed == pendingSessionAt
            ? _self.pendingSessionAt
            : pendingSessionAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        recentAttendancePct: freezed == recentAttendancePct
            ? _self.recentAttendancePct
            : recentAttendancePct // ignore: cast_nullable_to_non_nullable
                  as double?,
        healthReasons: null == healthReasons
            ? _self._healthReasons
            : healthReasons // ignore: cast_nullable_to_non_nullable
                  as List<HealthReason>,
      ),
    );
  }
}
