// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upcoming_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpcomingFilter {
  String? get locationId;
  String? get facilitatorId;
  String? get roundTableId;

  /// Create a copy of UpcomingFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpcomingFilterCopyWith<UpcomingFilter> get copyWith =>
      _$UpcomingFilterCopyWithImpl<UpcomingFilter>(
        this as UpcomingFilter,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpcomingFilter &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.facilitatorId, facilitatorId) ||
                other.facilitatorId == facilitatorId) &&
            (identical(other.roundTableId, roundTableId) ||
                other.roundTableId == roundTableId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, locationId, facilitatorId, roundTableId);

  @override
  String toString() {
    return 'UpcomingFilter(locationId: $locationId, facilitatorId: $facilitatorId, roundTableId: $roundTableId)';
  }
}

/// @nodoc
abstract mixin class $UpcomingFilterCopyWith<$Res> {
  factory $UpcomingFilterCopyWith(
    UpcomingFilter value,
    $Res Function(UpcomingFilter) _then,
  ) = _$UpcomingFilterCopyWithImpl;
  @useResult
  $Res call({String? locationId, String? facilitatorId, String? roundTableId});
}

/// @nodoc
class _$UpcomingFilterCopyWithImpl<$Res>
    implements $UpcomingFilterCopyWith<$Res> {
  _$UpcomingFilterCopyWithImpl(this._self, this._then);

  final UpcomingFilter _self;
  final $Res Function(UpcomingFilter) _then;

  /// Create a copy of UpcomingFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationId = freezed,
    Object? facilitatorId = freezed,
    Object? roundTableId = freezed,
  }) {
    return _then(
      _self.copyWith(
        locationId: freezed == locationId
            ? _self.locationId
            : locationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        facilitatorId: freezed == facilitatorId
            ? _self.facilitatorId
            : facilitatorId // ignore: cast_nullable_to_non_nullable
                  as String?,
        roundTableId: freezed == roundTableId
            ? _self.roundTableId
            : roundTableId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [UpcomingFilter].
extension UpcomingFilterPatterns on UpcomingFilter {
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
    TResult Function(_UpcomingFilter value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpcomingFilter() when $default != null:
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
    TResult Function(_UpcomingFilter value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpcomingFilter():
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
    TResult? Function(_UpcomingFilter value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpcomingFilter() when $default != null:
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
      String? locationId,
      String? facilitatorId,
      String? roundTableId,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpcomingFilter() when $default != null:
        return $default(
          _that.locationId,
          _that.facilitatorId,
          _that.roundTableId,
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
      String? locationId,
      String? facilitatorId,
      String? roundTableId,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpcomingFilter():
        return $default(
          _that.locationId,
          _that.facilitatorId,
          _that.roundTableId,
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
      String? locationId,
      String? facilitatorId,
      String? roundTableId,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpcomingFilter() when $default != null:
        return $default(
          _that.locationId,
          _that.facilitatorId,
          _that.roundTableId,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _UpcomingFilter extends UpcomingFilter {
  const _UpcomingFilter({
    this.locationId,
    this.facilitatorId,
    this.roundTableId,
  }) : super._();

  @override
  final String? locationId;
  @override
  final String? facilitatorId;
  @override
  final String? roundTableId;

  /// Create a copy of UpcomingFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpcomingFilterCopyWith<_UpcomingFilter> get copyWith =>
      __$UpcomingFilterCopyWithImpl<_UpcomingFilter>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpcomingFilter &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.facilitatorId, facilitatorId) ||
                other.facilitatorId == facilitatorId) &&
            (identical(other.roundTableId, roundTableId) ||
                other.roundTableId == roundTableId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, locationId, facilitatorId, roundTableId);

  @override
  String toString() {
    return 'UpcomingFilter(locationId: $locationId, facilitatorId: $facilitatorId, roundTableId: $roundTableId)';
  }
}

/// @nodoc
abstract mixin class _$UpcomingFilterCopyWith<$Res>
    implements $UpcomingFilterCopyWith<$Res> {
  factory _$UpcomingFilterCopyWith(
    _UpcomingFilter value,
    $Res Function(_UpcomingFilter) _then,
  ) = __$UpcomingFilterCopyWithImpl;
  @override
  @useResult
  $Res call({String? locationId, String? facilitatorId, String? roundTableId});
}

/// @nodoc
class __$UpcomingFilterCopyWithImpl<$Res>
    implements _$UpcomingFilterCopyWith<$Res> {
  __$UpcomingFilterCopyWithImpl(this._self, this._then);

  final _UpcomingFilter _self;
  final $Res Function(_UpcomingFilter) _then;

  /// Create a copy of UpcomingFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? locationId = freezed,
    Object? facilitatorId = freezed,
    Object? roundTableId = freezed,
  }) {
    return _then(
      _UpcomingFilter(
        locationId: freezed == locationId
            ? _self.locationId
            : locationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        facilitatorId: freezed == facilitatorId
            ? _self.facilitatorId
            : facilitatorId // ignore: cast_nullable_to_non_nullable
                  as String?,
        roundTableId: freezed == roundTableId
            ? _self.roundTableId
            : roundTableId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}
