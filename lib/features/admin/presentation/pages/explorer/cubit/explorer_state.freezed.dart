// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'explorer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExplorerState {
  ExplorerStatus get status;
  ApiException? get error;

  /// A reload is in flight while the previous rows stay on screen.
  bool get refreshing;
  ExplorerData get data;
  ExplorerEntity get entity;
  Map<ExplorerEntity, ExplorerQuery> get queries;
  Set<String> get selection;
  bool get compact;
  List<SavedExplorerView>
  get savedViews; // Rows of the current entity after search, filters, view and sort.
  List<ExplorerTable> get tables;
  List<ExplorerOrganization> get organizations;
  List<AdminPerson> get people;
  Map<String, int> get viewCounts;
  Map<String, List<ExplorerFilterOption>> get filterOptions;
  TableAggregate get aggregate;

  /// Create a copy of ExplorerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExplorerStateCopyWith<ExplorerState> get copyWith =>
      _$ExplorerStateCopyWithImpl<ExplorerState>(
        this as ExplorerState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExplorerState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.refreshing, refreshing) ||
                other.refreshing == refreshing) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.entity, entity) || other.entity == entity) &&
            const DeepCollectionEquality().equals(other.queries, queries) &&
            const DeepCollectionEquality().equals(other.selection, selection) &&
            (identical(other.compact, compact) || other.compact == compact) &&
            const DeepCollectionEquality().equals(
              other.savedViews,
              savedViews,
            ) &&
            const DeepCollectionEquality().equals(other.tables, tables) &&
            const DeepCollectionEquality().equals(
              other.organizations,
              organizations,
            ) &&
            const DeepCollectionEquality().equals(other.people, people) &&
            const DeepCollectionEquality().equals(
              other.viewCounts,
              viewCounts,
            ) &&
            const DeepCollectionEquality().equals(
              other.filterOptions,
              filterOptions,
            ) &&
            (identical(other.aggregate, aggregate) ||
                other.aggregate == aggregate));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    error,
    refreshing,
    data,
    entity,
    const DeepCollectionEquality().hash(queries),
    const DeepCollectionEquality().hash(selection),
    compact,
    const DeepCollectionEquality().hash(savedViews),
    const DeepCollectionEquality().hash(tables),
    const DeepCollectionEquality().hash(organizations),
    const DeepCollectionEquality().hash(people),
    const DeepCollectionEquality().hash(viewCounts),
    const DeepCollectionEquality().hash(filterOptions),
    aggregate,
  );

  @override
  String toString() {
    return 'ExplorerState(status: $status, error: $error, refreshing: $refreshing, data: $data, entity: $entity, queries: $queries, selection: $selection, compact: $compact, savedViews: $savedViews, tables: $tables, organizations: $organizations, people: $people, viewCounts: $viewCounts, filterOptions: $filterOptions, aggregate: $aggregate)';
  }
}

/// @nodoc
abstract mixin class $ExplorerStateCopyWith<$Res> {
  factory $ExplorerStateCopyWith(
    ExplorerState value,
    $Res Function(ExplorerState) _then,
  ) = _$ExplorerStateCopyWithImpl;
  @useResult
  $Res call({
    ExplorerStatus status,
    ApiException? error,
    bool refreshing,
    ExplorerData data,
    ExplorerEntity entity,
    Map<ExplorerEntity, ExplorerQuery> queries,
    Set<String> selection,
    bool compact,
    List<SavedExplorerView> savedViews,
    List<ExplorerTable> tables,
    List<ExplorerOrganization> organizations,
    List<AdminPerson> people,
    Map<String, int> viewCounts,
    Map<String, List<ExplorerFilterOption>> filterOptions,
    TableAggregate aggregate,
  });

  $ExplorerDataCopyWith<$Res> get data;
  $TableAggregateCopyWith<$Res> get aggregate;
}

