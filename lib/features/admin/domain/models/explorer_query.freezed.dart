// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'explorer_query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExplorerQuery {
  ExplorerEntity get entity;
  String get viewId;
  Map<String, String> get filters;
  String get search;
  String get sortKey;
  bool get ascending;

  /// Create a copy of ExplorerQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExplorerQueryCopyWith<ExplorerQuery> get copyWith =>
      _$ExplorerQueryCopyWithImpl<ExplorerQuery>(
        this as ExplorerQuery,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExplorerQuery &&
            (identical(other.entity, entity) || other.entity == entity) &&
            (identical(other.viewId, viewId) || other.viewId == viewId) &&
            const DeepCollectionEquality().equals(other.filters, filters) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.sortKey, sortKey) || other.sortKey == sortKey) &&
            (identical(other.ascending, ascending) ||
                other.ascending == ascending));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    entity,
    viewId,
    const DeepCollectionEquality().hash(filters),
    search,
    sortKey,
    ascending,
  );

  @override
  String toString() {
    return 'ExplorerQuery(entity: $entity, viewId: $viewId, filters: $filters, search: $search, sortKey: $sortKey, ascending: $ascending)';
  }
}

/// @nodoc
abstract mixin class $ExplorerQueryCopyWith<$Res> {
  factory $ExplorerQueryCopyWith(
    ExplorerQuery value,
    $Res Function(ExplorerQuery) _then,
  ) = _$ExplorerQueryCopyWithImpl;
  @useResult
  $Res call({
    ExplorerEntity entity,
    String viewId,
    Map<String, String> filters,
    String search,
    String sortKey,
    bool ascending,
  });
}

/// @nodoc
class _$ExplorerQueryCopyWithImpl<$Res>
    implements $ExplorerQueryCopyWith<$Res> {
  _$ExplorerQueryCopyWithImpl(this._self, this._then);

  final ExplorerQuery _self;
  final $Res Function(ExplorerQuery) _then;

  /// Create a copy of ExplorerQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entity = null,
    Object? viewId = null,
    Object? filters = null,
    Object? search = null,
    Object? sortKey = null,
    Object? ascending = null,
  }) {
    return _then(
      _self.copyWith(
        entity: null == entity
            ? _self.entity
            : entity // ignore: cast_nullable_to_non_nullable
                  as ExplorerEntity,
        viewId: null == viewId
            ? _self.viewId
            : viewId // ignore: cast_nullable_to_non_nullable
                  as String,
        filters: null == filters
            ? _self.filters
            : filters // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>,
        search: null == search
            ? _self.search
            : search // ignore: cast_nullable_to_non_nullable
                  as String,
        sortKey: null == sortKey
            ? _self.sortKey
            : sortKey // ignore: cast_nullable_to_non_nullable
                  as String,
        ascending: null == ascending
            ? _self.ascending
            : ascending // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [ExplorerQuery].
extension ExplorerQueryPatterns on ExplorerQuery {
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
    TResult Function(_ExplorerQuery value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExplorerQuery() when $default != null:
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
    TResult Function(_ExplorerQuery value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExplorerQuery():
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
    TResult? Function(_ExplorerQuery value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExplorerQuery() when $default != null:
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
      ExplorerEntity entity,
      String viewId,
      Map<String, String> filters,
      String search,
      String sortKey,
      bool ascending,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExplorerQuery() when $default != null:
        return $default(
          _that.entity,
          _that.viewId,
          _that.filters,
          _that.search,
          _that.sortKey,
          _that.ascending,
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
      ExplorerEntity entity,
      String viewId,
      Map<String, String> filters,
      String search,
      String sortKey,
      bool ascending,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExplorerQuery():
        return $default(
          _that.entity,
          _that.viewId,
          _that.filters,
          _that.search,
          _that.sortKey,
          _that.ascending,
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
      ExplorerEntity entity,
      String viewId,
      Map<String, String> filters,
      String search,
      String sortKey,
      bool ascending,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExplorerQuery() when $default != null:
        return $default(
          _that.entity,
          _that.viewId,
          _that.filters,
          _that.search,
          _that.sortKey,
          _that.ascending,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ExplorerQuery extends ExplorerQuery {
  const _ExplorerQuery({
    this.entity = ExplorerEntity.tables,
    this.viewId = 'all',
    final Map<String, String> filters = const {},
    this.search = '',
    this.sortKey = 'code',
    this.ascending = true,
  }) : _filters = filters,
       super._();

  @override
  @JsonKey()
  final ExplorerEntity entity;
  @override
  @JsonKey()
  final String viewId;
  final Map<String, String> _filters;
  @override
  @JsonKey()
  Map<String, String> get filters {
    if (_filters is EqualUnmodifiableMapView) return _filters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_filters);
  }

  @override
  @JsonKey()
  final String search;
  @override
  @JsonKey()
  final String sortKey;
  @override
  @JsonKey()
  final bool ascending;

  /// Create a copy of ExplorerQuery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ExplorerQueryCopyWith<_ExplorerQuery> get copyWith =>
      __$ExplorerQueryCopyWithImpl<_ExplorerQuery>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExplorerQuery &&
            (identical(other.entity, entity) || other.entity == entity) &&
            (identical(other.viewId, viewId) || other.viewId == viewId) &&
            const DeepCollectionEquality().equals(other._filters, _filters) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.sortKey, sortKey) || other.sortKey == sortKey) &&
            (identical(other.ascending, ascending) ||
                other.ascending == ascending));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    entity,
    viewId,
    const DeepCollectionEquality().hash(_filters),
    search,
    sortKey,
    ascending,
  );

  @override
  String toString() {
    return 'ExplorerQuery(entity: $entity, viewId: $viewId, filters: $filters, search: $search, sortKey: $sortKey, ascending: $ascending)';
  }
}

/// @nodoc
abstract mixin class _$ExplorerQueryCopyWith<$Res>
    implements $ExplorerQueryCopyWith<$Res> {
  factory _$ExplorerQueryCopyWith(
    _ExplorerQuery value,
    $Res Function(_ExplorerQuery) _then,
  ) = __$ExplorerQueryCopyWithImpl;
  @override
  @useResult
  $Res call({
    ExplorerEntity entity,
    String viewId,
    Map<String, String> filters,
    String search,
    String sortKey,
    bool ascending,
  });
}

/// @nodoc
class __$ExplorerQueryCopyWithImpl<$Res>
    implements _$ExplorerQueryCopyWith<$Res> {
  __$ExplorerQueryCopyWithImpl(this._self, this._then);

  final _ExplorerQuery _self;
  final $Res Function(_ExplorerQuery) _then;

  /// Create a copy of ExplorerQuery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? entity = null,
    Object? viewId = null,
    Object? filters = null,
    Object? search = null,
    Object? sortKey = null,
    Object? ascending = null,
  }) {
    return _then(
      _ExplorerQuery(
        entity: null == entity
            ? _self.entity
            : entity // ignore: cast_nullable_to_non_nullable
                  as ExplorerEntity,
        viewId: null == viewId
            ? _self.viewId
            : viewId // ignore: cast_nullable_to_non_nullable
                  as String,
        filters: null == filters
            ? _self._filters
            : filters // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>,
        search: null == search
            ? _self.search
            : search // ignore: cast_nullable_to_non_nullable
                  as String,
        sortKey: null == sortKey
            ? _self.sortKey
            : sortKey // ignore: cast_nullable_to_non_nullable
                  as String,
        ascending: null == ascending
            ? _self.ascending
            : ascending // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}
