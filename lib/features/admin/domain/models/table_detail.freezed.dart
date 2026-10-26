// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TableDetail {
  AdminTable get table;
  List<TableMembership> get memberships;
  List<AdminTable> get organizationTables;
  List<AdminPerson> get organizationPeople;
  KpiTableRow? get kpi;

  /// Create a copy of TableDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TableDetailCopyWith<TableDetail> get copyWith =>
      _$TableDetailCopyWithImpl<TableDetail>(this as TableDetail, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TableDetail &&
            (identical(other.table, table) || other.table == table) &&
            const DeepCollectionEquality().equals(
              other.memberships,
              memberships,
            ) &&
            const DeepCollectionEquality().equals(
              other.organizationTables,
              organizationTables,
            ) &&
            const DeepCollectionEquality().equals(
              other.organizationPeople,
              organizationPeople,
            ) &&
            (identical(other.kpi, kpi) || other.kpi == kpi));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    table,
    const DeepCollectionEquality().hash(memberships),
    const DeepCollectionEquality().hash(organizationTables),
    const DeepCollectionEquality().hash(organizationPeople),
    kpi,
  );

  @override
  String toString() {
    return 'TableDetail(table: $table, memberships: $memberships, organizationTables: $organizationTables, organizationPeople: $organizationPeople, kpi: $kpi)';
  }
}

/// @nodoc
abstract mixin class $TableDetailCopyWith<$Res> {
  factory $TableDetailCopyWith(
    TableDetail value,
    $Res Function(TableDetail) _then,
  ) = _$TableDetailCopyWithImpl;
  @useResult
  $Res call({
    AdminTable table,
    List<TableMembership> memberships,
    List<AdminTable> organizationTables,
    List<AdminPerson> organizationPeople,
    KpiTableRow? kpi,
  });

  $AdminTableCopyWith<$Res> get table;
  $KpiTableRowCopyWith<$Res>? get kpi;
}

/// @nodoc
class _$TableDetailCopyWithImpl<$Res> implements $TableDetailCopyWith<$Res> {
  _$TableDetailCopyWithImpl(this._self, this._then);

  final TableDetail _self;
  final $Res Function(TableDetail) _then;

  /// Create a copy of TableDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? table = null,
    Object? memberships = null,
    Object? organizationTables = null,
    Object? organizationPeople = null,
    Object? kpi = freezed,
  }) {
    return _then(
      _self.copyWith(
        table: null == table
            ? _self.table
            : table // ignore: cast_nullable_to_non_nullable
                  as AdminTable,
        memberships: null == memberships
            ? _self.memberships
            : memberships // ignore: cast_nullable_to_non_nullable
                  as List<TableMembership>,
        organizationTables: null == organizationTables
            ? _self.organizationTables
            : organizationTables // ignore: cast_nullable_to_non_nullable
                  as List<AdminTable>,
        organizationPeople: null == organizationPeople
            ? _self.organizationPeople
            : organizationPeople // ignore: cast_nullable_to_non_nullable
                  as List<AdminPerson>,
        kpi: freezed == kpi
            ? _self.kpi
            : kpi // ignore: cast_nullable_to_non_nullable
                  as KpiTableRow?,
      ),
    );
  }

  /// Create a copy of TableDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AdminTableCopyWith<$Res> get table {
    return $AdminTableCopyWith<$Res>(_self.table, (value) {
      return _then(_self.copyWith(table: value));
    });
  }

  /// Create a copy of TableDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KpiTableRowCopyWith<$Res>? get kpi {
    if (_self.kpi == null) {
      return null;
    }

    return $KpiTableRowCopyWith<$Res>(_self.kpi!, (value) {
      return _then(_self.copyWith(kpi: value));
    });
  }
}

