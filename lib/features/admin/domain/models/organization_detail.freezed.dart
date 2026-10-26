// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'organization_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrganizationDetail {
  AdminOrganization get organization;
  List<AdminLocation> get locations;
  List<AdminTable> get tables;
  List<AdminPerson> get people;
  KpiBreakdownRow? get rollup;
  List<AuditEvent> get recentActivity;

  /// Create a copy of OrganizationDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrganizationDetailCopyWith<OrganizationDetail> get copyWith =>
      _$OrganizationDetailCopyWithImpl<OrganizationDetail>(
        this as OrganizationDetail,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrganizationDetail &&
            (identical(other.organization, organization) ||
                other.organization == organization) &&
            const DeepCollectionEquality().equals(other.locations, locations) &&
            const DeepCollectionEquality().equals(other.tables, tables) &&
            const DeepCollectionEquality().equals(other.people, people) &&
            (identical(other.rollup, rollup) || other.rollup == rollup) &&
            const DeepCollectionEquality().equals(
              other.recentActivity,
              recentActivity,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    organization,
    const DeepCollectionEquality().hash(locations),
    const DeepCollectionEquality().hash(tables),
    const DeepCollectionEquality().hash(people),
    rollup,
    const DeepCollectionEquality().hash(recentActivity),
  );

  @override
  String toString() {
    return 'OrganizationDetail(organization: $organization, locations: $locations, tables: $tables, people: $people, rollup: $rollup, recentActivity: $recentActivity)';
  }
}

/// @nodoc
abstract mixin class $OrganizationDetailCopyWith<$Res> {
  factory $OrganizationDetailCopyWith(
    OrganizationDetail value,
    $Res Function(OrganizationDetail) _then,
  ) = _$OrganizationDetailCopyWithImpl;
  @useResult
  $Res call({
    AdminOrganization organization,
    List<AdminLocation> locations,
    List<AdminTable> tables,
    List<AdminPerson> people,
    KpiBreakdownRow? rollup,
    List<AuditEvent> recentActivity,
  });

  $AdminOrganizationCopyWith<$Res> get organization;
  $KpiBreakdownRowCopyWith<$Res>? get rollup;
}

/// @nodoc
class _$OrganizationDetailCopyWithImpl<$Res>
    implements $OrganizationDetailCopyWith<$Res> {
  _$OrganizationDetailCopyWithImpl(this._self, this._then);

  final OrganizationDetail _self;
  final $Res Function(OrganizationDetail) _then;

  /// Create a copy of OrganizationDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organization = null,
    Object? locations = null,
    Object? tables = null,
    Object? people = null,
    Object? rollup = freezed,
    Object? recentActivity = null,
  }) {
    return _then(
      _self.copyWith(
        organization: null == organization
            ? _self.organization
            : organization // ignore: cast_nullable_to_non_nullable
                  as AdminOrganization,
        locations: null == locations
            ? _self.locations
            : locations // ignore: cast_nullable_to_non_nullable
                  as List<AdminLocation>,
        tables: null == tables
            ? _self.tables
            : tables // ignore: cast_nullable_to_non_nullable
                  as List<AdminTable>,
        people: null == people
            ? _self.people
            : people // ignore: cast_nullable_to_non_nullable
                  as List<AdminPerson>,
        rollup: freezed == rollup
            ? _self.rollup
            : rollup // ignore: cast_nullable_to_non_nullable
                  as KpiBreakdownRow?,
        recentActivity: null == recentActivity
            ? _self.recentActivity
            : recentActivity // ignore: cast_nullable_to_non_nullable
                  as List<AuditEvent>,
      ),
    );
  }

  /// Create a copy of OrganizationDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AdminOrganizationCopyWith<$Res> get organization {
    return $AdminOrganizationCopyWith<$Res>(_self.organization, (value) {
      return _then(_self.copyWith(organization: value));
    });
  }

  /// Create a copy of OrganizationDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KpiBreakdownRowCopyWith<$Res>? get rollup {
    if (_self.rollup == null) {
      return null;
    }

    return $KpiBreakdownRowCopyWith<$Res>(_self.rollup!, (value) {
      return _then(_self.copyWith(rollup: value));
    });
  }
}

