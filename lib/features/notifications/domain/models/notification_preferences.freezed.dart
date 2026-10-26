// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationPreferences {
  /// This device is registered to receive pushes (reminders, stage opened).
  bool get pushEnabled;

  /// Show pushes that arrive while the app is open as a toast.
  bool get foregroundAlerts;

  /// Warn when session data has been unsynced for more than 24 hours.
  bool get unsyncedAlert;

  /// Create a copy of NotificationPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationPreferencesCopyWith<NotificationPreferences> get copyWith =>
      _$NotificationPreferencesCopyWithImpl<NotificationPreferences>(
        this as NotificationPreferences,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationPreferences &&
            (identical(other.pushEnabled, pushEnabled) ||
                other.pushEnabled == pushEnabled) &&
            (identical(other.foregroundAlerts, foregroundAlerts) ||
                other.foregroundAlerts == foregroundAlerts) &&
            (identical(other.unsyncedAlert, unsyncedAlert) ||
                other.unsyncedAlert == unsyncedAlert));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, pushEnabled, foregroundAlerts, unsyncedAlert);

  @override
  String toString() {
    return 'NotificationPreferences(pushEnabled: $pushEnabled, foregroundAlerts: $foregroundAlerts, unsyncedAlert: $unsyncedAlert)';
  }
}

/// @nodoc
abstract mixin class $NotificationPreferencesCopyWith<$Res> {
  factory $NotificationPreferencesCopyWith(
    NotificationPreferences value,
    $Res Function(NotificationPreferences) _then,
  ) = _$NotificationPreferencesCopyWithImpl;
  @useResult
  $Res call({bool pushEnabled, bool foregroundAlerts, bool unsyncedAlert});
}

/// @nodoc
class _$NotificationPreferencesCopyWithImpl<$Res>
    implements $NotificationPreferencesCopyWith<$Res> {
  _$NotificationPreferencesCopyWithImpl(this._self, this._then);

  final NotificationPreferences _self;
  final $Res Function(NotificationPreferences) _then;

  /// Create a copy of NotificationPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pushEnabled = null,
    Object? foregroundAlerts = null,
    Object? unsyncedAlert = null,
  }) {
    return _then(
      _self.copyWith(
        pushEnabled: null == pushEnabled
            ? _self.pushEnabled
            : pushEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        foregroundAlerts: null == foregroundAlerts
            ? _self.foregroundAlerts
            : foregroundAlerts // ignore: cast_nullable_to_non_nullable
                  as bool,
        unsyncedAlert: null == unsyncedAlert
            ? _self.unsyncedAlert
            : unsyncedAlert // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [NotificationPreferences].
extension NotificationPreferencesPatterns on NotificationPreferences {
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
    TResult Function(_NotificationPreferences value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationPreferences() when $default != null:
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
    TResult Function(_NotificationPreferences value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationPreferences():
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
    TResult? Function(_NotificationPreferences value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationPreferences() when $default != null:
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
      bool pushEnabled,
      bool foregroundAlerts,
      bool unsyncedAlert,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationPreferences() when $default != null:
        return $default(
          _that.pushEnabled,
          _that.foregroundAlerts,
          _that.unsyncedAlert,
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
      bool pushEnabled,
      bool foregroundAlerts,
      bool unsyncedAlert,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationPreferences():
        return $default(
          _that.pushEnabled,
          _that.foregroundAlerts,
          _that.unsyncedAlert,
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
      bool pushEnabled,
      bool foregroundAlerts,
      bool unsyncedAlert,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationPreferences() when $default != null:
        return $default(
          _that.pushEnabled,
          _that.foregroundAlerts,
          _that.unsyncedAlert,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _NotificationPreferences implements NotificationPreferences {
  const _NotificationPreferences({
    this.pushEnabled = true,
    this.foregroundAlerts = true,
    this.unsyncedAlert = true,
  });

  /// This device is registered to receive pushes (reminders, stage opened).
  @override
  @JsonKey()
  final bool pushEnabled;

  /// Show pushes that arrive while the app is open as a toast.
  @override
  @JsonKey()
  final bool foregroundAlerts;

  /// Warn when session data has been unsynced for more than 24 hours.
  @override
  @JsonKey()
  final bool unsyncedAlert;

  /// Create a copy of NotificationPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotificationPreferencesCopyWith<_NotificationPreferences> get copyWith =>
      __$NotificationPreferencesCopyWithImpl<_NotificationPreferences>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationPreferences &&
            (identical(other.pushEnabled, pushEnabled) ||
                other.pushEnabled == pushEnabled) &&
            (identical(other.foregroundAlerts, foregroundAlerts) ||
                other.foregroundAlerts == foregroundAlerts) &&
            (identical(other.unsyncedAlert, unsyncedAlert) ||
                other.unsyncedAlert == unsyncedAlert));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, pushEnabled, foregroundAlerts, unsyncedAlert);

  @override
  String toString() {
    return 'NotificationPreferences(pushEnabled: $pushEnabled, foregroundAlerts: $foregroundAlerts, unsyncedAlert: $unsyncedAlert)';
  }
}

/// @nodoc
abstract mixin class _$NotificationPreferencesCopyWith<$Res>
    implements $NotificationPreferencesCopyWith<$Res> {
  factory _$NotificationPreferencesCopyWith(
    _NotificationPreferences value,
    $Res Function(_NotificationPreferences) _then,
  ) = __$NotificationPreferencesCopyWithImpl;
  @override
  @useResult
  $Res call({bool pushEnabled, bool foregroundAlerts, bool unsyncedAlert});
}

/// @nodoc
class __$NotificationPreferencesCopyWithImpl<$Res>
    implements _$NotificationPreferencesCopyWith<$Res> {
  __$NotificationPreferencesCopyWithImpl(this._self, this._then);

  final _NotificationPreferences _self;
  final $Res Function(_NotificationPreferences) _then;

  /// Create a copy of NotificationPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? pushEnabled = null,
    Object? foregroundAlerts = null,
    Object? unsyncedAlert = null,
  }) {
    return _then(
      _NotificationPreferences(
        pushEnabled: null == pushEnabled
            ? _self.pushEnabled
            : pushEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        foregroundAlerts: null == foregroundAlerts
            ? _self.foregroundAlerts
            : foregroundAlerts // ignore: cast_nullable_to_non_nullable
                  as bool,
        unsyncedAlert: null == unsyncedAlert
            ? _self.unsyncedAlert
            : unsyncedAlert // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}
