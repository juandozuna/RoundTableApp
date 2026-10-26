// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_preferences_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationPreferencesState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationPreferencesState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NotificationPreferencesState()';
  }
}

/// @nodoc
class $NotificationPreferencesStateCopyWith<$Res> {
  $NotificationPreferencesStateCopyWith(
    NotificationPreferencesState _,
    $Res Function(NotificationPreferencesState) __,
  );
}

/// Adds pattern-matching-related methods to [NotificationPreferencesState].
extension NotificationPreferencesStatePatterns on NotificationPreferencesState {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotificationPreferencesLoading value)? loading,
    TResult Function(NotificationPreferencesReady value)? ready,
    TResult Function(NotificationPreferencesFailure value)? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case NotificationPreferencesLoading() when loading != null:
        return loading(_that);
      case NotificationPreferencesReady() when ready != null:
        return ready(_that);
      case NotificationPreferencesFailure() when failure != null:
        return failure(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(NotificationPreferencesLoading value) loading,
    required TResult Function(NotificationPreferencesReady value) ready,
    required TResult Function(NotificationPreferencesFailure value) failure,
  }) {
    final _that = this;
    switch (_that) {
      case NotificationPreferencesLoading():
        return loading(_that);
      case NotificationPreferencesReady():
        return ready(_that);
      case NotificationPreferencesFailure():
        return failure(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotificationPreferencesLoading value)? loading,
    TResult? Function(NotificationPreferencesReady value)? ready,
    TResult? Function(NotificationPreferencesFailure value)? failure,
  }) {
    final _that = this;
    switch (_that) {
      case NotificationPreferencesLoading() when loading != null:
        return loading(_that);
      case NotificationPreferencesReady() when ready != null:
        return ready(_that);
      case NotificationPreferencesFailure() when failure != null:
        return failure(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(NotificationSettings settings, bool busy)? ready,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case NotificationPreferencesLoading() when loading != null:
        return loading();
      case NotificationPreferencesReady() when ready != null:
        return ready(_that.settings, _that.busy);
      case NotificationPreferencesFailure() when failure != null:
        return failure();
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
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(NotificationSettings settings, bool busy) ready,
    required TResult Function() failure,
  }) {
    final _that = this;
    switch (_that) {
      case NotificationPreferencesLoading():
        return loading();
      case NotificationPreferencesReady():
        return ready(_that.settings, _that.busy);
      case NotificationPreferencesFailure():
        return failure();
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(NotificationSettings settings, bool busy)? ready,
    TResult? Function()? failure,
  }) {
    final _that = this;
    switch (_that) {
      case NotificationPreferencesLoading() when loading != null:
        return loading();
      case NotificationPreferencesReady() when ready != null:
        return ready(_that.settings, _that.busy);
      case NotificationPreferencesFailure() when failure != null:
        return failure();
      case _:
        return null;
    }
  }
}

/// @nodoc

class NotificationPreferencesLoading implements NotificationPreferencesState {
  const NotificationPreferencesLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationPreferencesLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NotificationPreferencesState.loading()';
  }
}

/// @nodoc

class NotificationPreferencesReady implements NotificationPreferencesState {
  const NotificationPreferencesReady({
    required this.settings,
    this.busy = false,
  });

  final NotificationSettings settings;
  @JsonKey()
  final bool busy;

  /// Create a copy of NotificationPreferencesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationPreferencesReadyCopyWith<NotificationPreferencesReady>
  get copyWith =>
      _$NotificationPreferencesReadyCopyWithImpl<NotificationPreferencesReady>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationPreferencesReady &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.busy, busy) || other.busy == busy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, settings, busy);

  @override
  String toString() {
    return 'NotificationPreferencesState.ready(settings: $settings, busy: $busy)';
  }
}

/// @nodoc
abstract mixin class $NotificationPreferencesReadyCopyWith<$Res>
    implements $NotificationPreferencesStateCopyWith<$Res> {
  factory $NotificationPreferencesReadyCopyWith(
    NotificationPreferencesReady value,
    $Res Function(NotificationPreferencesReady) _then,
  ) = _$NotificationPreferencesReadyCopyWithImpl;
  @useResult
  $Res call({NotificationSettings settings, bool busy});

  $NotificationSettingsCopyWith<$Res> get settings;
}

/// @nodoc
class _$NotificationPreferencesReadyCopyWithImpl<$Res>
    implements $NotificationPreferencesReadyCopyWith<$Res> {
  _$NotificationPreferencesReadyCopyWithImpl(this._self, this._then);

  final NotificationPreferencesReady _self;
  final $Res Function(NotificationPreferencesReady) _then;

  /// Create a copy of NotificationPreferencesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? settings = null, Object? busy = null}) {
    return _then(
      NotificationPreferencesReady(
        settings: null == settings
            ? _self.settings
            : settings // ignore: cast_nullable_to_non_nullable
                  as NotificationSettings,
        busy: null == busy
            ? _self.busy
            : busy // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of NotificationPreferencesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationSettingsCopyWith<$Res> get settings {
    return $NotificationSettingsCopyWith<$Res>(_self.settings, (value) {
      return _then(_self.copyWith(settings: value));
    });
  }
}

/// @nodoc

class NotificationPreferencesFailure implements NotificationPreferencesState {
  const NotificationPreferencesFailure();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationPreferencesFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NotificationPreferencesState.failure()';
  }
}
