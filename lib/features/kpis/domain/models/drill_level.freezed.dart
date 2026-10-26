// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drill_level.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DrillStep {
  DrillKind get kind;
  String get id;
  String get label;

  /// Create a copy of DrillStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DrillStepCopyWith<DrillStep> get copyWith =>
      _$DrillStepCopyWithImpl<DrillStep>(this as DrillStep, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DrillStep &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label));
  }

  @override
  int get hashCode => Object.hash(runtimeType, kind, id, label);

  @override
  String toString() {
    return 'DrillStep(kind: $kind, id: $id, label: $label)';
  }
}

/// @nodoc
abstract mixin class $DrillStepCopyWith<$Res> {
  factory $DrillStepCopyWith(DrillStep value, $Res Function(DrillStep) _then) =
      _$DrillStepCopyWithImpl;
  @useResult
  $Res call({DrillKind kind, String id, String label});
}

/// @nodoc
class _$DrillStepCopyWithImpl<$Res> implements $DrillStepCopyWith<$Res> {
  _$DrillStepCopyWithImpl(this._self, this._then);

  final DrillStep _self;
  final $Res Function(DrillStep) _then;

  /// Create a copy of DrillStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? kind = null, Object? id = null, Object? label = null}) {
    return _then(
      _self.copyWith(
        kind: null == kind
            ? _self.kind
            : kind // ignore: cast_nullable_to_non_nullable
                  as DrillKind,
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        label: null == label
            ? _self.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [DrillStep].
extension DrillStepPatterns on DrillStep {
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
    TResult Function(_DrillStep value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DrillStep() when $default != null:
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
    TResult Function(_DrillStep value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DrillStep():
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
    TResult? Function(_DrillStep value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DrillStep() when $default != null:
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
    TResult Function(DrillKind kind, String id, String label)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DrillStep() when $default != null:
        return $default(_that.kind, _that.id, _that.label);
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
    TResult Function(DrillKind kind, String id, String label) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DrillStep():
        return $default(_that.kind, _that.id, _that.label);
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
    TResult? Function(DrillKind kind, String id, String label)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DrillStep() when $default != null:
        return $default(_that.kind, _that.id, _that.label);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DrillStep implements DrillStep {
  const _DrillStep({required this.kind, required this.id, required this.label});

  @override
  final DrillKind kind;
  @override
  final String id;
  @override
  final String label;

  /// Create a copy of DrillStep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DrillStepCopyWith<_DrillStep> get copyWith =>
      __$DrillStepCopyWithImpl<_DrillStep>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DrillStep &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label));
  }

  @override
  int get hashCode => Object.hash(runtimeType, kind, id, label);

  @override
  String toString() {
    return 'DrillStep(kind: $kind, id: $id, label: $label)';
  }
}

/// @nodoc
abstract mixin class _$DrillStepCopyWith<$Res>
    implements $DrillStepCopyWith<$Res> {
  factory _$DrillStepCopyWith(
    _DrillStep value,
    $Res Function(_DrillStep) _then,
  ) = __$DrillStepCopyWithImpl;
  @override
  @useResult
  $Res call({DrillKind kind, String id, String label});
}

/// @nodoc
class __$DrillStepCopyWithImpl<$Res> implements _$DrillStepCopyWith<$Res> {
  __$DrillStepCopyWithImpl(this._self, this._then);

  final _DrillStep _self;
  final $Res Function(_DrillStep) _then;

  /// Create a copy of DrillStep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? kind = null, Object? id = null, Object? label = null}) {
    return _then(
      _DrillStep(
        kind: null == kind
            ? _self.kind
            : kind // ignore: cast_nullable_to_non_nullable
                  as DrillKind,
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        label: null == label
            ? _self.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
mixin _$DrillRow {
  String get id;
  String get label;
  String? get sublabel;
  int? get tablesCount;
  double? get attendancePct;
  int get valuesCompleted;
  double? get improvementAvg;
  int get syncedLate;

  /// Create a copy of DrillRow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DrillRowCopyWith<DrillRow> get copyWith =>
      _$DrillRowCopyWithImpl<DrillRow>(this as DrillRow, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DrillRow &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.sublabel, sublabel) ||
                other.sublabel == sublabel) &&
            (identical(other.tablesCount, tablesCount) ||
                other.tablesCount == tablesCount) &&
            (identical(other.attendancePct, attendancePct) ||
                other.attendancePct == attendancePct) &&
            (identical(other.valuesCompleted, valuesCompleted) ||
                other.valuesCompleted == valuesCompleted) &&
            (identical(other.improvementAvg, improvementAvg) ||
                other.improvementAvg == improvementAvg) &&
            (identical(other.syncedLate, syncedLate) ||
                other.syncedLate == syncedLate));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    label,
    sublabel,
    tablesCount,
    attendancePct,
    valuesCompleted,
    improvementAvg,
    syncedLate,
  );

  @override
  String toString() {
    return 'DrillRow(id: $id, label: $label, sublabel: $sublabel, tablesCount: $tablesCount, attendancePct: $attendancePct, valuesCompleted: $valuesCompleted, improvementAvg: $improvementAvg, syncedLate: $syncedLate)';
  }
}

/// @nodoc
abstract mixin class $DrillRowCopyWith<$Res> {
  factory $DrillRowCopyWith(DrillRow value, $Res Function(DrillRow) _then) =
      _$DrillRowCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String label,
    String? sublabel,
    int? tablesCount,
    double? attendancePct,
    int valuesCompleted,
    double? improvementAvg,
    int syncedLate,
  });
}

/// @nodoc
class _$DrillRowCopyWithImpl<$Res> implements $DrillRowCopyWith<$Res> {
  _$DrillRowCopyWithImpl(this._self, this._then);

  final DrillRow _self;
  final $Res Function(DrillRow) _then;

  /// Create a copy of DrillRow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? sublabel = freezed,
    Object? tablesCount = freezed,
    Object? attendancePct = freezed,
    Object? valuesCompleted = null,
    Object? improvementAvg = freezed,
    Object? syncedLate = null,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        label: null == label
            ? _self.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        sublabel: freezed == sublabel
            ? _self.sublabel
            : sublabel // ignore: cast_nullable_to_non_nullable
                  as String?,
        tablesCount: freezed == tablesCount
            ? _self.tablesCount
            : tablesCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        attendancePct: freezed == attendancePct
            ? _self.attendancePct
            : attendancePct // ignore: cast_nullable_to_non_nullable
                  as double?,
        valuesCompleted: null == valuesCompleted
            ? _self.valuesCompleted
            : valuesCompleted // ignore: cast_nullable_to_non_nullable
                  as int,
        improvementAvg: freezed == improvementAvg
            ? _self.improvementAvg
            : improvementAvg // ignore: cast_nullable_to_non_nullable
                  as double?,
        syncedLate: null == syncedLate
            ? _self.syncedLate
            : syncedLate // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [DrillRow].
extension DrillRowPatterns on DrillRow {
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
    TResult Function(_DrillRow value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DrillRow() when $default != null:
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
    TResult Function(_DrillRow value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DrillRow():
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
    TResult? Function(_DrillRow value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DrillRow() when $default != null:
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
      String label,
      String? sublabel,
      int? tablesCount,
      double? attendancePct,
      int valuesCompleted,
      double? improvementAvg,
      int syncedLate,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DrillRow() when $default != null:
        return $default(
          _that.id,
          _that.label,
          _that.sublabel,
          _that.tablesCount,
          _that.attendancePct,
          _that.valuesCompleted,
          _that.improvementAvg,
          _that.syncedLate,
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
      String label,
      String? sublabel,
      int? tablesCount,
      double? attendancePct,
      int valuesCompleted,
      double? improvementAvg,
      int syncedLate,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DrillRow():
        return $default(
          _that.id,
          _that.label,
          _that.sublabel,
          _that.tablesCount,
          _that.attendancePct,
          _that.valuesCompleted,
          _that.improvementAvg,
          _that.syncedLate,
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
      String label,
      String? sublabel,
      int? tablesCount,
      double? attendancePct,
      int valuesCompleted,
      double? improvementAvg,
      int syncedLate,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DrillRow() when $default != null:
        return $default(
          _that.id,
          _that.label,
          _that.sublabel,
          _that.tablesCount,
          _that.attendancePct,
          _that.valuesCompleted,
          _that.improvementAvg,
          _that.syncedLate,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DrillRow implements DrillRow {
  const _DrillRow({
    required this.id,
    required this.label,
    this.sublabel,
    this.tablesCount,
    this.attendancePct,
    this.valuesCompleted = 0,
    this.improvementAvg,
    this.syncedLate = 0,
  });

  @override
  final String id;
  @override
  final String label;
  @override
  final String? sublabel;
  @override
  final int? tablesCount;
  @override
  final double? attendancePct;
  @override
  @JsonKey()
  final int valuesCompleted;
  @override
  final double? improvementAvg;
  @override
  @JsonKey()
  final int syncedLate;

  /// Create a copy of DrillRow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DrillRowCopyWith<_DrillRow> get copyWith =>
      __$DrillRowCopyWithImpl<_DrillRow>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DrillRow &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.sublabel, sublabel) ||
                other.sublabel == sublabel) &&
            (identical(other.tablesCount, tablesCount) ||
                other.tablesCount == tablesCount) &&
            (identical(other.attendancePct, attendancePct) ||
                other.attendancePct == attendancePct) &&
            (identical(other.valuesCompleted, valuesCompleted) ||
                other.valuesCompleted == valuesCompleted) &&
            (identical(other.improvementAvg, improvementAvg) ||
                other.improvementAvg == improvementAvg) &&
            (identical(other.syncedLate, syncedLate) ||
                other.syncedLate == syncedLate));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    label,
    sublabel,
    tablesCount,
    attendancePct,
    valuesCompleted,
    improvementAvg,
    syncedLate,
  );

  @override
  String toString() {
    return 'DrillRow(id: $id, label: $label, sublabel: $sublabel, tablesCount: $tablesCount, attendancePct: $attendancePct, valuesCompleted: $valuesCompleted, improvementAvg: $improvementAvg, syncedLate: $syncedLate)';
  }
}

/// @nodoc
abstract mixin class _$DrillRowCopyWith<$Res>
    implements $DrillRowCopyWith<$Res> {
  factory _$DrillRowCopyWith(_DrillRow value, $Res Function(_DrillRow) _then) =
      __$DrillRowCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String label,
    String? sublabel,
    int? tablesCount,
    double? attendancePct,
    int valuesCompleted,
    double? improvementAvg,
    int syncedLate,
  });
}

/// @nodoc
class __$DrillRowCopyWithImpl<$Res> implements _$DrillRowCopyWith<$Res> {
  __$DrillRowCopyWithImpl(this._self, this._then);

  final _DrillRow _self;
  final $Res Function(_DrillRow) _then;

  /// Create a copy of DrillRow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? sublabel = freezed,
    Object? tablesCount = freezed,
    Object? attendancePct = freezed,
    Object? valuesCompleted = null,
    Object? improvementAvg = freezed,
    Object? syncedLate = null,
  }) {
    return _then(
      _DrillRow(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        label: null == label
            ? _self.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        sublabel: freezed == sublabel
            ? _self.sublabel
            : sublabel // ignore: cast_nullable_to_non_nullable
                  as String?,
        tablesCount: freezed == tablesCount
            ? _self.tablesCount
            : tablesCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        attendancePct: freezed == attendancePct
            ? _self.attendancePct
            : attendancePct // ignore: cast_nullable_to_non_nullable
                  as double?,
        valuesCompleted: null == valuesCompleted
            ? _self.valuesCompleted
            : valuesCompleted // ignore: cast_nullable_to_non_nullable
                  as int,
        improvementAvg: freezed == improvementAvg
            ? _self.improvementAvg
            : improvementAvg // ignore: cast_nullable_to_non_nullable
                  as double?,
        syncedLate: null == syncedLate
            ? _self.syncedLate
            : syncedLate // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
mixin _$DrillLevel {
  DrillKind get kind;
  List<DrillRow> get rows;

  /// Create a copy of DrillLevel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DrillLevelCopyWith<DrillLevel> get copyWith =>
      _$DrillLevelCopyWithImpl<DrillLevel>(this as DrillLevel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DrillLevel &&
            (identical(other.kind, kind) || other.kind == kind) &&
            const DeepCollectionEquality().equals(other.rows, rows));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, kind, const DeepCollectionEquality().hash(rows));

  @override
  String toString() {
    return 'DrillLevel(kind: $kind, rows: $rows)';
  }
}

/// @nodoc
abstract mixin class $DrillLevelCopyWith<$Res> {
  factory $DrillLevelCopyWith(
    DrillLevel value,
    $Res Function(DrillLevel) _then,
  ) = _$DrillLevelCopyWithImpl;
  @useResult
  $Res call({DrillKind kind, List<DrillRow> rows});
}

/// @nodoc
class _$DrillLevelCopyWithImpl<$Res> implements $DrillLevelCopyWith<$Res> {
  _$DrillLevelCopyWithImpl(this._self, this._then);

  final DrillLevel _self;
  final $Res Function(DrillLevel) _then;

  /// Create a copy of DrillLevel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? kind = null, Object? rows = null}) {
    return _then(
      _self.copyWith(
        kind: null == kind
            ? _self.kind
            : kind // ignore: cast_nullable_to_non_nullable
                  as DrillKind,
        rows: null == rows
            ? _self.rows
            : rows // ignore: cast_nullable_to_non_nullable
                  as List<DrillRow>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [DrillLevel].
extension DrillLevelPatterns on DrillLevel {
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
    TResult Function(_DrillLevel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DrillLevel() when $default != null:
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
    TResult Function(_DrillLevel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DrillLevel():
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
    TResult? Function(_DrillLevel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DrillLevel() when $default != null:
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
    TResult Function(DrillKind kind, List<DrillRow> rows)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DrillLevel() when $default != null:
        return $default(_that.kind, _that.rows);
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
    TResult Function(DrillKind kind, List<DrillRow> rows) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DrillLevel():
        return $default(_that.kind, _that.rows);
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
    TResult? Function(DrillKind kind, List<DrillRow> rows)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DrillLevel() when $default != null:
        return $default(_that.kind, _that.rows);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DrillLevel extends DrillLevel {
  const _DrillLevel({required this.kind, required final List<DrillRow> rows})
    : _rows = rows,
      super._();

  @override
  final DrillKind kind;
  final List<DrillRow> _rows;
  @override
  List<DrillRow> get rows {
    if (_rows is EqualUnmodifiableListView) return _rows;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rows);
  }

  /// Create a copy of DrillLevel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DrillLevelCopyWith<_DrillLevel> get copyWith =>
      __$DrillLevelCopyWithImpl<_DrillLevel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DrillLevel &&
            (identical(other.kind, kind) || other.kind == kind) &&
            const DeepCollectionEquality().equals(other._rows, _rows));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    kind,
    const DeepCollectionEquality().hash(_rows),
  );

  @override
  String toString() {
    return 'DrillLevel(kind: $kind, rows: $rows)';
  }
}

/// @nodoc
abstract mixin class _$DrillLevelCopyWith<$Res>
    implements $DrillLevelCopyWith<$Res> {
  factory _$DrillLevelCopyWith(
    _DrillLevel value,
    $Res Function(_DrillLevel) _then,
  ) = __$DrillLevelCopyWithImpl;
  @override
  @useResult
  $Res call({DrillKind kind, List<DrillRow> rows});
}

/// @nodoc
class __$DrillLevelCopyWithImpl<$Res> implements _$DrillLevelCopyWith<$Res> {
  __$DrillLevelCopyWithImpl(this._self, this._then);

  final _DrillLevel _self;
  final $Res Function(_DrillLevel) _then;

  /// Create a copy of DrillLevel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? kind = null, Object? rows = null}) {
    return _then(
      _DrillLevel(
        kind: null == kind
            ? _self.kind
            : kind // ignore: cast_nullable_to_non_nullable
                  as DrillKind,
        rows: null == rows
            ? _self._rows
            : rows // ignore: cast_nullable_to_non_nullable
                  as List<DrillRow>,
      ),
    );
  }
}
