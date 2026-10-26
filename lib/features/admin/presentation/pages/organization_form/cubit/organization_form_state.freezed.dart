// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'organization_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrganizationFormState {
  OrganizationFormStatus get status;

  /// The organization being edited; null when creating.
  AdminOrganization? get organization;

  /// Load failure (edit) or submit failure.
  ApiException? get error;

  /// Id of the saved organization.
  String? get savedId;

  /// Coordinator invite created together with the organization.
  InviteShare? get invite;

  /// The organization was created but its coordinator invite failed.
  ApiException? get inviteError;

  /// Create a copy of OrganizationFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrganizationFormStateCopyWith<OrganizationFormState> get copyWith =>
      _$OrganizationFormStateCopyWithImpl<OrganizationFormState>(
        this as OrganizationFormState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrganizationFormState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.organization, organization) ||
                other.organization == organization) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.savedId, savedId) || other.savedId == savedId) &&
            (identical(other.invite, invite) || other.invite == invite) &&
            (identical(other.inviteError, inviteError) ||
                other.inviteError == inviteError));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    organization,
    error,
    savedId,
    invite,
    inviteError,
  );

  @override
  String toString() {
    return 'OrganizationFormState(status: $status, organization: $organization, error: $error, savedId: $savedId, invite: $invite, inviteError: $inviteError)';
  }
}

/// @nodoc
abstract mixin class $OrganizationFormStateCopyWith<$Res> {
  factory $OrganizationFormStateCopyWith(
    OrganizationFormState value,
    $Res Function(OrganizationFormState) _then,
  ) = _$OrganizationFormStateCopyWithImpl;
  @useResult
  $Res call({
    OrganizationFormStatus status,
    AdminOrganization? organization,
    ApiException? error,
    String? savedId,
    InviteShare? invite,
    ApiException? inviteError,
  });

  $AdminOrganizationCopyWith<$Res>? get organization;
  $InviteShareCopyWith<$Res>? get invite;
}

/// @nodoc
class _$OrganizationFormStateCopyWithImpl<$Res>
    implements $OrganizationFormStateCopyWith<$Res> {
  _$OrganizationFormStateCopyWithImpl(this._self, this._then);

  final OrganizationFormState _self;
  final $Res Function(OrganizationFormState) _then;

  /// Create a copy of OrganizationFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? organization = freezed,
    Object? error = freezed,
    Object? savedId = freezed,
    Object? invite = freezed,
    Object? inviteError = freezed,
  }) {
    return _then(
      _self.copyWith(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as OrganizationFormStatus,
        organization: freezed == organization
            ? _self.organization
            : organization // ignore: cast_nullable_to_non_nullable
                  as AdminOrganization?,
        error: freezed == error
            ? _self.error
            : error // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
        savedId: freezed == savedId
            ? _self.savedId
            : savedId // ignore: cast_nullable_to_non_nullable
                  as String?,
        invite: freezed == invite
            ? _self.invite
            : invite // ignore: cast_nullable_to_non_nullable
                  as InviteShare?,
        inviteError: freezed == inviteError
            ? _self.inviteError
            : inviteError // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
      ),
    );
  }

  /// Create a copy of OrganizationFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AdminOrganizationCopyWith<$Res>? get organization {
    if (_self.organization == null) {
      return null;
    }

    return $AdminOrganizationCopyWith<$Res>(_self.organization!, (value) {
      return _then(_self.copyWith(organization: value));
    });
  }

  /// Create a copy of OrganizationFormState
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

