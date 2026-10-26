// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_context.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountContext {
  UserRole get kind;
  String get personId;
  String? get organizationId;
  String? get organizationName;
  String? get roundTableId;
  String? get roundTableName;
  String? get roundTableCode;
  String get label;

  /// Create a copy of AccountContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AccountContextCopyWith<AccountContext> get copyWith =>
      _$AccountContextCopyWithImpl<AccountContext>(
        this as AccountContext,
        _$identity,
      );

  /// Serializes this AccountContext to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AccountContext &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.personId, personId) ||
                other.personId == personId) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.organizationName, organizationName) ||
                other.organizationName == organizationName) &&
            (identical(other.roundTableId, roundTableId) ||
                other.roundTableId == roundTableId) &&
            (identical(other.roundTableName, roundTableName) ||
                other.roundTableName == roundTableName) &&
            (identical(other.roundTableCode, roundTableCode) ||
                other.roundTableCode == roundTableCode) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    kind,
    personId,
    organizationId,
    organizationName,
    roundTableId,
    roundTableName,
    roundTableCode,
    label,
  );

  @override
  String toString() {
    return 'AccountContext(kind: $kind, personId: $personId, organizationId: $organizationId, organizationName: $organizationName, roundTableId: $roundTableId, roundTableName: $roundTableName, roundTableCode: $roundTableCode, label: $label)';
  }
}

/// @nodoc
abstract mixin class $AccountContextCopyWith<$Res> {
  factory $AccountContextCopyWith(
    AccountContext value,
    $Res Function(AccountContext) _then,
  ) = _$AccountContextCopyWithImpl;
  @useResult
  $Res call({
    UserRole kind,
    String personId,
    String? organizationId,
    String? organizationName,
    String? roundTableId,
    String? roundTableName,
    String? roundTableCode,
    String label,
  });
}

