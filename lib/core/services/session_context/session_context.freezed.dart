// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_context.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionContext {
  UserRole get role;
  String? get organizationId;
  String? get organizationName;
  String? get tableId;
  String? get tableName;

  /// Create a copy of SessionContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SessionContextCopyWith<SessionContext> get copyWith =>
      _$SessionContextCopyWithImpl<SessionContext>(
        this as SessionContext,
        _$identity,
      );

  /// Serializes this SessionContext to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SessionContext &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.organizationName, organizationName) ||
                other.organizationName == organizationName) &&
            (identical(other.tableId, tableId) || other.tableId == tableId) &&
            (identical(other.tableName, tableName) ||
                other.tableName == tableName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    role,
    organizationId,
    organizationName,
    tableId,
    tableName,
  );

  @override
  String toString() {
    return 'SessionContext(role: $role, organizationId: $organizationId, organizationName: $organizationName, tableId: $tableId, tableName: $tableName)';
  }
}

/// @nodoc
abstract mixin class $SessionContextCopyWith<$Res> {
  factory $SessionContextCopyWith(
    SessionContext value,
    $Res Function(SessionContext) _then,
  ) = _$SessionContextCopyWithImpl;
  @useResult
  $Res call({
    UserRole role,
    String? organizationId,
    String? organizationName,
    String? tableId,
    String? tableName,
  });
}

/// @nodoc
class _$SessionContextCopyWithImpl<$Res>
    implements $SessionContextCopyWith<$Res> {
  _$SessionContextCopyWithImpl(this._self, this._then);

  final SessionContext _self;
  final $Res Function(SessionContext) _then;

  /// Create a copy of SessionContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? organizationId = freezed,
    Object? organizationName = freezed,
    Object? tableId = freezed,
    Object? tableName = freezed,
  }) {
    return _then(
      _self.copyWith(
        role: null == role
            ? _self.role
            : role // ignore: cast_nullable_to_non_nullable
                  as UserRole,
        organizationId: freezed == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        organizationName: freezed == organizationName
            ? _self.organizationName
            : organizationName // ignore: cast_nullable_to_non_nullable
                  as String?,
        tableId: freezed == tableId
            ? _self.tableId
            : tableId // ignore: cast_nullable_to_non_nullable
                  as String?,
        tableName: freezed == tableName
            ? _self.tableName
            : tableName // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [SessionContext].
extension SessionContextPatterns on SessionContext {
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
    TResult Function(_SessionContext value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SessionContext() when $default != null:
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
    TResult Function(_SessionContext value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionContext():
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
    TResult? Function(_SessionContext value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionContext() when $default != null:
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
      UserRole role,
      String? organizationId,
      String? organizationName,
      String? tableId,
      String? tableName,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SessionContext() when $default != null:
        return $default(
          _that.role,
          _that.organizationId,
          _that.organizationName,
          _that.tableId,
          _that.tableName,
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
      UserRole role,
      String? organizationId,
      String? organizationName,
      String? tableId,
      String? tableName,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionContext():
        return $default(
          _that.role,
          _that.organizationId,
          _that.organizationName,
          _that.tableId,
          _that.tableName,
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
      UserRole role,
      String? organizationId,
      String? organizationName,
      String? tableId,
      String? tableName,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionContext() when $default != null:
        return $default(
          _that.role,
          _that.organizationId,
          _that.organizationName,
          _that.tableId,
          _that.tableName,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SessionContext implements SessionContext {
  const _SessionContext({
    required this.role,
    this.organizationId,
    this.organizationName,
    this.tableId,
    this.tableName,
  });
  factory _SessionContext.fromJson(Map<String, dynamic> json) =>
      _$SessionContextFromJson(json);

  @override
  final UserRole role;
  @override
  final String? organizationId;
  @override
  final String? organizationName;
  @override
  final String? tableId;
  @override
  final String? tableName;

  /// Create a copy of SessionContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SessionContextCopyWith<_SessionContext> get copyWith =>
      __$SessionContextCopyWithImpl<_SessionContext>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SessionContextToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SessionContext &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.organizationName, organizationName) ||
                other.organizationName == organizationName) &&
            (identical(other.tableId, tableId) || other.tableId == tableId) &&
            (identical(other.tableName, tableName) ||
                other.tableName == tableName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    role,
    organizationId,
    organizationName,
    tableId,
    tableName,
  );

  @override
  String toString() {
    return 'SessionContext(role: $role, organizationId: $organizationId, organizationName: $organizationName, tableId: $tableId, tableName: $tableName)';
  }
}

/// @nodoc
abstract mixin class _$SessionContextCopyWith<$Res>
    implements $SessionContextCopyWith<$Res> {
  factory _$SessionContextCopyWith(
    _SessionContext value,
    $Res Function(_SessionContext) _then,
  ) = __$SessionContextCopyWithImpl;
  @override
  @useResult
  $Res call({
    UserRole role,
    String? organizationId,
    String? organizationName,
    String? tableId,
    String? tableName,
  });
}

/// @nodoc
class __$SessionContextCopyWithImpl<$Res>
    implements _$SessionContextCopyWith<$Res> {
  __$SessionContextCopyWithImpl(this._self, this._then);

  final _SessionContext _self;
  final $Res Function(_SessionContext) _then;

  /// Create a copy of SessionContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? role = null,
    Object? organizationId = freezed,
    Object? organizationName = freezed,
    Object? tableId = freezed,
    Object? tableName = freezed,
  }) {
    return _then(
      _SessionContext(
        role: null == role
            ? _self.role
            : role // ignore: cast_nullable_to_non_nullable
                  as UserRole,
        organizationId: freezed == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        organizationName: freezed == organizationName
            ? _self.organizationName
            : organizationName // ignore: cast_nullable_to_non_nullable
                  as String?,
        tableId: freezed == tableId
            ? _self.tableId
            : tableId // ignore: cast_nullable_to_non_nullable
                  as String?,
        tableName: freezed == tableName
            ? _self.tableName
            : tableName // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}
