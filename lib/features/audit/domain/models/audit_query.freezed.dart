// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audit_query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuditQuery {
  AuditCategory? get category;
  String? get organizationId;
  int get limit;

  /// Create a copy of AuditQuery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuditQueryCopyWith<AuditQuery> get copyWith =>
      _$AuditQueryCopyWithImpl<AuditQuery>(this as AuditQuery, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuditQuery &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category, organizationId, limit);

  @override
  String toString() {
    return 'AuditQuery(category: $category, organizationId: $organizationId, limit: $limit)';
  }
}

/// @nodoc
abstract mixin class $AuditQueryCopyWith<$Res> {
  factory $AuditQueryCopyWith(
    AuditQuery value,
    $Res Function(AuditQuery) _then,
  ) = _$AuditQueryCopyWithImpl;
  @useResult
  $Res call({AuditCategory? category, String? organizationId, int limit});
}

/// @nodoc
class _$AuditQueryCopyWithImpl<$Res> implements $AuditQueryCopyWith<$Res> {
  _$AuditQueryCopyWithImpl(this._self, this._then);

  final AuditQuery _self;
  final $Res Function(AuditQuery) _then;

  /// Create a copy of AuditQuery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
    Object? organizationId = freezed,
    Object? limit = null,
  }) {
    return _then(
      _self.copyWith(
        category: freezed == category
            ? _self.category
            : category // ignore: cast_nullable_to_non_nullable
                  as AuditCategory?,
        organizationId: freezed == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        limit: null == limit
            ? _self.limit
            : limit // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [AuditQuery].
extension AuditQueryPatterns on AuditQuery {
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
    TResult Function(_AuditQuery value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuditQuery() when $default != null:
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
    TResult Function(_AuditQuery value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuditQuery():
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
    TResult? Function(_AuditQuery value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuditQuery() when $default != null:
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
      AuditCategory? category,
      String? organizationId,
      int limit,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuditQuery() when $default != null:
        return $default(_that.category, _that.organizationId, _that.limit);
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
    TResult Function(AuditCategory? category, String? organizationId, int limit)
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuditQuery():
        return $default(_that.category, _that.organizationId, _that.limit);
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
      AuditCategory? category,
      String? organizationId,
      int limit,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuditQuery() when $default != null:
        return $default(_that.category, _that.organizationId, _that.limit);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AuditQuery implements AuditQuery {
  const _AuditQuery({this.category, this.organizationId, this.limit = 100});

  @override
  final AuditCategory? category;
  @override
  final String? organizationId;
  @override
  @JsonKey()
  final int limit;

  /// Create a copy of AuditQuery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuditQueryCopyWith<_AuditQuery> get copyWith =>
      __$AuditQueryCopyWithImpl<_AuditQuery>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuditQuery &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category, organizationId, limit);

  @override
  String toString() {
    return 'AuditQuery(category: $category, organizationId: $organizationId, limit: $limit)';
  }
}

/// @nodoc
abstract mixin class _$AuditQueryCopyWith<$Res>
    implements $AuditQueryCopyWith<$Res> {
  factory _$AuditQueryCopyWith(
    _AuditQuery value,
    $Res Function(_AuditQuery) _then,
  ) = __$AuditQueryCopyWithImpl;
  @override
  @useResult
  $Res call({AuditCategory? category, String? organizationId, int limit});
}

/// @nodoc
class __$AuditQueryCopyWithImpl<$Res> implements _$AuditQueryCopyWith<$Res> {
  __$AuditQueryCopyWithImpl(this._self, this._then);

  final _AuditQuery _self;
  final $Res Function(_AuditQuery) _then;

  /// Create a copy of AuditQuery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? category = freezed,
    Object? organizationId = freezed,
    Object? limit = null,
  }) {
    return _then(
      _AuditQuery(
        category: freezed == category
            ? _self.category
            : category // ignore: cast_nullable_to_non_nullable
                  as AuditCategory?,
        organizationId: freezed == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        limit: null == limit
            ? _self.limit
            : limit // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}
