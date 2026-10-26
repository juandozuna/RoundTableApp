// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReportData {
  KpiSummary get summary;
  List<KpiWeeklyPoint> get weekly;
  List<KpiBreakdownRow> get modules;
  List<KpiBreakdownRow> get organizations;
  List<KpiTableRow> get tables;

  /// Create a copy of ReportData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReportDataCopyWith<ReportData> get copyWith =>
      _$ReportDataCopyWithImpl<ReportData>(this as ReportData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReportData &&
            (identical(other.summary, summary) || other.summary == summary) &&
            const DeepCollectionEquality().equals(other.weekly, weekly) &&
            const DeepCollectionEquality().equals(other.modules, modules) &&
            const DeepCollectionEquality().equals(
              other.organizations,
              organizations,
            ) &&
            const DeepCollectionEquality().equals(other.tables, tables));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    summary,
    const DeepCollectionEquality().hash(weekly),
    const DeepCollectionEquality().hash(modules),
    const DeepCollectionEquality().hash(organizations),
    const DeepCollectionEquality().hash(tables),
  );

  @override
  String toString() {
    return 'ReportData(summary: $summary, weekly: $weekly, modules: $modules, organizations: $organizations, tables: $tables)';
  }
}

/// @nodoc
abstract mixin class $ReportDataCopyWith<$Res> {
  factory $ReportDataCopyWith(
    ReportData value,
    $Res Function(ReportData) _then,
  ) = _$ReportDataCopyWithImpl;
  @useResult
  $Res call({
    KpiSummary summary,
    List<KpiWeeklyPoint> weekly,
    List<KpiBreakdownRow> modules,
    List<KpiBreakdownRow> organizations,
    List<KpiTableRow> tables,
  });

  $KpiSummaryCopyWith<$Res> get summary;
}

/// @nodoc
class _$ReportDataCopyWithImpl<$Res> implements $ReportDataCopyWith<$Res> {
  _$ReportDataCopyWithImpl(this._self, this._then);

  final ReportData _self;
  final $Res Function(ReportData) _then;

