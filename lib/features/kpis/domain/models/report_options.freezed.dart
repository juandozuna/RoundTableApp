// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReportOption {
  String get id;
  String get label;
  String? get parentId;

  /// Create a copy of ReportOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReportOptionCopyWith<ReportOption> get copyWith =>
      _$ReportOptionCopyWithImpl<ReportOption>(
        this as ReportOption,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReportOption &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, label, parentId);

  @override
  String toString() {
    return 'ReportOption(id: $id, label: $label, parentId: $parentId)';
  }
}

/// @nodoc
abstract mixin class $ReportOptionCopyWith<$Res> {
  factory $ReportOptionCopyWith(
    ReportOption value,
    $Res Function(ReportOption) _then,
  ) = _$ReportOptionCopyWithImpl;
  @useResult
  $Res call({String id, String label, String? parentId});
}

/// @nodoc
class _$ReportOptionCopyWithImpl<$Res> implements $ReportOptionCopyWith<$Res> {
  _$ReportOptionCopyWithImpl(this._self, this._then);

  final ReportOption _self;
  final $Res Function(ReportOption) _then;

  /// Create a copy of ReportOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? parentId = freezed,
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
        parentId: freezed == parentId
            ? _self.parentId
            : parentId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [ReportOption].
extension ReportOptionPatterns on ReportOption {
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
    TResult Function(_ReportOption value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReportOption() when $default != null:
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
    TResult Function(_ReportOption value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportOption():
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
    TResult? Function(_ReportOption value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportOption() when $default != null:
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
    TResult Function(String id, String label, String? parentId)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReportOption() when $default != null:
        return $default(_that.id, _that.label, _that.parentId);
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
    TResult Function(String id, String label, String? parentId) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportOption():
        return $default(_that.id, _that.label, _that.parentId);
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
    TResult? Function(String id, String label, String? parentId)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportOption() when $default != null:
        return $default(_that.id, _that.label, _that.parentId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ReportOption implements ReportOption {
  const _ReportOption({required this.id, required this.label, this.parentId});

  @override
  final String id;
  @override
  final String label;
  @override
  final String? parentId;

  /// Create a copy of ReportOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReportOptionCopyWith<_ReportOption> get copyWith =>
      __$ReportOptionCopyWithImpl<_ReportOption>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReportOption &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, label, parentId);

  @override
  String toString() {
    return 'ReportOption(id: $id, label: $label, parentId: $parentId)';
  }
}

/// @nodoc
abstract mixin class _$ReportOptionCopyWith<$Res>
    implements $ReportOptionCopyWith<$Res> {
  factory _$ReportOptionCopyWith(
    _ReportOption value,
    $Res Function(_ReportOption) _then,
  ) = __$ReportOptionCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String label, String? parentId});
}

/// @nodoc
class __$ReportOptionCopyWithImpl<$Res>
    implements _$ReportOptionCopyWith<$Res> {
  __$ReportOptionCopyWithImpl(this._self, this._then);

  final _ReportOption _self;
  final $Res Function(_ReportOption) _then;

  /// Create a copy of ReportOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? parentId = freezed,
  }) {
    return _then(
      _ReportOption(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        label: null == label
            ? _self.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        parentId: freezed == parentId
            ? _self.parentId
            : parentId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
mixin _$ReportOptions {
  List<ReportOption> get countries;
  List<ReportOption> get organizations;
  List<ReportOption> get locations;
  List<ReportOption> get tables;
  List<ReportOption> get facilitators;
  List<ReportOption> get modules;

  /// Create a copy of ReportOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReportOptionsCopyWith<ReportOptions> get copyWith =>
      _$ReportOptionsCopyWithImpl<ReportOptions>(
        this as ReportOptions,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReportOptions &&
            const DeepCollectionEquality().equals(other.countries, countries) &&
            const DeepCollectionEquality().equals(
              other.organizations,
              organizations,
            ) &&
            const DeepCollectionEquality().equals(other.locations, locations) &&
            const DeepCollectionEquality().equals(other.tables, tables) &&
            const DeepCollectionEquality().equals(
              other.facilitators,
              facilitators,
            ) &&
            const DeepCollectionEquality().equals(other.modules, modules));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(countries),
    const DeepCollectionEquality().hash(organizations),
    const DeepCollectionEquality().hash(locations),
    const DeepCollectionEquality().hash(tables),
    const DeepCollectionEquality().hash(facilitators),
    const DeepCollectionEquality().hash(modules),
  );

  @override
  String toString() {
    return 'ReportOptions(countries: $countries, organizations: $organizations, locations: $locations, tables: $tables, facilitators: $facilitators, modules: $modules)';
  }
}

/// @nodoc
abstract mixin class $ReportOptionsCopyWith<$Res> {
  factory $ReportOptionsCopyWith(
    ReportOptions value,
    $Res Function(ReportOptions) _then,
  ) = _$ReportOptionsCopyWithImpl;
  @useResult
  $Res call({
    List<ReportOption> countries,
    List<ReportOption> organizations,
    List<ReportOption> locations,
    List<ReportOption> tables,
    List<ReportOption> facilitators,
    List<ReportOption> modules,
  });
}

/// @nodoc
class _$ReportOptionsCopyWithImpl<$Res>
    implements $ReportOptionsCopyWith<$Res> {
  _$ReportOptionsCopyWithImpl(this._self, this._then);

  final ReportOptions _self;
  final $Res Function(ReportOptions) _then;

  /// Create a copy of ReportOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countries = null,
    Object? organizations = null,
    Object? locations = null,
    Object? tables = null,
    Object? facilitators = null,
    Object? modules = null,
  }) {
    return _then(
      _self.copyWith(
        countries: null == countries
            ? _self.countries
            : countries // ignore: cast_nullable_to_non_nullable
                  as List<ReportOption>,
        organizations: null == organizations
            ? _self.organizations
            : organizations // ignore: cast_nullable_to_non_nullable
                  as List<ReportOption>,
        locations: null == locations
            ? _self.locations
            : locations // ignore: cast_nullable_to_non_nullable
                  as List<ReportOption>,
        tables: null == tables
            ? _self.tables
            : tables // ignore: cast_nullable_to_non_nullable
                  as List<ReportOption>,
        facilitators: null == facilitators
            ? _self.facilitators
            : facilitators // ignore: cast_nullable_to_non_nullable
                  as List<ReportOption>,
        modules: null == modules
            ? _self.modules
            : modules // ignore: cast_nullable_to_non_nullable
                  as List<ReportOption>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [ReportOptions].
extension ReportOptionsPatterns on ReportOptions {
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
    TResult Function(_ReportOptions value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReportOptions() when $default != null:
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
    TResult Function(_ReportOptions value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportOptions():
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
    TResult? Function(_ReportOptions value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportOptions() when $default != null:
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
      List<ReportOption> countries,
      List<ReportOption> organizations,
      List<ReportOption> locations,
      List<ReportOption> tables,
      List<ReportOption> facilitators,
      List<ReportOption> modules,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReportOptions() when $default != null:
        return $default(
          _that.countries,
          _that.organizations,
          _that.locations,
          _that.tables,
          _that.facilitators,
          _that.modules,
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
      List<ReportOption> countries,
      List<ReportOption> organizations,
      List<ReportOption> locations,
      List<ReportOption> tables,
      List<ReportOption> facilitators,
      List<ReportOption> modules,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportOptions():
        return $default(
          _that.countries,
          _that.organizations,
          _that.locations,
          _that.tables,
          _that.facilitators,
          _that.modules,
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
      List<ReportOption> countries,
      List<ReportOption> organizations,
      List<ReportOption> locations,
      List<ReportOption> tables,
      List<ReportOption> facilitators,
      List<ReportOption> modules,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportOptions() when $default != null:
        return $default(
          _that.countries,
          _that.organizations,
          _that.locations,
          _that.tables,
          _that.facilitators,
          _that.modules,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ReportOptions implements ReportOptions {
  const _ReportOptions({
    final List<ReportOption> countries = const [],
    final List<ReportOption> organizations = const [],
    final List<ReportOption> locations = const [],
    final List<ReportOption> tables = const [],
    final List<ReportOption> facilitators = const [],
    final List<ReportOption> modules = const [],
  }) : _countries = countries,
       _organizations = organizations,
       _locations = locations,
       _tables = tables,
       _facilitators = facilitators,
       _modules = modules;

  final List<ReportOption> _countries;
  @override
  @JsonKey()
  List<ReportOption> get countries {
    if (_countries is EqualUnmodifiableListView) return _countries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_countries);
  }

  final List<ReportOption> _organizations;
  @override
  @JsonKey()
  List<ReportOption> get organizations {
    if (_organizations is EqualUnmodifiableListView) return _organizations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_organizations);
  }

  final List<ReportOption> _locations;
  @override
  @JsonKey()
  List<ReportOption> get locations {
    if (_locations is EqualUnmodifiableListView) return _locations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_locations);
  }

  final List<ReportOption> _tables;
  @override
  @JsonKey()
  List<ReportOption> get tables {
    if (_tables is EqualUnmodifiableListView) return _tables;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tables);
  }

  final List<ReportOption> _facilitators;
  @override
  @JsonKey()
  List<ReportOption> get facilitators {
    if (_facilitators is EqualUnmodifiableListView) return _facilitators;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_facilitators);
  }

  final List<ReportOption> _modules;
  @override
  @JsonKey()
  List<ReportOption> get modules {
    if (_modules is EqualUnmodifiableListView) return _modules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_modules);
  }

  /// Create a copy of ReportOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReportOptionsCopyWith<_ReportOptions> get copyWith =>
      __$ReportOptionsCopyWithImpl<_ReportOptions>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReportOptions &&
            const DeepCollectionEquality().equals(
              other._countries,
              _countries,
            ) &&
            const DeepCollectionEquality().equals(
              other._organizations,
              _organizations,
            ) &&
            const DeepCollectionEquality().equals(
              other._locations,
              _locations,
            ) &&
            const DeepCollectionEquality().equals(other._tables, _tables) &&
            const DeepCollectionEquality().equals(
              other._facilitators,
              _facilitators,
            ) &&
            const DeepCollectionEquality().equals(other._modules, _modules));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_countries),
    const DeepCollectionEquality().hash(_organizations),
    const DeepCollectionEquality().hash(_locations),
    const DeepCollectionEquality().hash(_tables),
    const DeepCollectionEquality().hash(_facilitators),
    const DeepCollectionEquality().hash(_modules),
  );

  @override
  String toString() {
    return 'ReportOptions(countries: $countries, organizations: $organizations, locations: $locations, tables: $tables, facilitators: $facilitators, modules: $modules)';
  }
}

/// @nodoc
abstract mixin class _$ReportOptionsCopyWith<$Res>
    implements $ReportOptionsCopyWith<$Res> {
  factory _$ReportOptionsCopyWith(
    _ReportOptions value,
    $Res Function(_ReportOptions) _then,
  ) = __$ReportOptionsCopyWithImpl;
  @override
  @useResult
  $Res call({
    List<ReportOption> countries,
    List<ReportOption> organizations,
    List<ReportOption> locations,
    List<ReportOption> tables,
    List<ReportOption> facilitators,
    List<ReportOption> modules,
  });
}

/// @nodoc
class __$ReportOptionsCopyWithImpl<$Res>
    implements _$ReportOptionsCopyWith<$Res> {
  __$ReportOptionsCopyWithImpl(this._self, this._then);

  final _ReportOptions _self;
  final $Res Function(_ReportOptions) _then;

  /// Create a copy of ReportOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? countries = null,
    Object? organizations = null,
    Object? locations = null,
    Object? tables = null,
    Object? facilitators = null,
    Object? modules = null,
  }) {
    return _then(
      _ReportOptions(
        countries: null == countries
            ? _self._countries
            : countries // ignore: cast_nullable_to_non_nullable
                  as List<ReportOption>,
        organizations: null == organizations
            ? _self._organizations
            : organizations // ignore: cast_nullable_to_non_nullable
                  as List<ReportOption>,
        locations: null == locations
            ? _self._locations
            : locations // ignore: cast_nullable_to_non_nullable
                  as List<ReportOption>,
        tables: null == tables
            ? _self._tables
            : tables // ignore: cast_nullable_to_non_nullable
                  as List<ReportOption>,
        facilitators: null == facilitators
            ? _self._facilitators
            : facilitators // ignore: cast_nullable_to_non_nullable
                  as List<ReportOption>,
        modules: null == modules
            ? _self._modules
            : modules // ignore: cast_nullable_to_non_nullable
                  as List<ReportOption>,
      ),
    );
  }
}