/// Adds pattern-matching-related methods to [OrganizationFormState].
extension OrganizationFormStatePatterns on OrganizationFormState {
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
    TResult Function(_OrganizationFormState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrganizationFormState() when $default != null:
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
    TResult Function(_OrganizationFormState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrganizationFormState():
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
    TResult? Function(_OrganizationFormState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrganizationFormState() when $default != null:
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
      OrganizationFormStatus status,
      AdminOrganization? organization,
      ApiException? error,
      String? savedId,
      InviteShare? invite,
      ApiException? inviteError,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrganizationFormState() when $default != null:
        return $default(
          _that.status,
          _that.organization,
          _that.error,
          _that.savedId,
          _that.invite,
          _that.inviteError,
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
      OrganizationFormStatus status,
      AdminOrganization? organization,
      ApiException? error,
      String? savedId,
      InviteShare? invite,
      ApiException? inviteError,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrganizationFormState():
        return $default(
          _that.status,
          _that.organization,
          _that.error,
          _that.savedId,
          _that.invite,
          _that.inviteError,
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
      OrganizationFormStatus status,
      AdminOrganization? organization,
      ApiException? error,
      String? savedId,
      InviteShare? invite,
      ApiException? inviteError,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrganizationFormState() when $default != null:
        return $default(
          _that.status,
          _that.organization,
          _that.error,
          _that.savedId,
          _that.invite,
          _that.inviteError,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _OrganizationFormState implements OrganizationFormState {
  const _OrganizationFormState({
    this.status = OrganizationFormStatus.editing,
    this.organization,
    this.error,
    this.savedId,
    this.invite,
    this.inviteError,
  });

  @override
  @JsonKey()
  final OrganizationFormStatus status;

  /// The organization being edited; null when creating.
  @override
  final AdminOrganization? organization;

  /// Load failure (edit) or submit failure.
  @override
  final ApiException? error;

  /// Id of the saved organization.
  @override
  final String? savedId;

  /// Coordinator invite created together with the organization.
  @override
  final InviteShare? invite;

  /// The organization was created but its coordinator invite failed.
  @override
  final ApiException? inviteError;

  /// Create a copy of OrganizationFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrganizationFormStateCopyWith<_OrganizationFormState> get copyWith =>
      __$OrganizationFormStateCopyWithImpl<_OrganizationFormState>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrganizationFormState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.organization, organization) ||
                other.organization == organization) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.savedId, savedId) || other.savedId == savedId) &&
            (identical(other.invite, invite) || other.invite == invite) &&
            (identical(other.inviteError, inviteError) ||
                other.inviteError == inviteError));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    organization,
    error,
    savedId,
    invite,
    inviteError,
  );

  @override
  String toString() {
    return 'OrganizationFormState(status: $status, organization: $organization, error: $error, savedId: $savedId, invite: $invite, inviteError: $inviteError)';
  }
}

/// @nodoc
abstract mixin class _$OrganizationFormStateCopyWith<$Res>
    implements $OrganizationFormStateCopyWith<$Res> {
  factory _$OrganizationFormStateCopyWith(
    _OrganizationFormState value,
    $Res Function(_OrganizationFormState) _then,
  ) = __$OrganizationFormStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    OrganizationFormStatus status,
    AdminOrganization? organization,
    ApiException? error,
    String? savedId,
    InviteShare? invite,
    ApiException? inviteError,
  });

  @override
  $AdminOrganizationCopyWith<$Res>? get organization;
  @override
  $InviteShareCopyWith<$Res>? get invite;
}

/// @nodoc
class __$OrganizationFormStateCopyWithImpl<$Res>
    implements _$OrganizationFormStateCopyWith<$Res> {
  __$OrganizationFormStateCopyWithImpl(this._self, this._then);

  final _OrganizationFormState _self;
  final $Res Function(_OrganizationFormState) _then;

  /// Create a copy of OrganizationFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? organization = freezed,
    Object? error = freezed,
    Object? savedId = freezed,
    Object? invite = freezed,
    Object? inviteError = freezed,
  }) {
    return _then(
      _OrganizationFormState(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as OrganizationFormStatus,
        organization: freezed == organization
            ? _self.organization
            : organization // ignore: cast_nullable_to_non_nullable
                  as AdminOrganization?,
        error: freezed == error
            ? _self.error
            : error // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
        savedId: freezed == savedId
            ? _self.savedId
            : savedId // ignore: cast_nullable_to_non_nullable
                  as String?,
        invite: freezed == invite
            ? _self.invite
            : invite // ignore: cast_nullable_to_non_nullable
                  as InviteShare?,
        inviteError: freezed == inviteError
            ? _self.inviteError
            : inviteError // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
      ),
    );
  }

  /// Create a copy of OrganizationFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AdminOrganizationCopyWith<$Res>? get organization {
    if (_self.organization == null) {
      return null;
    }

    return $AdminOrganizationCopyWith<$Res>(_self.organization!, (value) {
      return _then(_self.copyWith(organization: value));
    });
  }

  /// Create a copy of OrganizationFormState
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
