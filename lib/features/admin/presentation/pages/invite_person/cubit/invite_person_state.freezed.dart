// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invite_person_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InvitePersonState {
  InvitePersonStatus get status;
  InviteRoleKind get role;
  String? get organizationId;
  String? get tableId;
  List<AdminOrganization> get organizations;

  /// Tables of the chosen organization (seats shown for members).
  List<AdminTable> get tables;
  ApiException? get error;
  InviteShare? get invite;

  /// Create a copy of InvitePersonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InvitePersonStateCopyWith<InvitePersonState> get copyWith =>
      _$InvitePersonStateCopyWithImpl<InvitePersonState>(
        this as InvitePersonState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvitePersonState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.tableId, tableId) || other.tableId == tableId) &&
            const DeepCollectionEquality().equals(
              other.organizations,
              organizations,
            ) &&
            const DeepCollectionEquality().equals(other.tables, tables) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.invite, invite) || other.invite == invite));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    role,
    organizationId,
    tableId,
    const DeepCollectionEquality().hash(organizations),
    const DeepCollectionEquality().hash(tables),
    error,
    invite,
  );

  @override
  String toString() {
    return 'InvitePersonState(status: $status, role: $role, organizationId: $organizationId, tableId: $tableId, organizations: $organizations, tables: $tables, error: $error, invite: $invite)';
  }
}

/// @nodoc
abstract mixin class $InvitePersonStateCopyWith<$Res> {
  factory $InvitePersonStateCopyWith(
    InvitePersonState value,
    $Res Function(InvitePersonState) _then,
  ) = _$InvitePersonStateCopyWithImpl;
  @useResult
  $Res call({
    InvitePersonStatus status,
    InviteRoleKind role,
    String? organizationId,
    String? tableId,
    List<AdminOrganization> organizations,
    List<AdminTable> tables,
    ApiException? error,
    InviteShare? invite,
  });

  $InviteShareCopyWith<$Res>? get invite;
}

/// @nodoc
class _$InvitePersonStateCopyWithImpl<$Res>
    implements $InvitePersonStateCopyWith<$Res> {
  _$InvitePersonStateCopyWithImpl(this._self, this._then);

  final InvitePersonState _self;
  final $Res Function(InvitePersonState) _then;

  /// Create a copy of InvitePersonState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? role = null,
    Object? organizationId = freezed,
    Object? tableId = freezed,
    Object? organizations = null,
    Object? tables = null,
    Object? error = freezed,
    Object? invite = freezed,
  }) {
    return _then(
      _self.copyWith(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as InvitePersonStatus,
        role: null == role
            ? _self.role
            : role // ignore: cast_nullable_to_non_nullable
                  as InviteRoleKind,
        organizationId: freezed == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        tableId: freezed == tableId
            ? _self.tableId
            : tableId // ignore: cast_nullable_to_non_nullable
                  as String?,
        organizations: null == organizations
            ? _self.organizations
            : organizations // ignore: cast_nullable_to_non_nullable
                  as List<AdminOrganization>,
        tables: null == tables
            ? _self.tables
            : tables // ignore: cast_nullable_to_non_nullable
                  as List<AdminTable>,
        error: freezed == error
            ? _self.error
            : error // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
        invite: freezed == invite
            ? _self.invite
            : invite // ignore: cast_nullable_to_non_nullable
                  as InviteShare?,
      ),
    );
  }

  /// Create a copy of InvitePersonState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InviteShareCopyWith<$Res>? get invite {
    if (_self.invite == null) {
      return null;
    }

    return $InviteShareCopyWith<$Res>(_self.invite!, (value) {
      return _then(_self.copyWith(invite: value));
    });
  }
}

