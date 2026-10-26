// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'command_palette_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommandPaletteState {
  bool get loading;
  List<AdminOrganization> get organizations;
  List<AdminTable> get tables;
  List<SavedExplorerView> get savedViews;

  /// Create a copy of CommandPaletteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommandPaletteStateCopyWith<CommandPaletteState> get copyWith =>
      _$CommandPaletteStateCopyWithImpl<CommandPaletteState>(
        this as CommandPaletteState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommandPaletteState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(
              other.organizations,
              organizations,
            ) &&
            const DeepCollectionEquality().equals(other.tables, tables) &&
            const DeepCollectionEquality().equals(
              other.savedViews,
              savedViews,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    loading,
    const DeepCollectionEquality().hash(organizations),
    const DeepCollectionEquality().hash(tables),
    const DeepCollectionEquality().hash(savedViews),
  );

  @override
  String toString() {
    return 'CommandPaletteState(loading: $loading, organizations: $organizations, tables: $tables, savedViews: $savedViews)';
  }
}

/// @nodoc
abstract mixin class $CommandPaletteStateCopyWith<$Res> {
  factory $CommandPaletteStateCopyWith(
    CommandPaletteState value,
    $Res Function(CommandPaletteState) _then,
  ) = _$CommandPaletteStateCopyWithImpl;
  @useResult
  $Res call({
    bool loading,
    List<AdminOrganization> organizations,
    List<AdminTable> tables,
    List<SavedExplorerView> savedViews,
  });
}

/// @nodoc
class _$CommandPaletteStateCopyWithImpl<$Res>
    implements $CommandPaletteStateCopyWith<$Res> {
  _$CommandPaletteStateCopyWithImpl(this._self, this._then);

  final CommandPaletteState _self;
  final $Res Function(CommandPaletteState) _then;

  /// Create a copy of CommandPaletteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? organizations = null,
    Object? tables = null,
    Object? savedViews = null,
  }) {
    return _then(
      _self.copyWith(
        loading: null == loading
            ? _self.loading
            : loading // ignore: cast_nullable_to_non_nullable
                  as bool,
        organizations: null == organizations
            ? _self.organizations
            : organizations // ignore: cast_nullable_to_non_nullable
                  as List<AdminOrganization>,
        tables: null == tables
            ? _self.tables
            : tables // ignore: cast_nullable_to_non_nullable
                  as List<AdminTable>,
        savedViews: null == savedViews
            ? _self.savedViews
            : savedViews // ignore: cast_nullable_to_non_nullable
                  as List<SavedExplorerView>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [CommandPaletteState].
extension CommandPaletteStatePatterns on CommandPaletteState {
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
    TResult Function(_CommandPaletteState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CommandPaletteState() when $default != null:
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
    TResult Function(_CommandPaletteState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CommandPaletteState():
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
    TResult? Function(_CommandPaletteState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CommandPaletteState() when $default != null:
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
      bool loading,
      List<AdminOrganization> organizations,
      List<AdminTable> tables,
      List<SavedExplorerView> savedViews,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CommandPaletteState() when $default != null:
        return $default(
          _that.loading,
          _that.organizations,
          _that.tables,
          _that.savedViews,
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
      bool loading,
      List<AdminOrganization> organizations,
      List<AdminTable> tables,
      List<SavedExplorerView> savedViews,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CommandPaletteState():
        return $default(
          _that.loading,
          _that.organizations,
          _that.tables,
          _that.savedViews,
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
      bool loading,
      List<AdminOrganization> organizations,
      List<AdminTable> tables,
      List<SavedExplorerView> savedViews,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CommandPaletteState() when $default != null:
        return $default(
          _that.loading,
          _that.organizations,
          _that.tables,
          _that.savedViews,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CommandPaletteState implements CommandPaletteState {
  const _CommandPaletteState({
    this.loading = true,
    final List<AdminOrganization> organizations = const [],
    final List<AdminTable> tables = const [],
    final List<SavedExplorerView> savedViews = const [],
  }) : _organizations = organizations,
       _tables = tables,
       _savedViews = savedViews;

  @override
  @JsonKey()
  final bool loading;
  final List<AdminOrganization> _organizations;
  @override
  @JsonKey()
  List<AdminOrganization> get organizations {
    if (_organizations is EqualUnmodifiableListView) return _organizations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_organizations);
  }

  final List<AdminTable> _tables;
  @override
  @JsonKey()
  List<AdminTable> get tables {
    if (_tables is EqualUnmodifiableListView) return _tables;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tables);
  }

  final List<SavedExplorerView> _savedViews;
  @override
  @JsonKey()
  List<SavedExplorerView> get savedViews {
    if (_savedViews is EqualUnmodifiableListView) return _savedViews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_savedViews);
  }

  /// Create a copy of CommandPaletteState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CommandPaletteStateCopyWith<_CommandPaletteState> get copyWith =>
      __$CommandPaletteStateCopyWithImpl<_CommandPaletteState>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CommandPaletteState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(
              other._organizations,
              _organizations,
            ) &&
            const DeepCollectionEquality().equals(other._tables, _tables) &&
            const DeepCollectionEquality().equals(
              other._savedViews,
              _savedViews,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    loading,
    const DeepCollectionEquality().hash(_organizations),
    const DeepCollectionEquality().hash(_tables),
    const DeepCollectionEquality().hash(_savedViews),
  );

  @override
  String toString() {
    return 'CommandPaletteState(loading: $loading, organizations: $organizations, tables: $tables, savedViews: $savedViews)';
  }
}

/// @nodoc
abstract mixin class _$CommandPaletteStateCopyWith<$Res>
    implements $CommandPaletteStateCopyWith<$Res> {
  factory _$CommandPaletteStateCopyWith(
    _CommandPaletteState value,
    $Res Function(_CommandPaletteState) _then,
  ) = __$CommandPaletteStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    bool loading,
    List<AdminOrganization> organizations,
    List<AdminTable> tables,
    List<SavedExplorerView> savedViews,
  });
}

/// @nodoc
class __$CommandPaletteStateCopyWithImpl<$Res>
    implements _$CommandPaletteStateCopyWith<$Res> {
  __$CommandPaletteStateCopyWithImpl(this._self, this._then);

  final _CommandPaletteState _self;
  final $Res Function(_CommandPaletteState) _then;

  /// Create a copy of CommandPaletteState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? loading = null,
    Object? organizations = null,
    Object? tables = null,
    Object? savedViews = null,
  }) {
    return _then(
      _CommandPaletteState(
        loading: null == loading
            ? _self.loading
            : loading // ignore: cast_nullable_to_non_nullable
                  as bool,
        organizations: null == organizations
            ? _self._organizations
            : organizations // ignore: cast_nullable_to_non_nullable
                  as List<AdminOrganization>,
        tables: null == tables
            ? _self._tables
            : tables // ignore: cast_nullable_to_non_nullable
                  as List<AdminTable>,
        savedViews: null == savedViews
            ? _self._savedViews
            : savedViews // ignore: cast_nullable_to_non_nullable
                  as List<SavedExplorerView>,
      ),
    );
  }
}