/// Adds pattern-matching-related methods to [OrganizationDetail].
extension OrganizationDetailPatterns on OrganizationDetail {
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
    TResult Function(_OrganizationDetail value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrganizationDetail() when $default != null:
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
    TResult Function(_OrganizationDetail value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrganizationDetail():
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
    TResult? Function(_OrganizationDetail value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrganizationDetail() when $default != null:
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
      AdminOrganization organization,
      List<AdminLocation> locations,
      List<AdminTable> tables,
      List<AdminPerson> people,
      KpiBreakdownRow? rollup,
      List<AuditEvent> recentActivity,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrganizationDetail() when $default != null:
        return $default(
          _that.organization,
          _that.locations,
          _that.tables,
          _that.people,
          _that.rollup,
          _that.recentActivity,
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
      AdminOrganization organization,
      List<AdminLocation> locations,
      List<AdminTable> tables,
      List<AdminPerson> people,
      KpiBreakdownRow? rollup,
      List<AuditEvent> recentActivity,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrganizationDetail():
        return $default(
          _that.organization,
          _that.locations,
          _that.tables,
          _that.people,
          _that.rollup,
          _that.recentActivity,
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
      AdminOrganization organization,
      List<AdminLocation> locations,
      List<AdminTable> tables,
      List<AdminPerson> people,
      KpiBreakdownRow? rollup,
      List<AuditEvent> recentActivity,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrganizationDetail() when $default != null:
        return $default(
          _that.organization,
          _that.locations,
          _that.tables,
          _that.people,
          _that.rollup,
          _that.recentActivity,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _OrganizationDetail implements OrganizationDetail {
  const _OrganizationDetail({
    required this.organization,
    final List<AdminLocation> locations = const [],
    final List<AdminTable> tables = const [],
    final List<AdminPerson> people = const [],
    this.rollup,
    final List<AuditEvent> recentActivity = const [],
  }) : _locations = locations,
       _tables = tables,
       _people = people,
       _recentActivity = recentActivity;

  @override
  final AdminOrganization organization;
  final List<AdminLocation> _locations;
  @override
  @JsonKey()
  List<AdminLocation> get locations {
    if (_locations is EqualUnmodifiableListView) return _locations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_locations);
  }

  final List<AdminTable> _tables;
  @override
  @JsonKey()
  List<AdminTable> get tables {
    if (_tables is EqualUnmodifiableListView) return _tables;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tables);
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
  final KpiBreakdownRow? rollup;
  final List<AuditEvent> _recentActivity;
  @override
  @JsonKey()
  List<AuditEvent> get recentActivity {
    if (_recentActivity is EqualUnmodifiableListView) return _recentActivity;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentActivity);
  }

  /// Create a copy of OrganizationDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrganizationDetailCopyWith<_OrganizationDetail> get copyWith =>
      __$OrganizationDetailCopyWithImpl<_OrganizationDetail>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrganizationDetail &&
            (identical(other.organization, organization) ||
                other.organization == organization) &&
            const DeepCollectionEquality().equals(
              other._locations,
              _locations,
            ) &&
            const DeepCollectionEquality().equals(other._tables, _tables) &&
            const DeepCollectionEquality().equals(other._people, _people) &&
            (identical(other.rollup, rollup) || other.rollup == rollup) &&
            const DeepCollectionEquality().equals(
              other._recentActivity,
              _recentActivity,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    organization,
    const DeepCollectionEquality().hash(_locations),
    const DeepCollectionEquality().hash(_tables),
    const DeepCollectionEquality().hash(_people),
    rollup,
    const DeepCollectionEquality().hash(_recentActivity),
  );

  @override
  String toString() {
    return 'OrganizationDetail(organization: $organization, locations: $locations, tables: $tables, people: $people, rollup: $rollup, recentActivity: $recentActivity)';
  }
}

/// @nodoc
abstract mixin class _$OrganizationDetailCopyWith<$Res>
    implements $OrganizationDetailCopyWith<$Res> {
  factory _$OrganizationDetailCopyWith(
    _OrganizationDetail value,
    $Res Function(_OrganizationDetail) _then,
  ) = __$OrganizationDetailCopyWithImpl;
  @override
  @useResult
  $Res call({
    AdminOrganization organization,
    List<AdminLocation> locations,
    List<AdminTable> tables,
    List<AdminPerson> people,
    KpiBreakdownRow? rollup,
    List<AuditEvent> recentActivity,
  });

  @override
  $AdminOrganizationCopyWith<$Res> get organization;
  @override
  $KpiBreakdownRowCopyWith<$Res>? get rollup;
}

/// @nodoc
class __$OrganizationDetailCopyWithImpl<$Res>
    implements _$OrganizationDetailCopyWith<$Res> {
  __$OrganizationDetailCopyWithImpl(this._self, this._then);

  final _OrganizationDetail _self;
  final $Res Function(_OrganizationDetail) _then;

  /// Create a copy of OrganizationDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? organization = null,
    Object? locations = null,
    Object? tables = null,
    Object? people = null,
    Object? rollup = freezed,
    Object? recentActivity = null,
  }) {
    return _then(
      _OrganizationDetail(
        organization: null == organization
            ? _self.organization
            : organization // ignore: cast_nullable_to_non_nullable
                  as AdminOrganization,
        locations: null == locations
            ? _self._locations
            : locations // ignore: cast_nullable_to_non_nullable
                  as List<AdminLocation>,
        tables: null == tables
            ? _self._tables
            : tables // ignore: cast_nullable_to_non_nullable
                  as List<AdminTable>,
        people: null == people
            ? _self._people
            : people // ignore: cast_nullable_to_non_nullable
                  as List<AdminPerson>,
        rollup: freezed == rollup
            ? _self.rollup
            : rollup // ignore: cast_nullable_to_non_nullable
                  as KpiBreakdownRow?,
        recentActivity: null == recentActivity
            ? _self._recentActivity
            : recentActivity // ignore: cast_nullable_to_non_nullable
                  as List<AuditEvent>,
      ),
    );
  }

  /// Create a copy of OrganizationDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AdminOrganizationCopyWith<$Res> get organization {
    return $AdminOrganizationCopyWith<$Res>(_self.organization, (value) {
      return _then(_self.copyWith(organization: value));
    });
  }

  /// Create a copy of OrganizationDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $KpiBreakdownRowCopyWith<$Res>? get rollup {
    if (_self.rollup == null) {
      return null;
    }

    return $KpiBreakdownRowCopyWith<$Res>(_self.rollup!, (value) {
      return _then(_self.copyWith(rollup: value));
    });
  }
}
