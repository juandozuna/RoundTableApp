// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_table.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdminTable {
  String get id;
  String get organizationId;
  String get organizationName;
  String? get locationId;
  String? get locationName;
  String get name;
  String get code;
  int get weekday;
  String get startTime;
  String get timezone;
  int get durationMinutes;
  @JsonKey(unknownEnumValue: RoundTableStatus.closed)
  RoundTableStatus get status;
  String? get currentValueId;
  int? get currentValueSequence;
  String? get currentValueName;
  String? get facilitatorPersonId;
  String? get facilitatorName;
  int get activePeople;
  int get maxPeople;
  String? get pendingSessionId;
  String? get pendingSessionStatus;
  DateTime? get pendingSessionAt;

  /// `regular` or `extraordinary`.
  String? get pendingSessionKind;

  /// Regular slot the pending session was moved from, if it was.
  DateTime? get pendingSessionOriginalAt;

  /// The pending session's slot as `YYYY-MM-DDTHH:MM` in [timezone].
  String? get pendingSessionLocal;
  String? get pendingSessionOriginalLocal;

  /// Create a copy of AdminTable
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AdminTableCopyWith<AdminTable> get copyWith =>
      _$AdminTableCopyWithImpl<AdminTable>(this as AdminTable, _$identity);

  /// Serializes this AdminTable to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AdminTable &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.organizationName, organizationName) ||
                other.organizationName == organizationName) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.locationName, locationName) ||
                other.locationName == locationName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.weekday, weekday) || other.weekday == weekday) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.currentValueId, currentValueId) ||
                other.currentValueId == currentValueId) &&
            (identical(other.currentValueSequence, currentValueSequence) ||
                other.currentValueSequence == currentValueSequence) &&
            (identical(other.currentValueName, currentValueName) ||
                other.currentValueName == currentValueName) &&
            (identical(other.facilitatorPersonId, facilitatorPersonId) ||
                other.facilitatorPersonId == facilitatorPersonId) &&
            (identical(other.facilitatorName, facilitatorName) ||
                other.facilitatorName == facilitatorName) &&
            (identical(other.activePeople, activePeople) ||
                other.activePeople == activePeople) &&
            (identical(other.maxPeople, maxPeople) ||
                other.maxPeople == maxPeople) &&
            (identical(other.pendingSessionId, pendingSessionId) ||
                other.pendingSessionId == pendingSessionId) &&
            (identical(other.pendingSessionStatus, pendingSessionStatus) ||
                other.pendingSessionStatus == pendingSessionStatus) &&
            (identical(other.pendingSessionAt, pendingSessionAt) ||
                other.pendingSessionAt == pendingSessionAt) &&
            (identical(other.pendingSessionKind, pendingSessionKind) ||
                other.pendingSessionKind == pendingSessionKind) &&
            (identical(
                  other.pendingSessionOriginalAt,
                  pendingSessionOriginalAt,
                ) ||
                other.pendingSessionOriginalAt == pendingSessionOriginalAt) &&
            (identical(other.pendingSessionLocal, pendingSessionLocal) ||
                other.pendingSessionLocal == pendingSessionLocal) &&
            (identical(
                  other.pendingSessionOriginalLocal,
                  pendingSessionOriginalLocal,
                ) ||
                other.pendingSessionOriginalLocal ==
                    pendingSessionOriginalLocal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    organizationId,
    organizationName,
    locationId,
    locationName,
    name,
    code,
    weekday,
    startTime,
    timezone,
    durationMinutes,
    status,
    currentValueId,
    currentValueSequence,
    currentValueName,
    facilitatorPersonId,
    facilitatorName,
    activePeople,
    maxPeople,
    pendingSessionId,
    pendingSessionStatus,
    pendingSessionAt,
    pendingSessionKind,
    pendingSessionOriginalAt,
    pendingSessionLocal,
    pendingSessionOriginalLocal,
  ]);

  @override
  String toString() {
    return 'AdminTable(id: $id, organizationId: $organizationId, organizationName: $organizationName, locationId: $locationId, locationName: $locationName, name: $name, code: $code, weekday: $weekday, startTime: $startTime, timezone: $timezone, durationMinutes: $durationMinutes, status: $status, currentValueId: $currentValueId, currentValueSequence: $currentValueSequence, currentValueName: $currentValueName, facilitatorPersonId: $facilitatorPersonId, facilitatorName: $facilitatorName, activePeople: $activePeople, maxPeople: $maxPeople, pendingSessionId: $pendingSessionId, pendingSessionStatus: $pendingSessionStatus, pendingSessionAt: $pendingSessionAt, pendingSessionKind: $pendingSessionKind, pendingSessionOriginalAt: $pendingSessionOriginalAt, pendingSessionLocal: $pendingSessionLocal, pendingSessionOriginalLocal: $pendingSessionOriginalLocal)';
  }
}

