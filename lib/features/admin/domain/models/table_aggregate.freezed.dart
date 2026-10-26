// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_aggregate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TableAggregate {
  int get tables;
  int get people;
  int get valuesCompleted;
  double? get attendancePct;
  double? get improvementAvg;
  int get syncedLateRows;
  int get active;
  int get delayed;
  int get inactive;
  int get lowAttendance;

  /// Create a copy of TableAggregate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TableAggregateCopyWith<TableAggregate> get copyWith =>
      _$TableAggregateCopyWithImpl<TableAggregate>(
        this as TableAggregate,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TableAggregate &&
            (identical(other.tables, tables) || other.tables == tables) &&
            (identical(other.people, people) || other.people == people) &&
            (identical(other.valuesCompleted, valuesCompleted) ||
                other.valuesCompleted == valuesCompleted) &&
            (identical(other.attendancePct, attendancePct) ||
                other.attendancePct == attendancePct) &&
            (identical(other.improvementAvg, improvementAvg) ||
                other.improvementAvg == improvementAvg) &&
            (identical(other.syncedLateRows, syncedLateRows) ||
                other.syncedLateRows == syncedLateRows) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.delayed, delayed) || other.delayed == delayed) &&
            (identical(other.inactive, inactive) ||
                other.inactive == inactive) &&
            (identical(other.lowAttendance, lowAttendance) ||
                other.lowAttendance == lowAttendance));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    tables,
    people,
    valuesCompleted,
    attendancePct,
    improvementAvg,
    syncedLateRows,
    active,
    delayed,
    inactive,
    lowAttendance,
  );

  @override
  String toString() {
    return 'TableAggregate(tables: $tables, people: $people, valuesCompleted: $valuesCompleted, attendancePct: $attendancePct, improvementAvg: $improvementAvg, syncedLateRows: $syncedLateRows, active: $active, delayed: $delayed, inactive: $inactive, lowAttendance: $lowAttendance)';
  }
}

/// @nodoc
abstract mixin class $TableAggregateCopyWith<$Res> {
  factory $TableAggregateCopyWith(
    TableAggregate value,
    $Res Function(TableAggregate) _then,
  ) = _$TableAggregateCopyWithImpl;
  @useResult
  $Res call({
    int tables,
    int people,
    int valuesCompleted,
    double? attendancePct,
    double? improvementAvg,
    int syncedLateRows,
    int active,
    int delayed,
    int inactive,
    int lowAttendance,
  });
}

