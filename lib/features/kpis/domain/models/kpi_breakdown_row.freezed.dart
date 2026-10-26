// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kpi_breakdown_row.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KpiBreakdownRow {
  String get key;
  String get label;
  int get sessionsClosed;
  int get valuesCompleted;
  int get memberValuesCompleted;
  double? get attendancePct;
  double? get initialAvg;
  double? get followUpAvg;
  double? get improvementAvg;
  int get improvementPairs;
  int get syncedLateRows;
  int? get tablesTotal;
  int? get tablesActive;
  int? get tablesDelayed;
  int? get tablesInactive;

  /// Create a copy of KpiBreakdownRow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $KpiBreakdownRowCopyWith<KpiBreakdownRow> get copyWith =>
      _$KpiBreakdownRowCopyWithImpl<KpiBreakdownRow>(
        this as KpiBreakdownRow,
        _$identity,
      );

  /// Serializes this KpiBreakdownRow to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is KpiBreakdownRow &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.sessionsClosed, sessionsClosed) ||
                other.sessionsClosed == sessionsClosed) &&
            (identical(other.valuesCompleted, valuesCompleted) ||
                other.valuesCompleted == valuesCompleted) &&
            (identical(other.memberValuesCompleted, memberValuesCompleted) ||
                other.memberValuesCompleted == memberValuesCompleted) &&
            (identical(other.attendancePct, attendancePct) ||
                other.attendancePct == attendancePct) &&
            (identical(other.initialAvg, initialAvg) ||
                other.initialAvg == initialAvg) &&
            (identical(other.followUpAvg, followUpAvg) ||
                other.followUpAvg == followUpAvg) &&
            (identical(other.improvementAvg, improvementAvg) ||
                other.improvementAvg == improvementAvg) &&
            (identical(other.improvementPairs, improvementPairs) ||
                other.improvementPairs == improvementPairs) &&
            (identical(other.syncedLateRows, syncedLateRows) ||
                other.syncedLateRows == syncedLateRows) &&
            (identical(other.tablesTotal, tablesTotal) ||
                other.tablesTotal == tablesTotal) &&
            (identical(other.tablesActive, tablesActive) ||
                other.tablesActive == tablesActive) &&
            (identical(other.tablesDelayed, tablesDelayed) ||
                other.tablesDelayed == tablesDelayed) &&
            (identical(other.tablesInactive, tablesInactive) ||
                other.tablesInactive == tablesInactive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    key,
    label,
    sessionsClosed,
    valuesCompleted,
    memberValuesCompleted,
    attendancePct,
    initialAvg,
    followUpAvg,
    improvementAvg,
    improvementPairs,
    syncedLateRows,
    tablesTotal,
    tablesActive,
    tablesDelayed,
    tablesInactive,
  );

  @override
  String toString() {
    return 'KpiBreakdownRow(key: $key, label: $label, sessionsClosed: $sessionsClosed, valuesCompleted: $valuesCompleted, memberValuesCompleted: $memberValuesCompleted, attendancePct: $attendancePct, initialAvg: $initialAvg, followUpAvg: $followUpAvg, improvementAvg: $improvementAvg, improvementPairs: $improvementPairs, syncedLateRows: $syncedLateRows, tablesTotal: $tablesTotal, tablesActive: $tablesActive, tablesDelayed: $tablesDelayed, tablesInactive: $tablesInactive)';
  }
}

/// @nodoc
abstract mixin class $KpiBreakdownRowCopyWith<$Res> {
  factory $KpiBreakdownRowCopyWith(
    KpiBreakdownRow value,
    $Res Function(KpiBreakdownRow) _then,
  ) = _$KpiBreakdownRowCopyWithImpl;
  @useResult
  $Res call({
    String key,
    String label,
    int sessionsClosed,
    int valuesCompleted,
    int memberValuesCompleted,
    double? attendancePct,
    double? initialAvg,
    double? followUpAvg,
    double? improvementAvg,
    int improvementPairs,
    int syncedLateRows,
    int? tablesTotal,
    int? tablesActive,
    int? tablesDelayed,
    int? tablesInactive,
  });
}