  /// Create a copy of ReportData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = null,
    Object? weekly = null,
    Object? modules = null,
    Object? organizations = null,
    Object? tables = null,
  }) {
    return _then(
      _self.copyWith(
        summary: null == summary
            ? _self.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as KpiSummary,
        weekly: null == weekly
            ? _self.weekly
            : weekly // ignore: cast_nullable_to_non_nullable
                  as List<KpiWeeklyPoint>,
        modules: null == modules
            ? _self.modules
            : modules // ignore: cast_nullable_to_non_nullable
                  as List<KpiBreakdownRow>,
        organizations: null == organizations
            ? _self.organizations
            : organizations // ignore: cast_nullable_to_non_nullable
                  as List<KpiBreakdownRow>,
        tables: null == tables
            ? _self.tables
            : tables // ignore: cast_nullable_to_non_nullable
                  as List<KpiTableRow>,
      ),
    );
  }

  /// Create a copy of ReportData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KpiSummaryCopyWith<$Res> get summary {
    return $KpiSummaryCopyWith<$Res>(_self.summary, (value) {
      return _then(_self.copyWith(summary: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ReportData].
extension ReportDataPatterns on ReportData {
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
    TResult Function(_ReportData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReportData() when $default != null:
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
    TResult Function(_ReportData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportData():
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
    TResult? Function(_ReportData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportData() when $default != null:
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
      KpiSummary summary,
      List<KpiWeeklyPoint> weekly,
      List<KpiBreakdownRow> modules,
      List<KpiBreakdownRow> organizations,
      List<KpiTableRow> tables,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReportData() when $default != null:
        return $default(
          _that.summary,
          _that.weekly,
          _that.modules,
          _that.organizations,
          _that.tables,
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
      KpiSummary summary,
      List<KpiWeeklyPoint> weekly,
      List<KpiBreakdownRow> modules,
      List<KpiBreakdownRow> organizations,
      List<KpiTableRow> tables,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportData():
        return $default(
          _that.summary,
          _that.weekly,
          _that.modules,
          _that.organizations,
          _that.tables,
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
      KpiSummary summary,
      List<KpiWeeklyPoint> weekly,
      List<KpiBreakdownRow> modules,
      List<KpiBreakdownRow> organizations,
      List<KpiTableRow> tables,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportData() when $default != null:
        return $default(
          _that.summary,
          _that.weekly,
          _that.modules,
          _that.organizations,
          _that.tables,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ReportData implements ReportData {
  const _ReportData({
    required this.summary,
    required final List<KpiWeeklyPoint> weekly,
    required final List<KpiBreakdownRow> modules,
    required final List<KpiBreakdownRow> organizations,
    required final List<KpiTableRow> tables,
  }) : _weekly = weekly,
       _modules = modules,
       _organizations = organizations,
       _tables = tables;

  @override
  final KpiSummary summary;
  final List<KpiWeeklyPoint> _weekly;
  @override
  List<KpiWeeklyPoint> get weekly {
    if (_weekly is EqualUnmodifiableListView) return _weekly;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weekly);
  }

  final List<KpiBreakdownRow> _modules;
  @override
  List<KpiBreakdownRow> get modules {
    if (_modules is EqualUnmodifiableListView) return _modules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_modules);
  }

  final List<KpiBreakdownRow> _organizations;
  @override
  List<KpiBreakdownRow> get organizations {
    if (_organizations is EqualUnmodifiableListView) return _organizations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_organizations);
  }

  final List<KpiTableRow> _tables;
  @override
  List<KpiTableRow> get tables {
    if (_tables is EqualUnmodifiableListView) return _tables;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tables);
  }

  /// Create a copy of ReportData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReportDataCopyWith<_ReportData> get copyWith =>
      __$ReportDataCopyWithImpl<_ReportData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReportData &&
            (identical(other.summary, summary) || other.summary == summary) &&
            const DeepCollectionEquality().equals(other._weekly, _weekly) &&
            const DeepCollectionEquality().equals(other._modules, _modules) &&
            const DeepCollectionEquality().equals(
              other._organizations,
              _organizations,
            ) &&
            const DeepCollectionEquality().equals(other._tables, _tables));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    summary,
    const DeepCollectionEquality().hash(_weekly),
    const DeepCollectionEquality().hash(_modules),
    const DeepCollectionEquality().hash(_organizations),
    const DeepCollectionEquality().hash(_tables),
  );

  @override
  String toString() {
    return 'ReportData(summary: $summary, weekly: $weekly, modules: $modules, organizations: $organizations, tables: $tables)';
  }
}

/// @nodoc
abstract mixin class _$ReportDataCopyWith<$Res>
    implements $ReportDataCopyWith<$Res> {
  factory _$ReportDataCopyWith(
    _ReportData value,
    $Res Function(_ReportData) _then,
  ) = __$ReportDataCopyWithImpl;
  @override
  @useResult
  $Res call({
    KpiSummary summary,
    List<KpiWeeklyPoint> weekly,
    List<KpiBreakdownRow> modules,
    List<KpiBreakdownRow> organizations,
    List<KpiTableRow> tables,
  });

  @override
  $KpiSummaryCopyWith<$Res> get summary;
}

/// @nodoc
class __$ReportDataCopyWithImpl<$Res> implements _$ReportDataCopyWith<$Res> {
  __$ReportDataCopyWithImpl(this._self, this._then);

  final _ReportData _self;
  final $Res Function(_ReportData) _then;

  /// Create a copy of ReportData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? summary = null,
    Object? weekly = null,
    Object? modules = null,
    Object? organizations = null,
    Object? tables = null,
  }) {
    return _then(
      _ReportData(
        summary: null == summary
            ? _self.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as KpiSummary,
        weekly: null == weekly
            ? _self._weekly
            : weekly // ignore: cast_nullable_to_non_nullable
                  as List<KpiWeeklyPoint>,
        modules: null == modules
            ? _self._modules
            : modules // ignore: cast_nullable_to_non_nullable
                  as List<KpiBreakdownRow>,
        organizations: null == organizations
            ? _self._organizations
            : organizations // ignore: cast_nullable_to_non_nullable
                  as List<KpiBreakdownRow>,
        tables: null == tables
            ? _self._tables
            : tables // ignore: cast_nullable_to_non_nullable
                  as List<KpiTableRow>,
      ),
    );
  }

  /// Create a copy of ReportData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KpiSummaryCopyWith<$Res> get summary {
    return $KpiSummaryCopyWith<$Res>(_self.summary, (value) {
      return _then(_self.copyWith(summary: value));
    });
  }
}
