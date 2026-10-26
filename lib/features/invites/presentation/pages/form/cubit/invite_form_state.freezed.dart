// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invite_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InviteFormState {
  InviteFormStatus get status;

  /// Role the inviter acts as; decides what the form lets them pick.
  UserRole? get inviterRole;
  List<InviteRoleKind> get roles;
  InviteRoleKind get role;
  List<InviteTargetOrganization> get organizations;
  List<InviteTargetTable> get tables;
  String? get organizationId;
  String? get tableId;
  bool get loadingTables;
  bool get submitting;
  InviteProblem? get problem;
  bool get online;

  /// Set when the invite was created; the page opens the share screen.
  Invite? get created;

  /// Create a copy of InviteFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InviteFormStateCopyWith<InviteFormState> get copyWith =>
      _$InviteFormStateCopyWithImpl<InviteFormState>(
        this as InviteFormState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InviteFormState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.inviterRole, inviterRole) ||
                other.inviterRole == inviterRole) &&
            const DeepCollectionEquality().equals(other.roles, roles) &&
            (identical(other.role, role) || other.role == role) &&
            const DeepCollectionEquality().equals(
              other.organizations,
              organizations,
            ) &&
            const DeepCollectionEquality().equals(other.tables, tables) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.tableId, tableId) || other.tableId == tableId) &&
            (identical(other.loadingTables, loadingTables) ||
                other.loadingTables == loadingTables) &&
            (identical(other.submitting, submitting) ||
                other.submitting == submitting) &&
            (identical(other.problem, problem) || other.problem == problem) &&
            (identical(other.online, online) || other.online == online) &&
            (identical(other.created, created) || other.created == created));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    inviterRole,
    const DeepCollectionEquality().hash(roles),
    role,
    const DeepCollectionEquality().hash(organizations),
    const DeepCollectionEquality().hash(tables),
    organizationId,
    tableId,
    loadingTables,
    submitting,
    problem,
    online,
    created,
  );

  @override
  String toString() {
    return 'InviteFormState(status: $status, inviterRole: $inviterRole, roles: $roles, role: $role, organizations: $organizations, tables: $tables, organizationId: $organizationId, tableId: $tableId, loadingTables: $loadingTables, submitting: $submitting, problem: $problem, online: $online, created: $created)';
  }
}

/// @nodoc
abstract mixin class $InviteFormStateCopyWith<$Res> {
  factory $InviteFormStateCopyWith(
    InviteFormState value,
    $Res Function(InviteFormState) _then,
  ) = _$InviteFormStateCopyWithImpl;
  @useResult
  $Res call({
    InviteFormStatus status,
    UserRole? inviterRole,
    List<InviteRoleKind> roles,
    InviteRoleKind role,
    List<InviteTargetOrganization> organizations,
    List<InviteTargetTable> tables,
    String? organizationId,
    String? tableId,
    bool loadingTables,
    bool submitting,
    InviteProblem? problem,
    bool online,
    Invite? created,
  });

  $InviteCopyWith<$Res>? get created;
}

/// @nodoc
class _$InviteFormStateCopyWithImpl<$Res>
    implements $InviteFormStateCopyWith<$Res> {
  _$InviteFormStateCopyWithImpl(this._self, this._then);

  final InviteFormState _self;
  final $Res Function(InviteFormState) _then;

  /// Create a copy of InviteFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? inviterRole = freezed,
    Object? roles = null,
    Object? role = null,
    Object? organizations = null,
    Object? tables = null,
    Object? organizationId = freezed,
    Object? tableId = freezed,
    Object? loadingTables = null,
    Object? submitting = null,
    Object? problem = freezed,
    Object? online = null,
    Object? created = freezed,
  }) {
    return _then(
      _self.copyWith(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as InviteFormStatus,
        inviterRole: freezed == inviterRole
            ? _self.inviterRole
            : inviterRole // ignore: cast_nullable_to_non_nullable
                  as UserRole?,
        roles: null == roles
            ? _self.roles
            : roles // ignore: cast_nullable_to_non_nullable
                  as List<InviteRoleKind>,
        role: null == role
            ? _self.role
            : role // ignore: cast_nullable_to_non_nullable
                  as InviteRoleKind,
        organizations: null == organizations
            ? _self.organizations
            : organizations // ignore: cast_nullable_to_non_nullable
                  as List<InviteTargetOrganization>,
        tables: null == tables
            ? _self.tables
            : tables // ignore: cast_nullable_to_non_nullable
                  as List<InviteTargetTable>,
        organizationId: freezed == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        tableId: freezed == tableId
            ? _self.tableId
            : tableId // ignore: cast_nullable_to_non_nullable
                  as String?,
        loadingTables: null == loadingTables
            ? _self.loadingTables
            : loadingTables // ignore: cast_nullable_to_non_nullable
                  as bool,
        submitting: null == submitting
            ? _self.submitting
            : submitting // ignore: cast_nullable_to_non_nullable
                  as bool,
        problem: freezed == problem
            ? _self.problem
            : problem // ignore: cast_nullable_to_non_nullable
                  as InviteProblem?,
        online: null == online
            ? _self.online
            : online // ignore: cast_nullable_to_non_nullable
                  as bool,
        created: freezed == created
            ? _self.created
            : created // ignore: cast_nullable_to_non_nullable
                  as Invite?,
      ),
    );
  }

  /// Create a copy of InviteFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InviteCopyWith<$Res>? get created {
    if (_self.created == null) {
      return null;
    }

    return $InviteCopyWith<$Res>(_self.created!, (value) {
      return _then(_self.copyWith(created: value));
    });
  }
}