/// @nodoc
class _$AccountContextCopyWithImpl<$Res>
    implements $AccountContextCopyWith<$Res> {
  _$AccountContextCopyWithImpl(this._self, this._then);

  final AccountContext _self;
  final $Res Function(AccountContext) _then;

  /// Create a copy of AccountContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kind = null,
    Object? personId = null,
    Object? organizationId = freezed,
    Object? organizationName = freezed,
    Object? roundTableId = freezed,
    Object? roundTableName = freezed,
    Object? roundTableCode = freezed,
    Object? label = null,
  }) {
    return _then(
      _self.copyWith(
        kind: null == kind
            ? _self.kind
            : kind // ignore: cast_nullable_to_non_nullable
                  as UserRole,
        personId: null == personId
            ? _self.personId
            : personId // ignore: cast_nullable_to_non_nullable
                  as String,
        organizationId: freezed == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        organizationName: freezed == organizationName
            ? _self.organizationName
            : organizationName // ignore: cast_nullable_to_non_nullable
                  as String?,
        roundTableId: freezed == roundTableId
            ? _self.roundTableId
            : roundTableId // ignore: cast_nullable_to_non_nullable
                  as String?,
        roundTableName: freezed == roundTableName
            ? _self.roundTableName
            : roundTableName // ignore: cast_nullable_to_non_nullable
                  as String?,
        roundTableCode: freezed == roundTableCode
            ? _self.roundTableCode
            : roundTableCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        label: null == label
            ? _self.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [AccountContext].
extension AccountContextPatterns on AccountContext {
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
    TResult Function(_AccountContext value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AccountContext() when $default != null:
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
    TResult Function(_AccountContext value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AccountContext():
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
    TResult? Function(_AccountContext value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AccountContext() when $default != null:
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
      UserRole kind,
      String personId,
      String? organizationId,
      String? organizationName,
      String? roundTableId,
      String? roundTableName,
      String? roundTableCode,
      String label,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AccountContext() when $default != null:
        return $default(
          _that.kind,
          _that.personId,
          _that.organizationId,
          _that.organizationName,
          _that.roundTableId,
          _that.roundTableName,
          _that.roundTableCode,
          _that.label,
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
      UserRole kind,
      String personId,
      String? organizationId,
      String? organizationName,
      String? roundTableId,
      String? roundTableName,
      String? roundTableCode,
      String label,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AccountContext():
        return $default(
          _that.kind,
          _that.personId,
          _that.organizationId,
          _that.organizationName,
          _that.roundTableId,
          _that.roundTableName,
          _that.roundTableCode,
          _that.label,
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
      UserRole kind,
      String personId,
      String? organizationId,
      String? organizationName,
      String? roundTableId,
      String? roundTableName,
      String? roundTableCode,
      String label,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AccountContext() when $default != null:
        return $default(
          _that.kind,
          _that.personId,
          _that.organizationId,
          _that.organizationName,
          _that.roundTableId,
          _that.roundTableName,
          _that.roundTableCode,
          _that.label,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AccountContext extends AccountContext {
  const _AccountContext({
    required this.kind,
    required this.personId,
    this.organizationId,
    this.organizationName,
    this.roundTableId,
    this.roundTableName,
    this.roundTableCode,
    this.label = '',
  }) : super._();
  factory _AccountContext.fromJson(Map<String, dynamic> json) =>
      _$AccountContextFromJson(json);

  @override
  final UserRole kind;
  @override
  final String personId;
  @override
  final String? organizationId;
  @override
  final String? organizationName;
  @override
  final String? roundTableId;
  @override
  final String? roundTableName;
  @override
  final String? roundTableCode;
  @override
  @JsonKey()
  final String label;

  /// Create a copy of AccountContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AccountContextCopyWith<_AccountContext> get copyWith =>
      __$AccountContextCopyWithImpl<_AccountContext>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AccountContextToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AccountContext &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.personId, personId) ||
                other.personId == personId) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.organizationName, organizationName) ||
                other.organizationName == organizationName) &&
            (identical(other.roundTableId, roundTableId) ||
                other.roundTableId == roundTableId) &&
            (identical(other.roundTableName, roundTableName) ||
                other.roundTableName == roundTableName) &&
            (identical(other.roundTableCode, roundTableCode) ||
                other.roundTableCode == roundTableCode) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    kind,
    personId,
    organizationId,
    organizationName,
    roundTableId,
    roundTableName,
    roundTableCode,
    label,
  );

  @override
  String toString() {
    return 'AccountContext(kind: $kind, personId: $personId, organizationId: $organizationId, organizationName: $organizationName, roundTableId: $roundTableId, roundTableName: $roundTableName, roundTableCode: $roundTableCode, label: $label)';
  }
}

/// @nodoc
abstract mixin class _$AccountContextCopyWith<$Res>
    implements $AccountContextCopyWith<$Res> {
  factory _$AccountContextCopyWith(
    _AccountContext value,
    $Res Function(_AccountContext) _then,
  ) = __$AccountContextCopyWithImpl;
  @override
  @useResult
  $Res call({
    UserRole kind,
    String personId,
    String? organizationId,
    String? organizationName,
    String? roundTableId,
    String? roundTableName,
    String? roundTableCode,
    String label,
  });
}

/// @nodoc
class __$AccountContextCopyWithImpl<$Res>
    implements _$AccountContextCopyWith<$Res> {
  __$AccountContextCopyWithImpl(this._self, this._then);

  final _AccountContext _self;
  final $Res Function(_AccountContext) _then;

  /// Create a copy of AccountContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? kind = null,
    Object? personId = null,
    Object? organizationId = freezed,
    Object? organizationName = freezed,
    Object? roundTableId = freezed,
    Object? roundTableName = freezed,
    Object? roundTableCode = freezed,
    Object? label = null,
  }) {
    return _then(
      _AccountContext(
        kind: null == kind
            ? _self.kind
            : kind // ignore: cast_nullable_to_non_nullable
                  as UserRole,
        personId: null == personId
            ? _self.personId
            : personId // ignore: cast_nullable_to_non_nullable
                  as String,
        organizationId: freezed == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        organizationName: freezed == organizationName
            ? _self.organizationName
            : organizationName // ignore: cast_nullable_to_non_nullable
                  as String?,
        roundTableId: freezed == roundTableId
            ? _self.roundTableId
            : roundTableId // ignore: cast_nullable_to_non_nullable
                  as String?,
        roundTableName: freezed == roundTableName
            ? _self.roundTableName
            : roundTableName // ignore: cast_nullable_to_non_nullable
                  as String?,
        roundTableCode: freezed == roundTableCode
            ? _self.roundTableCode
            : roundTableCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        label: null == label
            ? _self.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}
