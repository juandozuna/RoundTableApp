// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_explorer_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SavedExplorerView {
  String get id;
  String get name;
  Map<String, String> get filters;
  String get search;
  String get sortKey;
  bool get ascending;

  /// Create a copy of SavedExplorerView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SavedExplorerViewCopyWith<SavedExplorerView> get copyWith =>
      _$SavedExplorerViewCopyWithImpl<SavedExplorerView>(
        this as SavedExplorerView,
        _$identity,
      );

  /// Serializes this SavedExplorerView to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SavedExplorerView &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.filters, filters) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.sortKey, sortKey) || other.sortKey == sortKey) &&
            (identical(other.ascending, ascending) ||
                other.ascending == ascending));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    const DeepCollectionEquality().hash(filters),
    search,
    sortKey,
    ascending,
  );

  @override
  String toString() {
    return 'SavedExplorerView(id: $id, name: $name, filters: $filters, search: $search, sortKey: $sortKey, ascending: $ascending)';
  }
}

/// @nodoc
abstract mixin class $SavedExplorerViewCopyWith<$Res> {
  factory $SavedExplorerViewCopyWith(
    SavedExplorerView value,
    $Res Function(SavedExplorerView) _then,
  ) = _$SavedExplorerViewCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String name,
    Map<String, String> filters,
    String search,
    String sortKey,
    bool ascending,
  });
}

/// @nodoc
class _$SavedExplorerViewCopyWithImpl<$Res>
    implements $SavedExplorerViewCopyWith<$Res> {
  _$SavedExplorerViewCopyWithImpl(this._self, this._then);

  final SavedExplorerView _self;
  final $Res Function(SavedExplorerView) _then;

  /// Create a copy of SavedExplorerView
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? filters = null,
    Object? search = null,
    Object? sortKey = null,
    Object? ascending = null,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
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

/// Adds pattern-matching-related methods to [SavedExplorerView].
extension SavedExplorerViewPatterns on SavedExplorerView {
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
    TResult Function(_SavedExplorerView value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SavedExplorerView() when $default != null:
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
    TResult Function(_SavedExplorerView value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SavedExplorerView():
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
    TResult? Function(_SavedExplorerView value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SavedExplorerView() when $default != null:
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
      String name,
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
      case _SavedExplorerView() when $default != null:
        return $default(
          _that.id,
          _that.name,
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
      String id,
      String name,
      Map<String, String> filters,
      String search,
      String sortKey,
      bool ascending,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SavedExplorerView():
        return $default(
          _that.id,
          _that.name,
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
      String id,
      String name,
      Map<String, String> filters,
      String search,
      String sortKey,
      bool ascending,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SavedExplorerView() when $default != null:
        return $default(
          _that.id,
          _that.name,
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
@JsonSerializable()
class _SavedExplorerView implements SavedExplorerView {
  const _SavedExplorerView({
    required this.id,
    required this.name,
    final Map<String, String> filters = const {},
    this.search = '',
    this.sortKey = 'code',
    this.ascending = true,
  }) : _filters = filters;
  factory _SavedExplorerView.fromJson(Map<String, dynamic> json) =>
      _$SavedExplorerViewFromJson(json);

  @override
  final String id;
  @override
  final String name;
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

  /// Create a copy of SavedExplorerView
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SavedExplorerViewCopyWith<_SavedExplorerView> get copyWith =>
      __$SavedExplorerViewCopyWithImpl<_SavedExplorerView>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SavedExplorerViewToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SavedExplorerView &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._filters, _filters) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.sortKey, sortKey) || other.sortKey == sortKey) &&
            (identical(other.ascending, ascending) ||
                other.ascending == ascending));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    const DeepCollectionEquality().hash(_filters),
    search,
    sortKey,
    ascending,
  );

  @override
  String toString() {
    return 'SavedExplorerView(id: $id, name: $name, filters: $filters, search: $search, sortKey: $sortKey, ascending: $ascending)';
  }
}

/// @nodoc
abstract mixin class _$SavedExplorerViewCopyWith<$Res>
    implements $SavedExplorerViewCopyWith<$Res> {
  factory _$SavedExplorerViewCopyWith(
    _SavedExplorerView value,
    $Res Function(_SavedExplorerView) _then,
  ) = __$SavedExplorerViewCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    Map<String, String> filters,
    String search,
    String sortKey,
    bool ascending,
  });
}

/// @nodoc
class __$SavedExplorerViewCopyWithImpl<$Res>
    implements _$SavedExplorerViewCopyWith<$Res> {
  __$SavedExplorerViewCopyWithImpl(this._self, this._then);

  final _SavedExplorerView _self;
  final $Res Function(_SavedExplorerView) _then;

  /// Create a copy of SavedExplorerView
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? filters = null,
    Object? search = null,
    Object? sortKey = null,
    Object? ascending = null,
  }) {
    return _then(
      _SavedExplorerView(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
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
