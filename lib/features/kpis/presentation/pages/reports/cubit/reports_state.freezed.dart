// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reports_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReportsState {
  ReportsStatus get status;
  ApiException? get error;

  /// Filters changed and the dashboards are reloading.
  bool get refreshing;
  ReportFilters get filters;
  ReportOptions get options;
  ReportData? get data;

  /// Charts currently shown as a table instead of a graph.
  Set<ReportChart>
  get tableViews; // Drill-down: root grouping, steps taken and the rows of the level shown.
  DrillKind get drillGroup;
  List<DrillStep> get drillPath;
  DrillLevel? get drillLevel;
  bool get drillLoading;

  /// Failure of the drill level (the dashboards above stay usable).
  ApiException? get drillError;

  /// The organization a coordinator is limited to; the drill starts there.
  String? get lockedOrganizationId;

  /// Create a copy of ReportsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReportsStateCopyWith<ReportsState> get copyWith =>
      _$ReportsStateCopyWithImpl<ReportsState>(
        this as ReportsState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReportsState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.refreshing, refreshing) ||
                other.refreshing == refreshing) &&
            (identical(other.filters, filters) || other.filters == filters) &&
            (identical(other.options, options) || other.options == options) &&
            (identical(other.data, data) || other.data == data) &&
            const DeepCollectionEquality().equals(
              other.tableViews,
              tableViews,
            ) &&
            (identical(other.drillGroup, drillGroup) ||
                other.drillGroup == drillGroup) &&
            const DeepCollectionEquality().equals(other.drillPath, drillPath) &&
            (identical(other.drillLevel, drillLevel) ||
                other.drillLevel == drillLevel) &&
            (identical(other.drillLoading, drillLoading) ||
                other.drillLoading == drillLoading) &&
            (identical(other.drillError, drillError) ||
                other.drillError == drillError) &&
            (identical(other.lockedOrganizationId, lockedOrganizationId) ||
                other.lockedOrganizationId == lockedOrganizationId));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    error,
    refreshing,
    filters,
    options,
    data,
    const DeepCollectionEquality().hash(tableViews),
    drillGroup,
    const DeepCollectionEquality().hash(drillPath),
    drillLevel,
    drillLoading,
    drillError,
    lockedOrganizationId,
  );

  @override
  String toString() {
    return 'ReportsState(status: $status, error: $error, refreshing: $refreshing, filters: $filters, options: $options, data: $data, tableViews: $tableViews, drillGroup: $drillGroup, drillPath: $drillPath, drillLevel: $drillLevel, drillLoading: $drillLoading, drillError: $drillError, lockedOrganizationId: $lockedOrganizationId)';
  }
}

/// @nodoc
abstract mixin class $ReportsStateCopyWith<$Res> {
  factory $ReportsStateCopyWith(
    ReportsState value,
    $Res Function(ReportsState) _then,
  ) = _$ReportsStateCopyWithImpl;
  @useResult
  $Res call({
    ReportsStatus status,
    ApiException? error,
    bool refreshing,
    ReportFilters filters,
    ReportOptions options,
    ReportData? data,
    Set<ReportChart> tableViews,
    DrillKind drillGroup,
    List<DrillStep> drillPath,
    DrillLevel? drillLevel,
    bool drillLoading,
    ApiException? drillError,
    String? lockedOrganizationId,
  });

  $ReportFiltersCopyWith<$Res> get filters;
  $ReportOptionsCopyWith<$Res> get options;
  $ReportDataCopyWith<$Res>? get data;
  $DrillLevelCopyWith<$Res>? get drillLevel;
}

/// @nodoc
class _$ReportsStateCopyWithImpl<$Res> implements $ReportsStateCopyWith<$Res> {
  _$ReportsStateCopyWithImpl(this._self, this._then);

  final ReportsState _self;
  final $Res Function(ReportsState) _then;

