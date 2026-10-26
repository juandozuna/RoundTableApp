// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_target.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationTarget {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NotificationTarget);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NotificationTarget()';
  }
}

/// @nodoc
class $NotificationTargetCopyWith<$Res> {
  $NotificationTargetCopyWith(
    NotificationTarget _,
    $Res Function(NotificationTarget) __,
  );
}

/// Adds pattern-matching-related methods to [NotificationTarget].
extension NotificationTargetPatterns on NotificationTarget {
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
    TResult Function(NotificationTargetSession value)? session,
    TResult Function(NotificationTargetHome value)? home,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case NotificationTargetSession() when session != null:
        return session(_that);
      case NotificationTargetHome() when home != null:
        return home(_that);
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
    required TResult Function(NotificationTargetSession value) session,
    required TResult Function(NotificationTargetHome value) home,
  }) {
    final _that = this;
    switch (_that) {
      case NotificationTargetSession():
        return session(_that);
      case NotificationTargetHome():
        return home(_that);
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
    TResult? Function(NotificationTargetSession value)? session,
    TResult? Function(NotificationTargetHome value)? home,
  }) {
    final _that = this;
    switch (_that) {
      case NotificationTargetSession() when session != null:
        return session(_that);
      case NotificationTargetHome() when home != null:
        return home(_that);
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
    TResult Function(String roundTableId, String sessionId)? session,
    TResult Function()? home,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case NotificationTargetSession() when session != null:
        return session(_that.roundTableId, _that.sessionId);
      case NotificationTargetHome() when home != null:
        return home();
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
    required TResult Function(String roundTableId, String sessionId) session,
    required TResult Function() home,
  }) {
    final _that = this;
    switch (_that) {
      case NotificationTargetSession():
        return session(_that.roundTableId, _that.sessionId);
      case NotificationTargetHome():
        return home();
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
    TResult? Function(String roundTableId, String sessionId)? session,
    TResult? Function()? home,
  }) {
    final _that = this;
    switch (_that) {
      case NotificationTargetSession() when session != null:
        return session(_that.roundTableId, _that.sessionId);
      case NotificationTargetHome() when home != null:
        return home();
      case _:
        return null;
    }
  }
}

/// @nodoc

class NotificationTargetSession implements NotificationTarget {
  const NotificationTargetSession({
    required this.roundTableId,
    required this.sessionId,
  });

  final String roundTableId;
  final String sessionId;

  /// Create a copy of NotificationTarget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationTargetSessionCopyWith<NotificationTargetSession> get copyWith =>
      _$NotificationTargetSessionCopyWithImpl<NotificationTargetSession>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationTargetSession &&
            (identical(other.roundTableId, roundTableId) ||
                other.roundTableId == roundTableId) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, roundTableId, sessionId);

  @override
  String toString() {
    return 'NotificationTarget.session(roundTableId: $roundTableId, sessionId: $sessionId)';
  }
}

/// @nodoc
abstract mixin class $NotificationTargetSessionCopyWith<$Res>
    implements $NotificationTargetCopyWith<$Res> {
  factory $NotificationTargetSessionCopyWith(
    NotificationTargetSession value,
    $Res Function(NotificationTargetSession) _then,
  ) = _$NotificationTargetSessionCopyWithImpl;
  @useResult
  $Res call({String roundTableId, String sessionId});
}

/// @nodoc
class _$NotificationTargetSessionCopyWithImpl<$Res>
    implements $NotificationTargetSessionCopyWith<$Res> {
  _$NotificationTargetSessionCopyWithImpl(this._self, this._then);

  final NotificationTargetSession _self;
  final $Res Function(NotificationTargetSession) _then;

  /// Create a copy of NotificationTarget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? roundTableId = null, Object? sessionId = null}) {
    return _then(
      NotificationTargetSession(
        roundTableId: null == roundTableId
            ? _self.roundTableId
            : roundTableId // ignore: cast_nullable_to_non_nullable
                  as String,
        sessionId: null == sessionId
            ? _self.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class NotificationTargetHome implements NotificationTarget {
  const NotificationTargetHome();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NotificationTargetHome);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NotificationTarget.home()';
  }
}