/// Adds pattern-matching-related methods to [InviteFormState].
extension InviteFormStatePatterns on InviteFormState {
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
    TResult Function(_InviteFormState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InviteFormState() when $default != null:
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
    TResult Function(_InviteFormState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InviteFormState():
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
    TResult? Function(_InviteFormState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InviteFormState() when $default != null:
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
      InviteFormStatus status,
      UserRole? inviterRole,
      List<InviteRoleKind> roles,
      InviteRoleKind role,
      List<InviteTargetOrganization> organizations,
      List<InviteTargetTable> tables,
      String? organizationId,
      String? tableId,
      bool loadingTables,
      bool submitting,
      InviteProblem? problem,
      bool online,
      Invite? created,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InviteFormState() when $default != null:
        return $default(
          _that.status,
          _that.inviterRole,
          _that.roles,
          _that.role,
          _that.organizations,
          _that.tables,
          _that.organizationId,
          _that.tableId,
          _that.loadingTables,
          _that.submitting,
          _that.problem,
          _that.online,
          _that.created,
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
      InviteFormStatus status,
      UserRole? inviterRole,
      List<InviteRoleKind> roles,
      InviteRoleKind role,
      List<InviteTargetOrganization> organizations,
      List<InviteTargetTable> tables,
      String? organizationId,
      String? tableId,
      bool loadingTables,
      bool submitting,
      InviteProblem? problem,
      bool online,
      Invite? created,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InviteFormState():
        return $default(
          _that.status,
          _that.inviterRole,
          _that.roles,
          _that.role,
          _that.organizations,
          _that.tables,
          _that.organizationId,
          _that.tableId,
          _that.loadingTables,
          _that.submitting,
          _that.problem,
          _that.online,
          _that.created,
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
      InviteFormStatus status,
      UserRole? inviterRole,
      List<InviteRoleKind> roles,
      InviteRoleKind role,
      List<InviteTargetOrganization> organizations,
      List<InviteTargetTable> tables,
      String? organizationId,
      String? tableId,
      bool loadingTables,
      bool submitting,
      InviteProblem? problem,
      bool online,
      Invite? created,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InviteFormState() when $default != null:
        return $default(
          _that.status,
          _that.inviterRole,
          _that.roles,
          _that.role,
          _that.organizations,
          _that.tables,
          _that.organizationId,
          _that.tableId,
          _that.loadingTables,
          _that.submitting,
          _that.problem,
          _that.online,
          _that.created,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _InviteFormState extends InviteFormState {
  const _InviteFormState({
    this.status = InviteFormStatus.loading,
    this.inviterRole,
    final List<InviteRoleKind> roles = const [],
    this.role = InviteRoleKind.member,
    final List<InviteTargetOrganization> organizations = const [],
    final List<InviteTargetTable> tables = const [],
    this.organizationId,
    this.tableId,
    this.loadingTables = false,
    this.submitting = false,
    this.problem,
    this.online = true,
    this.created,
  }) : _roles = roles,
       _organizations = organizations,
       _tables = tables,
       super._();

  @override
  @JsonKey()
  final InviteFormStatus status;

  /// Role the inviter acts as; decides what the form lets them pick.
  @override
  final UserRole? inviterRole;
  final List<InviteRoleKind> _roles;
  @override
  @JsonKey()
  List<InviteRoleKind> get roles {
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roles);
  }

  @override
  @JsonKey()
  final InviteRoleKind role;
  final List<InviteTargetOrganization> _organizations;
  @override
  @JsonKey()
  List<InviteTargetOrganization> get organizations {
    if (_organizations is EqualUnmodifiableListView) return _organizations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_organizations);
  }

  final List<InviteTargetTable> _tables;
  @override
  @JsonKey()
  List<InviteTargetTable> get tables {
    if (_tables is EqualUnmodifiableListView) return _tables;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tables);
  }

  @override
  final String? organizationId;
  @override
  final String? tableId;
  @override
  @JsonKey()
  final bool loadingTables;
  @override
  @JsonKey()
  final bool submitting;
  @override
  final InviteProblem? problem;
  @override
  @JsonKey()
  final bool online;

  /// Set when the invite was created; the page opens the share screen.
  @override
  final Invite? created;

  /// Create a copy of InviteFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InviteFormStateCopyWith<_InviteFormState> get copyWith =>
      __$InviteFormStateCopyWithImpl<_InviteFormState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InviteFormState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.inviterRole, inviterRole) ||
                other.inviterRole == inviterRole) &&
            const DeepCollectionEquality().equals(other._roles, _roles) &&
            (identical(other.role, role) || other.role == role) &&
            const DeepCollectionEquality().equals(
              other._organizations,
              _organizations,
            ) &&
            const DeepCollectionEquality().equals(other._tables, _tables) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.tableId, tableId) || other.tableId == tableId) &&
            (identical(other.loadingTables, loadingTables) ||
                other.loadingTables == loadingTables) &&
            (identical(other.submitting, submitting) ||
                other.submitting == submitting) &&
            (identical(other.problem, problem) || other.problem == problem) &&
            (identical(other.online, online) || other.online == online) &&
            (identical(other.created, created) || other.created == created));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    inviterRole,
    const DeepCollectionEquality().hash(_roles),
    role,
    const DeepCollectionEquality().hash(_organizations),
    const DeepCollectionEquality().hash(_tables),
    organizationId,
    tableId,
    loadingTables,
    submitting,
    problem,
    online,
    created,
  );

  @override
  String toString() {
    return 'InviteFormState(status: $status, inviterRole: $inviterRole, roles: $roles, role: $role, organizations: $organizations, tables: $tables, organizationId: $organizationId, tableId: $tableId, loadingTables: $loadingTables, submitting: $submitting, problem: $problem, online: $online, created: $created)';
  }
}

