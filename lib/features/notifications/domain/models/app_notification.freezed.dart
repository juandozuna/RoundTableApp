// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppNotification {
  /// `null` for a type this version does not know.
  NotificationKind? get kind;
  String? get title;
  String? get body;
  String? get sessionId;
  String? get roundTableId;

  /// Stage that was opened (`stage_opened`).
  String? get stage;
  String? get commitmentId;

  /// Create a copy of AppNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppNotificationCopyWith<AppNotification> get copyWith =>
      _$AppNotificationCopyWithImpl<AppNotification>(
        this as AppNotification,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppNotification &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.roundTableId, roundTableId) ||
                other.roundTableId == roundTableId) &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.commitmentId, commitmentId) ||
                other.commitmentId == commitmentId));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    kind,
    title,
    body,
    sessionId,
    roundTableId,
    stage,
    commitmentId,
  );

  @override
  String toString() {
    return 'AppNotification(kind: $kind, title: $title, body: $body, sessionId: $sessionId, roundTableId: $roundTableId, stage: $stage, commitmentId: $commitmentId)';
  }
}

/// @nodoc
abstract mixin class $AppNotificationCopyWith<$Res> {
  factory $AppNotificationCopyWith(
    AppNotification value,
    $Res Function(AppNotification) _then,
  ) = _$AppNotificationCopyWithImpl;
  @useResult
  $Res call({
    NotificationKind? kind,
    String? title,
    String? body,
    String? sessionId,
    String? roundTableId,
    String? stage,
    String? commitmentId,
  });
}

/// @nodoc
class _$AppNotificationCopyWithImpl<$Res>
    implements $AppNotificationCopyWith<$Res> {
  _$AppNotificationCopyWithImpl(this._self, this._then);

  final AppNotification _self;
  final $Res Function(AppNotification) _then;

  /// Create a copy of AppNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kind = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? sessionId = freezed,
    Object? roundTableId = freezed,
    Object? stage = freezed,
    Object? commitmentId = freezed,
  }) {
    return _then(
      _self.copyWith(
        kind: freezed == kind
            ? _self.kind
            : kind // ignore: cast_nullable_to_non_nullable
                  as NotificationKind?,
        title: freezed == title
            ? _self.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        body: freezed == body
            ? _self.body
            : body // ignore: cast_nullable_to_non_nullable
                  as String?,
        sessionId: freezed == sessionId
            ? _self.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String?,
        roundTableId: freezed == roundTableId
            ? _self.roundTableId
            : roundTableId // ignore: cast_nullable_to_non_nullable
                  as String?,
        stage: freezed == stage
            ? _self.stage
            : stage // ignore: cast_nullable_to_non_nullable
                  as String?,
        commitmentId: freezed == commitmentId
            ? _self.commitmentId
            : commitmentId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [AppNotification].
extension AppNotificationPatterns on AppNotification {
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
    TResult Function(_AppNotification value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AppNotification() when $default != null:
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
    TResult Function(_AppNotification value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppNotification():
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
    TResult? Function(_AppNotification value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppNotification() when $default != null:
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
      NotificationKind? kind,
      String? title,
      String? body,
      String? sessionId,
      String? roundTableId,
      String? stage,
      String? commitmentId,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AppNotification() when $default != null:
        return $default(
          _that.kind,
          _that.title,
          _that.body,
          _that.sessionId,
          _that.roundTableId,
          _that.stage,
          _that.commitmentId,
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
      NotificationKind? kind,
      String? title,
      String? body,
      String? sessionId,
      String? roundTableId,
      String? stage,
      String? commitmentId,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppNotification():
        return $default(
          _that.kind,
          _that.title,
          _that.body,
          _that.sessionId,
          _that.roundTableId,
          _that.stage,
          _that.commitmentId,
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
      NotificationKind? kind,
      String? title,
      String? body,
      String? sessionId,
      String? roundTableId,
      String? stage,
      String? commitmentId,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppNotification() when $default != null:
        return $default(
          _that.kind,
          _that.title,
          _that.body,
          _that.sessionId,
          _that.roundTableId,
          _that.stage,
          _that.commitmentId,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AppNotification implements AppNotification {
  const _AppNotification({
    this.kind,
    this.title,
    this.body,
    this.sessionId,
    this.roundTableId,
    this.stage,
    this.commitmentId,
  });

  /// `null` for a type this version does not know.
  @override
  final NotificationKind? kind;
  @override
  final String? title;
  @override
  final String? body;
  @override
  final String? sessionId;
  @override
  final String? roundTableId;

  /// Stage that was opened (`stage_opened`).
  @override
  final String? stage;
  @override
  final String? commitmentId;

  /// Create a copy of AppNotification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppNotificationCopyWith<_AppNotification> get copyWith =>
      __$AppNotificationCopyWithImpl<_AppNotification>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppNotification &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.roundTableId, roundTableId) ||
                other.roundTableId == roundTableId) &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.commitmentId, commitmentId) ||
                other.commitmentId == commitmentId));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    kind,
    title,
    body,
    sessionId,
    roundTableId,
    stage,
    commitmentId,
  );

  @override
  String toString() {
    return 'AppNotification(kind: $kind, title: $title, body: $body, sessionId: $sessionId, roundTableId: $roundTableId, stage: $stage, commitmentId: $commitmentId)';
  }
}

/// @nodoc
abstract mixin class _$AppNotificationCopyWith<$Res>
    implements $AppNotificationCopyWith<$Res> {
  factory _$AppNotificationCopyWith(
    _AppNotification value,
    $Res Function(_AppNotification) _then,
  ) = __$AppNotificationCopyWithImpl;
  @override
  @useResult
  $Res call({
    NotificationKind? kind,
    String? title,
    String? body,
    String? sessionId,
    String? roundTableId,
    String? stage,
    String? commitmentId,
  });
}

/// @nodoc
class __$AppNotificationCopyWithImpl<$Res>
    implements _$AppNotificationCopyWith<$Res> {
  __$AppNotificationCopyWithImpl(this._self, this._then);

  final _AppNotification _self;
  final $Res Function(_AppNotification) _then;

  /// Create a copy of AppNotification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? kind = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? sessionId = freezed,
    Object? roundTableId = freezed,
    Object? stage = freezed,
    Object? commitmentId = freezed,
  }) {
    return _then(
      _AppNotification(
        kind: freezed == kind
            ? _self.kind
            : kind // ignore: cast_nullable_to_non_nullable
                  as NotificationKind?,
        title: freezed == title
            ? _self.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        body: freezed == body
            ? _self.body
            : body // ignore: cast_nullable_to_non_nullable
                  as String?,
        sessionId: freezed == sessionId
            ? _self.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String?,
        roundTableId: freezed == roundTableId
            ? _self.roundTableId
            : roundTableId // ignore: cast_nullable_to_non_nullable
                  as String?,
        stage: freezed == stage
            ? _self.stage
            : stage // ignore: cast_nullable_to_non_nullable
                  as String?,
        commitmentId: freezed == commitmentId
            ? _self.commitmentId
            : commitmentId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}
