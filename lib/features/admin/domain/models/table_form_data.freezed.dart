// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_form_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TableFormData {
  AdminTable? get table;
  List<AdminOrganization> get organizations;
  List<AdminLocation> get locations;
  List<AdminPerson> get people;
  List<AdminTable> get organizationTables;
  List<ProgramValue> get programValues;

  /// Create a copy of TableFormData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TableFormDataCopyWith<TableFormData> get copyWith =>
      _$TableFormDataCopyWithImpl<TableFormData>(
        this as TableFormData,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TableFormData &&
            (identical(other.table, table) || other.table == table) &&
            const DeepCollectionEquality().equals(
              other.organizations,
              organizations,
            ) &&
            const DeepCollectionEquality().equals(other.locations, locations) &&
            const DeepCollectionEquality().equals(other.people, people) &&
            const DeepCollectionEquality().equals(
              other.organizationTables,
              organizationTables,
            ) &&
            const DeepCollectionEquality().equals(
              other.programValues,
              programValues,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    table,
    const DeepCollectionEquality().hash(organizations),
    const DeepCollectionEquality().hash(locations),
    const DeepCollectionEquality().hash(people),
    const DeepCollectionEquality().hash(organizationTables),
    const DeepCollectionEquality().hash(programValues),
  );

  @override
  String toString() {
    return 'TableFormData(table: $table, organizations: $organizations, locations: $locations, people: $people, organizationTables: $organizationTables, programValues: $programValues)';
  }
}

/// @nodoc
abstract mixin class $TableFormDataCopyWith<$Res> {
  factory $TableFormDataCopyWith(
    TableFormData value,
    $Res Function(TableFormData) _then,
  ) = _$TableFormDataCopyWithImpl;
  @useResult
  $Res call({
    AdminTable? table,
    List<AdminOrganization> organizations,
    List<AdminLocation> locations,
    List<AdminPerson> people,
    List<AdminTable> organizationTables,
    List<ProgramValue> programValues,
  });

  $AdminTableCopyWith<$Res>? get table;
}

/// @nodoc
class _$TableFormDataCopyWithImpl<$Res>
    implements $TableFormDataCopyWith<$Res> {
  _$TableFormDataCopyWithImpl(this._self, this._then);

  final TableFormData _self;
  final $Res Function(TableFormData) _then;

  /// Create a copy of TableFormData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? table = freezed,
    Object? organizations = null,
    Object? locations = null,
    Object? people = null,
    Object? organizationTables = null,
    Object? programValues = null,
  }) {
    return _then(
      _self.copyWith(
        table: freezed == table
            ? _self.table
            : table // ignore: cast_nullable_to_non_nullable
                  as AdminTable?,
        organizations: null == organizations
            ? _self.organizations
            : organizations // ignore: cast_nullable_to_non_nullable
                  as List<AdminOrganization>,
        locations: null == locations
            ? _self.locations
            : locations // ignore: cast_nullable_to_non_nullable
                  as List<AdminLocation>,
        people: null == people
            ? _self.people
            : people // ignore: cast_nullable_to_non_nullable
                  as List<AdminPerson>,
        organizationTables: null == organizationTables
            ? _self.organizationTables
            : organizationTables // ignore: cast_nullable_to_non_nullable
                  as List<AdminTable>,
        programValues: null == programValues
            ? _self.programValues
            : programValues // ignore: cast_nullable_to_non_nullable
                  as List<ProgramValue>,
      ),
    );
  }

  /// Create a copy of TableFormData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AdminTableCopyWith<$Res>? get table {
    if (_self.table == null) {
      return null;
    }

    return $AdminTableCopyWith<$Res>(_self.table!, (value) {
      return _then(_self.copyWith(table: value));
    });
  }
}