/// @nodoc
abstract mixin class _$InviteFormStateCopyWith<$Res>
    implements $InviteFormStateCopyWith<$Res> {
  factory _$InviteFormStateCopyWith(
    _InviteFormState value,
    $Res Function(_InviteFormState) _then,
  ) = __$InviteFormStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    InviteFormStatus status,
    UserRole? inviterRole,
    List<InviteRoleKind> roles,
    InviteRoleKind role,
    List<InviteTargetOrganization> organizations,
    List<InviteTargetTable> tables,
    String? organizationId,
    String? tableId,
    bool loadingTables,
    bool submitting,
    InviteProblem? problem,
    bool online,
    Invite? created,
  });

  @override
  $InviteCopyWith<$Res>? get created;
}

/// @nodoc
class __$InviteFormStateCopyWithImpl<$Res>
    implements _$InviteFormStateCopyWith<$Res> {
  __$InviteFormStateCopyWithImpl(this._self, this._then);

  final _InviteFormState _self;
  final $Res Function(_InviteFormState) _then;

  /// Create a copy of InviteFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? inviterRole = freezed,
    Object? roles = null,
    Object? role = null,
    Object? organizations = null,
    Object? tables = null,
    Object? organizationId = freezed,
    Object? tableId = freezed,
    Object? loadingTables = null,
    Object? submitting = null,
    Object? problem = freezed,
    Object? online = null,
    Object? created = freezed,
  }) {
    return _then(
      _InviteFormState(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as InviteFormStatus,
        inviterRole: freezed == inviterRole
            ? _self.inviterRole
            : inviterRole // ignore: cast_nullable_to_non_nullable
                  as UserRole?,
        roles: null == roles
            ? _self._roles
            : roles // ignore: cast_nullable_to_non_nullable
                  as List<InviteRoleKind>,
        role: null == role
            ? _self.role
            : role // ignore: cast_nullable_to_non_nullable
                  as InviteRoleKind,
        organizations: null == organizations
            ? _self._organizations
            : organizations // ignore: cast_nullable_to_non_nullable
                  as List<InviteTargetOrganization>,
        tables: null == tables
            ? _self._tables
            : tables // ignore: cast_nullable_to_non_nullable
                  as List<InviteTargetTable>,
        organizationId: freezed == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        tableId: freezed == tableId
            ? _self.tableId
            : tableId // ignore: cast_nullable_to_non_nullable
                  as String?,
        loadingTables: null == loadingTables
            ? _self.loadingTables
            : loadingTables // ignore: cast_nullable_to_non_nullable
                  as bool,
        submitting: null == submitting
            ? _self.submitting
            : submitting // ignore: cast_nullable_to_non_nullable
                  as bool,
        problem: freezed == problem
            ? _self.problem
            : problem // ignore: cast_nullable_to_non_nullable
                  as InviteProblem?,
        online: null == online
            ? _self.online
            : online // ignore: cast_nullable_to_non_nullable
                  as bool,
        created: freezed == created
            ? _self.created
            : created // ignore: cast_nullable_to_non_nullable
                  as Invite?,
      ),
    );
  }

  /// Create a copy of InviteFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InviteCopyWith<$Res>? get created {
    if (_self.created == null) {
      return null;
    }

    return $InviteCopyWith<$Res>(_self.created!, (value) {
      return _then(_self.copyWith(created: value));
    });
  }
}