/// @nodoc
class _$KpiBreakdownRowCopyWithImpl<$Res>
    implements $KpiBreakdownRowCopyWith<$Res> {
  _$KpiBreakdownRowCopyWithImpl(this._self, this._then);

  final KpiBreakdownRow _self;
  final $Res Function(KpiBreakdownRow) _then;

  /// Create a copy of KpiBreakdownRow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? label = null,
    Object? sessionsClosed = null,
    Object? valuesCompleted = null,
    Object? memberValuesCompleted = null,
    Object? attendancePct = freezed,
    Object? initialAvg = freezed,
    Object? followUpAvg = freezed,
    Object? improvementAvg = freezed,
    Object? improvementPairs = null,
    Object? syncedLateRows = null,
    Object? tablesTotal = freezed,
    Object? tablesActive = freezed,
    Object? tablesDelayed = freezed,
    Object? tablesInactive = freezed,
  }) {
    return _then(
      _self.copyWith(
        key: null == key
            ? _self.key
            : key // ignore: cast_nullable_to_non_nullable
                  as String,
        label: null == label
            ? _self.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        sessionsClosed: null == sessionsClosed
            ? _self.sessionsClosed
            : sessionsClosed // ignore: cast_nullable_to_non_nullable
                  as int,
        valuesCompleted: null == valuesCompleted
            ? _self.valuesCompleted
            : valuesCompleted // ignore: cast_nullable_to_non_nullable
                  as int,
        memberValuesCompleted: null == memberValuesCompleted
            ? _self.memberValuesCompleted
            : memberValuesCompleted // ignore: cast_nullable_to_non_nullable
                  as int,
        attendancePct: freezed == attendancePct
            ? _self.attendancePct
            : attendancePct // ignore: cast_nullable_to_non_nullable
                  as double?,
        initialAvg: freezed == initialAvg
            ? _self.initialAvg
            : initialAvg // ignore: cast_nullable_to_non_nullable
                  as double?,
        followUpAvg: freezed == followUpAvg
            ? _self.followUpAvg
            : followUpAvg // ignore: cast_nullable_to_non_nullable
                  as double?,
        improvementAvg: freezed == improvementAvg
            ? _self.improvementAvg
            : improvementAvg // ignore: cast_nullable_to_non_nullable
                  as double?,
        improvementPairs: null == improvementPairs
            ? _self.improvementPairs
            : improvementPairs // ignore: cast_nullable_to_non_nullable
                  as int,
        syncedLateRows: null == syncedLateRows
            ? _self.syncedLateRows
            : syncedLateRows // ignore: cast_nullable_to_non_nullable
                  as int,
        tablesTotal: freezed == tablesTotal
            ? _self.tablesTotal
            : tablesTotal // ignore: cast_nullable_to_non_nullable
                  as int?,
        tablesActive: freezed == tablesActive
            ? _self.tablesActive
            : tablesActive // ignore: cast_nullable_to_non_nullable
                  as int?,
        tablesDelayed: freezed == tablesDelayed
            ? _self.tablesDelayed
            : tablesDelayed // ignore: cast_nullable_to_non_nullable
                  as int?,
        tablesInactive: freezed == tablesInactive
            ? _self.tablesInactive
            : tablesInactive // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [KpiBreakdownRow].
extension KpiBreakdownRowPatterns on KpiBreakdownRow {
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
    TResult Function(_KpiBreakdownRow value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _KpiBreakdownRow() when $default != null:
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
    TResult Function(_KpiBreakdownRow value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KpiBreakdownRow():
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
    TResult? Function(_KpiBreakdownRow value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KpiBreakdownRow() when $default != null:
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
      String key,
      String label,
      int sessionsClosed,
      int valuesCompleted,
      int memberValuesCompleted,
      double? attendancePct,
      double? initialAvg,
      double? followUpAvg,
      double? improvementAvg,
      int improvementPairs,
      int syncedLateRows,
      int? tablesTotal,
      int? tablesActive,
      int? tablesDelayed,
      int? tablesInactive,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _KpiBreakdownRow() when $default != null:
        return $default(
          _that.key,
          _that.label,
          _that.sessionsClosed,
          _that.valuesCompleted,
          _that.memberValuesCompleted,
          _that.attendancePct,
          _that.initialAvg,
          _that.followUpAvg,
          _that.improvementAvg,
          _that.improvementPairs,
          _that.syncedLateRows,
          _that.tablesTotal,
          _that.tablesActive,
          _that.tablesDelayed,
          _that.tablesInactive,
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
      String key,
      String label,
      int sessionsClosed,
      int valuesCompleted,
      int memberValuesCompleted,
      double? attendancePct,
      double? initialAvg,
      double? followUpAvg,
      double? improvementAvg,
      int improvementPairs,
      int syncedLateRows,
      int? tablesTotal,
      int? tablesActive,
      int? tablesDelayed,
      int? tablesInactive,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KpiBreakdownRow():
        return $default(
          _that.key,
          _that.label,
          _that.sessionsClosed,
          _that.valuesCompleted,
          _that.memberValuesCompleted,
          _that.attendancePct,
          _that.initialAvg,
          _that.followUpAvg,
          _that.improvementAvg,
          _that.improvementPairs,
          _that.syncedLateRows,
          _that.tablesTotal,
          _that.tablesActive,
          _that.tablesDelayed,
          _that.tablesInactive,
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
      String key,
      String label,
      int sessionsClosed,
      int valuesCompleted,
      int memberValuesCompleted,
      double? attendancePct,
      double? initialAvg,
      double? followUpAvg,
      double? improvementAvg,
      int improvementPairs,
      int syncedLateRows,
      int? tablesTotal,
      int? tablesActive,
      int? tablesDelayed,
      int? tablesInactive,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KpiBreakdownRow() when $default != null:
        return $default(
          _that.key,
          _that.label,
          _that.sessionsClosed,
          _that.valuesCompleted,
          _that.memberValuesCompleted,
          _that.attendancePct,
          _that.initialAvg,
          _that.followUpAvg,
          _that.improvementAvg,
          _that.improvementPairs,
          _that.syncedLateRows,
          _that.tablesTotal,
          _that.tablesActive,
          _that.tablesDelayed,
          _that.tablesInactive,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _KpiBreakdownRow implements KpiBreakdownRow {
  const _KpiBreakdownRow({
    required this.key,
    required this.label,
    this.sessionsClosed = 0,
    this.valuesCompleted = 0,
    this.memberValuesCompleted = 0,
    this.attendancePct,
    this.initialAvg,
    this.followUpAvg,
    this.improvementAvg,
    this.improvementPairs = 0,
    this.syncedLateRows = 0,
    this.tablesTotal,
    this.tablesActive,
    this.tablesDelayed,
    this.tablesInactive,
  });
  factory _KpiBreakdownRow.fromJson(Map<String, dynamic> json) =>
      _$KpiBreakdownRowFromJson(json);

  @override
  final String key;
  @override
  final String label;
  @override
  @JsonKey()
  final int sessionsClosed;
  @override
  @JsonKey()
  final int valuesCompleted;
  @override
  @JsonKey()
  final int memberValuesCompleted;
  @override
  final double? attendancePct;
  @override
  final double? initialAvg;
  @override
  final double? followUpAvg;
  @override
  final double? improvementAvg;
  @override
  @JsonKey()
  final int improvementPairs;
  @override
  @JsonKey()
  final int syncedLateRows;
  @override
  final int? tablesTotal;
  @override
  final int? tablesActive;
  @override
  final int? tablesDelayed;
  @override
  final int? tablesInactive;

  /// Create a copy of KpiBreakdownRow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$KpiBreakdownRowCopyWith<_KpiBreakdownRow> get copyWith =>
      __$KpiBreakdownRowCopyWithImpl<_KpiBreakdownRow>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$KpiBreakdownRowToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _KpiBreakdownRow &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.sessionsClosed, sessionsClosed) ||
                other.sessionsClosed == sessionsClosed) &&
            (identical(other.valuesCompleted, valuesCompleted) ||
                other.valuesCompleted == valuesCompleted) &&
            (identical(other.memberValuesCompleted, memberValuesCompleted) ||
                other.memberValuesCompleted == memberValuesCompleted) &&
            (identical(other.attendancePct, attendancePct) ||
                other.attendancePct == attendancePct) &&
            (identical(other.initialAvg, initialAvg) ||
                other.initialAvg == initialAvg) &&
            (identical(other.followUpAvg, followUpAvg) ||
                other.followUpAvg == followUpAvg) &&
            (identical(other.improvementAvg, improvementAvg) ||
                other.improvementAvg == improvementAvg) &&
            (identical(other.improvementPairs, improvementPairs) ||
                other.improvementPairs == improvementPairs) &&
            (identical(other.syncedLateRows, syncedLateRows) ||
                other.syncedLateRows == syncedLateRows) &&
            (identical(other.tablesTotal, tablesTotal) ||
                other.tablesTotal == tablesTotal) &&
            (identical(other.tablesActive, tablesActive) ||
                other.tablesActive == tablesActive) &&
            (identical(other.tablesDelayed, tablesDelayed) ||
                other.tablesDelayed == tablesDelayed) &&
            (identical(other.tablesInactive, tablesInactive) ||
                other.tablesInactive == tablesInactive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    key,
    label,
    sessionsClosed,
    valuesCompleted,
    memberValuesCompleted,
    attendancePct,
    initialAvg,
    followUpAvg,
    improvementAvg,
    improvementPairs,
    syncedLateRows,
    tablesTotal,
    tablesActive,
    tablesDelayed,
    tablesInactive,
  );

  @override
  String toString() {
    return 'KpiBreakdownRow(key: $key, label: $label, sessionsClosed: $sessionsClosed, valuesCompleted: $valuesCompleted, memberValuesCompleted: $memberValuesCompleted, attendancePct: $attendancePct, initialAvg: $initialAvg, followUpAvg: $followUpAvg, improvementAvg: $improvementAvg, improvementPairs: $improvementPairs, syncedLateRows: $syncedLateRows, tablesTotal: $tablesTotal, tablesActive: $tablesActive, tablesDelayed: $tablesDelayed, tablesInactive: $tablesInactive)';
  }
}

/// @nodoc
abstract mixin class _$KpiBreakdownRowCopyWith<$Res>
    implements $KpiBreakdownRowCopyWith<$Res> {
  factory _$KpiBreakdownRowCopyWith(
    _KpiBreakdownRow value,
    $Res Function(_KpiBreakdownRow) _then,
  ) = __$KpiBreakdownRowCopyWithImpl;
  @override
  @useResult
  $Res call({
    String key,
    String label,
    int sessionsClosed,
    int valuesCompleted,
    int memberValuesCompleted,
    double? attendancePct,
    double? initialAvg,
    double? followUpAvg,
    double? improvementAvg,
    int improvementPairs,
    int syncedLateRows,
    int? tablesTotal,
    int? tablesActive,
    int? tablesDelayed,
    int? tablesInactive,
  });
}

/// @nodoc
class __$KpiBreakdownRowCopyWithImpl<$Res>
    implements _$KpiBreakdownRowCopyWith<$Res> {
  __$KpiBreakdownRowCopyWithImpl(this._self, this._then);

  final _KpiBreakdownRow _self;
  final $Res Function(_KpiBreakdownRow) _then;

  /// Create a copy of KpiBreakdownRow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? key = null,
    Object? label = null,
    Object? sessionsClosed = null,
    Object? valuesCompleted = null,
    Object? memberValuesCompleted = null,
    Object? attendancePct = freezed,
    Object? initialAvg = freezed,
    Object? followUpAvg = freezed,
    Object? improvementAvg = freezed,
    Object? improvementPairs = null,
    Object? syncedLateRows = null,
    Object? tablesTotal = freezed,
    Object? tablesActive = freezed,
    Object? tablesDelayed = freezed,
    Object? tablesInactive = freezed,
  }) {
    return _then(
      _KpiBreakdownRow(
        key: null == key
            ? _self.key
            : key // ignore: cast_nullable_to_non_nullable
                  as String,
        label: null == label
            ? _self.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        sessionsClosed: null == sessionsClosed
            ? _self.sessionsClosed
            : sessionsClosed // ignore: cast_nullable_to_non_nullable
                  as int,
        valuesCompleted: null == valuesCompleted
            ? _self.valuesCompleted
            : valuesCompleted // ignore: cast_nullable_to_non_nullable
                  as int,
        memberValuesCompleted: null == memberValuesCompleted
            ? _self.memberValuesCompleted
            : memberValuesCompleted // ignore: cast_nullable_to_non_nullable
                  as int,
        attendancePct: freezed == attendancePct
            ? _self.attendancePct
            : attendancePct // ignore: cast_nullable_to_non_nullable
                  as double?,
        initialAvg: freezed == initialAvg
            ? _self.initialAvg
            : initialAvg // ignore: cast_nullable_to_non_nullable
                  as double?,
        followUpAvg: freezed == followUpAvg
            ? _self.followUpAvg
            : followUpAvg // ignore: cast_nullable_to_non_nullable
                  as double?,
        improvementAvg: freezed == improvementAvg
            ? _self.improvementAvg
            : improvementAvg // ignore: cast_nullable_to_non_nullable
                  as double?,
        improvementPairs: null == improvementPairs
            ? _self.improvementPairs
            : improvementPairs // ignore: cast_nullable_to_non_nullable
                  as int,
        syncedLateRows: null == syncedLateRows
            ? _self.syncedLateRows
            : syncedLateRows // ignore: cast_nullable_to_non_nullable
                  as int,
        tablesTotal: freezed == tablesTotal
            ? _self.tablesTotal
            : tablesTotal // ignore: cast_nullable_to_non_nullable
                  as int?,
        tablesActive: freezed == tablesActive
            ? _self.tablesActive
            : tablesActive // ignore: cast_nullable_to_non_nullable
                  as int?,
        tablesDelayed: freezed == tablesDelayed
            ? _self.tablesDelayed
            : tablesDelayed // ignore: cast_nullable_to_non_nullable
                  as int?,
        tablesInactive: freezed == tablesInactive
            ? _self.tablesInactive
            : tablesInactive // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}