/// @nodoc
abstract mixin class $AdminTableCopyWith<$Res> {
  factory $AdminTableCopyWith(
    AdminTable value,
    $Res Function(AdminTable) _then,
  ) = _$AdminTableCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String organizationId,
    String organizationName,
    String? locationId,
    String? locationName,
    String name,
    String code,
    int weekday,
    String startTime,
    String timezone,
    int durationMinutes,
    @JsonKey(unknownEnumValue: RoundTableStatus.closed) RoundTableStatus status,
    String? currentValueId,
    int? currentValueSequence,
    String? currentValueName,
    String? facilitatorPersonId,
    String? facilitatorName,
    int activePeople,
    int maxPeople,
    String? pendingSessionId,
    String? pendingSessionStatus,
    DateTime? pendingSessionAt,
    String? pendingSessionKind,
    DateTime? pendingSessionOriginalAt,
    String? pendingSessionLocal,
    String? pendingSessionOriginalLocal,
  });
}

/// @nodoc
class _$AdminTableCopyWithImpl<$Res> implements $AdminTableCopyWith<$Res> {
  _$AdminTableCopyWithImpl(this._self, this._then);

  final AdminTable _self;
  final $Res Function(AdminTable) _then;

  /// Create a copy of AdminTable
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? organizationId = null,
    Object? organizationName = null,
    Object? locationId = freezed,
    Object? locationName = freezed,
    Object? name = null,
    Object? code = null,
    Object? weekday = null,
    Object? startTime = null,
    Object? timezone = null,
    Object? durationMinutes = null,
    Object? status = null,
    Object? currentValueId = freezed,
    Object? currentValueSequence = freezed,
    Object? currentValueName = freezed,
    Object? facilitatorPersonId = freezed,
    Object? facilitatorName = freezed,
    Object? activePeople = null,
    Object? maxPeople = null,
    Object? pendingSessionId = freezed,
    Object? pendingSessionStatus = freezed,
    Object? pendingSessionAt = freezed,
    Object? pendingSessionKind = freezed,
    Object? pendingSessionOriginalAt = freezed,
    Object? pendingSessionLocal = freezed,
    Object? pendingSessionOriginalLocal = freezed,
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
        organizationName: null == organizationName
            ? _self.organizationName
            : organizationName // ignore: cast_nullable_to_non_nullable
                  as String,
        locationId: freezed == locationId
            ? _self.locationId
            : locationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        locationName: freezed == locationName
            ? _self.locationName
            : locationName // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        code: null == code
            ? _self.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
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
        durationMinutes: null == durationMinutes
            ? _self.durationMinutes
            : durationMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as RoundTableStatus,
        currentValueId: freezed == currentValueId
            ? _self.currentValueId
            : currentValueId // ignore: cast_nullable_to_non_nullable
                  as String?,
        currentValueSequence: freezed == currentValueSequence
            ? _self.currentValueSequence
            : currentValueSequence // ignore: cast_nullable_to_non_nullable
                  as int?,
        currentValueName: freezed == currentValueName
            ? _self.currentValueName
            : currentValueName // ignore: cast_nullable_to_non_nullable
                  as String?,
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
        pendingSessionId: freezed == pendingSessionId
            ? _self.pendingSessionId
            : pendingSessionId // ignore: cast_nullable_to_non_nullable
                  as String?,
        pendingSessionStatus: freezed == pendingSessionStatus
            ? _self.pendingSessionStatus
            : pendingSessionStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        pendingSessionAt: freezed == pendingSessionAt
            ? _self.pendingSessionAt
            : pendingSessionAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        pendingSessionKind: freezed == pendingSessionKind
            ? _self.pendingSessionKind
            : pendingSessionKind // ignore: cast_nullable_to_non_nullable
                  as String?,
        pendingSessionOriginalAt: freezed == pendingSessionOriginalAt
            ? _self.pendingSessionOriginalAt
            : pendingSessionOriginalAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        pendingSessionLocal: freezed == pendingSessionLocal
            ? _self.pendingSessionLocal
            : pendingSessionLocal // ignore: cast_nullable_to_non_nullable
                  as String?,
        pendingSessionOriginalLocal: freezed == pendingSessionOriginalLocal
            ? _self.pendingSessionOriginalLocal
            : pendingSessionOriginalLocal // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [AdminTable].
extension AdminTablePatterns on AdminTable {
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
    TResult Function(_AdminTable value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdminTable() when $default != null:
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
    TResult Function(_AdminTable value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminTable():
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
    TResult? Function(_AdminTable value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminTable() when $default != null:
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
      String organizationName,
      String? locationId,
      String? locationName,
      String name,
      String code,
      int weekday,
      String startTime,
      String timezone,
      int durationMinutes,
      @JsonKey(unknownEnumValue: RoundTableStatus.closed)
      RoundTableStatus status,
      String? currentValueId,
      int? currentValueSequence,
      String? currentValueName,
      String? facilitatorPersonId,
      String? facilitatorName,
      int activePeople,
      int maxPeople,
      String? pendingSessionId,
      String? pendingSessionStatus,
      DateTime? pendingSessionAt,
      String? pendingSessionKind,
      DateTime? pendingSessionOriginalAt,
      String? pendingSessionLocal,
      String? pendingSessionOriginalLocal,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdminTable() when $default != null:
        return $default(
          _that.id,
          _that.organizationId,
          _that.organizationName,
          _that.locationId,
          _that.locationName,
          _that.name,
          _that.code,
          _that.weekday,
          _that.startTime,
          _that.timezone,
          _that.durationMinutes,
          _that.status,
          _that.currentValueId,
          _that.currentValueSequence,
          _that.currentValueName,
          _that.facilitatorPersonId,
          _that.facilitatorName,
          _that.activePeople,
          _that.maxPeople,
          _that.pendingSessionId,
          _that.pendingSessionStatus,
          _that.pendingSessionAt,
          _that.pendingSessionKind,
          _that.pendingSessionOriginalAt,
          _that.pendingSessionLocal,
          _that.pendingSessionOriginalLocal,
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
      String organizationName,
      String? locationId,
      String? locationName,
      String name,
      String code,
      int weekday,
      String startTime,
      String timezone,
      int durationMinutes,
      @JsonKey(unknownEnumValue: RoundTableStatus.closed)
      RoundTableStatus status,
      String? currentValueId,
      int? currentValueSequence,
      String? currentValueName,
      String? facilitatorPersonId,
      String? facilitatorName,
      int activePeople,
      int maxPeople,
      String? pendingSessionId,
      String? pendingSessionStatus,
      DateTime? pendingSessionAt,
      String? pendingSessionKind,
      DateTime? pendingSessionOriginalAt,
      String? pendingSessionLocal,
      String? pendingSessionOriginalLocal,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminTable():
        return $default(
          _that.id,
          _that.organizationId,
          _that.organizationName,
          _that.locationId,
          _that.locationName,
          _that.name,
          _that.code,
          _that.weekday,
          _that.startTime,
          _that.timezone,
          _that.durationMinutes,
          _that.status,
          _that.currentValueId,
          _that.currentValueSequence,
          _that.currentValueName,
          _that.facilitatorPersonId,
          _that.facilitatorName,
          _that.activePeople,
          _that.maxPeople,
          _that.pendingSessionId,
          _that.pendingSessionStatus,
          _that.pendingSessionAt,
          _that.pendingSessionKind,
          _that.pendingSessionOriginalAt,
          _that.pendingSessionLocal,
          _that.pendingSessionOriginalLocal,
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
      String organizationName,
      String? locationId,
      String? locationName,
      String name,
      String code,
      int weekday,
      String startTime,
      String timezone,
      int durationMinutes,
      @JsonKey(unknownEnumValue: RoundTableStatus.closed)
      RoundTableStatus status,
      String? currentValueId,
      int? currentValueSequence,
      String? currentValueName,
      String? facilitatorPersonId,
      String? facilitatorName,
      int activePeople,
      int maxPeople,
      String? pendingSessionId,
      String? pendingSessionStatus,
      DateTime? pendingSessionAt,
      String? pendingSessionKind,
      DateTime? pendingSessionOriginalAt,
      String? pendingSessionLocal,
      String? pendingSessionOriginalLocal,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminTable() when $default != null:
        return $default(
          _that.id,
          _that.organizationId,
          _that.organizationName,
          _that.locationId,
          _that.locationName,
          _that.name,
          _that.code,
          _that.weekday,
          _that.startTime,
          _that.timezone,
          _that.durationMinutes,
          _that.status,
          _that.currentValueId,
          _that.currentValueSequence,
          _that.currentValueName,
          _that.facilitatorPersonId,
          _that.facilitatorName,
          _that.activePeople,
          _that.maxPeople,
          _that.pendingSessionId,
          _that.pendingSessionStatus,
          _that.pendingSessionAt,
          _that.pendingSessionKind,
          _that.pendingSessionOriginalAt,
          _that.pendingSessionLocal,
          _that.pendingSessionOriginalLocal,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AdminTable extends AdminTable {
  const _AdminTable({
    required this.id,
    required this.organizationId,
    required this.organizationName,
    this.locationId,
    this.locationName,
    required this.name,
    required this.code,
    this.weekday = 1,
    this.startTime = '00:00:00',
    this.timezone = 'UTC',
    this.durationMinutes = 30,
    @JsonKey(unknownEnumValue: RoundTableStatus.closed)
    this.status = RoundTableStatus.active,
    this.currentValueId,
    this.currentValueSequence,
    this.currentValueName,
    this.facilitatorPersonId,
    this.facilitatorName,
    this.activePeople = 0,
    this.maxPeople = AppLimits.maxTableSeats,
    this.pendingSessionId,
    this.pendingSessionStatus,
    this.pendingSessionAt,
    this.pendingSessionKind,
    this.pendingSessionOriginalAt,
    this.pendingSessionLocal,
    this.pendingSessionOriginalLocal,
  }) : super._();
  factory _AdminTable.fromJson(Map<String, dynamic> json) =>
      _$AdminTableFromJson(json);

  @override
  final String id;
  @override
  final String organizationId;
  @override
  final String organizationName;
  @override
  final String? locationId;
  @override
  final String? locationName;
  @override
  final String name;
  @override
  final String code;
  @override
  @JsonKey()
  final int weekday;
  @override
  @JsonKey()
  final String startTime;
  @override
  @JsonKey()
  final String timezone;
  @override
  @JsonKey()
  final int durationMinutes;
  @override
  @JsonKey(unknownEnumValue: RoundTableStatus.closed)
  final RoundTableStatus status;
  @override
  final String? currentValueId;
  @override
  final int? currentValueSequence;
  @override
  final String? currentValueName;
  @override
  final String? facilitatorPersonId;
  @override
  final String? facilitatorName;
  @override
  @JsonKey()
  final int activePeople;
  @override
  @JsonKey()
  final int maxPeople;
  @override
  final String? pendingSessionId;
  @override
  final String? pendingSessionStatus;
  @override
  final DateTime? pendingSessionAt;

  /// `regular` or `extraordinary`.
  @override
  final String? pendingSessionKind;

  /// Regular slot the pending session was moved from, if it was.
  @override
  final DateTime? pendingSessionOriginalAt;

  /// The pending session's slot as `YYYY-MM-DDTHH:MM` in [timezone].
  @override
  final String? pendingSessionLocal;
  @override
  final String? pendingSessionOriginalLocal;

  /// Create a copy of AdminTable
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AdminTableCopyWith<_AdminTable> get copyWith =>
      __$AdminTableCopyWithImpl<_AdminTable>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AdminTableToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AdminTable &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.organizationName, organizationName) ||
                other.organizationName == organizationName) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.locationName, locationName) ||
                other.locationName == locationName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.weekday, weekday) || other.weekday == weekday) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.currentValueId, currentValueId) ||
                other.currentValueId == currentValueId) &&
            (identical(other.currentValueSequence, currentValueSequence) ||
                other.currentValueSequence == currentValueSequence) &&
            (identical(other.currentValueName, currentValueName) ||
                other.currentValueName == currentValueName) &&
            (identical(other.facilitatorPersonId, facilitatorPersonId) ||
                other.facilitatorPersonId == facilitatorPersonId) &&
            (identical(other.facilitatorName, facilitatorName) ||
                other.facilitatorName == facilitatorName) &&
            (identical(other.activePeople, activePeople) ||
                other.activePeople == activePeople) &&
            (identical(other.maxPeople, maxPeople) ||
                other.maxPeople == maxPeople) &&
            (identical(other.pendingSessionId, pendingSessionId) ||
                other.pendingSessionId == pendingSessionId) &&
            (identical(other.pendingSessionStatus, pendingSessionStatus) ||
                other.pendingSessionStatus == pendingSessionStatus) &&
            (identical(other.pendingSessionAt, pendingSessionAt) ||
                other.pendingSessionAt == pendingSessionAt) &&
            (identical(other.pendingSessionKind, pendingSessionKind) ||
                other.pendingSessionKind == pendingSessionKind) &&
            (identical(
                  other.pendingSessionOriginalAt,
                  pendingSessionOriginalAt,
                ) ||
                other.pendingSessionOriginalAt == pendingSessionOriginalAt) &&
            (identical(other.pendingSessionLocal, pendingSessionLocal) ||
                other.pendingSessionLocal == pendingSessionLocal) &&
            (identical(
                  other.pendingSessionOriginalLocal,
                  pendingSessionOriginalLocal,
                ) ||
                other.pendingSessionOriginalLocal ==
                    pendingSessionOriginalLocal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    organizationId,
    organizationName,
    locationId,
    locationName,
    name,
    code,
    weekday,
    startTime,
    timezone,
    durationMinutes,
    status,
    currentValueId,
    currentValueSequence,
    currentValueName,
    facilitatorPersonId,
    facilitatorName,
    activePeople,
    maxPeople,
    pendingSessionId,
    pendingSessionStatus,
    pendingSessionAt,
    pendingSessionKind,
    pendingSessionOriginalAt,
    pendingSessionLocal,
    pendingSessionOriginalLocal,
  ]);

