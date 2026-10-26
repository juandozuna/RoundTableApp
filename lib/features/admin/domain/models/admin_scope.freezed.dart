// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_scope.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdminScope {
  bool get isAdministrator;
  String? get organizationId;
  String? get organizationName;

  /// Create a copy of AdminScope
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AdminScopeCopyWith<AdminScope> get copyWith =>
      _$AdminScopeCopyWithImpl<AdminScope>(this as AdminScope, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AdminScope &&
            (identical(other.isAdministrator, isAdministrator) ||
                other.isAdministrator == isAdministrator) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.organizationName, organizationName) ||
                other.organizationName == organizationName));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isAdministrator,
    organizationId,
    organizationName,
  );

  @override
  String toString() {
    return 'AdminScope(isAdministrator: $isAdministrator, organizationId: $organizationId, organizationName: $organizationName)';
  }
}

/// @nodoc
abstract mixin class $AdminScopeCopyWith<$Res> {
  factory $AdminScopeCopyWith(
    AdminScope value,
    $Res Function(AdminScope) _then,
  ) = _$AdminScopeCopyWithImpl;
  @useResult
  $Res call({
    bool isAdministrator,
    String? organizationId,
    String? organizationName,
  });
}

/// @nodoc
class _$AdminScopeCopyWithImpl<$Res> implements $AdminScopeCopyWith<$Res> {
  _$AdminScopeCopyWithImpl(this._self, this._then);

  final AdminScope _self;
  final $Res Function(AdminScope) _then;

  /// Create a copy of AdminScope
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAdministrator = null,
    Object? organizationId = freezed,
    Object? organizationName = freezed,
  }) {
    return _then(
      _self.copyWith(
        isAdministrator: null == isAdministrator
            ? _self.isAdministrator
            : isAdministrator // ignore: cast_nullable_to_non_nullable
                  as bool,
        organizationId: freezed == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        organizationName: freezed == organizationName
            ? _self.organizationName
            : organizationName // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [AdminScope].
extension AdminScopePatterns on AdminScope {
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
    TResult Function(_AdminScope value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdminScope() when $default != null:
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
    TResult Function(_AdminScope value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminScope():
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
    TResult? Function(_AdminScope value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminScope() when $default != null:
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
      bool isAdministrator,
      String? organizationId,
      String? organizationName,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdminScope() when $default != null:
        return $default(
          _that.isAdministrator,
          _that.organizationId,
          _that.organizationName,
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
      bool isAdministrator,
      String? organizationId,
      String? organizationName,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminScope():
        return $default(
          _that.isAdministrator,
          _that.organizationId,
          _that.organizationName,
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
      bool isAdministrator,
      String? organizationId,
      String? organizationName,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminScope() when $default != null:
        return $default(
          _that.isAdministrator,
          _that.organizationId,
          _that.organizationName,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AdminScope extends AdminScope {
  const _AdminScope({
    required this.isAdministrator,
    this.organizationId,
    this.organizationName,
  }) : super._();

  @override
  final bool isAdministrator;
  @override
  final String? organizationId;
  @override
  final String? organizationName;

  /// Create a copy of AdminScope
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AdminScopeCopyWith<_AdminScope> get copyWith =>
      __$AdminScopeCopyWithImpl<_AdminScope>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AdminScope &&
            (identical(other.isAdministrator, isAdministrator) ||
                other.isAdministrator == isAdministrator) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.organizationName, organizationName) ||
                other.organizationName == organizationName));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isAdministrator,
    organizationId,
    organizationName,
  );

  @override
  String toString() {
    return 'AdminScope(isAdministrator: $isAdministrator, organizationId: $organizationId, organizationName: $organizationName)';
  }
}

/// @nodoc
abstract mixin class _$AdminScopeCopyWith<$Res>
    implements $AdminScopeCopyWith<$Res> {
  factory _$AdminScopeCopyWith(
    _AdminScope value,
    $Res Function(_AdminScope) _then,
  ) = __$AdminScopeCopyWithImpl;
  @override
  @useResult
  $Res call({
    bool isAdministrator,
    String? organizationId,
    String? organizationName,
  });
}

/// @nodoc
class __$AdminScopeCopyWithImpl<$Res> implements _$AdminScopeCopyWith<$Res> {
  __$AdminScopeCopyWithImpl(this._self, this._then);

  final _AdminScope _self;
  final $Res Function(_AdminScope) _then;

  /// Create a copy of AdminScope
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isAdministrator = null,
    Object? organizationId = freezed,
    Object? organizationName = freezed,
  }) {
    return _then(
      _AdminScope(
        isAdministrator: null == isAdministrator
            ? _self.isAdministrator
            : isAdministrator // ignore: cast_nullable_to_non_nullable
                  as bool,
        organizationId: freezed == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        organizationName: freezed == organizationName
            ? _self.organizationName
            : organizationName // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}