/// Adds pattern-matching-related methods to [TableFormData].
extension TableFormDataPatterns on TableFormData {
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
    TResult Function(_TableFormData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TableFormData() when $default != null:
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
    TResult Function(_TableFormData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableFormData():
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
    TResult? Function(_TableFormData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableFormData() when $default != null:
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
      AdminTable? table,
      List<AdminOrganization> organizations,
      List<AdminLocation> locations,
      List<AdminPerson> people,
      List<AdminTable> organizationTables,
      List<ProgramValue> programValues,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TableFormData() when $default != null:
        return $default(
          _that.table,
          _that.organizations,
          _that.locations,
          _that.people,
          _that.organizationTables,
          _that.programValues,
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
      AdminTable? table,
      List<AdminOrganization> organizations,
      List<AdminLocation> locations,
      List<AdminPerson> people,
      List<AdminTable> organizationTables,
      List<ProgramValue> programValues,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableFormData():
        return $default(
          _that.table,
          _that.organizations,
          _that.locations,
          _that.people,
          _that.organizationTables,
          _that.programValues,
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
      AdminTable? table,
      List<AdminOrganization> organizations,
      List<AdminLocation> locations,
      List<AdminPerson> people,
      List<AdminTable> organizationTables,
      List<ProgramValue> programValues,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableFormData() when $default != null:
        return $default(
          _that.table,
          _that.organizations,
          _that.locations,
          _that.people,
          _that.organizationTables,
          _that.programValues,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TableFormData implements TableFormData {
  const _TableFormData({
    this.table,
    final List<AdminOrganization> organizations = const [],
    final List<AdminLocation> locations = const [],
    final List<AdminPerson> people = const [],
    final List<AdminTable> organizationTables = const [],
    final List<ProgramValue> programValues = const [],
  }) : _organizations = organizations,
       _locations = locations,
       _people = people,
       _organizationTables = organizationTables,
       _programValues = programValues;

  @override
  final AdminTable? table;
  final List<AdminOrganization> _organizations;
  @override
  @JsonKey()
  List<AdminOrganization> get organizations {
    if (_organizations is EqualUnmodifiableListView) return _organizations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_organizations);
  }

  final List<AdminLocation> _locations;
  @override
  @JsonKey()
  List<AdminLocation> get locations {
    if (_locations is EqualUnmodifiableListView) return _locations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_locations);
  }

  final List<AdminPerson> _people;
  @override
  @JsonKey()
  List<AdminPerson> get people {
    if (_people is EqualUnmodifiableListView) return _people;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_people);
  }

  final List<AdminTable> _organizationTables;
  @override
  @JsonKey()
  List<AdminTable> get organizationTables {
    if (_organizationTables is EqualUnmodifiableListView)
      return _organizationTables;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_organizationTables);
  }

  final List<ProgramValue> _programValues;
  @override
  @JsonKey()
  List<ProgramValue> get programValues {
    if (_programValues is EqualUnmodifiableListView) return _programValues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_programValues);
  }

  /// Create a copy of TableFormData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TableFormDataCopyWith<_TableFormData> get copyWith =>
      __$TableFormDataCopyWithImpl<_TableFormData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TableFormData &&
            (identical(other.table, table) || other.table == table) &&
            const DeepCollectionEquality().equals(
              other._organizations,
              _organizations,
            ) &&
            const DeepCollectionEquality().equals(
              other._locations,
              _locations,
            ) &&
            const DeepCollectionEquality().equals(other._people, _people) &&
            const DeepCollectionEquality().equals(
              other._organizationTables,
              _organizationTables,
            ) &&
            const DeepCollectionEquality().equals(
              other._programValues,
              _programValues,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    table,
    const DeepCollectionEquality().hash(_organizations),
    const DeepCollectionEquality().hash(_locations),
    const DeepCollectionEquality().hash(_people),
    const DeepCollectionEquality().hash(_organizationTables),
    const DeepCollectionEquality().hash(_programValues),
  );

  @override
  String toString() {
    return 'TableFormData(table: $table, organizations: $organizations, locations: $locations, people: $people, organizationTables: $organizationTables, programValues: $programValues)';
  }
}

/// @nodoc
abstract mixin class _$TableFormDataCopyWith<$Res>
    implements $TableFormDataCopyWith<$Res> {
  factory _$TableFormDataCopyWith(
    _TableFormData value,
    $Res Function(_TableFormData) _then,
  ) = __$TableFormDataCopyWithImpl;
  @override
  @useResult
  $Res call({
    AdminTable? table,
    List<AdminOrganization> organizations,
    List<AdminLocation> locations,
    List<AdminPerson> people,
    List<AdminTable> organizationTables,
    List<ProgramValue> programValues,
  });

  @override
  $AdminTableCopyWith<$Res>? get table;
}

/// @nodoc
class __$TableFormDataCopyWithImpl<$Res>
    implements _$TableFormDataCopyWith<$Res> {
  __$TableFormDataCopyWithImpl(this._self, this._then);

  final _TableFormData _self;
  final $Res Function(_TableFormData) _then;

  /// Create a copy of TableFormData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? table = freezed,
    Object? organizations = null,
    Object? locations = null,
    Object? people = null,
    Object? organizationTables = null,
    Object? programValues = null,
  }) {
    return _then(
      _TableFormData(
        table: freezed == table
            ? _self.table
            : table // ignore: cast_nullable_to_non_nullable
                  as AdminTable?,
        organizations: null == organizations
            ? _self._organizations
            : organizations // ignore: cast_nullable_to_non_nullable
                  as List<AdminOrganization>,
        locations: null == locations
            ? _self._locations
            : locations // ignore: cast_nullable_to_non_nullable
                  as List<AdminLocation>,
        people: null == people
            ? _self._people
            : people // ignore: cast_nullable_to_non_nullable
                  as List<AdminPerson>,
        organizationTables: null == organizationTables
            ? _self._organizationTables
            : organizationTables // ignore: cast_nullable_to_non_nullable
                  as List<AdminTable>,
        programValues: null == programValues
            ? _self._programValues
            : programValues // ignore: cast_nullable_to_non_nullable
                  as List<ProgramValue>,
      ),
    );
  }

  /// Create a copy of TableFormData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AdminTableCopyWith<$Res>? get table {
    if (_self.table == null) {
      return null;
    }

    return $AdminTableCopyWith<$Res>(_self.table!, (value) {
      return _then(_self.copyWith(table: value));
    });
  }
}
