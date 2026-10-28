// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upcoming_sessions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpcomingOption {
  String get id;
  String get label;

  /// Create a copy of UpcomingOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpcomingOptionCopyWith<UpcomingOption> get copyWith =>
      _$UpcomingOptionCopyWithImpl<UpcomingOption>(
        this as UpcomingOption,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpcomingOption &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, label);

  @override
  String toString() {
    return 'UpcomingOption(id: $id, label: $label)';
  }
}

/// @nodoc
abstract mixin class $UpcomingOptionCopyWith<$Res> {
  factory $UpcomingOptionCopyWith(
    UpcomingOption value,
    $Res Function(UpcomingOption) _then,
  ) = _$UpcomingOptionCopyWithImpl;
  @useResult
  $Res call({String id, String label});
}

/// @nodoc
class _$UpcomingOptionCopyWithImpl<$Res>
    implements $UpcomingOptionCopyWith<$Res> {
  _$UpcomingOptionCopyWithImpl(this._self, this._then);

  final UpcomingOption _self;
  final $Res Function(UpcomingOption) _then;

  /// Create a copy of UpcomingOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? label = null}) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        label: null == label
            ? _self.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [UpcomingOption].
extension UpcomingOptionPatterns on UpcomingOption {
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
    TResult Function(_UpcomingOption value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpcomingOption() when $default != null:
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
    TResult Function(_UpcomingOption value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpcomingOption():
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
    TResult? Function(_UpcomingOption value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpcomingOption() when $default != null:
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
    TResult Function(String id, String label)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpcomingOption() when $default != null:
        return $default(_that.id, _that.label);
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
    TResult Function(String id, String label) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpcomingOption():
        return $default(_that.id, _that.label);
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
    TResult? Function(String id, String label)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpcomingOption() when $default != null:
        return $default(_that.id, _that.label);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _UpcomingOption implements UpcomingOption {
  const _UpcomingOption({required this.id, required this.label});

  @override
  final String id;
  @override
  final String label;

  /// Create a copy of UpcomingOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpcomingOptionCopyWith<_UpcomingOption> get copyWith =>
      __$UpcomingOptionCopyWithImpl<_UpcomingOption>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpcomingOption &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, label);

  @override
  String toString() {
    return 'UpcomingOption(id: $id, label: $label)';
  }
}

/// @nodoc
abstract mixin class _$UpcomingOptionCopyWith<$Res>
    implements $UpcomingOptionCopyWith<$Res> {
  factory _$UpcomingOptionCopyWith(
    _UpcomingOption value,
    $Res Function(_UpcomingOption) _then,
  ) = __$UpcomingOptionCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String label});
}

/// @nodoc
class __$UpcomingOptionCopyWithImpl<$Res>
    implements _$UpcomingOptionCopyWith<$Res> {
  __$UpcomingOptionCopyWithImpl(this._self, this._then);

  final _UpcomingOption _self;
  final $Res Function(_UpcomingOption) _then;

  /// Create a copy of UpcomingOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? id = null, Object? label = null}) {
    return _then(
      _UpcomingOption(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        label: null == label
            ? _self.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
mixin _$UpcomingSessions {
  UpcomingScope get scope;
  List<UpcomingSession> get sessions;

  /// Create a copy of UpcomingSessions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpcomingSessionsCopyWith<UpcomingSessions> get copyWith =>
      _$UpcomingSessionsCopyWithImpl<UpcomingSessions>(
        this as UpcomingSessions,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpcomingSessions &&
            (identical(other.scope, scope) || other.scope == scope) &&
            const DeepCollectionEquality().equals(other.sessions, sessions));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    scope,
    const DeepCollectionEquality().hash(sessions),
  );

  @override
  String toString() {
    return 'UpcomingSessions(scope: $scope, sessions: $sessions)';
  }
}

/// @nodoc
abstract mixin class $UpcomingSessionsCopyWith<$Res> {
  factory $UpcomingSessionsCopyWith(
    UpcomingSessions value,
    $Res Function(UpcomingSessions) _then,
  ) = _$UpcomingSessionsCopyWithImpl;
  @useResult
  $Res call({UpcomingScope scope, List<UpcomingSession> sessions});
}

/// @nodoc
class _$UpcomingSessionsCopyWithImpl<$Res>
    implements $UpcomingSessionsCopyWith<$Res> {
  _$UpcomingSessionsCopyWithImpl(this._self, this._then);

  final UpcomingSessions _self;
  final $Res Function(UpcomingSessions) _then;

  /// Create a copy of UpcomingSessions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? scope = null, Object? sessions = null}) {
    return _then(
      _self.copyWith(
        scope: null == scope
            ? _self.scope
            : scope // ignore: cast_nullable_to_non_nullable
                  as UpcomingScope,
        sessions: null == sessions
            ? _self.sessions
            : sessions // ignore: cast_nullable_to_non_nullable
                  as List<UpcomingSession>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [UpcomingSessions].
extension UpcomingSessionsPatterns on UpcomingSessions {
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
    TResult Function(_UpcomingSessions value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpcomingSessions() when $default != null:
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
    TResult Function(_UpcomingSessions value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpcomingSessions():
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
    TResult? Function(_UpcomingSessions value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpcomingSessions() when $default != null:
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
    TResult Function(UpcomingScope scope, List<UpcomingSession> sessions)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpcomingSessions() when $default != null:
        return $default(_that.scope, _that.sessions);
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
    TResult Function(UpcomingScope scope, List<UpcomingSession> sessions)
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpcomingSessions():
        return $default(_that.scope, _that.sessions);
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
    TResult? Function(UpcomingScope scope, List<UpcomingSession> sessions)?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpcomingSessions() when $default != null:
        return $default(_that.scope, _that.sessions);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _UpcomingSessions extends UpcomingSessions {
  const _UpcomingSessions({
    required this.scope,
    final List<UpcomingSession> sessions = const [],
  }) : _sessions = sessions,
       super._();

  @override
  final UpcomingScope scope;
  final List<UpcomingSession> _sessions;
  @override
  @JsonKey()
  List<UpcomingSession> get sessions {
    if (_sessions is EqualUnmodifiableListView) return _sessions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sessions);
  }

  /// Create a copy of UpcomingSessions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpcomingSessionsCopyWith<_UpcomingSessions> get copyWith =>
      __$UpcomingSessionsCopyWithImpl<_UpcomingSessions>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpcomingSessions &&
            (identical(other.scope, scope) || other.scope == scope) &&
            const DeepCollectionEquality().equals(other._sessions, _sessions));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    scope,
    const DeepCollectionEquality().hash(_sessions),
  );

  @override
  String toString() {
    return 'UpcomingSessions(scope: $scope, sessions: $sessions)';
  }
}

/// @nodoc
abstract mixin class _$UpcomingSessionsCopyWith<$Res>
    implements $UpcomingSessionsCopyWith<$Res> {
  factory _$UpcomingSessionsCopyWith(
    _UpcomingSessions value,
    $Res Function(_UpcomingSessions) _then,
  ) = __$UpcomingSessionsCopyWithImpl;
  @override
  @useResult
  $Res call({UpcomingScope scope, List<UpcomingSession> sessions});
}

/// @nodoc
class __$UpcomingSessionsCopyWithImpl<$Res>
    implements _$UpcomingSessionsCopyWith<$Res> {
  __$UpcomingSessionsCopyWithImpl(this._self, this._then);

  final _UpcomingSessions _self;
  final $Res Function(_UpcomingSessions) _then;

  /// Create a copy of UpcomingSessions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? scope = null, Object? sessions = null}) {
    return _then(
      _UpcomingSessions(
        scope: null == scope
            ? _self.scope
            : scope // ignore: cast_nullable_to_non_nullable
                  as UpcomingScope,
        sessions: null == sessions
            ? _self._sessions
            : sessions // ignore: cast_nullable_to_non_nullable
                  as List<UpcomingSession>,
      ),
    );
  }
}
