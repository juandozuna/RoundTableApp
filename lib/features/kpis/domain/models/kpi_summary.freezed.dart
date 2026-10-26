// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kpi_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KpiTableCounts {
  int get total;
  int get active;
  int get delayed;
  int get inactive;
  int get completed;

  /// Create a copy of KpiTableCounts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $KpiTableCountsCopyWith<KpiTableCounts> get copyWith =>
      _$KpiTableCountsCopyWithImpl<KpiTableCounts>(
        this as KpiTableCounts,
        _$identity,
      );

  /// Serializes this KpiTableCounts to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is KpiTableCounts &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.delayed, delayed) || other.delayed == delayed) &&
            (identical(other.inactive, inactive) ||
                other.inactive == inactive) &&
            (identical(other.completed, completed) ||
                other.completed == completed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, total, active, delayed, inactive, completed);

  @override
  String toString() {
    return 'KpiTableCounts(total: $total, active: $active, delayed: $delayed, inactive: $inactive, completed: $completed)';
  }
}

/// @nodoc
abstract mixin class $KpiTableCountsCopyWith<$Res> {
  factory $KpiTableCountsCopyWith(
    KpiTableCounts value,
    $Res Function(KpiTableCounts) _then,
  ) = _$KpiTableCountsCopyWithImpl;
  @useResult
  $Res call({int total, int active, int delayed, int inactive, int completed});
}