/// @nodoc
class _$ExplorerStateCopyWithImpl<$Res>
    implements $ExplorerStateCopyWith<$Res> {
  _$ExplorerStateCopyWithImpl(this._self, this._then);

  final ExplorerState _self;
  final $Res Function(ExplorerState) _then;

  /// Create a copy of ExplorerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? refreshing = null,
    Object? data = null,
    Object? entity = null,
    Object? queries = null,
    Object? selection = null,
    Object? compact = null,
    Object? savedViews = null,
    Object? tables = null,
    Object? organizations = null,
    Object? people = null,
    Object? viewCounts = null,
    Object? filterOptions = null,
    Object? aggregate = null,
  }) {
    return _then(
      _self.copyWith(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as ExplorerStatus,
        error: freezed == error
            ? _self.error
            : error // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
        refreshing: null == refreshing
            ? _self.refreshing
            : refreshing // ignore: cast_nullable_to_non_nullable
                  as bool,
        data: null == data
            ? _self.data
            : data // ignore: cast_nullable_to_non_nullable
                  as ExplorerData,
        entity: null == entity
            ? _self.entity
            : entity // ignore: cast_nullable_to_non_nullable
                  as ExplorerEntity,
        queries: null == queries
            ? _self.queries
            : queries // ignore: cast_nullable_to_non_nullable
                  as Map<ExplorerEntity, ExplorerQuery>,
        selection: null == selection
            ? _self.selection
            : selection // ignore: cast_nullable_to_non_nullable
                  as Set<String>,
        compact: null == compact
            ? _self.compact
            : compact // ignore: cast_nullable_to_non_nullable
                  as bool,
        savedViews: null == savedViews
            ? _self.savedViews
            : savedViews // ignore: cast_nullable_to_non_nullable
                  as List<SavedExplorerView>,
        tables: null == tables
            ? _self.tables
            : tables // ignore: cast_nullable_to_non_nullable
                  as List<ExplorerTable>,
        organizations: null == organizations
            ? _self.organizations
            : organizations // ignore: cast_nullable_to_non_nullable
                  as List<ExplorerOrganization>,
        people: null == people
            ? _self.people
            : people // ignore: cast_nullable_to_non_nullable
                  as List<AdminPerson>,
        viewCounts: null == viewCounts
            ? _self.viewCounts
            : viewCounts // ignore: cast_nullable_to_non_nullable
                  as Map<String, int>,
        filterOptions: null == filterOptions
            ? _self.filterOptions
            : filterOptions // ignore: cast_nullable_to_non_nullable
                  as Map<String, List<ExplorerFilterOption>>,
        aggregate: null == aggregate
            ? _self.aggregate
            : aggregate // ignore: cast_nullable_to_non_nullable
                  as TableAggregate,
      ),
    );
  }

  /// Create a copy of ExplorerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExplorerDataCopyWith<$Res> get data {
    return $ExplorerDataCopyWith<$Res>(_self.data, (value) {
      return _then(_self.copyWith(data: value));
    });
  }

  /// Create a copy of ExplorerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TableAggregateCopyWith<$Res> get aggregate {
    return $TableAggregateCopyWith<$Res>(_self.aggregate, (value) {
      return _then(_self.copyWith(aggregate: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ExplorerState].
extension ExplorerStatePatterns on ExplorerState {
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
    TResult Function(_ExplorerState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExplorerState() when $default != null:
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
    TResult Function(_ExplorerState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExplorerState():
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
    TResult? Function(_ExplorerState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExplorerState() when $default != null:
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
      ExplorerStatus status,
      ApiException? error,
      bool refreshing,
      ExplorerData data,
      ExplorerEntity entity,
      Map<ExplorerEntity, ExplorerQuery> queries,
      Set<String> selection,
      bool compact,
      List<SavedExplorerView> savedViews,
      List<ExplorerTable> tables,
      List<ExplorerOrganization> organizations,
      List<AdminPerson> people,
      Map<String, int> viewCounts,
      Map<String, List<ExplorerFilterOption>> filterOptions,
      TableAggregate aggregate,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExplorerState() when $default != null:
        return $default(
          _that.status,
          _that.error,
          _that.refreshing,
          _that.data,
          _that.entity,
          _that.queries,
          _that.selection,
          _that.compact,
          _that.savedViews,
          _that.tables,
          _that.organizations,
          _that.people,
          _that.viewCounts,
          _that.filterOptions,
          _that.aggregate,
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
      ExplorerStatus status,
      ApiException? error,
      bool refreshing,
      ExplorerData data,
      ExplorerEntity entity,
      Map<ExplorerEntity, ExplorerQuery> queries,
      Set<String> selection,
      bool compact,
      List<SavedExplorerView> savedViews,
      List<ExplorerTable> tables,
      List<ExplorerOrganization> organizations,
      List<AdminPerson> people,
      Map<String, int> viewCounts,
      Map<String, List<ExplorerFilterOption>> filterOptions,
      TableAggregate aggregate,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExplorerState():
        return $default(
          _that.status,
          _that.error,
          _that.refreshing,
          _that.data,
          _that.entity,
          _that.queries,
          _that.selection,
          _that.compact,
          _that.savedViews,
          _that.tables,
          _that.organizations,
          _that.people,
          _that.viewCounts,
          _that.filterOptions,
          _that.aggregate,
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
      ExplorerStatus status,
      ApiException? error,
      bool refreshing,
      ExplorerData data,
      ExplorerEntity entity,
      Map<ExplorerEntity, ExplorerQuery> queries,
      Set<String> selection,
      bool compact,
      List<SavedExplorerView> savedViews,
      List<ExplorerTable> tables,
      List<ExplorerOrganization> organizations,
      List<AdminPerson> people,
      Map<String, int> viewCounts,
      Map<String, List<ExplorerFilterOption>> filterOptions,
      TableAggregate aggregate,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExplorerState() when $default != null:
        return $default(
          _that.status,
          _that.error,
          _that.refreshing,
          _that.data,
          _that.entity,
          _that.queries,
          _that.selection,
          _that.compact,
          _that.savedViews,
          _that.tables,
          _that.organizations,
          _that.people,
          _that.viewCounts,
          _that.filterOptions,
          _that.aggregate,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ExplorerState extends ExplorerState {
  const _ExplorerState({
    this.status = ExplorerStatus.loading,
    this.error,
    this.refreshing = false,
    this.data = const ExplorerData(),
    this.entity = ExplorerEntity.tables,
    final Map<ExplorerEntity, ExplorerQuery> queries = const {},
    final Set<String> selection = const {},
    this.compact = false,
    final List<SavedExplorerView> savedViews = const [],
    final List<ExplorerTable> tables = const [],
    final List<ExplorerOrganization> organizations = const [],
    final List<AdminPerson> people = const [],
    final Map<String, int> viewCounts = const {},
    final Map<String, List<ExplorerFilterOption>> filterOptions = const {},
    this.aggregate = const TableAggregate(),
  }) : _queries = queries,
       _selection = selection,
       _savedViews = savedViews,
       _tables = tables,
       _organizations = organizations,
       _people = people,
       _viewCounts = viewCounts,
       _filterOptions = filterOptions,
       super._();

  @override
  @JsonKey()
  final ExplorerStatus status;
  @override
  final ApiException? error;

  /// A reload is in flight while the previous rows stay on screen.
  @override
  @JsonKey()
  final bool refreshing;
  @override
  @JsonKey()
  final ExplorerData data;
  @override
  @JsonKey()
  final ExplorerEntity entity;
  final Map<ExplorerEntity, ExplorerQuery> _queries;
  @override
  @JsonKey()
  Map<ExplorerEntity, ExplorerQuery> get queries {
    if (_queries is EqualUnmodifiableMapView) return _queries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_queries);
  }

  final Set<String> _selection;
  @override
  @JsonKey()
  Set<String> get selection {
    if (_selection is EqualUnmodifiableSetView) return _selection;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selection);
  }

  @override
  @JsonKey()
  final bool compact;
  final List<SavedExplorerView> _savedViews;
  @override
  @JsonKey()
  List<SavedExplorerView> get savedViews {
    if (_savedViews is EqualUnmodifiableListView) return _savedViews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_savedViews);
  }

  // Rows of the current entity after search, filters, view and sort.
  final List<ExplorerTable> _tables;
  // Rows of the current entity after search, filters, view and sort.
  @override
  @JsonKey()
  List<ExplorerTable> get tables {
    if (_tables is EqualUnmodifiableListView) return _tables;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tables);
  }

  final List<ExplorerOrganization> _organizations;
  @override
  @JsonKey()
  List<ExplorerOrganization> get organizations {
    if (_organizations is EqualUnmodifiableListView) return _organizations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_organizations);
  }

  final List<AdminPerson> _people;
  @override
  @JsonKey()
  List<AdminPerson> get people {
    if (_people is EqualUnmodifiableListView) return _people;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_people);
  }

  final Map<String, int> _viewCounts;
  @override
  @JsonKey()
  Map<String, int> get viewCounts {
    if (_viewCounts is EqualUnmodifiableMapView) return _viewCounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_viewCounts);
  }

  final Map<String, List<ExplorerFilterOption>> _filterOptions;
  @override
  @JsonKey()
  Map<String, List<ExplorerFilterOption>> get filterOptions {
    if (_filterOptions is EqualUnmodifiableMapView) return _filterOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_filterOptions);
  }

  @override
  @JsonKey()
  final TableAggregate aggregate;

  /// Create a copy of ExplorerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ExplorerStateCopyWith<_ExplorerState> get copyWith =>
      __$ExplorerStateCopyWithImpl<_ExplorerState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExplorerState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.refreshing, refreshing) ||
                other.refreshing == refreshing) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.entity, entity) || other.entity == entity) &&
            const DeepCollectionEquality().equals(other._queries, _queries) &&
            const DeepCollectionEquality().equals(
              other._selection,
              _selection,
            ) &&
            (identical(other.compact, compact) || other.compact == compact) &&
            const DeepCollectionEquality().equals(
              other._savedViews,
              _savedViews,
            ) &&
            const DeepCollectionEquality().equals(other._tables, _tables) &&
            const DeepCollectionEquality().equals(
              other._organizations,
              _organizations,
            ) &&
            const DeepCollectionEquality().equals(other._people, _people) &&
            const DeepCollectionEquality().equals(
              other._viewCounts,
              _viewCounts,
            ) &&
            const DeepCollectionEquality().equals(
              other._filterOptions,
              _filterOptions,
            ) &&
            (identical(other.aggregate, aggregate) ||
                other.aggregate == aggregate));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    error,
    refreshing,
    data,
    entity,
    const DeepCollectionEquality().hash(_queries),
    const DeepCollectionEquality().hash(_selection),
    compact,
    const DeepCollectionEquality().hash(_savedViews),
    const DeepCollectionEquality().hash(_tables),
    const DeepCollectionEquality().hash(_organizations),
    const DeepCollectionEquality().hash(_people),
    const DeepCollectionEquality().hash(_viewCounts),
    const DeepCollectionEquality().hash(_filterOptions),
    aggregate,
  );

  @override
  String toString() {
    return 'ExplorerState(status: $status, error: $error, refreshing: $refreshing, data: $data, entity: $entity, queries: $queries, selection: $selection, compact: $compact, savedViews: $savedViews, tables: $tables, organizations: $organizations, people: $people, viewCounts: $viewCounts, filterOptions: $filterOptions, aggregate: $aggregate)';
  }
}

