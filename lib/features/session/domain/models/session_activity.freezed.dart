// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_activity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionActivity {
  String get personName;
  SessionActivityKind get kind;
  DateTime get at;
  bool get syncedLate;
  bool get autoAttendance;

  /// Create a copy of SessionActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SessionActivityCopyWith<SessionActivity> get copyWith =>
      _$SessionActivityCopyWithImpl<SessionActivity>(
        this as SessionActivity,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SessionActivity &&
            (identical(other.personName, personName) ||
                other.personName == personName) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.at, at) || other.at == at) &&
            (identical(other.syncedLate, syncedLate) ||
                other.syncedLate == syncedLate) &&
            (identical(other.autoAttendance, autoAttendance) ||
                other.autoAttendance == autoAttendance));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    personName,
    kind,
    at,
    syncedLate,
    autoAttendance,
  );

  @override
  String toString() {
    return 'SessionActivity(personName: $personName, kind: $kind, at: $at, syncedLate: $syncedLate, autoAttendance: $autoAttendance)';
  }
}

/// @nodoc
abstract mixin class $SessionActivityCopyWith<$Res> {
  factory $SessionActivityCopyWith(
    SessionActivity value,
    $Res Function(SessionActivity) _then,
  ) = _$SessionActivityCopyWithImpl;
  @useResult
  $Res call({
    String personName,
    SessionActivityKind kind,
    DateTime at,
    bool syncedLate,
    bool autoAttendance,
  });
}

/// @nodoc
class _$SessionActivityCopyWithImpl<$Res>
    implements $SessionActivityCopyWith<$Res> {
  _$SessionActivityCopyWithImpl(this._self, this._then);

  final SessionActivity _self;
  final $Res Function(SessionActivity) _then;

  /// Create a copy of SessionActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? personName = null,
    Object? kind = null,
    Object? at = null,
    Object? syncedLate = null,
    Object? autoAttendance = null,
  }) {
    return _then(
      _self.copyWith(
        personName: null == personName
            ? _self.personName
            : personName // ignore: cast_nullable_to_non_nullable
                  as String,
        kind: null == kind
            ? _self.kind
            : kind // ignore: cast_nullable_to_non_nullable
                  as SessionActivityKind,
        at: null == at
            ? _self.at
            : at // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        syncedLate: null == syncedLate
            ? _self.syncedLate
            : syncedLate // ignore: cast_nullable_to_non_nullable
                  as bool,
        autoAttendance: null == autoAttendance
            ? _self.autoAttendance
            : autoAttendance // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [SessionActivity].
extension SessionActivityPatterns on SessionActivity {
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
    TResult Function(_SessionActivity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SessionActivity() when $default != null:
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
    TResult Function(_SessionActivity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionActivity():
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
    TResult? Function(_SessionActivity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionActivity() when $default != null:
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
      String personName,
      SessionActivityKind kind,
      DateTime at,
      bool syncedLate,
      bool autoAttendance,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SessionActivity() when $default != null:
        return $default(
          _that.personName,
          _that.kind,
          _that.at,
          _that.syncedLate,
          _that.autoAttendance,
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
      String personName,
      SessionActivityKind kind,
      DateTime at,
      bool syncedLate,
      bool autoAttendance,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionActivity():
        return $default(
          _that.personName,
          _that.kind,
          _that.at,
          _that.syncedLate,
          _that.autoAttendance,
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
      String personName,
      SessionActivityKind kind,
      DateTime at,
      bool syncedLate,
      bool autoAttendance,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionActivity() when $default != null:
        return $default(
          _that.personName,
          _that.kind,
          _that.at,
          _that.syncedLate,
          _that.autoAttendance,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SessionActivity extends SessionActivity {
  const _SessionActivity({
    required this.personName,
    required this.kind,
    required this.at,
    this.syncedLate = false,
    this.autoAttendance = false,
  }) : super._();

  @override
  final String personName;
  @override
  final SessionActivityKind kind;
  @override
  final DateTime at;
  @override
  @JsonKey()
  final bool syncedLate;
  @override
  @JsonKey()
  final bool autoAttendance;

  /// Create a copy of SessionActivity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SessionActivityCopyWith<_SessionActivity> get copyWith =>
      __$SessionActivityCopyWithImpl<_SessionActivity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SessionActivity &&
            (identical(other.personName, personName) ||
                other.personName == personName) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.at, at) || other.at == at) &&
            (identical(other.syncedLate, syncedLate) ||
                other.syncedLate == syncedLate) &&
            (identical(other.autoAttendance, autoAttendance) ||
                other.autoAttendance == autoAttendance));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    personName,
    kind,
    at,
    syncedLate,
    autoAttendance,
  );

  @override
  String toString() {
    return 'SessionActivity(personName: $personName, kind: $kind, at: $at, syncedLate: $syncedLate, autoAttendance: $autoAttendance)';
  }
}

/// @nodoc
abstract mixin class _$SessionActivityCopyWith<$Res>
    implements $SessionActivityCopyWith<$Res> {
  factory _$SessionActivityCopyWith(
    _SessionActivity value,
    $Res Function(_SessionActivity) _then,
  ) = __$SessionActivityCopyWithImpl;
  @override
  @useResult
  $Res call({
    String personName,
    SessionActivityKind kind,
    DateTime at,
    bool syncedLate,
    bool autoAttendance,
  });
}

/// @nodoc
class __$SessionActivityCopyWithImpl<$Res>
    implements _$SessionActivityCopyWith<$Res> {
  __$SessionActivityCopyWithImpl(this._self, this._then);

  final _SessionActivity _self;
  final $Res Function(_SessionActivity) _then;

  /// Create a copy of SessionActivity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? personName = null,
    Object? kind = null,
    Object? at = null,
    Object? syncedLate = null,
    Object? autoAttendance = null,
  }) {
    return _then(
      _SessionActivity(
        personName: null == personName
            ? _self.personName
            : personName // ignore: cast_nullable_to_non_nullable
                  as String,
        kind: null == kind
            ? _self.kind
            : kind // ignore: cast_nullable_to_non_nullable
                  as SessionActivityKind,
        at: null == at
            ? _self.at
            : at // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        syncedLate: null == syncedLate
            ? _self.syncedLate
            : syncedLate // ignore: cast_nullable_to_non_nullable
                  as bool,
        autoAttendance: null == autoAttendance
            ? _self.autoAttendance
            : autoAttendance // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}
