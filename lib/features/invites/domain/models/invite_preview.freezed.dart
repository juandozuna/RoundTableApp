// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invite_preview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InvitePreview {
  String get code;
  @JsonKey(unknownEnumValue: InviteStatus.pending)
  InviteStatus get status;
  InviteRoleKind get roleKind;
  String get organizationName;
  String? get roundTableName;
  String? get personFirstName;
  String? get invitedByName;
  DateTime? get expiresAt;

  /// Create a copy of InvitePreview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InvitePreviewCopyWith<InvitePreview> get copyWith =>
      _$InvitePreviewCopyWithImpl<InvitePreview>(
        this as InvitePreview,
        _$identity,
      );

  /// Serializes this InvitePreview to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvitePreview &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.roleKind, roleKind) ||
                other.roleKind == roleKind) &&
            (identical(other.organizationName, organizationName) ||
                other.organizationName == organizationName) &&
            (identical(other.roundTableName, roundTableName) ||
                other.roundTableName == roundTableName) &&
            (identical(other.personFirstName, personFirstName) ||
                other.personFirstName == personFirstName) &&
            (identical(other.invitedByName, invitedByName) ||
                other.invitedByName == invitedByName) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    code,
    status,
    roleKind,
    organizationName,
    roundTableName,
    personFirstName,
    invitedByName,
    expiresAt,
  );

  @override
  String toString() {
    return 'InvitePreview(code: $code, status: $status, roleKind: $roleKind, organizationName: $organizationName, roundTableName: $roundTableName, personFirstName: $personFirstName, invitedByName: $invitedByName, expiresAt: $expiresAt)';
  }
}

/// @nodoc
abstract mixin class $InvitePreviewCopyWith<$Res> {
  factory $InvitePreviewCopyWith(
    InvitePreview value,
    $Res Function(InvitePreview) _then,
  ) = _$InvitePreviewCopyWithImpl;
  @useResult
  $Res call({
    String code,
    @JsonKey(unknownEnumValue: InviteStatus.pending) InviteStatus status,
    InviteRoleKind roleKind,
    String organizationName,
    String? roundTableName,
    String? personFirstName,
    String? invitedByName,
    DateTime? expiresAt,
  });
}