/// Adds pattern-matching-related methods to [TableDetail].
extension TableDetailPatterns on TableDetail {
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
    TResult Function(_TableDetail value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TableDetail() when $default != null:
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
    TResult Function(_TableDetail value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableDetail():
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
    TResult? Function(_TableDetail value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableDetail() when $default != null:
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
      AdminTable table,
      List<TableMembership> memberships,
      List<AdminTable> organizationTables,
      List<AdminPerson> organizationPeople,
      KpiTableRow? kpi,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TableDetail() when $default != null:
        return $default(
          _that.table,
          _that.memberships,
          _that.organizationTables,
          _that.organizationPeople,
          _that.kpi,
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
      AdminTable table,
      List<TableMembership> memberships,
      List<AdminTable> organizationTables,
      List<AdminPerson> organizationPeople,
      KpiTableRow? kpi,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableDetail():
        return $default(
          _that.table,
          _that.memberships,
          _that.organizationTables,
          _that.organizationPeople,
          _that.kpi,
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
      AdminTable table,
      List<TableMembership> memberships,
      List<AdminTable> organizationTables,
      List<AdminPerson> organizationPeople,
      KpiTableRow? kpi,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableDetail() when $default != null:
        return $default(
          _that.table,
          _that.memberships,
          _that.organizationTables,
          _that.organizationPeople,
          _that.kpi,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TableDetail extends TableDetail {
  const _TableDetail({
    required this.table,
    final List<TableMembership> memberships = const [],
    final List<AdminTable> organizationTables = const [],
    final List<AdminPerson> organizationPeople = const [],
    this.kpi,
  }) : _memberships = memberships,
       _organizationTables = organizationTables,
       _organizationPeople = organizationPeople,
       super._();

  @override
  final AdminTable table;
  final List<TableMembership> _memberships;
  @override
  @JsonKey()
  List<TableMembership> get memberships {
    if (_memberships is EqualUnmodifiableListView) return _memberships;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_memberships);
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

  final List<AdminPerson> _organizationPeople;
  @override
  @JsonKey()
  List<AdminPerson> get organizationPeople {
    if (_organizationPeople is EqualUnmodifiableListView)
      return _organizationPeople;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_organizationPeople);
  }

  @override
  final KpiTableRow? kpi;

  /// Create a copy of TableDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TableDetailCopyWith<_TableDetail> get copyWith =>
      __$TableDetailCopyWithImpl<_TableDetail>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TableDetail &&
            (identical(other.table, table) || other.table == table) &&
            const DeepCollectionEquality().equals(
              other._memberships,
              _memberships,
            ) &&
            const DeepCollectionEquality().equals(
              other._organizationTables,
              _organizationTables,
            ) &&
            const DeepCollectionEquality().equals(
              other._organizationPeople,
              _organizationPeople,
            ) &&
            (identical(other.kpi, kpi) || other.kpi == kpi));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    table,
    const DeepCollectionEquality().hash(_memberships),
    const DeepCollectionEquality().hash(_organizationTables),
    const DeepCollectionEquality().hash(_organizationPeople),
    kpi,
  );

  @override
  String toString() {
    return 'TableDetail(table: $table, memberships: $memberships, organizationTables: $organizationTables, organizationPeople: $organizationPeople, kpi: $kpi)';
  }
}

/// @nodoc
abstract mixin class _$TableDetailCopyWith<$Res>
    implements $TableDetailCopyWith<$Res> {
  factory _$TableDetailCopyWith(
    _TableDetail value,
    $Res Function(_TableDetail) _then,
  ) = __$TableDetailCopyWithImpl;
  @override
  @useResult
  $Res call({
    AdminTable table,
    List<TableMembership> memberships,
    List<AdminTable> organizationTables,
    List<AdminPerson> organizationPeople,
    KpiTableRow? kpi,
  });

  @override
  $AdminTableCopyWith<$Res> get table;
  @override
  $KpiTableRowCopyWith<$Res>? get kpi;
}

/// @nodoc
class __$TableDetailCopyWithImpl<$Res> implements _$TableDetailCopyWith<$Res> {
  __$TableDetailCopyWithImpl(this._self, this._then);

  final _TableDetail _self;
  final $Res Function(_TableDetail) _then;

  /// Create a copy of TableDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? table = null,
    Object? memberships = null,
    Object? organizationTables = null,
    Object? organizationPeople = null,
    Object? kpi = freezed,
  }) {
    return _then(
      _TableDetail(
        table: null == table
            ? _self.table
            : table // ignore: cast_nullable_to_non_nullable
                  as AdminTable,
        memberships: null == memberships
            ? _self._memberships
            : memberships // ignore: cast_nullable_to_non_nullable
                  as List<TableMembership>,
        organizationTables: null == organizationTables
            ? _self._organizationTables
            : organizationTables // ignore: cast_nullable_to_non_nullable
                  as List<AdminTable>,
        organizationPeople: null == organizationPeople
            ? _self._organizationPeople
            : organizationPeople // ignore: cast_nullable_to_non_nullable
                  as List<AdminPerson>,
        kpi: freezed == kpi
            ? _self.kpi
            : kpi // ignore: cast_nullable_to_non_nullable
                  as KpiTableRow?,
      ),
    );
  }

  /// Create a copy of TableDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AdminTableCopyWith<$Res> get table {
    return $AdminTableCopyWith<$Res>(_self.table, (value) {
      return _then(_self.copyWith(table: value));
    });
  }

  /// Create a copy of TableDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KpiTableRowCopyWith<$Res>? get kpi {
    if (_self.kpi == null) {
      return null;
    }

    return $KpiTableRowCopyWith<$Res>(_self.kpi!, (value) {
      return _then(_self.copyWith(kpi: value));
    });
  }
}