  @override
  String toString() {
    return 'AdminTable(id: $id, organizationId: $organizationId, organizationName: $organizationName, locationId: $locationId, locationName: $locationName, name: $name, code: $code, weekday: $weekday, startTime: $startTime, timezone: $timezone, durationMinutes: $durationMinutes, status: $status, currentValueId: $currentValueId, currentValueSequence: $currentValueSequence, currentValueName: $currentValueName, facilitatorPersonId: $facilitatorPersonId, facilitatorName: $facilitatorName, activePeople: $activePeople, maxPeople: $maxPeople, pendingSessionId: $pendingSessionId, pendingSessionStatus: $pendingSessionStatus, pendingSessionAt: $pendingSessionAt, pendingSessionKind: $pendingSessionKind, pendingSessionOriginalAt: $pendingSessionOriginalAt, pendingSessionLocal: $pendingSessionLocal, pendingSessionOriginalLocal: $pendingSessionOriginalLocal)';
  }
}

/// @nodoc
abstract mixin class _$AdminTableCopyWith<$Res>
    implements $AdminTableCopyWith<$Res> {
  factory _$AdminTableCopyWith(
    _AdminTable value,
    $Res Function(_AdminTable) _then,
  ) = __$AdminTableCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String organizationId,
    String organizationName,
    String? locationId,
    String? locationName,
    String name,
    String code,
    int weekday,
    String startTime,
    String timezone,
    int durationMinutes,
    @JsonKey(unknownEnumValue: RoundTableStatus.closed) RoundTableStatus status,
    String? currentValueId,
    int? currentValueSequence,
    String? currentValueName,
    String? facilitatorPersonId,
    String? facilitatorName,
    int activePeople,
    int maxPeople,
    String? pendingSessionId,
    String? pendingSessionStatus,
    DateTime? pendingSessionAt,
    String? pendingSessionKind,
    DateTime? pendingSessionOriginalAt,
    String? pendingSessionLocal,
    String? pendingSessionOriginalLocal,
  });
}