/// @nodoc
abstract mixin class _$ExplorerStateCopyWith<$Res>
    implements $ExplorerStateCopyWith<$Res> {
  factory _$ExplorerStateCopyWith(
    _ExplorerState value,
    $Res Function(_ExplorerState) _then,
  ) = __$ExplorerStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    ExplorerStatus status,
    ApiException? error,
    bool refreshing,
    ExplorerData data,
    ExplorerEntity entity,
    Map<ExplorerEntity, ExplorerQuery> queries,
    Set<String> selection,
    bool compact,
    List<SavedExplorerView> savedViews,
    List<ExplorerTable> tables,
    List<ExplorerOrganization> organizations,
    List<AdminPerson> people,
    Map<String, int> viewCounts,
    Map<String, List<ExplorerFilterOption>> filterOptions,
    TableAggregate aggregate,
  });

  @override
  $ExplorerDataCopyWith<$Res> get data;
  @override
  $TableAggregateCopyWith<$Res> get aggregate;
}

/// @nodoc
class __$ExplorerStateCopyWithImpl<$Res>
    implements _$ExplorerStateCopyWith<$Res> {
  __$ExplorerStateCopyWithImpl(this._self, this._then);

  final _ExplorerState _self;
  final $Res Function(_ExplorerState) _then;

  /// Create a copy of ExplorerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? refreshing = null,
    Object? data = null,
    Object? entity = null,
    Object? queries = null,
    Object? selection = null,
    Object? compact = null,
    Object? savedViews = null,
    Object? tables = null,
    Object? organizations = null,
    Object? people = null,
    Object? viewCounts = null,
    Object? filterOptions = null,
    Object? aggregate = null,
  }) {
    return _then(
      _ExplorerState(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as ExplorerStatus,
        error: freezed == error
            ? _self.error
            : error // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
        refreshing: null == refreshing
            ? _self.refreshing
            : refreshing // ignore: cast_nullable_to_non_nullable
                  as bool,
        data: null == data
            ? _self.data
            : data // ignore: cast_nullable_to_non_nullable
                  as ExplorerData,
        entity: null == entity
            ? _self.entity
            : entity // ignore: cast_nullable_to_non_nullable
                  as ExplorerEntity,
        queries: null == queries
            ? _self._queries
            : queries // ignore: cast_nullable_to_non_nullable
                  as Map<ExplorerEntity, ExplorerQuery>,
        selection: null == selection
            ? _self._selection
            : selection // ignore: cast_nullable_to_non_nullable
                  as Set<String>,
        compact: null == compact
            ? _self.compact
            : compact // ignore: cast_nullable_to_non_nullable
                  as bool,
        savedViews: null == savedViews
            ? _self._savedViews
            : savedViews // ignore: cast_nullable_to_non_nullable
                  as List<SavedExplorerView>,
        tables: null == tables
            ? _self._tables
            : tables // ignore: cast_nullable_to_non_nullable
                  as List<ExplorerTable>,
        organizations: null == organizations
            ? _self._organizations
            : organizations // ignore: cast_nullable_to_non_nullable
                  as List<ExplorerOrganization>,
        people: null == people
            ? _self._people
            : people // ignore: cast_nullable_to_non_nullable
                  as List<AdminPerson>,
        viewCounts: null == viewCounts
            ? _self._viewCounts
            : viewCounts // ignore: cast_nullable_to_non_nullable
                  as Map<String, int>,
        filterOptions: null == filterOptions
            ? _self._filterOptions
            : filterOptions // ignore: cast_nullable_to_non_nullable
                  as Map<String, List<ExplorerFilterOption>>,
        aggregate: null == aggregate
            ? _self.aggregate
            : aggregate // ignore: cast_nullable_to_non_nullable
                  as TableAggregate,
      ),
    );
  }

  /// Create a copy of ExplorerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExplorerDataCopyWith<$Res> get data {
    return $ExplorerDataCopyWith<$Res>(_self.data, (value) {
      return _then(_self.copyWith(data: value));
    });
  }

  /// Create a copy of ExplorerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TableAggregateCopyWith<$Res> get aggregate {
    return $TableAggregateCopyWith<$Res>(_self.aggregate, (value) {
      return _then(_self.copyWith(aggregate: value));
    });
  }
}