/// @nodoc
class _$TableAggregateCopyWithImpl<$Res>
    implements $TableAggregateCopyWith<$Res> {
  _$TableAggregateCopyWithImpl(this._self, this._then);

  final TableAggregate _self;
  final $Res Function(TableAggregate) _then;

  /// Create a copy of TableAggregate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tables = null,
    Object? people = null,
    Object? valuesCompleted = null,
    Object? attendancePct = freezed,
    Object? improvementAvg = freezed,
    Object? syncedLateRows = null,
    Object? active = null,
    Object? delayed = null,
    Object? inactive = null,
    Object? lowAttendance = null,
  }) {
    return _then(
      _self.copyWith(
        tables: null == tables
            ? _self.tables
            : tables // ignore: cast_nullable_to_non_nullable
                  as int,
        people: null == people
            ? _self.people
            : people // ignore: cast_nullable_to_non_nullable
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
        lowAttendance: null == lowAttendance
            ? _self.lowAttendance
            : lowAttendance // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [TableAggregate].
extension TableAggregatePatterns on TableAggregate {
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
    TResult Function(_TableAggregate value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TableAggregate() when $default != null:
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
    TResult Function(_TableAggregate value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableAggregate():
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
    TResult? Function(_TableAggregate value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableAggregate() when $default != null:
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
      int tables,
      int people,
      int valuesCompleted,
      double? attendancePct,
      double? improvementAvg,
      int syncedLateRows,
      int active,
      int delayed,
      int inactive,
      int lowAttendance,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TableAggregate() when $default != null:
        return $default(
          _that.tables,
          _that.people,
          _that.valuesCompleted,
          _that.attendancePct,
          _that.improvementAvg,
          _that.syncedLateRows,
          _that.active,
          _that.delayed,
          _that.inactive,
          _that.lowAttendance,
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
      int tables,
      int people,
      int valuesCompleted,
      double? attendancePct,
      double? improvementAvg,
      int syncedLateRows,
      int active,
      int delayed,
      int inactive,
      int lowAttendance,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableAggregate():
        return $default(
          _that.tables,
          _that.people,
          _that.valuesCompleted,
          _that.attendancePct,
          _that.improvementAvg,
          _that.syncedLateRows,
          _that.active,
          _that.delayed,
          _that.inactive,
          _that.lowAttendance,
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
      int tables,
      int people,
      int valuesCompleted,
      double? attendancePct,
      double? improvementAvg,
      int syncedLateRows,
      int active,
      int delayed,
      int inactive,
      int lowAttendance,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableAggregate() when $default != null:
        return $default(
          _that.tables,
          _that.people,
          _that.valuesCompleted,
          _that.attendancePct,
          _that.improvementAvg,
          _that.syncedLateRows,
          _that.active,
          _that.delayed,
          _that.inactive,
          _that.lowAttendance,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TableAggregate implements TableAggregate {
  const _TableAggregate({
    this.tables = 0,
    this.people = 0,
    this.valuesCompleted = 0,
    this.attendancePct,
    this.improvementAvg,
    this.syncedLateRows = 0,
    this.active = 0,
    this.delayed = 0,
    this.inactive = 0,
    this.lowAttendance = 0,
  });

  @override
  @JsonKey()
  final int tables;
  @override
  @JsonKey()
  final int people;
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
  final int active;
  @override
  @JsonKey()
  final int delayed;
  @override
  @JsonKey()
  final int inactive;
  @override
  @JsonKey()
  final int lowAttendance;

  /// Create a copy of TableAggregate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TableAggregateCopyWith<_TableAggregate> get copyWith =>
      __$TableAggregateCopyWithImpl<_TableAggregate>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TableAggregate &&
            (identical(other.tables, tables) || other.tables == tables) &&
            (identical(other.people, people) || other.people == people) &&
            (identical(other.valuesCompleted, valuesCompleted) ||
                other.valuesCompleted == valuesCompleted) &&
            (identical(other.attendancePct, attendancePct) ||
                other.attendancePct == attendancePct) &&
            (identical(other.improvementAvg, improvementAvg) ||
                other.improvementAvg == improvementAvg) &&
            (identical(other.syncedLateRows, syncedLateRows) ||
                other.syncedLateRows == syncedLateRows) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.delayed, delayed) || other.delayed == delayed) &&
            (identical(other.inactive, inactive) ||
                other.inactive == inactive) &&
            (identical(other.lowAttendance, lowAttendance) ||
                other.lowAttendance == lowAttendance));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    tables,
    people,
    valuesCompleted,
    attendancePct,
    improvementAvg,
    syncedLateRows,
    active,
    delayed,
    inactive,
    lowAttendance,
  );

  @override
  String toString() {
    return 'TableAggregate(tables: $tables, people: $people, valuesCompleted: $valuesCompleted, attendancePct: $attendancePct, improvementAvg: $improvementAvg, syncedLateRows: $syncedLateRows, active: $active, delayed: $delayed, inactive: $inactive, lowAttendance: $lowAttendance)';
  }
}

/// @nodoc
abstract mixin class _$TableAggregateCopyWith<$Res>
    implements $TableAggregateCopyWith<$Res> {
  factory _$TableAggregateCopyWith(
    _TableAggregate value,
    $Res Function(_TableAggregate) _then,
  ) = __$TableAggregateCopyWithImpl;
  @override
  @useResult
  $Res call({
    int tables,
    int people,
    int valuesCompleted,
    double? attendancePct,
    double? improvementAvg,
    int syncedLateRows,
    int active,
    int delayed,
    int inactive,
    int lowAttendance,
  });
}

/// @nodoc
class __$TableAggregateCopyWithImpl<$Res>
    implements _$TableAggregateCopyWith<$Res> {
  __$TableAggregateCopyWithImpl(this._self, this._then);

  final _TableAggregate _self;
  final $Res Function(_TableAggregate) _then;

  /// Create a copy of TableAggregate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tables = null,
    Object? people = null,
    Object? valuesCompleted = null,
    Object? attendancePct = freezed,
    Object? improvementAvg = freezed,
    Object? syncedLateRows = null,
    Object? active = null,
    Object? delayed = null,
    Object? inactive = null,
    Object? lowAttendance = null,
  }) {
    return _then(
      _TableAggregate(
        tables: null == tables
            ? _self.tables
            : tables // ignore: cast_nullable_to_non_nullable
                  as int,
        people: null == people
            ? _self.people
            : people // ignore: cast_nullable_to_non_nullable
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
        lowAttendance: null == lowAttendance
            ? _self.lowAttendance
            : lowAttendance // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}
