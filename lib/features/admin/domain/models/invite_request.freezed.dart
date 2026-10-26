// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invite_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InviteRequest {
  InviteRoleKind get roleKind;
  String? get organizationId;
  String? get roundTableId;
  PersonRef get person;
  int? get expiresInDays;

  /// Create a copy of InviteRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InviteRequestCopyWith<InviteRequest> get copyWith =>
      _$InviteRequestCopyWithImpl<InviteRequest>(
        this as InviteRequest,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InviteRequest &&
            (identical(other.roleKind, roleKind) ||
                other.roleKind == roleKind) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.roundTableId, roundTableId) ||
                other.roundTableId == roundTableId) &&
            (identical(other.person, person) || other.person == person) &&
            (identical(other.expiresInDays, expiresInDays) ||
                other.expiresInDays == expiresInDays));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    roleKind,
    organizationId,
    roundTableId,
    person,
    expiresInDays,
  );

  @override
  String toString() {
    return 'InviteRequest(roleKind: $roleKind, organizationId: $organizationId, roundTableId: $roundTableId, person: $person, expiresInDays: $expiresInDays)';
  }
}

/// @nodoc
abstract mixin class $InviteRequestCopyWith<$Res> {
  factory $InviteRequestCopyWith(
    InviteRequest value,
    $Res Function(InviteRequest) _then,
  ) = _$InviteRequestCopyWithImpl;
  @useResult
  $Res call({
    InviteRoleKind roleKind,
    String? organizationId,
    String? roundTableId,
    PersonRef person,
    int? expiresInDays,
  });

  $PersonRefCopyWith<$Res> get person;
}

/// @nodoc
class _$InviteRequestCopyWithImpl<$Res>
    implements $InviteRequestCopyWith<$Res> {
  _$InviteRequestCopyWithImpl(this._self, this._then);

  final InviteRequest _self;
  final $Res Function(InviteRequest) _then;

  /// Create a copy of InviteRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roleKind = null,
    Object? organizationId = freezed,
    Object? roundTableId = freezed,
    Object? person = null,
    Object? expiresInDays = freezed,
  }) {
    return _then(
      _self.copyWith(
        roleKind: null == roleKind
            ? _self.roleKind
            : roleKind // ignore: cast_nullable_to_non_nullable
                  as InviteRoleKind,
        organizationId: freezed == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        roundTableId: freezed == roundTableId
            ? _self.roundTableId
            : roundTableId // ignore: cast_nullable_to_non_nullable
                  as String?,
        person: null == person
            ? _self.person
            : person // ignore: cast_nullable_to_non_nullable
                  as PersonRef,
        expiresInDays: freezed == expiresInDays
            ? _self.expiresInDays
            : expiresInDays // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }

  /// Create a copy of InviteRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PersonRefCopyWith<$Res> get person {
    return $PersonRefCopyWith<$Res>(_self.person, (value) {
      return _then(_self.copyWith(person: value));
    });
  }
}

/// Adds pattern-matching-related methods to [InviteRequest].
extension InviteRequestPatterns on InviteRequest {
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
    TResult Function(_InviteRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InviteRequest() when $default != null:
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
    TResult Function(_InviteRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InviteRequest():
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
    TResult? Function(_InviteRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InviteRequest() when $default != null:
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
      InviteRoleKind roleKind,
      String? organizationId,
      String? roundTableId,
      PersonRef person,
      int? expiresInDays,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InviteRequest() when $default != null:
        return $default(
          _that.roleKind,
          _that.organizationId,
          _that.roundTableId,
          _that.person,
          _that.expiresInDays,
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
      InviteRoleKind roleKind,
      String? organizationId,
      String? roundTableId,
      PersonRef person,
      int? expiresInDays,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InviteRequest():
        return $default(
          _that.roleKind,
          _that.organizationId,
          _that.roundTableId,
          _that.person,
          _that.expiresInDays,
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
      InviteRoleKind roleKind,
      String? organizationId,
      String? roundTableId,
      PersonRef person,
      int? expiresInDays,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InviteRequest() when $default != null:
        return $default(
          _that.roleKind,
          _that.organizationId,
          _that.roundTableId,
          _that.person,
          _that.expiresInDays,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _InviteRequest implements InviteRequest {
  const _InviteRequest({
    required this.roleKind,
    this.organizationId,
    this.roundTableId,
    required this.person,
    this.expiresInDays,
  });

  @override
  final InviteRoleKind roleKind;
  @override
  final String? organizationId;
  @override
  final String? roundTableId;
  @override
  final PersonRef person;
  @override
  final int? expiresInDays;

  /// Create a copy of InviteRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InviteRequestCopyWith<_InviteRequest> get copyWith =>
      __$InviteRequestCopyWithImpl<_InviteRequest>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InviteRequest &&
            (identical(other.roleKind, roleKind) ||
                other.roleKind == roleKind) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.roundTableId, roundTableId) ||
                other.roundTableId == roundTableId) &&
            (identical(other.person, person) || other.person == person) &&
            (identical(other.expiresInDays, expiresInDays) ||
                other.expiresInDays == expiresInDays));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    roleKind,
    organizationId,
    roundTableId,
    person,
    expiresInDays,
  );

  @override
  String toString() {
    return 'InviteRequest(roleKind: $roleKind, organizationId: $organizationId, roundTableId: $roundTableId, person: $person, expiresInDays: $expiresInDays)';
  }
}

/// @nodoc
abstract mixin class _$InviteRequestCopyWith<$Res>
    implements $InviteRequestCopyWith<$Res> {
  factory _$InviteRequestCopyWith(
    _InviteRequest value,
    $Res Function(_InviteRequest) _then,
  ) = __$InviteRequestCopyWithImpl;
  @override
  @useResult
  $Res call({
    InviteRoleKind roleKind,
    String? organizationId,
    String? roundTableId,
    PersonRef person,
    int? expiresInDays,
  });

  @override
  $PersonRefCopyWith<$Res> get person;
}

/// @nodoc
class __$InviteRequestCopyWithImpl<$Res>
    implements _$InviteRequestCopyWith<$Res> {
  __$InviteRequestCopyWithImpl(this._self, this._then);

  final _InviteRequest _self;
  final $Res Function(_InviteRequest) _then;

  /// Create a copy of InviteRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? roleKind = null,
    Object? organizationId = freezed,
    Object? roundTableId = freezed,
    Object? person = null,
    Object? expiresInDays = freezed,
  }) {
    return _then(
      _InviteRequest(
        roleKind: null == roleKind
            ? _self.roleKind
            : roleKind // ignore: cast_nullable_to_non_nullable
                  as InviteRoleKind,
        organizationId: freezed == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        roundTableId: freezed == roundTableId
            ? _self.roundTableId
            : roundTableId // ignore: cast_nullable_to_non_nullable
                  as String?,
        person: null == person
            ? _self.person
            : person // ignore: cast_nullable_to_non_nullable
                  as PersonRef,
        expiresInDays: freezed == expiresInDays
            ? _self.expiresInDays
            : expiresInDays // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }

  /// Create a copy of InviteRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PersonRefCopyWith<$Res> get person {
    return $PersonRefCopyWith<$Res>(_self.person, (value) {
      return _then(_self.copyWith(person: value));
    });
  }
}
