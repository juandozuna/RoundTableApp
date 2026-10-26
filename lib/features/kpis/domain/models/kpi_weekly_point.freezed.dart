// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kpi_weekly_point.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KpiWeeklyPoint {
  DateTime get weekStart;
  int get sessionsClosed;
  int get valuesCompleted;
  double? get attendancePct;
  double? get initialAvg;
  double? get improvementAvg;
  int get syncedLateRows;

  /// Create a copy of KpiWeeklyPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $KpiWeeklyPointCopyWith<KpiWeeklyPoint> get copyWith =>
      _$KpiWeeklyPointCopyWithImpl<KpiWeeklyPoint>(
        this as KpiWeeklyPoint,
        _$identity,
      );

  /// Serializes this KpiWeeklyPoint to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is KpiWeeklyPoint &&
            (identical(other.weekStart, weekStart) ||
                other.weekStart == weekStart) &&
            (identical(other.sessionsClosed, sessionsClosed) ||
                other.sessionsClosed == sessionsClosed) &&
            (identical(other.valuesCompleted, valuesCompleted) ||
                other.valuesCompleted == valuesCompleted) &&
            (identical(other.attendancePct, attendancePct) ||
                other.attendancePct == attendancePct) &&
            (identical(other.initialAvg, initialAvg) ||
                other.initialAvg == initialAvg) &&
            (identical(other.improvementAvg, improvementAvg) ||
                other.improvementAvg == improvementAvg) &&
            (identical(other.syncedLateRows, syncedLateRows) ||
                other.syncedLateRows == syncedLateRows));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    weekStart,
    sessionsClosed,
    valuesCompleted,
    attendancePct,
    initialAvg,
    improvementAvg,
    syncedLateRows,
  );

  @override
  String toString() {
    return 'KpiWeeklyPoint(weekStart: $weekStart, sessionsClosed: $sessionsClosed, valuesCompleted: $valuesCompleted, attendancePct: $attendancePct, initialAvg: $initialAvg, improvementAvg: $improvementAvg, syncedLateRows: $syncedLateRows)';
  }
}

/// @nodoc
abstract mixin class $KpiWeeklyPointCopyWith<$Res> {
  factory $KpiWeeklyPointCopyWith(
    KpiWeeklyPoint value,
    $Res Function(KpiWeeklyPoint) _then,
  ) = _$KpiWeeklyPointCopyWithImpl;
  @useResult
  $Res call({
    DateTime weekStart,
    int sessionsClosed,
    int valuesCompleted,
    double? attendancePct,
    double? initialAvg,
    double? improvementAvg,
    int syncedLateRows,
  });
}

