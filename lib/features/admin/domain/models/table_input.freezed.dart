// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TableInput {
  String? get locationId;
  String? get name;
  String? get code;
  int? get weekday;
  String? get startTime;
  String? get timezone;
  int? get durationMinutes;
  RoundTableStatus? get status;

  /// Create a copy of TableInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TableInputCopyWith<TableInput> get copyWith =>
      _$TableInputCopyWithImpl<TableInput>(this as TableInput, _$identity);

  /// Serializes this TableInput to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TableInput &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.weekday, weekday) || other.weekday == weekday) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    locationId,
    name,
    code,
    weekday,
    startTime,
    timezone,
    durationMinutes,
    status,
  );

  @override
  String toString() {
    return 'TableInput(locationId: $locationId, name: $name, code: $code, weekday: $weekday, startTime: $startTime, timezone: $timezone, durationMinutes: $durationMinutes, status: $status)';
  }
}

/// @nodoc
abstract mixin class $TableInputCopyWith<$Res> {
  factory $TableInputCopyWith(
    TableInput value,
    $Res Function(TableInput) _then,
  ) = _$TableInputCopyWithImpl;
  @useResult
  $Res call({
    String? locationId,
    String? name,
    String? code,
    int? weekday,
    String? startTime,
    String? timezone,
    int? durationMinutes,
    RoundTableStatus? status,
  });
}

/// @nodoc
class _$TableInputCopyWithImpl<$Res> implements $TableInputCopyWith<$Res> {
  _$TableInputCopyWithImpl(this._self, this._then);

  final TableInput _self;
  final $Res Function(TableInput) _then;

  /// Create a copy of TableInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationId = freezed,
    Object? name = freezed,
    Object? code = freezed,
    Object? weekday = freezed,
    Object? startTime = freezed,
    Object? timezone = freezed,
    Object? durationMinutes = freezed,
    Object? status = freezed,
  }) {
    return _then(
      _self.copyWith(
        locationId: freezed == locationId
            ? _self.locationId
            : locationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        code: freezed == code
            ? _self.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String?,
        weekday: freezed == weekday
            ? _self.weekday
            : weekday // ignore: cast_nullable_to_non_nullable
                  as int?,
        startTime: freezed == startTime
            ? _self.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as String?,
        timezone: freezed == timezone
            ? _self.timezone
            : timezone // ignore: cast_nullable_to_non_nullable
                  as String?,
        durationMinutes: freezed == durationMinutes
            ? _self.durationMinutes
            : durationMinutes // ignore: cast_nullable_to_non_nullable
                  as int?,
        status: freezed == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as RoundTableStatus?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [TableInput].
extension TableInputPatterns on TableInput {
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
    TResult Function(_TableInput value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TableInput() when $default != null:
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
    TResult Function(_TableInput value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableInput():
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
    TResult? Function(_TableInput value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableInput() when $default != null:
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
      String? name,
      String? code,
      int? weekday,
      String? startTime,
      String? timezone,
      int? durationMinutes,
      RoundTableStatus? status,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TableInput() when $default != null:
        return $default(
          _that.locationId,
          _that.name,
          _that.code,
          _that.weekday,
          _that.startTime,
          _that.timezone,
          _that.durationMinutes,
          _that.status,
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
      String? name,
      String? code,
      int? weekday,
      String? startTime,
      String? timezone,
      int? durationMinutes,
      RoundTableStatus? status,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableInput():
        return $default(
          _that.locationId,
          _that.name,
          _that.code,
          _that.weekday,
          _that.startTime,
          _that.timezone,
          _that.durationMinutes,
          _that.status,
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
      String? name,
      String? code,
      int? weekday,
      String? startTime,
      String? timezone,
      int? durationMinutes,
      RoundTableStatus? status,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableInput() when $default != null:
        return $default(
          _that.locationId,
          _that.name,
          _that.code,
          _that.weekday,
          _that.startTime,
          _that.timezone,
          _that.durationMinutes,
          _that.status,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TableInput implements TableInput {
  const _TableInput({
    this.locationId,
    this.name,
    this.code,
    this.weekday,
    this.startTime,
    this.timezone,
    this.durationMinutes,
    this.status,
  });
  factory _TableInput.fromJson(Map<String, dynamic> json) =>
      _$TableInputFromJson(json);

  @override
  final String? locationId;
  @override
  final String? name;
  @override
  final String? code;
  @override
  final int? weekday;
  @override
  final String? startTime;
  @override
  final String? timezone;
  @override
  final int? durationMinutes;
  @override
  final RoundTableStatus? status;

  /// Create a copy of TableInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TableInputCopyWith<_TableInput> get copyWith =>
      __$TableInputCopyWithImpl<_TableInput>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TableInputToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TableInput &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.weekday, weekday) || other.weekday == weekday) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    locationId,
    name,
    code,
    weekday,
    startTime,
    timezone,
    durationMinutes,
    status,
  );

  @override
  String toString() {
    return 'TableInput(locationId: $locationId, name: $name, code: $code, weekday: $weekday, startTime: $startTime, timezone: $timezone, durationMinutes: $durationMinutes, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$TableInputCopyWith<$Res>
    implements $TableInputCopyWith<$Res> {
  factory _$TableInputCopyWith(
    _TableInput value,
    $Res Function(_TableInput) _then,
  ) = __$TableInputCopyWithImpl;
  @override
  @useResult
  $Res call({
    String? locationId,
    String? name,
    String? code,
    int? weekday,
    String? startTime,
    String? timezone,
    int? durationMinutes,
    RoundTableStatus? status,
  });
}

/// @nodoc
class __$TableInputCopyWithImpl<$Res> implements _$TableInputCopyWith<$Res> {
  __$TableInputCopyWithImpl(this._self, this._then);

  final _TableInput _self;
  final $Res Function(_TableInput) _then;

  /// Create a copy of TableInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? locationId = freezed,
    Object? name = freezed,
    Object? code = freezed,
    Object? weekday = freezed,
    Object? startTime = freezed,
    Object? timezone = freezed,
    Object? durationMinutes = freezed,
    Object? status = freezed,
  }) {
    return _then(
      _TableInput(
        locationId: freezed == locationId
            ? _self.locationId
            : locationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        code: freezed == code
            ? _self.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String?,
        weekday: freezed == weekday
            ? _self.weekday
            : weekday // ignore: cast_nullable_to_non_nullable
                  as int?,
        startTime: freezed == startTime
            ? _self.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as String?,
        timezone: freezed == timezone
            ? _self.timezone
            : timezone // ignore: cast_nullable_to_non_nullable
                  as String?,
        durationMinutes: freezed == durationMinutes
            ? _self.durationMinutes
            : durationMinutes // ignore: cast_nullable_to_non_nullable
                  as int?,
        status: freezed == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as RoundTableStatus?,
      ),
    );
  }
}
