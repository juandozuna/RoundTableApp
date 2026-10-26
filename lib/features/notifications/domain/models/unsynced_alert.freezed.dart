// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unsynced_alert.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UnsyncedAlert {
  int get pendingCount;
  DateTime? get since;

  /// Create a copy of UnsyncedAlert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UnsyncedAlertCopyWith<UnsyncedAlert> get copyWith =>
      _$UnsyncedAlertCopyWithImpl<UnsyncedAlert>(
        this as UnsyncedAlert,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnsyncedAlert &&
            (identical(other.pendingCount, pendingCount) ||
                other.pendingCount == pendingCount) &&
            (identical(other.since, since) || other.since == since));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pendingCount, since);

  @override
  String toString() {
    return 'UnsyncedAlert(pendingCount: $pendingCount, since: $since)';
  }
}

/// @nodoc
abstract mixin class $UnsyncedAlertCopyWith<$Res> {
  factory $UnsyncedAlertCopyWith(
    UnsyncedAlert value,
    $Res Function(UnsyncedAlert) _then,
  ) = _$UnsyncedAlertCopyWithImpl;
  @useResult
  $Res call({int pendingCount, DateTime? since});
}

/// @nodoc
class _$UnsyncedAlertCopyWithImpl<$Res>
    implements $UnsyncedAlertCopyWith<$Res> {
  _$UnsyncedAlertCopyWithImpl(this._self, this._then);

  final UnsyncedAlert _self;
  final $Res Function(UnsyncedAlert) _then;

  /// Create a copy of UnsyncedAlert
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? pendingCount = null, Object? since = freezed}) {
    return _then(
      _self.copyWith(
        pendingCount: null == pendingCount
            ? _self.pendingCount
            : pendingCount // ignore: cast_nullable_to_non_nullable
                  as int,
        since: freezed == since
            ? _self.since
            : since // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [UnsyncedAlert].
extension UnsyncedAlertPatterns on UnsyncedAlert {
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
    TResult Function(_UnsyncedAlert value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UnsyncedAlert() when $default != null:
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
    TResult Function(_UnsyncedAlert value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UnsyncedAlert():
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
    TResult? Function(_UnsyncedAlert value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UnsyncedAlert() when $default != null:
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
    TResult Function(int pendingCount, DateTime? since)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UnsyncedAlert() when $default != null:
        return $default(_that.pendingCount, _that.since);
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
    TResult Function(int pendingCount, DateTime? since) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UnsyncedAlert():
        return $default(_that.pendingCount, _that.since);
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
    TResult? Function(int pendingCount, DateTime? since)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UnsyncedAlert() when $default != null:
        return $default(_that.pendingCount, _that.since);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _UnsyncedAlert implements UnsyncedAlert {
  const _UnsyncedAlert({required this.pendingCount, this.since});

  @override
  final int pendingCount;
  @override
  final DateTime? since;

  /// Create a copy of UnsyncedAlert
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UnsyncedAlertCopyWith<_UnsyncedAlert> get copyWith =>
      __$UnsyncedAlertCopyWithImpl<_UnsyncedAlert>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnsyncedAlert &&
            (identical(other.pendingCount, pendingCount) ||
                other.pendingCount == pendingCount) &&
            (identical(other.since, since) || other.since == since));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pendingCount, since);

  @override
  String toString() {
    return 'UnsyncedAlert(pendingCount: $pendingCount, since: $since)';
  }
}

/// @nodoc
abstract mixin class _$UnsyncedAlertCopyWith<$Res>
    implements $UnsyncedAlertCopyWith<$Res> {
  factory _$UnsyncedAlertCopyWith(
    _UnsyncedAlert value,
    $Res Function(_UnsyncedAlert) _then,
  ) = __$UnsyncedAlertCopyWithImpl;
  @override
  @useResult
  $Res call({int pendingCount, DateTime? since});
}

/// @nodoc
class __$UnsyncedAlertCopyWithImpl<$Res>
    implements _$UnsyncedAlertCopyWith<$Res> {
  __$UnsyncedAlertCopyWithImpl(this._self, this._then);

  final _UnsyncedAlert _self;
  final $Res Function(_UnsyncedAlert) _then;

  /// Create a copy of UnsyncedAlert
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? pendingCount = null, Object? since = freezed}) {
    return _then(
      _UnsyncedAlert(
        pendingCount: null == pendingCount
            ? _self.pendingCount
            : pendingCount // ignore: cast_nullable_to_non_nullable
                  as int,
        since: freezed == since
            ? _self.since
            : since // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}
