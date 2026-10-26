// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_kpi_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeTableHealthCounts {
  int get total;
  int get active;
  int get delayed;
  int get inactive;
  int get completed;

  /// Create a copy of HomeTableHealthCounts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeTableHealthCountsCopyWith<HomeTableHealthCounts> get copyWith =>
      _$HomeTableHealthCountsCopyWithImpl<HomeTableHealthCounts>(
        this as HomeTableHealthCounts,
        _$identity,
      );

  /// Serializes this HomeTableHealthCounts to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeTableHealthCounts &&
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
    return 'HomeTableHealthCounts(total: $total, active: $active, delayed: $delayed, inactive: $inactive, completed: $completed)';
  }
}

/// @nodoc
abstract mixin class $HomeTableHealthCountsCopyWith<$Res> {
  factory $HomeTableHealthCountsCopyWith(
    HomeTableHealthCounts value,
    $Res Function(HomeTableHealthCounts) _then,
  ) = _$HomeTableHealthCountsCopyWithImpl;
  @useResult
  $Res call({int total, int active, int delayed, int inactive, int completed});
}

/// @nodoc
class _$HomeTableHealthCountsCopyWithImpl<$Res>
    implements $HomeTableHealthCountsCopyWith<$Res> {
  _$HomeTableHealthCountsCopyWithImpl(this._self, this._then);

  final HomeTableHealthCounts _self;
  final $Res Function(HomeTableHealthCounts) _then;

  /// Create a copy of HomeTableHealthCounts
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

/// Adds pattern-matching-related methods to [HomeTableHealthCounts].
extension HomeTableHealthCountsPatterns on HomeTableHealthCounts {
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
    TResult Function(_HomeTableHealthCounts value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeTableHealthCounts() when $default != null:
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
    TResult Function(_HomeTableHealthCounts value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeTableHealthCounts():
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
    TResult? Function(_HomeTableHealthCounts value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeTableHealthCounts() when $default != null:
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
      case _HomeTableHealthCounts() when $default != null:
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
      case _HomeTableHealthCounts():
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
      case _HomeTableHealthCounts() when $default != null:
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
class _HomeTableHealthCounts implements HomeTableHealthCounts {
  const _HomeTableHealthCounts({
    this.total = 0,
    this.active = 0,
    this.delayed = 0,
    this.inactive = 0,
    this.completed = 0,
  });
  factory _HomeTableHealthCounts.fromJson(Map<String, dynamic> json) =>
      _$HomeTableHealthCountsFromJson(json);

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

  /// Create a copy of HomeTableHealthCounts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomeTableHealthCountsCopyWith<_HomeTableHealthCounts> get copyWith =>
      __$HomeTableHealthCountsCopyWithImpl<_HomeTableHealthCounts>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$HomeTableHealthCountsToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeTableHealthCounts &&
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
    return 'HomeTableHealthCounts(total: $total, active: $active, delayed: $delayed, inactive: $inactive, completed: $completed)';
  }
}

/// @nodoc
abstract mixin class _$HomeTableHealthCountsCopyWith<$Res>
    implements $HomeTableHealthCountsCopyWith<$Res> {
  factory _$HomeTableHealthCountsCopyWith(
    _HomeTableHealthCounts value,
    $Res Function(_HomeTableHealthCounts) _then,
  ) = __$HomeTableHealthCountsCopyWithImpl;
  @override
  @useResult
  $Res call({int total, int active, int delayed, int inactive, int completed});
}

/// @nodoc
class __$HomeTableHealthCountsCopyWithImpl<$Res>
    implements _$HomeTableHealthCountsCopyWith<$Res> {
  __$HomeTableHealthCountsCopyWithImpl(this._self, this._then);

  final _HomeTableHealthCounts _self;
  final $Res Function(_HomeTableHealthCounts) _then;

  /// Create a copy of HomeTableHealthCounts
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
      _HomeTableHealthCounts(
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
mixin _$HomeKpiSummary {
  int get valuesCompleted;
  double? get attendancePct;
  double? get improvementAvg;
  int get syncedLateRows;
  HomeTableHealthCounts get tables;
  DateTime? get computedAt;

  /// Create a copy of HomeKpiSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeKpiSummaryCopyWith<HomeKpiSummary> get copyWith =>
      _$HomeKpiSummaryCopyWithImpl<HomeKpiSummary>(
        this as HomeKpiSummary,
        _$identity,
      );

  /// Serializes this HomeKpiSummary to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeKpiSummary &&
            (identical(other.valuesCompleted, valuesCompleted) ||
                other.valuesCompleted == valuesCompleted) &&
            (identical(other.attendancePct, attendancePct) ||
                other.attendancePct == attendancePct) &&
            (identical(other.improvementAvg, improvementAvg) ||
                other.improvementAvg == improvementAvg) &&
            (identical(other.syncedLateRows, syncedLateRows) ||
                other.syncedLateRows == syncedLateRows) &&
            (identical(other.tables, tables) || other.tables == tables) &&
            (identical(other.computedAt, computedAt) ||
                other.computedAt == computedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    valuesCompleted,
    attendancePct,
    improvementAvg,
    syncedLateRows,
    tables,
    computedAt,
  );

  @override
  String toString() {
    return 'HomeKpiSummary(valuesCompleted: $valuesCompleted, attendancePct: $attendancePct, improvementAvg: $improvementAvg, syncedLateRows: $syncedLateRows, tables: $tables, computedAt: $computedAt)';
  }
}

/// @nodoc
abstract mixin class $HomeKpiSummaryCopyWith<$Res> {
  factory $HomeKpiSummaryCopyWith(
    HomeKpiSummary value,
    $Res Function(HomeKpiSummary) _then,
  ) = _$HomeKpiSummaryCopyWithImpl;
  @useResult
  $Res call({
    int valuesCompleted,
    double? attendancePct,
    double? improvementAvg,
    int syncedLateRows,
    HomeTableHealthCounts tables,
    DateTime? computedAt,
  });

  $HomeTableHealthCountsCopyWith<$Res> get tables;
}

/// @nodoc
class _$HomeKpiSummaryCopyWithImpl<$Res>
    implements $HomeKpiSummaryCopyWith<$Res> {
  _$HomeKpiSummaryCopyWithImpl(this._self, this._then);

  final HomeKpiSummary _self;
  final $Res Function(HomeKpiSummary) _then;

  /// Create a copy of HomeKpiSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? valuesCompleted = null,
    Object? attendancePct = freezed,
    Object? improvementAvg = freezed,
    Object? syncedLateRows = null,
    Object? tables = null,
    Object? computedAt = freezed,
  }) {
    return _then(
      _self.copyWith(
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
        tables: null == tables
            ? _self.tables
            : tables // ignore: cast_nullable_to_non_nullable
                  as HomeTableHealthCounts,
        computedAt: freezed == computedAt
            ? _self.computedAt
            : computedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }

  /// Create a copy of HomeKpiSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HomeTableHealthCountsCopyWith<$Res> get tables {
    return $HomeTableHealthCountsCopyWith<$Res>(_self.tables, (value) {
      return _then(_self.copyWith(tables: value));
    });
  }
}

/// Adds pattern-matching-related methods to [HomeKpiSummary].
extension HomeKpiSummaryPatterns on HomeKpiSummary {
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
    TResult Function(_HomeKpiSummary value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeKpiSummary() when $default != null:
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
    TResult Function(_HomeKpiSummary value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeKpiSummary():
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
    TResult? Function(_HomeKpiSummary value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeKpiSummary() when $default != null:
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
      int valuesCompleted,
      double? attendancePct,
      double? improvementAvg,
      int syncedLateRows,
      HomeTableHealthCounts tables,
      DateTime? computedAt,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeKpiSummary() when $default != null:
        return $default(
          _that.valuesCompleted,
          _that.attendancePct,
          _that.improvementAvg,
          _that.syncedLateRows,
          _that.tables,
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
      int valuesCompleted,
      double? attendancePct,
      double? improvementAvg,
      int syncedLateRows,
      HomeTableHealthCounts tables,
      DateTime? computedAt,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeKpiSummary():
        return $default(
          _that.valuesCompleted,
          _that.attendancePct,
          _that.improvementAvg,
          _that.syncedLateRows,
          _that.tables,
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
      int valuesCompleted,
      double? attendancePct,
      double? improvementAvg,
      int syncedLateRows,
      HomeTableHealthCounts tables,
      DateTime? computedAt,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeKpiSummary() when $default != null:
        return $default(
          _that.valuesCompleted,
          _that.attendancePct,
          _that.improvementAvg,
          _that.syncedLateRows,
          _that.tables,
          _that.computedAt,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _HomeKpiSummary implements HomeKpiSummary {
  const _HomeKpiSummary({
    this.valuesCompleted = 0,
    this.attendancePct,
    this.improvementAvg,
    this.syncedLateRows = 0,
    this.tables = const HomeTableHealthCounts(),
    this.computedAt,
  });
  factory _HomeKpiSummary.fromJson(Map<String, dynamic> json) =>
      _$HomeKpiSummaryFromJson(json);

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
  @JsonKey()
  final HomeTableHealthCounts tables;
  @override
  final DateTime? computedAt;

  /// Create a copy of HomeKpiSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomeKpiSummaryCopyWith<_HomeKpiSummary> get copyWith =>
      __$HomeKpiSummaryCopyWithImpl<_HomeKpiSummary>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$HomeKpiSummaryToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeKpiSummary &&
            (identical(other.valuesCompleted, valuesCompleted) ||
                other.valuesCompleted == valuesCompleted) &&
            (identical(other.attendancePct, attendancePct) ||
                other.attendancePct == attendancePct) &&
            (identical(other.improvementAvg, improvementAvg) ||
                other.improvementAvg == improvementAvg) &&
            (identical(other.syncedLateRows, syncedLateRows) ||
                other.syncedLateRows == syncedLateRows) &&
            (identical(other.tables, tables) || other.tables == tables) &&
            (identical(other.computedAt, computedAt) ||
                other.computedAt == computedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    valuesCompleted,
    attendancePct,
    improvementAvg,
    syncedLateRows,
    tables,
    computedAt,
  );

  @override
  String toString() {
    return 'HomeKpiSummary(valuesCompleted: $valuesCompleted, attendancePct: $attendancePct, improvementAvg: $improvementAvg, syncedLateRows: $syncedLateRows, tables: $tables, computedAt: $computedAt)';
  }
}

/// @nodoc
abstract mixin class _$HomeKpiSummaryCopyWith<$Res>
    implements $HomeKpiSummaryCopyWith<$Res> {
  factory _$HomeKpiSummaryCopyWith(
    _HomeKpiSummary value,
    $Res Function(_HomeKpiSummary) _then,
  ) = __$HomeKpiSummaryCopyWithImpl;
  @override
  @useResult
  $Res call({
    int valuesCompleted,
    double? attendancePct,
    double? improvementAvg,
    int syncedLateRows,
    HomeTableHealthCounts tables,
    DateTime? computedAt,
  });

  @override
  $HomeTableHealthCountsCopyWith<$Res> get tables;
}

/// @nodoc
class __$HomeKpiSummaryCopyWithImpl<$Res>
    implements _$HomeKpiSummaryCopyWith<$Res> {
  __$HomeKpiSummaryCopyWithImpl(this._self, this._then);

  final _HomeKpiSummary _self;
  final $Res Function(_HomeKpiSummary) _then;

  /// Create a copy of HomeKpiSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? valuesCompleted = null,
    Object? attendancePct = freezed,
    Object? improvementAvg = freezed,
    Object? syncedLateRows = null,
    Object? tables = null,
    Object? computedAt = freezed,
  }) {
    return _then(
      _HomeKpiSummary(
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
        tables: null == tables
            ? _self.tables
            : tables // ignore: cast_nullable_to_non_nullable
                  as HomeTableHealthCounts,
        computedAt: freezed == computedAt
            ? _self.computedAt
            : computedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }

  /// Create a copy of HomeKpiSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HomeTableHealthCountsCopyWith<$Res> get tables {
    return $HomeTableHealthCountsCopyWith<$Res>(_self.tables, (value) {
      return _then(_self.copyWith(tables: value));
    });
  }
}
