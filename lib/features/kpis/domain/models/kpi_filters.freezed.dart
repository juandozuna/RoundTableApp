// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kpi_filters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KpiFilters {
  DateTime? get from;
  DateTime? get to;
  String? get country;
  String? get organizationId;
  String? get locationId;
  String? get roundTableId;
  String? get facilitatorPersonId;
  String? get moduleId;
  String? get valueId;
  String? get health;

  /// Create a copy of KpiFilters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $KpiFiltersCopyWith<KpiFilters> get copyWith =>
      _$KpiFiltersCopyWithImpl<KpiFilters>(this as KpiFilters, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is KpiFilters &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.roundTableId, roundTableId) ||
                other.roundTableId == roundTableId) &&
            (identical(other.facilitatorPersonId, facilitatorPersonId) ||
                other.facilitatorPersonId == facilitatorPersonId) &&
            (identical(other.moduleId, moduleId) ||
                other.moduleId == moduleId) &&
            (identical(other.valueId, valueId) || other.valueId == valueId) &&
            (identical(other.health, health) || other.health == health));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    from,
    to,
    country,
    organizationId,
    locationId,
    roundTableId,
    facilitatorPersonId,
    moduleId,
    valueId,
    health,
  );

  @override
  String toString() {
    return 'KpiFilters(from: $from, to: $to, country: $country, organizationId: $organizationId, locationId: $locationId, roundTableId: $roundTableId, facilitatorPersonId: $facilitatorPersonId, moduleId: $moduleId, valueId: $valueId, health: $health)';
  }
}

/// @nodoc
abstract mixin class $KpiFiltersCopyWith<$Res> {
  factory $KpiFiltersCopyWith(
    KpiFilters value,
    $Res Function(KpiFilters) _then,
  ) = _$KpiFiltersCopyWithImpl;
  @useResult
  $Res call({
    DateTime? from,
    DateTime? to,
    String? country,
    String? organizationId,
    String? locationId,
    String? roundTableId,
    String? facilitatorPersonId,
    String? moduleId,
    String? valueId,
    String? health,
  });
}

/// @nodoc
class _$KpiFiltersCopyWithImpl<$Res> implements $KpiFiltersCopyWith<$Res> {
  _$KpiFiltersCopyWithImpl(this._self, this._then);

  final KpiFilters _self;
  final $Res Function(KpiFilters) _then;

