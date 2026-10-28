// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_version.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScheduleVersion {
  String get id;
  int get weekday;
  String get startTime;
  String get timezone;
  int get durationMinutes;
  DateTime get effectiveFrom;

  /// Create a copy of ScheduleVersion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScheduleVersionCopyWith<ScheduleVersion> get copyWith =>
      _$ScheduleVersionCopyWithImpl<ScheduleVersion>(
        this as ScheduleVersion,
        _$identity,
      );

  /// Serializes this ScheduleVersion to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScheduleVersion &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.weekday, weekday) || other.weekday == weekday) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.effectiveFrom, effectiveFrom) ||
                other.effectiveFrom == effectiveFrom));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    weekday,
    startTime,
    timezone,
    durationMinutes,
    effectiveFrom,
  );

  @override
  String toString() {
    return 'ScheduleVersion(id: $id, weekday: $weekday, startTime: $startTime, timezone: $timezone, durationMinutes: $durationMinutes, effectiveFrom: $effectiveFrom)';
  }
}

/// @nodoc
abstract mixin class $ScheduleVersionCopyWith<$Res> {
  factory $ScheduleVersionCopyWith(
    ScheduleVersion value,
    $Res Function(ScheduleVersion) _then,
  ) = _$ScheduleVersionCopyWithImpl;
  @useResult
  $Res call({
    String id,
    int weekday,
    String startTime,
    String timezone,
    int durationMinutes,
    DateTime effectiveFrom,
  });
}

/// @nodoc
class _$ScheduleVersionCopyWithImpl<$Res>
    implements $ScheduleVersionCopyWith<$Res> {
  _$ScheduleVersionCopyWithImpl(this._self, this._then);

  final ScheduleVersion _self;
  final $Res Function(ScheduleVersion) _then;

  /// Create a copy of ScheduleVersion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? weekday = null,
    Object? startTime = null,
    Object? timezone = null,
    Object? durationMinutes = null,
    Object? effectiveFrom = null,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        weekday: null == weekday
            ? _self.weekday
            : weekday // ignore: cast_nullable_to_non_nullable
                  as int,
        startTime: null == startTime
            ? _self.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as String,
        timezone: null == timezone
            ? _self.timezone
            : timezone // ignore: cast_nullable_to_non_nullable
                  as String,
        durationMinutes: null == durationMinutes
            ? _self.durationMinutes
            : durationMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        effectiveFrom: null == effectiveFrom
            ? _self.effectiveFrom
            : effectiveFrom // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [ScheduleVersion].
extension ScheduleVersionPatterns on ScheduleVersion {
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
    TResult Function(_ScheduleVersion value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ScheduleVersion() when $default != null:
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
    TResult Function(_ScheduleVersion value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScheduleVersion():
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
    TResult? Function(_ScheduleVersion value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScheduleVersion() when $default != null:
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
      String id,
      int weekday,
      String startTime,
      String timezone,
      int durationMinutes,
      DateTime effectiveFrom,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ScheduleVersion() when $default != null:
        return $default(
          _that.id,
          _that.weekday,
          _that.startTime,
          _that.timezone,
          _that.durationMinutes,
          _that.effectiveFrom,
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
      String id,
      int weekday,
      String startTime,
      String timezone,
      int durationMinutes,
      DateTime effectiveFrom,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScheduleVersion():
        return $default(
          _that.id,
          _that.weekday,
          _that.startTime,
          _that.timezone,
          _that.durationMinutes,
          _that.effectiveFrom,
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
      String id,
      int weekday,
      String startTime,
      String timezone,
      int durationMinutes,
      DateTime effectiveFrom,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScheduleVersion() when $default != null:
        return $default(
          _that.id,
          _that.weekday,
          _that.startTime,
          _that.timezone,
          _that.durationMinutes,
          _that.effectiveFrom,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ScheduleVersion extends ScheduleVersion {
  const _ScheduleVersion({
    required this.id,
    required this.weekday,
    required this.startTime,
    required this.timezone,
    required this.durationMinutes,
    required this.effectiveFrom,
  }) : super._();
  factory _ScheduleVersion.fromJson(Map<String, dynamic> json) =>
      _$ScheduleVersionFromJson(json);

  @override
  final String id;
  @override
  final int weekday;
  @override
  final String startTime;
  @override
  final String timezone;
  @override
  final int durationMinutes;
  @override
  final DateTime effectiveFrom;

  /// Create a copy of ScheduleVersion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ScheduleVersionCopyWith<_ScheduleVersion> get copyWith =>
      __$ScheduleVersionCopyWithImpl<_ScheduleVersion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ScheduleVersionToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScheduleVersion &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.weekday, weekday) || other.weekday == weekday) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.effectiveFrom, effectiveFrom) ||
                other.effectiveFrom == effectiveFrom));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    weekday,
    startTime,
    timezone,
    durationMinutes,
    effectiveFrom,
  );

  @override
  String toString() {
    return 'ScheduleVersion(id: $id, weekday: $weekday, startTime: $startTime, timezone: $timezone, durationMinutes: $durationMinutes, effectiveFrom: $effectiveFrom)';
  }
}

/// @nodoc
abstract mixin class _$ScheduleVersionCopyWith<$Res>
    implements $ScheduleVersionCopyWith<$Res> {
  factory _$ScheduleVersionCopyWith(
    _ScheduleVersion value,
    $Res Function(_ScheduleVersion) _then,
  ) = __$ScheduleVersionCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    int weekday,
    String startTime,
    String timezone,
    int durationMinutes,
    DateTime effectiveFrom,
  });
}

/// @nodoc
class __$ScheduleVersionCopyWithImpl<$Res>
    implements _$ScheduleVersionCopyWith<$Res> {
  __$ScheduleVersionCopyWithImpl(this._self, this._then);

  final _ScheduleVersion _self;
  final $Res Function(_ScheduleVersion) _then;

  /// Create a copy of ScheduleVersion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? weekday = null,
    Object? startTime = null,
    Object? timezone = null,
    Object? durationMinutes = null,
    Object? effectiveFrom = null,
  }) {
    return _then(
      _ScheduleVersion(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        weekday: null == weekday
            ? _self.weekday
            : weekday // ignore: cast_nullable_to_non_nullable
                  as int,
        startTime: null == startTime
            ? _self.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as String,
        timezone: null == timezone
            ? _self.timezone
            : timezone // ignore: cast_nullable_to_non_nullable
                  as String,
        durationMinutes: null == durationMinutes
            ? _self.durationMinutes
            : durationMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        effectiveFrom: null == effectiveFrom
            ? _self.effectiveFrom
            : effectiveFrom // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}