  /// Create a copy of ReportsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? refreshing = null,
    Object? filters = null,
    Object? options = null,
    Object? data = freezed,
    Object? tableViews = null,
    Object? drillGroup = null,
    Object? drillPath = null,
    Object? drillLevel = freezed,
    Object? drillLoading = null,
    Object? drillError = freezed,
    Object? lockedOrganizationId = freezed,
  }) {
    return _then(
      _self.copyWith(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as ReportsStatus,
        error: freezed == error
            ? _self.error
            : error // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
        refreshing: null == refreshing
            ? _self.refreshing
            : refreshing // ignore: cast_nullable_to_non_nullable
                  as bool,
        filters: null == filters
            ? _self.filters
            : filters // ignore: cast_nullable_to_non_nullable
                  as ReportFilters,
        options: null == options
            ? _self.options
            : options // ignore: cast_nullable_to_non_nullable
                  as ReportOptions,
        data: freezed == data
            ? _self.data
            : data // ignore: cast_nullable_to_non_nullable
                  as ReportData?,
        tableViews: null == tableViews
            ? _self.tableViews
            : tableViews // ignore: cast_nullable_to_non_nullable
                  as Set<ReportChart>,
        drillGroup: null == drillGroup
            ? _self.drillGroup
            : drillGroup // ignore: cast_nullable_to_non_nullable
                  as DrillKind,
        drillPath: null == drillPath
            ? _self.drillPath
            : drillPath // ignore: cast_nullable_to_non_nullable
                  as List<DrillStep>,
        drillLevel: freezed == drillLevel
            ? _self.drillLevel
            : drillLevel // ignore: cast_nullable_to_non_nullable
                  as DrillLevel?,
        drillLoading: null == drillLoading
            ? _self.drillLoading
            : drillLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        drillError: freezed == drillError
            ? _self.drillError
            : drillError // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
        lockedOrganizationId: freezed == lockedOrganizationId
            ? _self.lockedOrganizationId
            : lockedOrganizationId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }

  /// Create a copy of ReportsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReportFiltersCopyWith<$Res> get filters {
    return $ReportFiltersCopyWith<$Res>(_self.filters, (value) {
      return _then(_self.copyWith(filters: value));
    });
  }

  /// Create a copy of ReportsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReportOptionsCopyWith<$Res> get options {
    return $ReportOptionsCopyWith<$Res>(_self.options, (value) {
      return _then(_self.copyWith(options: value));
    });
  }

  /// Create a copy of ReportsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReportDataCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $ReportDataCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }

  /// Create a copy of ReportsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DrillLevelCopyWith<$Res>? get drillLevel {
    if (_self.drillLevel == null) {
      return null;
    }

    return $DrillLevelCopyWith<$Res>(_self.drillLevel!, (value) {
      return _then(_self.copyWith(drillLevel: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ReportsState].
extension ReportsStatePatterns on ReportsState {
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
    TResult Function(_ReportsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReportsState() when $default != null:
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
    TResult Function(_ReportsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportsState():
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
    TResult? Function(_ReportsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportsState() when $default != null:
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
      ReportsStatus status,
      ApiException? error,
      bool refreshing,
      ReportFilters filters,
      ReportOptions options,
      ReportData? data,
      Set<ReportChart> tableViews,
      DrillKind drillGroup,
      List<DrillStep> drillPath,
      DrillLevel? drillLevel,
      bool drillLoading,
      ApiException? drillError,
      String? lockedOrganizationId,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReportsState() when $default != null:
        return $default(
          _that.status,
          _that.error,
          _that.refreshing,
          _that.filters,
          _that.options,
          _that.data,
          _that.tableViews,
          _that.drillGroup,
          _that.drillPath,
          _that.drillLevel,
          _that.drillLoading,
          _that.drillError,
          _that.lockedOrganizationId,
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
      ReportsStatus status,
      ApiException? error,
      bool refreshing,
      ReportFilters filters,
      ReportOptions options,
      ReportData? data,
      Set<ReportChart> tableViews,
      DrillKind drillGroup,
      List<DrillStep> drillPath,
      DrillLevel? drillLevel,
      bool drillLoading,
      ApiException? drillError,
      String? lockedOrganizationId,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportsState():
        return $default(
          _that.status,
          _that.error,
          _that.refreshing,
          _that.filters,
          _that.options,
          _that.data,
          _that.tableViews,
          _that.drillGroup,
          _that.drillPath,
          _that.drillLevel,
          _that.drillLoading,
          _that.drillError,
          _that.lockedOrganizationId,
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
      ReportsStatus status,
      ApiException? error,
      bool refreshing,
      ReportFilters filters,
      ReportOptions options,
      ReportData? data,
      Set<ReportChart> tableViews,
      DrillKind drillGroup,
      List<DrillStep> drillPath,
      DrillLevel? drillLevel,
      bool drillLoading,
      ApiException? drillError,
      String? lockedOrganizationId,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportsState() when $default != null:
        return $default(
          _that.status,
          _that.error,
          _that.refreshing,
          _that.filters,
          _that.options,
          _that.data,
          _that.tableViews,
          _that.drillGroup,
          _that.drillPath,
          _that.drillLevel,
          _that.drillLoading,
          _that.drillError,
          _that.lockedOrganizationId,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ReportsState implements ReportsState {
  const _ReportsState({
    this.status = ReportsStatus.loading,
    this.error,
    this.refreshing = false,
    this.filters = const ReportFilters(),
    this.options = const ReportOptions(),
    this.data,
    final Set<ReportChart> tableViews = const {},
    this.drillGroup = DrillKind.country,
    final List<DrillStep> drillPath = const [],
    this.drillLevel,
    this.drillLoading = false,
    this.drillError,
    this.lockedOrganizationId,
  }) : _tableViews = tableViews,
       _drillPath = drillPath;

  @override
  @JsonKey()
  final ReportsStatus status;
  @override
  final ApiException? error;

  /// Filters changed and the dashboards are reloading.
  @override
  @JsonKey()
  final bool refreshing;
  @override
  @JsonKey()
  final ReportFilters filters;
  @override
  @JsonKey()
  final ReportOptions options;
  @override
  final ReportData? data;

  /// Charts currently shown as a table instead of a graph.
  final Set<ReportChart> _tableViews;

  /// Charts currently shown as a table instead of a graph.
  @override
  @JsonKey()
  Set<ReportChart> get tableViews {
    if (_tableViews is EqualUnmodifiableSetView) return _tableViews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_tableViews);
  }

  // Drill-down: root grouping, steps taken and the rows of the level shown.
  @override
  @JsonKey()
  final DrillKind drillGroup;
  final List<DrillStep> _drillPath;
  @override
  @JsonKey()
  List<DrillStep> get drillPath {
    if (_drillPath is EqualUnmodifiableListView) return _drillPath;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_drillPath);
  }

  @override
  final DrillLevel? drillLevel;
  @override
  @JsonKey()
  final bool drillLoading;

  /// Failure of the drill level (the dashboards above stay usable).
  @override
  final ApiException? drillError;

  /// The organization a coordinator is limited to; the drill starts there.
  @override
  final String? lockedOrganizationId;

  /// Create a copy of ReportsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReportsStateCopyWith<_ReportsState> get copyWith =>
      __$ReportsStateCopyWithImpl<_ReportsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReportsState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.refreshing, refreshing) ||
                other.refreshing == refreshing) &&
            (identical(other.filters, filters) || other.filters == filters) &&
            (identical(other.options, options) || other.options == options) &&
            (identical(other.data, data) || other.data == data) &&
            const DeepCollectionEquality().equals(
              other._tableViews,
              _tableViews,
            ) &&
            (identical(other.drillGroup, drillGroup) ||
                other.drillGroup == drillGroup) &&
            const DeepCollectionEquality().equals(
              other._drillPath,
              _drillPath,
            ) &&
            (identical(other.drillLevel, drillLevel) ||
                other.drillLevel == drillLevel) &&
            (identical(other.drillLoading, drillLoading) ||
                other.drillLoading == drillLoading) &&
            (identical(other.drillError, drillError) ||
                other.drillError == drillError) &&
            (identical(other.lockedOrganizationId, lockedOrganizationId) ||
                other.lockedOrganizationId == lockedOrganizationId));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    error,
    refreshing,
    filters,
    options,
    data,
    const DeepCollectionEquality().hash(_tableViews),
    drillGroup,
    const DeepCollectionEquality().hash(_drillPath),
    drillLevel,
    drillLoading,
    drillError,
    lockedOrganizationId,
  );

  @override
  String toString() {
    return 'ReportsState(status: $status, error: $error, refreshing: $refreshing, filters: $filters, options: $options, data: $data, tableViews: $tableViews, drillGroup: $drillGroup, drillPath: $drillPath, drillLevel: $drillLevel, drillLoading: $drillLoading, drillError: $drillError, lockedOrganizationId: $lockedOrganizationId)';
  }
}

/// @nodoc
abstract mixin class _$ReportsStateCopyWith<$Res>
    implements $ReportsStateCopyWith<$Res> {
  factory _$ReportsStateCopyWith(
    _ReportsState value,
    $Res Function(_ReportsState) _then,
  ) = __$ReportsStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    ReportsStatus status,
    ApiException? error,
    bool refreshing,
    ReportFilters filters,
    ReportOptions options,
    ReportData? data,
    Set<ReportChart> tableViews,
    DrillKind drillGroup,
    List<DrillStep> drillPath,
    DrillLevel? drillLevel,
    bool drillLoading,
    ApiException? drillError,
    String? lockedOrganizationId,
  });

  @override
  $ReportFiltersCopyWith<$Res> get filters;
  @override
  $ReportOptionsCopyWith<$Res> get options;
  @override
  $ReportDataCopyWith<$Res>? get data;
  @override
  $DrillLevelCopyWith<$Res>? get drillLevel;
}

/// @nodoc
class __$ReportsStateCopyWithImpl<$Res>
    implements _$ReportsStateCopyWith<$Res> {
  __$ReportsStateCopyWithImpl(this._self, this._then);

  final _ReportsState _self;
  final $Res Function(_ReportsState) _then;

  /// Create a copy of ReportsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? refreshing = null,
    Object? filters = null,
    Object? options = null,
    Object? data = freezed,
    Object? tableViews = null,
    Object? drillGroup = null,
    Object? drillPath = null,
    Object? drillLevel = freezed,
    Object? drillLoading = null,
    Object? drillError = freezed,
    Object? lockedOrganizationId = freezed,
  }) {
    return _then(
      _ReportsState(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as ReportsStatus,
        error: freezed == error
            ? _self.error
            : error // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
        refreshing: null == refreshing
            ? _self.refreshing
            : refreshing // ignore: cast_nullable_to_non_nullable
                  as bool,
        filters: null == filters
            ? _self.filters
            : filters // ignore: cast_nullable_to_non_nullable
                  as ReportFilters,
        options: null == options
            ? _self.options
            : options // ignore: cast_nullable_to_non_nullable
                  as ReportOptions,
        data: freezed == data
            ? _self.data
            : data // ignore: cast_nullable_to_non_nullable
                  as ReportData?,
        tableViews: null == tableViews
            ? _self._tableViews
            : tableViews // ignore: cast_nullable_to_non_nullable
                  as Set<ReportChart>,
        drillGroup: null == drillGroup
            ? _self.drillGroup
            : drillGroup // ignore: cast_nullable_to_non_nullable
                  as DrillKind,
        drillPath: null == drillPath
            ? _self._drillPath
            : drillPath // ignore: cast_nullable_to_non_nullable
                  as List<DrillStep>,
        drillLevel: freezed == drillLevel
            ? _self.drillLevel
            : drillLevel // ignore: cast_nullable_to_non_nullable
                  as DrillLevel?,
        drillLoading: null == drillLoading
            ? _self.drillLoading
            : drillLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        drillError: freezed == drillError
            ? _self.drillError
            : drillError // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
        lockedOrganizationId: freezed == lockedOrganizationId
            ? _self.lockedOrganizationId
            : lockedOrganizationId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }

  /// Create a copy of ReportsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReportFiltersCopyWith<$Res> get filters {
    return $ReportFiltersCopyWith<$Res>(_self.filters, (value) {
      return _then(_self.copyWith(filters: value));
    });
  }

  /// Create a copy of ReportsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReportOptionsCopyWith<$Res> get options {
    return $ReportOptionsCopyWith<$Res>(_self.options, (value) {
      return _then(_self.copyWith(options: value));
    });
  }

  /// Create a copy of ReportsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReportDataCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $ReportDataCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }

  /// Create a copy of ReportsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DrillLevelCopyWith<$Res>? get drillLevel {
    if (_self.drillLevel == null) {
      return null;
    }

    return $DrillLevelCopyWith<$Res>(_self.drillLevel!, (value) {
      return _then(_self.copyWith(drillLevel: value));
    });
  }
}