/// @nodoc
class __$AdminTableCopyWithImpl<$Res> implements _$AdminTableCopyWith<$Res> {
  __$AdminTableCopyWithImpl(this._self, this._then);

  final _AdminTable _self;
  final $Res Function(_AdminTable) _then;

  /// Create a copy of AdminTable
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? organizationId = null,
    Object? organizationName = null,
    Object? locationId = freezed,
    Object? locationName = freezed,
    Object? name = null,
    Object? code = null,
    Object? weekday = null,
    Object? startTime = null,
    Object? timezone = null,
    Object? durationMinutes = null,
    Object? status = null,
    Object? currentValueId = freezed,
    Object? currentValueSequence = freezed,
    Object? currentValueName = freezed,
    Object? facilitatorPersonId = freezed,
    Object? facilitatorName = freezed,
    Object? activePeople = null,
    Object? maxPeople = null,
    Object? pendingSessionId = freezed,
    Object? pendingSessionStatus = freezed,
    Object? pendingSessionAt = freezed,
    Object? pendingSessionKind = freezed,
    Object? pendingSessionOriginalAt = freezed,
    Object? pendingSessionLocal = freezed,
    Object? pendingSessionOriginalLocal = freezed,
  }) {
    return _then(
      _AdminTable(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        organizationId: null == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String,
        organizationName: null == organizationName
            ? _self.organizationName
            : organizationName // ignore: cast_nullable_to_non_nullable
                  as String,
        locationId: freezed == locationId
            ? _self.locationId
            : locationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        locationName: freezed == locationName
            ? _self.locationName
            : locationName // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        code: null == code
            ? _self.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
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
        durationMinutes: null == durationMinutes
            ? _self.durationMinutes
            : durationMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as RoundTableStatus,
        currentValueId: freezed == currentValueId
            ? _self.currentValueId
            : currentValueId // ignore: cast_nullable_to_non_nullable
                  as String?,
        currentValueSequence: freezed == currentValueSequence
            ? _self.currentValueSequence
            : currentValueSequence // ignore: cast_nullable_to_non_nullable
                  as int?,
        currentValueName: freezed == currentValueName
            ? _self.currentValueName
            : currentValueName // ignore: cast_nullable_to_non_nullable
                  as String?,
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
        pendingSessionId: freezed == pendingSessionId
            ? _self.pendingSessionId
            : pendingSessionId // ignore: cast_nullable_to_non_nullable
                  as String?,
        pendingSessionStatus: freezed == pendingSessionStatus
            ? _self.pendingSessionStatus
            : pendingSessionStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        pendingSessionAt: freezed == pendingSessionAt
            ? _self.pendingSessionAt
            : pendingSessionAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        pendingSessionKind: freezed == pendingSessionKind
            ? _self.pendingSessionKind
            : pendingSessionKind // ignore: cast_nullable_to_non_nullable
                  as String?,
        pendingSessionOriginalAt: freezed == pendingSessionOriginalAt
            ? _self.pendingSessionOriginalAt
            : pendingSessionOriginalAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        pendingSessionLocal: freezed == pendingSessionLocal
            ? _self.pendingSessionLocal
            : pendingSessionLocal // ignore: cast_nullable_to_non_nullable
                  as String?,
        pendingSessionOriginalLocal: freezed == pendingSessionOriginalLocal
            ? _self.pendingSessionOriginalLocal
            : pendingSessionOriginalLocal // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}
