// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_host_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationsHostState {
  int get sequence;

  /// A push that arrived while the app is open: show a toast.
  AppNotification? get foreground;

  /// A tapped notification: navigate.
  NotificationTarget? get target;

  /// Create a copy of NotificationsHostState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationsHostStateCopyWith<NotificationsHostState> get copyWith =>
      _$NotificationsHostStateCopyWithImpl<NotificationsHostState>(
        this as NotificationsHostState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationsHostState &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence) &&
            (identical(other.foreground, foreground) ||
                other.foreground == foreground) &&
            (identical(other.target, target) || other.target == target));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sequence, foreground, target);

  @override
  String toString() {
    return 'NotificationsHostState(sequence: $sequence, foreground: $foreground, target: $target)';
  }
}

/// @nodoc
abstract mixin class $NotificationsHostStateCopyWith<$Res> {
  factory $NotificationsHostStateCopyWith(
    NotificationsHostState value,
    $Res Function(NotificationsHostState) _then,
  ) = _$NotificationsHostStateCopyWithImpl;
  @useResult
  $Res call({
    int sequence,
    AppNotification? foreground,
    NotificationTarget? target,
  });

  $AppNotificationCopyWith<$Res>? get foreground;
  $NotificationTargetCopyWith<$Res>? get target;
}

/// @nodoc
class _$NotificationsHostStateCopyWithImpl<$Res>
    implements $NotificationsHostStateCopyWith<$Res> {
  _$NotificationsHostStateCopyWithImpl(this._self, this._then);

  final NotificationsHostState _self;
  final $Res Function(NotificationsHostState) _then;

  /// Create a copy of NotificationsHostState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sequence = null,
    Object? foreground = freezed,
    Object? target = freezed,
  }) {
    return _then(
      _self.copyWith(
        sequence: null == sequence
            ? _self.sequence
            : sequence // ignore: cast_nullable_to_non_nullable
                  as int,
        foreground: freezed == foreground
            ? _self.foreground
            : foreground // ignore: cast_nullable_to_non_nullable
                  as AppNotification?,
        target: freezed == target
            ? _self.target
            : target // ignore: cast_nullable_to_non_nullable
                  as NotificationTarget?,
      ),
    );
  }

  /// Create a copy of NotificationsHostState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppNotificationCopyWith<$Res>? get foreground {
    if (_self.foreground == null) {
      return null;
    }

    return $AppNotificationCopyWith<$Res>(_self.foreground!, (value) {
      return _then(_self.copyWith(foreground: value));
    });
  }

  /// Create a copy of NotificationsHostState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationTargetCopyWith<$Res>? get target {
    if (_self.target == null) {
      return null;
    }

    return $NotificationTargetCopyWith<$Res>(_self.target!, (value) {
      return _then(_self.copyWith(target: value));
    });
  }
}

/// Adds pattern-matching-related methods to [NotificationsHostState].
extension NotificationsHostStatePatterns on NotificationsHostState {
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
    TResult Function(_NotificationsHostState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationsHostState() when $default != null:
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
    TResult Function(_NotificationsHostState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationsHostState():
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
    TResult? Function(_NotificationsHostState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationsHostState() when $default != null:
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
      int sequence,
      AppNotification? foreground,
      NotificationTarget? target,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationsHostState() when $default != null:
        return $default(_that.sequence, _that.foreground, _that.target);
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
      int sequence,
      AppNotification? foreground,
      NotificationTarget? target,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationsHostState():
        return $default(_that.sequence, _that.foreground, _that.target);
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
      int sequence,
      AppNotification? foreground,
      NotificationTarget? target,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationsHostState() when $default != null:
        return $default(_that.sequence, _that.foreground, _that.target);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _NotificationsHostState implements NotificationsHostState {
  const _NotificationsHostState({
    this.sequence = 0,
    this.foreground,
    this.target,
  });

  @override
  @JsonKey()
  final int sequence;

  /// A push that arrived while the app is open: show a toast.
  @override
  final AppNotification? foreground;

  /// A tapped notification: navigate.
  @override
  final NotificationTarget? target;

  /// Create a copy of NotificationsHostState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotificationsHostStateCopyWith<_NotificationsHostState> get copyWith =>
      __$NotificationsHostStateCopyWithImpl<_NotificationsHostState>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationsHostState &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence) &&
            (identical(other.foreground, foreground) ||
                other.foreground == foreground) &&
            (identical(other.target, target) || other.target == target));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sequence, foreground, target);

  @override
  String toString() {
    return 'NotificationsHostState(sequence: $sequence, foreground: $foreground, target: $target)';
  }
}

/// @nodoc
abstract mixin class _$NotificationsHostStateCopyWith<$Res>
    implements $NotificationsHostStateCopyWith<$Res> {
  factory _$NotificationsHostStateCopyWith(
    _NotificationsHostState value,
    $Res Function(_NotificationsHostState) _then,
  ) = __$NotificationsHostStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    int sequence,
    AppNotification? foreground,
    NotificationTarget? target,
  });

  @override
  $AppNotificationCopyWith<$Res>? get foreground;
  @override
  $NotificationTargetCopyWith<$Res>? get target;
}

/// @nodoc
class __$NotificationsHostStateCopyWithImpl<$Res>
    implements _$NotificationsHostStateCopyWith<$Res> {
  __$NotificationsHostStateCopyWithImpl(this._self, this._then);

  final _NotificationsHostState _self;
  final $Res Function(_NotificationsHostState) _then;

  /// Create a copy of NotificationsHostState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sequence = null,
    Object? foreground = freezed,
    Object? target = freezed,
  }) {
    return _then(
      _NotificationsHostState(
        sequence: null == sequence
            ? _self.sequence
            : sequence // ignore: cast_nullable_to_non_nullable
                  as int,
        foreground: freezed == foreground
            ? _self.foreground
            : foreground // ignore: cast_nullable_to_non_nullable
                  as AppNotification?,
        target: freezed == target
            ? _self.target
            : target // ignore: cast_nullable_to_non_nullable
                  as NotificationTarget?,
      ),
    );
  }

  /// Create a copy of NotificationsHostState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppNotificationCopyWith<$Res>? get foreground {
    if (_self.foreground == null) {
      return null;
    }

    return $AppNotificationCopyWith<$Res>(_self.foreground!, (value) {
      return _then(_self.copyWith(foreground: value));
    });
  }

  /// Create a copy of NotificationsHostState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationTargetCopyWith<$Res>? get target {
    if (_self.target == null) {
      return null;
    }

    return $NotificationTargetCopyWith<$Res>(_self.target!, (value) {
      return _then(_self.copyWith(target: value));
    });
  }
}
