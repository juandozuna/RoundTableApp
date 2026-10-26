// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_filters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReportFilters {
  int get periodWeeks;
  String? get country;
  String? get organizationId;
  String? get locationId;
  String? get roundTableId;
  String? get facilitatorPersonId;
  String? get moduleId;

  /// Create a copy of ReportFilters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReportFiltersCopyWith<ReportFilters> get copyWith =>
      _$ReportFiltersCopyWithImpl<ReportFilters>(
        this as ReportFilters,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReportFilters &&
            (identical(other.periodWeeks, periodWeeks) ||
                other.periodWeeks == periodWeeks) &&
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
                other.moduleId == moduleId));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    periodWeeks,
    country,
    organizationId,
    locationId,
    roundTableId,
    facilitatorPersonId,
    moduleId,
  );

  @override
  String toString() {
    return 'ReportFilters(periodWeeks: $periodWeeks, country: $country, organizationId: $organizationId, locationId: $locationId, roundTableId: $roundTableId, facilitatorPersonId: $facilitatorPersonId, moduleId: $moduleId)';
  }
}

/// @nodoc
abstract mixin class $ReportFiltersCopyWith<$Res> {
  factory $ReportFiltersCopyWith(
    ReportFilters value,
    $Res Function(ReportFilters) _then,
  ) = _$ReportFiltersCopyWithImpl;
  @useResult
  $Res call({
    int periodWeeks,
    String? country,
    String? organizationId,
    String? locationId,
    String? roundTableId,
    String? facilitatorPersonId,
    String? moduleId,
  });
}

/// @nodoc
class _$ReportFiltersCopyWithImpl<$Res>
    implements $ReportFiltersCopyWith<$Res> {
  _$ReportFiltersCopyWithImpl(this._self, this._then);

  final ReportFilters _self;
  final $Res Function(ReportFilters) _then;

  /// Create a copy of ReportFilters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? periodWeeks = null,
    Object? country = freezed,
    Object? organizationId = freezed,
    Object? locationId = freezed,
    Object? roundTableId = freezed,
    Object? facilitatorPersonId = freezed,
    Object? moduleId = freezed,
  }) {
    return _then(
      _self.copyWith(
        periodWeeks: null == periodWeeks
            ? _self.periodWeeks
            : periodWeeks // ignore: cast_nullable_to_non_nullable
                  as int,
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
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [ReportFilters].
extension ReportFiltersPatterns on ReportFilters {
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
    TResult Function(_ReportFilters value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReportFilters() when $default != null:
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
    TResult Function(_ReportFilters value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportFilters():
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
    TResult? Function(_ReportFilters value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportFilters() when $default != null:
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
      int periodWeeks,
      String? country,
      String? organizationId,
      String? locationId,
      String? roundTableId,
      String? facilitatorPersonId,
      String? moduleId,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReportFilters() when $default != null:
        return $default(
          _that.periodWeeks,
          _that.country,
          _that.organizationId,
          _that.locationId,
          _that.roundTableId,
          _that.facilitatorPersonId,
          _that.moduleId,
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
      int periodWeeks,
      String? country,
      String? organizationId,
      String? locationId,
      String? roundTableId,
      String? facilitatorPersonId,
      String? moduleId,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportFilters():
        return $default(
          _that.periodWeeks,
          _that.country,
          _that.organizationId,
          _that.locationId,
          _that.roundTableId,
          _that.facilitatorPersonId,
          _that.moduleId,
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
      int periodWeeks,
      String? country,
      String? organizationId,
      String? locationId,
      String? roundTableId,
      String? facilitatorPersonId,
      String? moduleId,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReportFilters() when $default != null:
        return $default(
          _that.periodWeeks,
          _that.country,
          _that.organizationId,
          _that.locationId,
          _that.roundTableId,
          _that.facilitatorPersonId,
          _that.moduleId,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ReportFilters extends ReportFilters {
  const _ReportFilters({
    this.periodWeeks = ReportFilters.defaultPeriodWeeks,
    this.country,
    this.organizationId,
    this.locationId,
    this.roundTableId,
    this.facilitatorPersonId,
    this.moduleId,
  }) : super._();

  @override
  @JsonKey()
  final int periodWeeks;
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

  /// Create a copy of ReportFilters
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReportFiltersCopyWith<_ReportFilters> get copyWith =>
      __$ReportFiltersCopyWithImpl<_ReportFilters>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReportFilters &&
            (identical(other.periodWeeks, periodWeeks) ||
                other.periodWeeks == periodWeeks) &&
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
                other.moduleId == moduleId));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    periodWeeks,
    country,
    organizationId,
    locationId,
    roundTableId,
    facilitatorPersonId,
    moduleId,
  );

  @override
  String toString() {
    return 'ReportFilters(periodWeeks: $periodWeeks, country: $country, organizationId: $organizationId, locationId: $locationId, roundTableId: $roundTableId, facilitatorPersonId: $facilitatorPersonId, moduleId: $moduleId)';
  }
}

/// @nodoc
abstract mixin class _$ReportFiltersCopyWith<$Res>
    implements $ReportFiltersCopyWith<$Res> {
  factory _$ReportFiltersCopyWith(
    _ReportFilters value,
    $Res Function(_ReportFilters) _then,
  ) = __$ReportFiltersCopyWithImpl;
  @override
  @useResult
  $Res call({
    int periodWeeks,
    String? country,
    String? organizationId,
    String? locationId,
    String? roundTableId,
    String? facilitatorPersonId,
    String? moduleId,
  });
}

/// @nodoc
class __$ReportFiltersCopyWithImpl<$Res>
    implements _$ReportFiltersCopyWith<$Res> {
  __$ReportFiltersCopyWithImpl(this._self, this._then);

  final _ReportFilters _self;
  final $Res Function(_ReportFilters) _then;

  /// Create a copy of ReportFilters
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? periodWeeks = null,
    Object? country = freezed,
    Object? organizationId = freezed,
    Object? locationId = freezed,
    Object? roundTableId = freezed,
    Object? facilitatorPersonId = freezed,
    Object? moduleId = freezed,
  }) {
    return _then(
      _ReportFilters(
        periodWeeks: null == periodWeeks
            ? _self.periodWeeks
            : periodWeeks // ignore: cast_nullable_to_non_nullable
                  as int,
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
      ),
    );
  }
}