/// @nodoc
class _$KpiWeeklyPointCopyWithImpl<$Res>
    implements $KpiWeeklyPointCopyWith<$Res> {
  _$KpiWeeklyPointCopyWithImpl(this._self, this._then);

  final KpiWeeklyPoint _self;
  final $Res Function(KpiWeeklyPoint) _then;

  /// Create a copy of KpiWeeklyPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weekStart = null,
    Object? sessionsClosed = null,
    Object? valuesCompleted = null,
    Object? attendancePct = freezed,
    Object? initialAvg = freezed,
    Object? improvementAvg = freezed,
    Object? syncedLateRows = null,
  }) {
    return _then(
      _self.copyWith(
        weekStart: null == weekStart
            ? _self.weekStart
            : weekStart // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        sessionsClosed: null == sessionsClosed
            ? _self.sessionsClosed
            : sessionsClosed // ignore: cast_nullable_to_non_nullable
                  as int,
        valuesCompleted: null == valuesCompleted
            ? _self.valuesCompleted
            : valuesCompleted // ignore: cast_nullable_to_non_nullable
                  as int,
        attendancePct: freezed == attendancePct
            ? _self.attendancePct
            : attendancePct // ignore: cast_nullable_to_non_nullable
                  as double?,
        initialAvg: freezed == initialAvg
            ? _self.initialAvg
            : initialAvg // ignore: cast_nullable_to_non_nullable
                  as double?,
        improvementAvg: freezed == improvementAvg
            ? _self.improvementAvg
            : improvementAvg // ignore: cast_nullable_to_non_nullable
                  as double?,
        syncedLateRows: null == syncedLateRows
            ? _self.syncedLateRows
            : syncedLateRows // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [KpiWeeklyPoint].
extension KpiWeeklyPointPatterns on KpiWeeklyPoint {
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
    TResult Function(_KpiWeeklyPoint value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _KpiWeeklyPoint() when $default != null:
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
    TResult Function(_KpiWeeklyPoint value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KpiWeeklyPoint():
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
    TResult? Function(_KpiWeeklyPoint value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KpiWeeklyPoint() when $default != null:
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
      DateTime weekStart,
      int sessionsClosed,
      int valuesCompleted,
      double? attendancePct,
      double? initialAvg,
      double? improvementAvg,
      int syncedLateRows,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _KpiWeeklyPoint() when $default != null:
        return $default(
          _that.weekStart,
          _that.sessionsClosed,
          _that.valuesCompleted,
          _that.attendancePct,
          _that.initialAvg,
          _that.improvementAvg,
          _that.syncedLateRows,
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
      DateTime weekStart,
      int sessionsClosed,
      int valuesCompleted,
      double? attendancePct,
      double? initialAvg,
      double? improvementAvg,
      int syncedLateRows,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KpiWeeklyPoint():
        return $default(
          _that.weekStart,
          _that.sessionsClosed,
          _that.valuesCompleted,
          _that.attendancePct,
          _that.initialAvg,
          _that.improvementAvg,
          _that.syncedLateRows,
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
      DateTime weekStart,
      int sessionsClosed,
      int valuesCompleted,
      double? attendancePct,
      double? initialAvg,
      double? improvementAvg,
      int syncedLateRows,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KpiWeeklyPoint() when $default != null:
        return $default(
          _that.weekStart,
          _that.sessionsClosed,
          _that.valuesCompleted,
          _that.attendancePct,
          _that.initialAvg,
          _that.improvementAvg,
          _that.syncedLateRows,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _KpiWeeklyPoint implements KpiWeeklyPoint {
  const _KpiWeeklyPoint({
    required this.weekStart,
    this.sessionsClosed = 0,
    this.valuesCompleted = 0,
    this.attendancePct,
    this.initialAvg,
    this.improvementAvg,
    this.syncedLateRows = 0,
  });
  factory _KpiWeeklyPoint.fromJson(Map<String, dynamic> json) =>
      _$KpiWeeklyPointFromJson(json);

  @override
  final DateTime weekStart;
  @override
  @JsonKey()
  final int sessionsClosed;
  @override
  @JsonKey()
  final int valuesCompleted;
  @override
  final double? attendancePct;
  @override
  final double? initialAvg;
  @override
  final double? improvementAvg;
  @override
  @JsonKey()
  final int syncedLateRows;

  /// Create a copy of KpiWeeklyPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$KpiWeeklyPointCopyWith<_KpiWeeklyPoint> get copyWith =>
      __$KpiWeeklyPointCopyWithImpl<_KpiWeeklyPoint>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$KpiWeeklyPointToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _KpiWeeklyPoint &&
            (identical(other.weekStart, weekStart) ||
                other.weekStart == weekStart) &&
            (identical(other.sessionsClosed, sessionsClosed) ||
                other.sessionsClosed == sessionsClosed) &&
            (identical(other.valuesCompleted, valuesCompleted) ||
                other.valuesCompleted == valuesCompleted) &&
            (identical(other.attendancePct, attendancePct) ||
                other.attendancePct == attendancePct) &&
            (identical(other.initialAvg, initialAvg) ||
                other.initialAvg == initialAvg) &&
            (identical(other.improvementAvg, improvementAvg) ||
                other.improvementAvg == improvementAvg) &&
            (identical(other.syncedLateRows, syncedLateRows) ||
                other.syncedLateRows == syncedLateRows));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    weekStart,
    sessionsClosed,
    valuesCompleted,
    attendancePct,
    initialAvg,
    improvementAvg,
    syncedLateRows,
  );

  @override
  String toString() {
    return 'KpiWeeklyPoint(weekStart: $weekStart, sessionsClosed: $sessionsClosed, valuesCompleted: $valuesCompleted, attendancePct: $attendancePct, initialAvg: $initialAvg, improvementAvg: $improvementAvg, syncedLateRows: $syncedLateRows)';
  }
}

/// @nodoc
abstract mixin class _$KpiWeeklyPointCopyWith<$Res>
    implements $KpiWeeklyPointCopyWith<$Res> {
  factory _$KpiWeeklyPointCopyWith(
    _KpiWeeklyPoint value,
    $Res Function(_KpiWeeklyPoint) _then,
  ) = __$KpiWeeklyPointCopyWithImpl;
  @override
  @useResult
  $Res call({
    DateTime weekStart,
    int sessionsClosed,
    int valuesCompleted,
    double? attendancePct,
    double? initialAvg,
    double? improvementAvg,
    int syncedLateRows,
  });
}

/// @nodoc
class __$KpiWeeklyPointCopyWithImpl<$Res>
    implements _$KpiWeeklyPointCopyWith<$Res> {
  __$KpiWeeklyPointCopyWithImpl(this._self, this._then);

  final _KpiWeeklyPoint _self;
  final $Res Function(_KpiWeeklyPoint) _then;

  /// Create a copy of KpiWeeklyPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? weekStart = null,
    Object? sessionsClosed = null,
    Object? valuesCompleted = null,
    Object? attendancePct = freezed,
    Object? initialAvg = freezed,
    Object? improvementAvg = freezed,
    Object? syncedLateRows = null,
  }) {
    return _then(
      _KpiWeeklyPoint(
        weekStart: null == weekStart
            ? _self.weekStart
            : weekStart // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        sessionsClosed: null == sessionsClosed
            ? _self.sessionsClosed
            : sessionsClosed // ignore: cast_nullable_to_non_nullable
                  as int,
        valuesCompleted: null == valuesCompleted
            ? _self.valuesCompleted
            : valuesCompleted // ignore: cast_nullable_to_non_nullable
                  as int,
        attendancePct: freezed == attendancePct
            ? _self.attendancePct
            : attendancePct // ignore: cast_nullable_to_non_nullable
                  as double?,
        initialAvg: freezed == initialAvg
            ? _self.initialAvg
            : initialAvg // ignore: cast_nullable_to_non_nullable
                  as double?,
        improvementAvg: freezed == improvementAvg
            ? _self.improvementAvg
            : improvementAvg // ignore: cast_nullable_to_non_nullable
                  as double?,
        syncedLateRows: null == syncedLateRows
            ? _self.syncedLateRows
            : syncedLateRows // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}