  /// Create a copy of KpiFilters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
    Object? country = freezed,
    Object? organizationId = freezed,
    Object? locationId = freezed,
    Object? roundTableId = freezed,
    Object? facilitatorPersonId = freezed,
    Object? moduleId = freezed,
    Object? valueId = freezed,
    Object? health = freezed,
  }) {
    return _then(
      _self.copyWith(
        from: freezed == from
            ? _self.from
            : from // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        to: freezed == to
            ? _self.to
            : to // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        country: freezed == country
            ? _self.country
            : country // ignore: cast_nullable_to_non_nullable
                  as String?,
        organizationId: freezed == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        locationId: freezed == locationId
            ? _self.locationId
            : locationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        roundTableId: freezed == roundTableId
            ? _self.roundTableId
            : roundTableId // ignore: cast_nullable_to_non_nullable
                  as String?,
        facilitatorPersonId: freezed == facilitatorPersonId
            ? _self.facilitatorPersonId
            : facilitatorPersonId // ignore: cast_nullable_to_non_nullable
                  as String?,
        moduleId: freezed == moduleId
            ? _self.moduleId
            : moduleId // ignore: cast_nullable_to_non_nullable
                  as String?,
        valueId: freezed == valueId
            ? _self.valueId
            : valueId // ignore: cast_nullable_to_non_nullable
                  as String?,
        health: freezed == health
            ? _self.health
            : health // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [KpiFilters].
extension KpiFiltersPatterns on KpiFilters {
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
    TResult Function(_KpiFilters value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _KpiFilters() when $default != null:
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
    TResult Function(_KpiFilters value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KpiFilters():
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
    TResult? Function(_KpiFilters value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KpiFilters() when $default != null:
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
      DateTime? from,
      DateTime? to,
      String? country,
      String? organizationId,
      String? locationId,
      String? roundTableId,
      String? facilitatorPersonId,
      String? moduleId,
      String? valueId,
      String? health,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _KpiFilters() when $default != null:
        return $default(
          _that.from,
          _that.to,
          _that.country,
          _that.organizationId,
          _that.locationId,
          _that.roundTableId,
          _that.facilitatorPersonId,
          _that.moduleId,
          _that.valueId,
          _that.health,
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
      DateTime? from,
      DateTime? to,
      String? country,
      String? organizationId,
      String? locationId,
      String? roundTableId,
      String? facilitatorPersonId,
      String? moduleId,
      String? valueId,
      String? health,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KpiFilters():
        return $default(
          _that.from,
          _that.to,
          _that.country,
          _that.organizationId,
          _that.locationId,
          _that.roundTableId,
          _that.facilitatorPersonId,
          _that.moduleId,
          _that.valueId,
          _that.health,
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
      DateTime? from,
      DateTime? to,
      String? country,
      String? organizationId,
      String? locationId,
      String? roundTableId,
      String? facilitatorPersonId,
      String? moduleId,
      String? valueId,
      String? health,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KpiFilters() when $default != null:
        return $default(
          _that.from,
          _that.to,
          _that.country,
          _that.organizationId,
          _that.locationId,
          _that.roundTableId,
          _that.facilitatorPersonId,
          _that.moduleId,
          _that.valueId,
          _that.health,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _KpiFilters extends KpiFilters {
  const _KpiFilters({
    this.from,
    this.to,
    this.country,
    this.organizationId,
    this.locationId,
    this.roundTableId,
    this.facilitatorPersonId,
    this.moduleId,
    this.valueId,
    this.health,
  }) : super._();

  @override
  final DateTime? from;
  @override
  final DateTime? to;
  @override
  final String? country;
  @override
  final String? organizationId;
  @override
  final String? locationId;
  @override
  final String? roundTableId;
  @override
  final String? facilitatorPersonId;
  @override
  final String? moduleId;
  @override
  final String? valueId;
  @override
  final String? health;

  /// Create a copy of KpiFilters
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$KpiFiltersCopyWith<_KpiFilters> get copyWith =>
      __$KpiFiltersCopyWithImpl<_KpiFilters>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _KpiFilters &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.roundTableId, roundTableId) ||
                other.roundTableId == roundTableId) &&
            (identical(other.facilitatorPersonId, facilitatorPersonId) ||
                other.facilitatorPersonId == facilitatorPersonId) &&
            (identical(other.moduleId, moduleId) ||
                other.moduleId == moduleId) &&
            (identical(other.valueId, valueId) || other.valueId == valueId) &&
            (identical(other.health, health) || other.health == health));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    from,
    to,
    country,
    organizationId,
    locationId,
    roundTableId,
    facilitatorPersonId,
    moduleId,
    valueId,
    health,
  );

  @override
  String toString() {
    return 'KpiFilters(from: $from, to: $to, country: $country, organizationId: $organizationId, locationId: $locationId, roundTableId: $roundTableId, facilitatorPersonId: $facilitatorPersonId, moduleId: $moduleId, valueId: $valueId, health: $health)';
  }
}

/// @nodoc
abstract mixin class _$KpiFiltersCopyWith<$Res>
    implements $KpiFiltersCopyWith<$Res> {
  factory _$KpiFiltersCopyWith(
    _KpiFilters value,
    $Res Function(_KpiFilters) _then,
  ) = __$KpiFiltersCopyWithImpl;
  @override
  @useResult
  $Res call({
    DateTime? from,
    DateTime? to,
    String? country,
    String? organizationId,
    String? locationId,
    String? roundTableId,
    String? facilitatorPersonId,
    String? moduleId,
    String? valueId,
    String? health,
  });
}

/// @nodoc
class __$KpiFiltersCopyWithImpl<$Res> implements _$KpiFiltersCopyWith<$Res> {
  __$KpiFiltersCopyWithImpl(this._self, this._then);

  final _KpiFilters _self;
  final $Res Function(_KpiFilters) _then;

  /// Create a copy of KpiFilters
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
    Object? country = freezed,
    Object? organizationId = freezed,
    Object? locationId = freezed,
    Object? roundTableId = freezed,
    Object? facilitatorPersonId = freezed,
    Object? moduleId = freezed,
    Object? valueId = freezed,
    Object? health = freezed,
  }) {
    return _then(
      _KpiFilters(
        from: freezed == from
            ? _self.from
            : from // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        to: freezed == to
            ? _self.to
            : to // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        country: freezed == country
            ? _self.country
            : country // ignore: cast_nullable_to_non_nullable
                  as String?,
        organizationId: freezed == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        locationId: freezed == locationId
            ? _self.locationId
            : locationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        roundTableId: freezed == roundTableId
            ? _self.roundTableId
            : roundTableId // ignore: cast_nullable_to_non_nullable
                  as String?,
        facilitatorPersonId: freezed == facilitatorPersonId
            ? _self.facilitatorPersonId
            : facilitatorPersonId // ignore: cast_nullable_to_non_nullable
                  as String?,
        moduleId: freezed == moduleId
            ? _self.moduleId
            : moduleId // ignore: cast_nullable_to_non_nullable
                  as String?,
        valueId: freezed == valueId
            ? _self.valueId
            : valueId // ignore: cast_nullable_to_non_nullable
                  as String?,
        health: freezed == health
            ? _self.health
            : health // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}
