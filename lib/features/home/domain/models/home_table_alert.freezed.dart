// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_table_alert.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeTableAlert {
  String get tableId;
  String get code;
  String get name;
  List<HealthReason> get reasons;

  /// Create a copy of HomeTableAlert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeTableAlertCopyWith<HomeTableAlert> get copyWith =>
      _$HomeTableAlertCopyWithImpl<HomeTableAlert>(
        this as HomeTableAlert,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeTableAlert &&
            (identical(other.tableId, tableId) || other.tableId == tableId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.reasons, reasons));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    tableId,
    code,
    name,
    const DeepCollectionEquality().hash(reasons),
  );

  @override
  String toString() {
    return 'HomeTableAlert(tableId: $tableId, code: $code, name: $name, reasons: $reasons)';
  }
}

/// @nodoc
abstract mixin class $HomeTableAlertCopyWith<$Res> {
  factory $HomeTableAlertCopyWith(
    HomeTableAlert value,
    $Res Function(HomeTableAlert) _then,
  ) = _$HomeTableAlertCopyWithImpl;
  @useResult
  $Res call({
    String tableId,
    String code,
    String name,
    List<HealthReason> reasons,
  });
}

/// @nodoc
class _$HomeTableAlertCopyWithImpl<$Res>
    implements $HomeTableAlertCopyWith<$Res> {
  _$HomeTableAlertCopyWithImpl(this._self, this._then);

  final HomeTableAlert _self;
  final $Res Function(HomeTableAlert) _then;

  /// Create a copy of HomeTableAlert
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tableId = null,
    Object? code = null,
    Object? name = null,
    Object? reasons = null,
  }) {
    return _then(
      _self.copyWith(
        tableId: null == tableId
            ? _self.tableId
            : tableId // ignore: cast_nullable_to_non_nullable
                  as String,
        code: null == code
            ? _self.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        reasons: null == reasons
            ? _self.reasons
            : reasons // ignore: cast_nullable_to_non_nullable
                  as List<HealthReason>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [HomeTableAlert].
extension HomeTableAlertPatterns on HomeTableAlert {
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
    TResult Function(_HomeTableAlert value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeTableAlert() when $default != null:
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
    TResult Function(_HomeTableAlert value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeTableAlert():
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
    TResult? Function(_HomeTableAlert value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeTableAlert() when $default != null:
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
      String tableId,
      String code,
      String name,
      List<HealthReason> reasons,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeTableAlert() when $default != null:
        return $default(_that.tableId, _that.code, _that.name, _that.reasons);
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
      String tableId,
      String code,
      String name,
      List<HealthReason> reasons,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeTableAlert():
        return $default(_that.tableId, _that.code, _that.name, _that.reasons);
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
      String tableId,
      String code,
      String name,
      List<HealthReason> reasons,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeTableAlert() when $default != null:
        return $default(_that.tableId, _that.code, _that.name, _that.reasons);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _HomeTableAlert implements HomeTableAlert {
  const _HomeTableAlert({
    required this.tableId,
    required this.code,
    required this.name,
    required final List<HealthReason> reasons,
  }) : _reasons = reasons;

  @override
  final String tableId;
  @override
  final String code;
  @override
  final String name;
  final List<HealthReason> _reasons;
  @override
  List<HealthReason> get reasons {
    if (_reasons is EqualUnmodifiableListView) return _reasons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reasons);
  }

  /// Create a copy of HomeTableAlert
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomeTableAlertCopyWith<_HomeTableAlert> get copyWith =>
      __$HomeTableAlertCopyWithImpl<_HomeTableAlert>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeTableAlert &&
            (identical(other.tableId, tableId) || other.tableId == tableId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._reasons, _reasons));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    tableId,
    code,
    name,
    const DeepCollectionEquality().hash(_reasons),
  );

  @override
  String toString() {
    return 'HomeTableAlert(tableId: $tableId, code: $code, name: $name, reasons: $reasons)';
  }
}

/// @nodoc
abstract mixin class _$HomeTableAlertCopyWith<$Res>
    implements $HomeTableAlertCopyWith<$Res> {
  factory _$HomeTableAlertCopyWith(
    _HomeTableAlert value,
    $Res Function(_HomeTableAlert) _then,
  ) = __$HomeTableAlertCopyWithImpl;
  @override
  @useResult
  $Res call({
    String tableId,
    String code,
    String name,
    List<HealthReason> reasons,
  });
}

/// @nodoc
class __$HomeTableAlertCopyWithImpl<$Res>
    implements _$HomeTableAlertCopyWith<$Res> {
  __$HomeTableAlertCopyWithImpl(this._self, this._then);

  final _HomeTableAlert _self;
  final $Res Function(_HomeTableAlert) _then;

  /// Create a copy of HomeTableAlert
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tableId = null,
    Object? code = null,
    Object? name = null,
    Object? reasons = null,
  }) {
    return _then(
      _HomeTableAlert(
        tableId: null == tableId
            ? _self.tableId
            : tableId // ignore: cast_nullable_to_non_nullable
                  as String,
        code: null == code
            ? _self.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        reasons: null == reasons
            ? _self._reasons
            : reasons // ignore: cast_nullable_to_non_nullable
                  as List<HealthReason>,
      ),
    );
  }
}