/// Adds pattern-matching-related methods to [InvitePersonState].
extension InvitePersonStatePatterns on InvitePersonState {
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
    TResult Function(_InvitePersonState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvitePersonState() when $default != null:
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
    TResult Function(_InvitePersonState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvitePersonState():
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
    TResult? Function(_InvitePersonState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvitePersonState() when $default != null:
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
      InvitePersonStatus status,
      InviteRoleKind role,
      String? organizationId,
      String? tableId,
      List<AdminOrganization> organizations,
      List<AdminTable> tables,
      ApiException? error,
      InviteShare? invite,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvitePersonState() when $default != null:
        return $default(
          _that.status,
          _that.role,
          _that.organizationId,
          _that.tableId,
          _that.organizations,
          _that.tables,
          _that.error,
          _that.invite,
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
      InvitePersonStatus status,
      InviteRoleKind role,
      String? organizationId,
      String? tableId,
      List<AdminOrganization> organizations,
      List<AdminTable> tables,
      ApiException? error,
      InviteShare? invite,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvitePersonState():
        return $default(
          _that.status,
          _that.role,
          _that.organizationId,
          _that.tableId,
          _that.organizations,
          _that.tables,
          _that.error,
          _that.invite,
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
      InvitePersonStatus status,
      InviteRoleKind role,
      String? organizationId,
      String? tableId,
      List<AdminOrganization> organizations,
      List<AdminTable> tables,
      ApiException? error,
      InviteShare? invite,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvitePersonState() when $default != null:
        return $default(
          _that.status,
          _that.role,
          _that.organizationId,
          _that.tableId,
          _that.organizations,
          _that.tables,
          _that.error,
          _that.invite,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _InvitePersonState implements InvitePersonState {
  const _InvitePersonState({
    this.status = InvitePersonStatus.loading,
    this.role = InviteRoleKind.facilitator,
    this.organizationId,
    this.tableId,
    final List<AdminOrganization> organizations = const [],
    final List<AdminTable> tables = const [],
    this.error,
    this.invite,
  }) : _organizations = organizations,
       _tables = tables;

  @override
  @JsonKey()
  final InvitePersonStatus status;
  @override
  @JsonKey()
  final InviteRoleKind role;
  @override
  final String? organizationId;
  @override
  final String? tableId;
  final List<AdminOrganization> _organizations;
  @override
  @JsonKey()
  List<AdminOrganization> get organizations {
    if (_organizations is EqualUnmodifiableListView) return _organizations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_organizations);
  }

  /// Tables of the chosen organization (seats shown for members).
  final List<AdminTable> _tables;

  /// Tables of the chosen organization (seats shown for members).
  @override
  @JsonKey()
  List<AdminTable> get tables {
    if (_tables is EqualUnmodifiableListView) return _tables;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tables);
  }

  @override
  final ApiException? error;
  @override
  final InviteShare? invite;

  /// Create a copy of InvitePersonState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InvitePersonStateCopyWith<_InvitePersonState> get copyWith =>
      __$InvitePersonStateCopyWithImpl<_InvitePersonState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InvitePersonState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.tableId, tableId) || other.tableId == tableId) &&
            const DeepCollectionEquality().equals(
              other._organizations,
              _organizations,
            ) &&
            const DeepCollectionEquality().equals(other._tables, _tables) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.invite, invite) || other.invite == invite));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    role,
    organizationId,
    tableId,
    const DeepCollectionEquality().hash(_organizations),
    const DeepCollectionEquality().hash(_tables),
    error,
    invite,
  );

  @override
  String toString() {
    return 'InvitePersonState(status: $status, role: $role, organizationId: $organizationId, tableId: $tableId, organizations: $organizations, tables: $tables, error: $error, invite: $invite)';
  }
}

/// @nodoc
abstract mixin class _$InvitePersonStateCopyWith<$Res>
    implements $InvitePersonStateCopyWith<$Res> {
  factory _$InvitePersonStateCopyWith(
    _InvitePersonState value,
    $Res Function(_InvitePersonState) _then,
  ) = __$InvitePersonStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    InvitePersonStatus status,
    InviteRoleKind role,
    String? organizationId,
    String? tableId,
    List<AdminOrganization> organizations,
    List<AdminTable> tables,
    ApiException? error,
    InviteShare? invite,
  });

  @override
  $InviteShareCopyWith<$Res>? get invite;
}

/// @nodoc
class __$InvitePersonStateCopyWithImpl<$Res>
    implements _$InvitePersonStateCopyWith<$Res> {
  __$InvitePersonStateCopyWithImpl(this._self, this._then);

  final _InvitePersonState _self;
  final $Res Function(_InvitePersonState) _then;

  /// Create a copy of InvitePersonState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? role = null,
    Object? organizationId = freezed,
    Object? tableId = freezed,
    Object? organizations = null,
    Object? tables = null,
    Object? error = freezed,
    Object? invite = freezed,
  }) {
    return _then(
      _InvitePersonState(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as InvitePersonStatus,
        role: null == role
            ? _self.role
            : role // ignore: cast_nullable_to_non_nullable
                  as InviteRoleKind,
        organizationId: freezed == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        tableId: freezed == tableId
            ? _self.tableId
            : tableId // ignore: cast_nullable_to_non_nullable
                  as String?,
        organizations: null == organizations
            ? _self._organizations
            : organizations // ignore: cast_nullable_to_non_nullable
                  as List<AdminOrganization>,
        tables: null == tables
            ? _self._tables
            : tables // ignore: cast_nullable_to_non_nullable
                  as List<AdminTable>,
        error: freezed == error
            ? _self.error
            : error // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
        invite: freezed == invite
            ? _self.invite
            : invite // ignore: cast_nullable_to_non_nullable
                  as InviteShare?,
      ),
    );
  }

  /// Create a copy of InvitePersonState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InviteShareCopyWith<$Res>? get invite {
    if (_self.invite == null) {
      return null;
    }

    return $InviteShareCopyWith<$Res>(_self.invite!, (value) {
      return _then(_self.copyWith(invite: value));
    });
  }
}