/// @nodoc
class _$KpiTableCountsCopyWithImpl<$Res>
    implements $KpiTableCountsCopyWith<$Res> {
  _$KpiTableCountsCopyWithImpl(this._self, this._then);

  final KpiTableCounts _self;
  final $Res Function(KpiTableCounts) _then;

  /// Create a copy of KpiTableCounts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? active = null,
    Object? delayed = null,
    Object? inactive = null,
    Object? completed = null,
  }) {
    return _then(
      _self.copyWith(
        total: null == total
            ? _self.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
        active: null == active
            ? _self.active
            : active // ignore: cast_nullable_to_non_nullable
                  as int,
        delayed: null == delayed
            ? _self.delayed
            : delayed // ignore: cast_nullable_to_non_nullable
                  as int,
        inactive: null == inactive
            ? _self.inactive
            : inactive // ignore: cast_nullable_to_non_nullable
                  as int,
        completed: null == completed
            ? _self.completed
            : completed // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [KpiTableCounts].
extension KpiTableCountsPatterns on KpiTableCounts {
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
    TResult Function(_KpiTableCounts value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _KpiTableCounts() when $default != null:
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
    TResult Function(_KpiTableCounts value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KpiTableCounts():
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
    TResult? Function(_KpiTableCounts value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KpiTableCounts() when $default != null:
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
      int total,
      int active,
      int delayed,
      int inactive,
      int completed,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _KpiTableCounts() when $default != null:
        return $default(
          _that.total,
          _that.active,
          _that.delayed,
          _that.inactive,
          _that.completed,
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
      int total,
      int active,
      int delayed,
      int inactive,
      int completed,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KpiTableCounts():
        return $default(
          _that.total,
          _that.active,
          _that.delayed,
          _that.inactive,
          _that.completed,
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
      int total,
      int active,
      int delayed,
      int inactive,
      int completed,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KpiTableCounts() when $default != null:
        return $default(
          _that.total,
          _that.active,
          _that.delayed,
          _that.inactive,
          _that.completed,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _KpiTableCounts implements KpiTableCounts {
  const _KpiTableCounts({
    this.total = 0,
    this.active = 0,
    this.delayed = 0,
    this.inactive = 0,
    this.completed = 0,
  });
  factory _KpiTableCounts.fromJson(Map<String, dynamic> json) =>
      _$KpiTableCountsFromJson(json);

  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey()
  final int active;
  @override
  @JsonKey()
  final int delayed;
  @override
  @JsonKey()
  final int inactive;
  @override
  @JsonKey()
  final int completed;

  /// Create a copy of KpiTableCounts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$KpiTableCountsCopyWith<_KpiTableCounts> get copyWith =>
      __$KpiTableCountsCopyWithImpl<_KpiTableCounts>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$KpiTableCountsToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _KpiTableCounts &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.delayed, delayed) || other.delayed == delayed) &&
            (identical(other.inactive, inactive) ||
                other.inactive == inactive) &&
            (identical(other.completed, completed) ||
                other.completed == completed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, total, active, delayed, inactive, completed);

  @override
  String toString() {
    return 'KpiTableCounts(total: $total, active: $active, delayed: $delayed, inactive: $inactive, completed: $completed)';
  }
}

/// @nodoc
abstract mixin class _$KpiTableCountsCopyWith<$Res>
    implements $KpiTableCountsCopyWith<$Res> {
  factory _$KpiTableCountsCopyWith(
    _KpiTableCounts value,
    $Res Function(_KpiTableCounts) _then,
  ) = __$KpiTableCountsCopyWithImpl;
  @override
  @useResult
  $Res call({int total, int active, int delayed, int inactive, int completed});
}

/// @nodoc
class __$KpiTableCountsCopyWithImpl<$Res>
    implements _$KpiTableCountsCopyWith<$Res> {
  __$KpiTableCountsCopyWithImpl(this._self, this._then);

  final _KpiTableCounts _self;
  final $Res Function(_KpiTableCounts) _then;

  /// Create a copy of KpiTableCounts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? total = null,
    Object? active = null,
    Object? delayed = null,
    Object? inactive = null,
    Object? completed = null,
  }) {
    return _then(
      _KpiTableCounts(
        total: null == total
            ? _self.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
        active: null == active
            ? _self.active
            : active // ignore: cast_nullable_to_non_nullable
                  as int,
        delayed: null == delayed
            ? _self.delayed
            : delayed // ignore: cast_nullable_to_non_nullable
                  as int,
        inactive: null == inactive
            ? _self.inactive
            : inactive // ignore: cast_nullable_to_non_nullable
                  as int,
        completed: null == completed
            ? _self.completed
            : completed // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
mixin _$KpiSummary {
  int get sessionsClosed;
  int get valuesCompleted;
  int get memberValuesCompleted;
  double? get attendancePct;
  double? get initialAvg;
  double? get followUpAvg;
  double? get improvementAvg;
  int get improvementPairs;
  int get syncedLateRows;
  int get syncedLateSessions;
  KpiTableCounts get tables;
  int get peopleActive;
  double? get programProgressPct;
  DateTime? get computedAt;

  /// Create a copy of KpiSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $KpiSummaryCopyWith<KpiSummary> get copyWith =>
      _$KpiSummaryCopyWithImpl<KpiSummary>(this as KpiSummary, _$identity);

  /// Serializes this KpiSummary to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is KpiSummary &&
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
            (identical(other.syncedLateSessions, syncedLateSessions) ||
                other.syncedLateSessions == syncedLateSessions) &&
            (identical(other.tables, tables) || other.tables == tables) &&
            (identical(other.peopleActive, peopleActive) ||
                other.peopleActive == peopleActive) &&
            (identical(other.programProgressPct, programProgressPct) ||
                other.programProgressPct == programProgressPct) &&
            (identical(other.computedAt, computedAt) ||
                other.computedAt == computedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    sessionsClosed,
    valuesCompleted,
    memberValuesCompleted,
    attendancePct,
    initialAvg,
    followUpAvg,
    improvementAvg,
    improvementPairs,
    syncedLateRows,
    syncedLateSessions,
    tables,
    peopleActive,
    programProgressPct,
    computedAt,
  );

  @override
  String toString() {
    return 'KpiSummary(sessionsClosed: $sessionsClosed, valuesCompleted: $valuesCompleted, memberValuesCompleted: $memberValuesCompleted, attendancePct: $attendancePct, initialAvg: $initialAvg, followUpAvg: $followUpAvg, improvementAvg: $improvementAvg, improvementPairs: $improvementPairs, syncedLateRows: $syncedLateRows, syncedLateSessions: $syncedLateSessions, tables: $tables, peopleActive: $peopleActive, programProgressPct: $programProgressPct, computedAt: $computedAt)';
  }
}

/// @nodoc
abstract mixin class $KpiSummaryCopyWith<$Res> {
  factory $KpiSummaryCopyWith(
    KpiSummary value,
    $Res Function(KpiSummary) _then,
  ) = _$KpiSummaryCopyWithImpl;
  @useResult
  $Res call({
    int sessionsClosed,
    int valuesCompleted,
    int memberValuesCompleted,
    double? attendancePct,
    double? initialAvg,
    double? followUpAvg,
    double? improvementAvg,
    int improvementPairs,
    int syncedLateRows,
    int syncedLateSessions,
    KpiTableCounts tables,
    int peopleActive,
    double? programProgressPct,
    DateTime? computedAt,
  });

  $KpiTableCountsCopyWith<$Res> get tables;
}

/// @nodoc
class _$KpiSummaryCopyWithImpl<$Res> implements $KpiSummaryCopyWith<$Res> {
  _$KpiSummaryCopyWithImpl(this._self, this._then);

  final KpiSummary _self;
  final $Res Function(KpiSummary) _then;

  /// Create a copy of KpiSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionsClosed = null,
    Object? valuesCompleted = null,
    Object? memberValuesCompleted = null,
    Object? attendancePct = freezed,
    Object? initialAvg = freezed,
    Object? followUpAvg = freezed,
    Object? improvementAvg = freezed,
    Object? improvementPairs = null,
    Object? syncedLateRows = null,
    Object? syncedLateSessions = null,
    Object? tables = null,
    Object? peopleActive = null,
    Object? programProgressPct = freezed,
    Object? computedAt = freezed,
  }) {
    return _then(
      _self.copyWith(
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
        syncedLateSessions: null == syncedLateSessions
            ? _self.syncedLateSessions
            : syncedLateSessions // ignore: cast_nullable_to_non_nullable
                  as int,
        tables: null == tables
            ? _self.tables
            : tables // ignore: cast_nullable_to_non_nullable
                  as KpiTableCounts,
        peopleActive: null == peopleActive
            ? _self.peopleActive
            : peopleActive // ignore: cast_nullable_to_non_nullable
                  as int,
        programProgressPct: freezed == programProgressPct
            ? _self.programProgressPct
            : programProgressPct // ignore: cast_nullable_to_non_nullable
                  as double?,
        computedAt: freezed == computedAt
            ? _self.computedAt
            : computedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }

  /// Create a copy of KpiSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KpiTableCountsCopyWith<$Res> get tables {
    return $KpiTableCountsCopyWith<$Res>(_self.tables, (value) {
      return _then(_self.copyWith(tables: value));
    });
  }
}

/// Adds pattern-matching-related methods to [KpiSummary].
extension KpiSummaryPatterns on KpiSummary {
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
    TResult Function(_KpiSummary value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _KpiSummary() when $default != null:
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
    TResult Function(_KpiSummary value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KpiSummary():
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
    TResult? Function(_KpiSummary value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KpiSummary() when $default != null:
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
      int sessionsClosed,
      int valuesCompleted,
      int memberValuesCompleted,
      double? attendancePct,
      double? initialAvg,
      double? followUpAvg,
      double? improvementAvg,
      int improvementPairs,
      int syncedLateRows,
      int syncedLateSessions,
      KpiTableCounts tables,
      int peopleActive,
      double? programProgressPct,
      DateTime? computedAt,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _KpiSummary() when $default != null:
        return $default(
          _that.sessionsClosed,
          _that.valuesCompleted,
          _that.memberValuesCompleted,
          _that.attendancePct,
          _that.initialAvg,
          _that.followUpAvg,
          _that.improvementAvg,
          _that.improvementPairs,
          _that.syncedLateRows,
          _that.syncedLateSessions,
          _that.tables,
          _that.peopleActive,
          _that.programProgressPct,
          _that.computedAt,
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
      int sessionsClosed,
      int valuesCompleted,
      int memberValuesCompleted,
      double? attendancePct,
      double? initialAvg,
      double? followUpAvg,
      double? improvementAvg,
      int improvementPairs,
      int syncedLateRows,
      int syncedLateSessions,
      KpiTableCounts tables,
      int peopleActive,
      double? programProgressPct,
      DateTime? computedAt,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KpiSummary():
        return $default(
          _that.sessionsClosed,
          _that.valuesCompleted,
          _that.memberValuesCompleted,
          _that.attendancePct,
          _that.initialAvg,
          _that.followUpAvg,
          _that.improvementAvg,
          _that.improvementPairs,
          _that.syncedLateRows,
          _that.syncedLateSessions,
          _that.tables,
          _that.peopleActive,
          _that.programProgressPct,
          _that.computedAt,
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
      int sessionsClosed,
      int valuesCompleted,
      int memberValuesCompleted,
      double? attendancePct,
      double? initialAvg,
      double? followUpAvg,
      double? improvementAvg,
      int improvementPairs,
      int syncedLateRows,
      int syncedLateSessions,
      KpiTableCounts tables,
      int peopleActive,
      double? programProgressPct,
      DateTime? computedAt,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KpiSummary() when $default != null:
        return $default(
          _that.sessionsClosed,
          _that.valuesCompleted,
          _that.memberValuesCompleted,
          _that.attendancePct,
          _that.initialAvg,
          _that.followUpAvg,
          _that.improvementAvg,
          _that.improvementPairs,
          _that.syncedLateRows,
          _that.syncedLateSessions,
          _that.tables,
          _that.peopleActive,
          _that.programProgressPct,
          _that.computedAt,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _KpiSummary implements KpiSummary {
  const _KpiSummary({
    this.sessionsClosed = 0,
    this.valuesCompleted = 0,
    this.memberValuesCompleted = 0,
    this.attendancePct,
    this.initialAvg,
    this.followUpAvg,
    this.improvementAvg,
    this.improvementPairs = 0,
    this.syncedLateRows = 0,
    this.syncedLateSessions = 0,
    this.tables = const KpiTableCounts(),
    this.peopleActive = 0,
    this.programProgressPct,
    this.computedAt,
  });
  factory _KpiSummary.fromJson(Map<String, dynamic> json) =>
      _$KpiSummaryFromJson(json);

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
  @JsonKey()
  final int syncedLateSessions;
  @override
  @JsonKey()
  final KpiTableCounts tables;
  @override
  @JsonKey()
  final int peopleActive;
  @override
  final double? programProgressPct;
  @override
  final DateTime? computedAt;

  /// Create a copy of KpiSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$KpiSummaryCopyWith<_KpiSummary> get copyWith =>
      __$KpiSummaryCopyWithImpl<_KpiSummary>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$KpiSummaryToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _KpiSummary &&
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
            (identical(other.syncedLateSessions, syncedLateSessions) ||
                other.syncedLateSessions == syncedLateSessions) &&
            (identical(other.tables, tables) || other.tables == tables) &&
            (identical(other.peopleActive, peopleActive) ||
                other.peopleActive == peopleActive) &&
            (identical(other.programProgressPct, programProgressPct) ||
                other.programProgressPct == programProgressPct) &&
            (identical(other.computedAt, computedAt) ||
                other.computedAt == computedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    sessionsClosed,
    valuesCompleted,
    memberValuesCompleted,
    attendancePct,
    initialAvg,
    followUpAvg,
    improvementAvg,
    improvementPairs,
    syncedLateRows,
    syncedLateSessions,
    tables,
    peopleActive,
    programProgressPct,
    computedAt,
  );

  @override
  String toString() {
    return 'KpiSummary(sessionsClosed: $sessionsClosed, valuesCompleted: $valuesCompleted, memberValuesCompleted: $memberValuesCompleted, attendancePct: $attendancePct, initialAvg: $initialAvg, followUpAvg: $followUpAvg, improvementAvg: $improvementAvg, improvementPairs: $improvementPairs, syncedLateRows: $syncedLateRows, syncedLateSessions: $syncedLateSessions, tables: $tables, peopleActive: $peopleActive, programProgressPct: $programProgressPct, computedAt: $computedAt)';
  }
}

/// @nodoc
abstract mixin class _$KpiSummaryCopyWith<$Res>
    implements $KpiSummaryCopyWith<$Res> {
  factory _$KpiSummaryCopyWith(
    _KpiSummary value,
    $Res Function(_KpiSummary) _then,
  ) = __$KpiSummaryCopyWithImpl;
  @override
  @useResult
  $Res call({
    int sessionsClosed,
    int valuesCompleted,
    int memberValuesCompleted,
    double? attendancePct,
    double? initialAvg,
    double? followUpAvg,
    double? improvementAvg,
    int improvementPairs,
    int syncedLateRows,
    int syncedLateSessions,
    KpiTableCounts tables,
    int peopleActive,
    double? programProgressPct,
    DateTime? computedAt,
  });

  @override
  $KpiTableCountsCopyWith<$Res> get tables;
}

/// @nodoc
class __$KpiSummaryCopyWithImpl<$Res> implements _$KpiSummaryCopyWith<$Res> {
  __$KpiSummaryCopyWithImpl(this._self, this._then);

  final _KpiSummary _self;
  final $Res Function(_KpiSummary) _then;

  /// Create a copy of KpiSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sessionsClosed = null,
    Object? valuesCompleted = null,
    Object? memberValuesCompleted = null,
    Object? attendancePct = freezed,
    Object? initialAvg = freezed,
    Object? followUpAvg = freezed,
    Object? improvementAvg = freezed,
    Object? improvementPairs = null,
    Object? syncedLateRows = null,
    Object? syncedLateSessions = null,
    Object? tables = null,
    Object? peopleActive = null,
    Object? programProgressPct = freezed,
    Object? computedAt = freezed,
  }) {
    return _then(
      _KpiSummary(
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
        syncedLateSessions: null == syncedLateSessions
            ? _self.syncedLateSessions
            : syncedLateSessions // ignore: cast_nullable_to_non_nullable
                  as int,
        tables: null == tables
            ? _self.tables
            : tables // ignore: cast_nullable_to_non_nullable
                  as KpiTableCounts,
        peopleActive: null == peopleActive
            ? _self.peopleActive
            : peopleActive // ignore: cast_nullable_to_non_nullable
                  as int,
        programProgressPct: freezed == programProgressPct
            ? _self.programProgressPct
            : programProgressPct // ignore: cast_nullable_to_non_nullable
                  as double?,
        computedAt: freezed == computedAt
            ? _self.computedAt
            : computedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }

  /// Create a copy of KpiSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KpiTableCountsCopyWith<$Res> get tables {
    return $KpiTableCountsCopyWith<$Res>(_self.tables, (value) {
      return _then(_self.copyWith(tables: value));
    });
  }
}
