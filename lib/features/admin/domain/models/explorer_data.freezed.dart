// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'explorer_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExplorerData {
  List<ExplorerTable> get tables;
  List<ExplorerOrganization> get organizations;
  List<AdminPerson> get people;
  DateTime? get loadedAt;

  /// Create a copy of ExplorerData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExplorerDataCopyWith<ExplorerData> get copyWith =>
      _$ExplorerDataCopyWithImpl<ExplorerData>(
        this as ExplorerData,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExplorerData &&
            const DeepCollectionEquality().equals(other.tables, tables) &&
            const DeepCollectionEquality().equals(
              other.organizations,
              organizations,
            ) &&
            const DeepCollectionEquality().equals(other.people, people) &&
            (identical(other.loadedAt, loadedAt) ||
                other.loadedAt == loadedAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(tables),
    const DeepCollectionEquality().hash(organizations),
    const DeepCollectionEquality().hash(people),
    loadedAt,
  );

  @override
  String toString() {
    return 'ExplorerData(tables: $tables, organizations: $organizations, people: $people, loadedAt: $loadedAt)';
  }
}

/// @nodoc
abstract mixin class $ExplorerDataCopyWith<$Res> {
  factory $ExplorerDataCopyWith(
    ExplorerData value,
    $Res Function(ExplorerData) _then,
  ) = _$ExplorerDataCopyWithImpl;
  @useResult
  $Res call({
    List<ExplorerTable> tables,
    List<ExplorerOrganization> organizations,
    List<AdminPerson> people,
    DateTime? loadedAt,
  });
}

/// @nodoc
class _$ExplorerDataCopyWithImpl<$Res> implements $ExplorerDataCopyWith<$Res> {
  _$ExplorerDataCopyWithImpl(this._self, this._then);

  final ExplorerData _self;
  final $Res Function(ExplorerData) _then;

  /// Create a copy of ExplorerData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tables = null,
    Object? organizations = null,
    Object? people = null,
    Object? loadedAt = freezed,
  }) {
    return _then(
      _self.copyWith(
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
        loadedAt: freezed == loadedAt
            ? _self.loadedAt
            : loadedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [ExplorerData].
extension ExplorerDataPatterns on ExplorerData {
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
    TResult Function(_ExplorerData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExplorerData() when $default != null:
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
    TResult Function(_ExplorerData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExplorerData():
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
    TResult? Function(_ExplorerData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExplorerData() when $default != null:
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
      List<ExplorerTable> tables,
      List<ExplorerOrganization> organizations,
      List<AdminPerson> people,
      DateTime? loadedAt,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExplorerData() when $default != null:
        return $default(
          _that.tables,
          _that.organizations,
          _that.people,
          _that.loadedAt,
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
      List<ExplorerTable> tables,
      List<ExplorerOrganization> organizations,
      List<AdminPerson> people,
      DateTime? loadedAt,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExplorerData():
        return $default(
          _that.tables,
          _that.organizations,
          _that.people,
          _that.loadedAt,
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
      List<ExplorerTable> tables,
      List<ExplorerOrganization> organizations,
      List<AdminPerson> people,
      DateTime? loadedAt,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExplorerData() when $default != null:
        return $default(
          _that.tables,
          _that.organizations,
          _that.people,
          _that.loadedAt,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ExplorerData implements ExplorerData {
  const _ExplorerData({
    final List<ExplorerTable> tables = const [],
    final List<ExplorerOrganization> organizations = const [],
    final List<AdminPerson> people = const [],
    this.loadedAt,
  }) : _tables = tables,
       _organizations = organizations,
       _people = people;

  final List<ExplorerTable> _tables;
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

  @override
  final DateTime? loadedAt;

  /// Create a copy of ExplorerData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ExplorerDataCopyWith<_ExplorerData> get copyWith =>
      __$ExplorerDataCopyWithImpl<_ExplorerData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExplorerData &&
            const DeepCollectionEquality().equals(other._tables, _tables) &&
            const DeepCollectionEquality().equals(
              other._organizations,
              _organizations,
            ) &&
            const DeepCollectionEquality().equals(other._people, _people) &&
            (identical(other.loadedAt, loadedAt) ||
                other.loadedAt == loadedAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_tables),
    const DeepCollectionEquality().hash(_organizations),
    const DeepCollectionEquality().hash(_people),
    loadedAt,
  );

  @override
  String toString() {
    return 'ExplorerData(tables: $tables, organizations: $organizations, people: $people, loadedAt: $loadedAt)';
  }
}

/// @nodoc
abstract mixin class _$ExplorerDataCopyWith<$Res>
    implements $ExplorerDataCopyWith<$Res> {
  factory _$ExplorerDataCopyWith(
    _ExplorerData value,
    $Res Function(_ExplorerData) _then,
  ) = __$ExplorerDataCopyWithImpl;
  @override
  @useResult
  $Res call({
    List<ExplorerTable> tables,
    List<ExplorerOrganization> organizations,
    List<AdminPerson> people,
    DateTime? loadedAt,
  });
}

/// @nodoc
class __$ExplorerDataCopyWithImpl<$Res>
    implements _$ExplorerDataCopyWith<$Res> {
  __$ExplorerDataCopyWithImpl(this._self, this._then);

  final _ExplorerData _self;
  final $Res Function(_ExplorerData) _then;

  /// Create a copy of ExplorerData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tables = null,
    Object? organizations = null,
    Object? people = null,
    Object? loadedAt = freezed,
  }) {
    return _then(
      _ExplorerData(
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
        loadedAt: freezed == loadedAt
            ? _self.loadedAt
            : loadedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}