/// @nodoc
class _$InvitePreviewCopyWithImpl<$Res>
    implements $InvitePreviewCopyWith<$Res> {
  _$InvitePreviewCopyWithImpl(this._self, this._then);

  final InvitePreview _self;
  final $Res Function(InvitePreview) _then;

  /// Create a copy of InvitePreview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? status = null,
    Object? roleKind = null,
    Object? organizationName = null,
    Object? roundTableName = freezed,
    Object? personFirstName = freezed,
    Object? invitedByName = freezed,
    Object? expiresAt = freezed,
  }) {
    return _then(
      _self.copyWith(
        code: null == code
            ? _self.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as InviteStatus,
        roleKind: null == roleKind
            ? _self.roleKind
            : roleKind // ignore: cast_nullable_to_non_nullable
                  as InviteRoleKind,
        organizationName: null == organizationName
            ? _self.organizationName
            : organizationName // ignore: cast_nullable_to_non_nullable
                  as String,
        roundTableName: freezed == roundTableName
            ? _self.roundTableName
            : roundTableName // ignore: cast_nullable_to_non_nullable
                  as String?,
        personFirstName: freezed == personFirstName
            ? _self.personFirstName
            : personFirstName // ignore: cast_nullable_to_non_nullable
                  as String?,
        invitedByName: freezed == invitedByName
            ? _self.invitedByName
            : invitedByName // ignore: cast_nullable_to_non_nullable
                  as String?,
        expiresAt: freezed == expiresAt
            ? _self.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [InvitePreview].
extension InvitePreviewPatterns on InvitePreview {
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
    TResult Function(_InvitePreview value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvitePreview() when $default != null:
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
    TResult Function(_InvitePreview value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvitePreview():
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
    TResult? Function(_InvitePreview value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvitePreview() when $default != null:
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
      String code,
      @JsonKey(unknownEnumValue: InviteStatus.pending) InviteStatus status,
      InviteRoleKind roleKind,
      String organizationName,
      String? roundTableName,
      String? personFirstName,
      String? invitedByName,
      DateTime? expiresAt,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvitePreview() when $default != null:
        return $default(
          _that.code,
          _that.status,
          _that.roleKind,
          _that.organizationName,
          _that.roundTableName,
          _that.personFirstName,
          _that.invitedByName,
          _that.expiresAt,
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
      String code,
      @JsonKey(unknownEnumValue: InviteStatus.pending) InviteStatus status,
      InviteRoleKind roleKind,
      String organizationName,
      String? roundTableName,
      String? personFirstName,
      String? invitedByName,
      DateTime? expiresAt,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvitePreview():
        return $default(
          _that.code,
          _that.status,
          _that.roleKind,
          _that.organizationName,
          _that.roundTableName,
          _that.personFirstName,
          _that.invitedByName,
          _that.expiresAt,
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
      String code,
      @JsonKey(unknownEnumValue: InviteStatus.pending) InviteStatus status,
      InviteRoleKind roleKind,
      String organizationName,
      String? roundTableName,
      String? personFirstName,
      String? invitedByName,
      DateTime? expiresAt,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvitePreview() when $default != null:
        return $default(
          _that.code,
          _that.status,
          _that.roleKind,
          _that.organizationName,
          _that.roundTableName,
          _that.personFirstName,
          _that.invitedByName,
          _that.expiresAt,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _InvitePreview extends InvitePreview {
  const _InvitePreview({
    required this.code,
    @JsonKey(unknownEnumValue: InviteStatus.pending)
    this.status = InviteStatus.pending,
    required this.roleKind,
    required this.organizationName,
    this.roundTableName,
    this.personFirstName,
    this.invitedByName,
    this.expiresAt,
  }) : super._();
  factory _InvitePreview.fromJson(Map<String, dynamic> json) =>
      _$InvitePreviewFromJson(json);

  @override
  final String code;
  @override
  @JsonKey(unknownEnumValue: InviteStatus.pending)
  final InviteStatus status;
  @override
  final InviteRoleKind roleKind;
  @override
  final String organizationName;
  @override
  final String? roundTableName;
  @override
  final String? personFirstName;
  @override
  final String? invitedByName;
  @override
  final DateTime? expiresAt;

  /// Create a copy of InvitePreview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InvitePreviewCopyWith<_InvitePreview> get copyWith =>
      __$InvitePreviewCopyWithImpl<_InvitePreview>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InvitePreviewToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InvitePreview &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.roleKind, roleKind) ||
                other.roleKind == roleKind) &&
            (identical(other.organizationName, organizationName) ||
                other.organizationName == organizationName) &&
            (identical(other.roundTableName, roundTableName) ||
                other.roundTableName == roundTableName) &&
            (identical(other.personFirstName, personFirstName) ||
                other.personFirstName == personFirstName) &&
            (identical(other.invitedByName, invitedByName) ||
                other.invitedByName == invitedByName) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    code,
    status,
    roleKind,
    organizationName,
    roundTableName,
    personFirstName,
    invitedByName,
    expiresAt,
  );

  @override
  String toString() {
    return 'InvitePreview(code: $code, status: $status, roleKind: $roleKind, organizationName: $organizationName, roundTableName: $roundTableName, personFirstName: $personFirstName, invitedByName: $invitedByName, expiresAt: $expiresAt)';
  }
}

/// @nodoc
abstract mixin class _$InvitePreviewCopyWith<$Res>
    implements $InvitePreviewCopyWith<$Res> {
  factory _$InvitePreviewCopyWith(
    _InvitePreview value,
    $Res Function(_InvitePreview) _then,
  ) = __$InvitePreviewCopyWithImpl;
  @override
  @useResult
  $Res call({
    String code,
    @JsonKey(unknownEnumValue: InviteStatus.pending) InviteStatus status,
    InviteRoleKind roleKind,
    String organizationName,
    String? roundTableName,
    String? personFirstName,
    String? invitedByName,
    DateTime? expiresAt,
  });
}

/// @nodoc
class __$InvitePreviewCopyWithImpl<$Res>
    implements _$InvitePreviewCopyWith<$Res> {
  __$InvitePreviewCopyWithImpl(this._self, this._then);

  final _InvitePreview _self;
  final $Res Function(_InvitePreview) _then;

  /// Create a copy of InvitePreview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? code = null,
    Object? status = null,
    Object? roleKind = null,
    Object? organizationName = null,
    Object? roundTableName = freezed,
    Object? personFirstName = freezed,
    Object? invitedByName = freezed,
    Object? expiresAt = freezed,
  }) {
    return _then(
      _InvitePreview(
        code: null == code
            ? _self.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as InviteStatus,
        roleKind: null == roleKind
            ? _self.roleKind
            : roleKind // ignore: cast_nullable_to_non_nullable
                  as InviteRoleKind,
        organizationName: null == organizationName
            ? _self.organizationName
            : organizationName // ignore: cast_nullable_to_non_nullable
                  as String,
        roundTableName: freezed == roundTableName
            ? _self.roundTableName
            : roundTableName // ignore: cast_nullable_to_non_nullable
                  as String?,
        personFirstName: freezed == personFirstName
            ? _self.personFirstName
            : personFirstName // ignore: cast_nullable_to_non_nullable
                  as String?,
        invitedByName: freezed == invitedByName
            ? _self.invitedByName
            : invitedByName // ignore: cast_nullable_to_non_nullable
                  as String?,
        expiresAt: freezed == expiresAt
            ? _self.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}
