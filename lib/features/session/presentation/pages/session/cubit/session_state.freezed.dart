// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SessionState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SessionState()';
  }
}

/// @nodoc
class $SessionStateCopyWith<$Res> {
  $SessionStateCopyWith(SessionState _, $Res Function(SessionState) __);
}

/// Adds pattern-matching-related methods to [SessionState].
extension SessionStatePatterns on SessionState {
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
    TResult Function(SessionLoading value)? loading,
    TResult Function(SessionUnavailable value)? unavailable,
    TResult Function(SessionFailure value)? failure,
    TResult Function(SessionReady value)? ready,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case SessionLoading() when loading != null:
        return loading(_that);
      case SessionUnavailable() when unavailable != null:
        return unavailable(_that);
      case SessionFailure() when failure != null:
        return failure(_that);
      case SessionReady() when ready != null:
        return ready(_that);
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
    required TResult Function(SessionLoading value) loading,
    required TResult Function(SessionUnavailable value) unavailable,
    required TResult Function(SessionFailure value) failure,
    required TResult Function(SessionReady value) ready,
  }) {
    final _that = this;
    switch (_that) {
      case SessionLoading():
        return loading(_that);
      case SessionUnavailable():
        return unavailable(_that);
      case SessionFailure():
        return failure(_that);
      case SessionReady():
        return ready(_that);
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
    TResult? Function(SessionLoading value)? loading,
    TResult? Function(SessionUnavailable value)? unavailable,
    TResult? Function(SessionFailure value)? failure,
    TResult? Function(SessionReady value)? ready,
  }) {
    final _that = this;
    switch (_that) {
      case SessionLoading() when loading != null:
        return loading(_that);
      case SessionUnavailable() when unavailable != null:
        return unavailable(_that);
      case SessionFailure() when failure != null:
        return failure(_that);
      case SessionReady() when ready != null:
        return ready(_that);
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
    TResult Function()? unavailable,
    TResult Function(Object error)? failure,
    TResult Function(SessionView view)? ready,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case SessionLoading() when loading != null:
        return loading();
      case SessionUnavailable() when unavailable != null:
        return unavailable();
      case SessionFailure() when failure != null:
        return failure(_that.error);
      case SessionReady() when ready != null:
        return ready(_that.view);
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
    required TResult Function() unavailable,
    required TResult Function(Object error) failure,
    required TResult Function(SessionView view) ready,
  }) {
    final _that = this;
    switch (_that) {
      case SessionLoading():
        return loading();
      case SessionUnavailable():
        return unavailable();
      case SessionFailure():
        return failure(_that.error);
      case SessionReady():
        return ready(_that.view);
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
    TResult? Function()? unavailable,
    TResult? Function(Object error)? failure,
    TResult? Function(SessionView view)? ready,
  }) {
    final _that = this;
    switch (_that) {
      case SessionLoading() when loading != null:
        return loading();
      case SessionUnavailable() when unavailable != null:
        return unavailable();
      case SessionFailure() when failure != null:
        return failure(_that.error);
      case SessionReady() when ready != null:
        return ready(_that.view);
      case _:
        return null;
    }
  }
}

/// @nodoc

class SessionLoading implements SessionState {
  const SessionLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SessionLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SessionState.loading()';
  }
}

/// @nodoc

class SessionUnavailable implements SessionState {
  const SessionUnavailable();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SessionUnavailable);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SessionState.unavailable()';
  }
}

/// @nodoc

class SessionFailure implements SessionState {
  const SessionFailure(this.error);

  final Object error;

  /// Create a copy of SessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SessionFailureCopyWith<SessionFailure> get copyWith =>
      _$SessionFailureCopyWithImpl<SessionFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SessionFailure &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @override
  String toString() {
    return 'SessionState.failure(error: $error)';
  }
}

/// @nodoc
abstract mixin class $SessionFailureCopyWith<$Res>
    implements $SessionStateCopyWith<$Res> {
  factory $SessionFailureCopyWith(
    SessionFailure value,
    $Res Function(SessionFailure) _then,
  ) = _$SessionFailureCopyWithImpl;
  @useResult
  $Res call({Object error});
}

/// @nodoc
class _$SessionFailureCopyWithImpl<$Res>
    implements $SessionFailureCopyWith<$Res> {
  _$SessionFailureCopyWithImpl(this._self, this._then);

  final SessionFailure _self;
  final $Res Function(SessionFailure) _then;

  /// Create a copy of SessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? error = null}) {
    return _then(SessionFailure(null == error ? _self.error : error));
  }
}

/// @nodoc

class SessionReady implements SessionState {
  const SessionReady(this.view);

  final SessionView view;

  /// Create a copy of SessionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SessionReadyCopyWith<SessionReady> get copyWith =>
      _$SessionReadyCopyWithImpl<SessionReady>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SessionReady &&
            (identical(other.view, view) || other.view == view));
  }

  @override
  int get hashCode => Object.hash(runtimeType, view);

  @override
  String toString() {
    return 'SessionState.ready(view: $view)';
  }
}

/// @nodoc
abstract mixin class $SessionReadyCopyWith<$Res>
    implements $SessionStateCopyWith<$Res> {
  factory $SessionReadyCopyWith(
    SessionReady value,
    $Res Function(SessionReady) _then,
  ) = _$SessionReadyCopyWithImpl;
  @useResult
  $Res call({SessionView view});

  $SessionViewCopyWith<$Res> get view;
}

/// @nodoc
class _$SessionReadyCopyWithImpl<$Res> implements $SessionReadyCopyWith<$Res> {
  _$SessionReadyCopyWithImpl(this._self, this._then);

  final SessionReady _self;
  final $Res Function(SessionReady) _then;

  /// Create a copy of SessionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? view = null}) {
    return _then(
      SessionReady(
        null == view
            ? _self.view
            : view // ignore: cast_nullable_to_non_nullable
                  as SessionView,
      ),
    );
  }

  /// Create a copy of SessionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionViewCopyWith<$Res> get view {
    return $SessionViewCopyWith<$Res>(_self.view, (value) {
      return _then(_self.copyWith(view: value));
    });
  }
}

/// @nodoc
mixin _$SessionView {
  LiveSession get session;
  bool get isOnline;
  SyncSnapshot get sync;
  bool get isBusy;
  SessionPrompt? get prompt;
  SessionProblem? get problem;
  SessionNotice? get notice;

  /// Create a copy of SessionView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SessionViewCopyWith<SessionView> get copyWith =>
      _$SessionViewCopyWithImpl<SessionView>(this as SessionView, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SessionView &&
            (identical(other.session, session) || other.session == session) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline) &&
            (identical(other.sync, sync) || other.sync == sync) &&
            (identical(other.isBusy, isBusy) || other.isBusy == isBusy) &&
            (identical(other.prompt, prompt) || other.prompt == prompt) &&
            (identical(other.problem, problem) || other.problem == problem) &&
            (identical(other.notice, notice) || other.notice == notice));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    session,
    isOnline,
    sync,
    isBusy,
    prompt,
    problem,
    notice,
  );

  @override
  String toString() {
    return 'SessionView(session: $session, isOnline: $isOnline, sync: $sync, isBusy: $isBusy, prompt: $prompt, problem: $problem, notice: $notice)';
  }
}

/// @nodoc
abstract mixin class $SessionViewCopyWith<$Res> {
  factory $SessionViewCopyWith(
    SessionView value,
    $Res Function(SessionView) _then,
  ) = _$SessionViewCopyWithImpl;
  @useResult
  $Res call({
    LiveSession session,
    bool isOnline,
    SyncSnapshot sync,
    bool isBusy,
    SessionPrompt? prompt,
    SessionProblem? problem,
    SessionNotice? notice,
  });

  $LiveSessionCopyWith<$Res> get session;
  $SyncSnapshotCopyWith<$Res> get sync;
  $SessionPromptCopyWith<$Res>? get prompt;
  $SessionProblemCopyWith<$Res>? get problem;
}

/// @nodoc
class _$SessionViewCopyWithImpl<$Res> implements $SessionViewCopyWith<$Res> {
  _$SessionViewCopyWithImpl(this._self, this._then);

  final SessionView _self;
  final $Res Function(SessionView) _then;

  /// Create a copy of SessionView
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? session = null,
    Object? isOnline = null,
    Object? sync = null,
    Object? isBusy = null,
    Object? prompt = freezed,
    Object? problem = freezed,
    Object? notice = freezed,
  }) {
    return _then(
      _self.copyWith(
        session: null == session
            ? _self.session
            : session // ignore: cast_nullable_to_non_nullable
                  as LiveSession,
        isOnline: null == isOnline
            ? _self.isOnline
            : isOnline // ignore: cast_nullable_to_non_nullable
                  as bool,
        sync: null == sync
            ? _self.sync
            : sync // ignore: cast_nullable_to_non_nullable
                  as SyncSnapshot,
        isBusy: null == isBusy
            ? _self.isBusy
            : isBusy // ignore: cast_nullable_to_non_nullable
                  as bool,
        prompt: freezed == prompt
            ? _self.prompt
            : prompt // ignore: cast_nullable_to_non_nullable
                  as SessionPrompt?,
        problem: freezed == problem
            ? _self.problem
            : problem // ignore: cast_nullable_to_non_nullable
                  as SessionProblem?,
        notice: freezed == notice
            ? _self.notice
            : notice // ignore: cast_nullable_to_non_nullable
                  as SessionNotice?,
      ),
    );
  }

  /// Create a copy of SessionView
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LiveSessionCopyWith<$Res> get session {
    return $LiveSessionCopyWith<$Res>(_self.session, (value) {
      return _then(_self.copyWith(session: value));
    });
  }

  /// Create a copy of SessionView
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SyncSnapshotCopyWith<$Res> get sync {
    return $SyncSnapshotCopyWith<$Res>(_self.sync, (value) {
      return _then(_self.copyWith(sync: value));
    });
  }

  /// Create a copy of SessionView
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionPromptCopyWith<$Res>? get prompt {
    if (_self.prompt == null) {
      return null;
    }

    return $SessionPromptCopyWith<$Res>(_self.prompt!, (value) {
      return _then(_self.copyWith(prompt: value));
    });
  }

  /// Create a copy of SessionView
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionProblemCopyWith<$Res>? get problem {
    if (_self.problem == null) {
      return null;
    }

    return $SessionProblemCopyWith<$Res>(_self.problem!, (value) {
      return _then(_self.copyWith(problem: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SessionView].
extension SessionViewPatterns on SessionView {
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
    TResult Function(_SessionView value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SessionView() when $default != null:
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
    TResult Function(_SessionView value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionView():
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
    TResult? Function(_SessionView value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionView() when $default != null:
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
      LiveSession session,
      bool isOnline,
      SyncSnapshot sync,
      bool isBusy,
      SessionPrompt? prompt,
      SessionProblem? problem,
      SessionNotice? notice,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SessionView() when $default != null:
        return $default(
          _that.session,
          _that.isOnline,
          _that.sync,
          _that.isBusy,
          _that.prompt,
          _that.problem,
          _that.notice,
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
      LiveSession session,
      bool isOnline,
      SyncSnapshot sync,
      bool isBusy,
      SessionPrompt? prompt,
      SessionProblem? problem,
      SessionNotice? notice,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionView():
        return $default(
          _that.session,
          _that.isOnline,
          _that.sync,
          _that.isBusy,
          _that.prompt,
          _that.problem,
          _that.notice,
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
      LiveSession session,
      bool isOnline,
      SyncSnapshot sync,
      bool isBusy,
      SessionPrompt? prompt,
      SessionProblem? problem,
      SessionNotice? notice,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionView() when $default != null:
        return $default(
          _that.session,
          _that.isOnline,
          _that.sync,
          _that.isBusy,
          _that.prompt,
          _that.problem,
          _that.notice,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SessionView extends SessionView {
  const _SessionView({
    required this.session,
    required this.isOnline,
    required this.sync,
    this.isBusy = false,
    this.prompt,
    this.problem,
    this.notice,
  }) : super._();

  @override
  final LiveSession session;
  @override
  final bool isOnline;
  @override
  final SyncSnapshot sync;
  @override
  @JsonKey()
  final bool isBusy;
  @override
  final SessionPrompt? prompt;
  @override
  final SessionProblem? problem;
  @override
  final SessionNotice? notice;

  /// Create a copy of SessionView
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SessionViewCopyWith<_SessionView> get copyWith =>
      __$SessionViewCopyWithImpl<_SessionView>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SessionView &&
            (identical(other.session, session) || other.session == session) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline) &&
            (identical(other.sync, sync) || other.sync == sync) &&
            (identical(other.isBusy, isBusy) || other.isBusy == isBusy) &&
            (identical(other.prompt, prompt) || other.prompt == prompt) &&
            (identical(other.problem, problem) || other.problem == problem) &&
            (identical(other.notice, notice) || other.notice == notice));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    session,
    isOnline,
    sync,
    isBusy,
    prompt,
    problem,
    notice,
  );

  @override
  String toString() {
    return 'SessionView(session: $session, isOnline: $isOnline, sync: $sync, isBusy: $isBusy, prompt: $prompt, problem: $problem, notice: $notice)';
  }
}

/// @nodoc
abstract mixin class _$SessionViewCopyWith<$Res>
    implements $SessionViewCopyWith<$Res> {
  factory _$SessionViewCopyWith(
    _SessionView value,
    $Res Function(_SessionView) _then,
  ) = __$SessionViewCopyWithImpl;
  @override
  @useResult
  $Res call({
    LiveSession session,
    bool isOnline,
    SyncSnapshot sync,
    bool isBusy,
    SessionPrompt? prompt,
    SessionProblem? problem,
    SessionNotice? notice,
  });

  @override
  $LiveSessionCopyWith<$Res> get session;
  @override
  $SyncSnapshotCopyWith<$Res> get sync;
  @override
  $SessionPromptCopyWith<$Res>? get prompt;
  @override
  $SessionProblemCopyWith<$Res>? get problem;
}

/// @nodoc
class __$SessionViewCopyWithImpl<$Res> implements _$SessionViewCopyWith<$Res> {
  __$SessionViewCopyWithImpl(this._self, this._then);

  final _SessionView _self;
  final $Res Function(_SessionView) _then;

  /// Create a copy of SessionView
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? session = null,
    Object? isOnline = null,
    Object? sync = null,
    Object? isBusy = null,
    Object? prompt = freezed,
    Object? problem = freezed,
    Object? notice = freezed,
  }) {
    return _then(
      _SessionView(
        session: null == session
            ? _self.session
            : session // ignore: cast_nullable_to_non_nullable
                  as LiveSession,
        isOnline: null == isOnline
            ? _self.isOnline
            : isOnline // ignore: cast_nullable_to_non_nullable
                  as bool,
        sync: null == sync
            ? _self.sync
            : sync // ignore: cast_nullable_to_non_nullable
                  as SyncSnapshot,
        isBusy: null == isBusy
            ? _self.isBusy
            : isBusy // ignore: cast_nullable_to_non_nullable
                  as bool,
        prompt: freezed == prompt
            ? _self.prompt
            : prompt // ignore: cast_nullable_to_non_nullable
                  as SessionPrompt?,
        problem: freezed == problem
            ? _self.problem
            : problem // ignore: cast_nullable_to_non_nullable
                  as SessionProblem?,
        notice: freezed == notice
            ? _self.notice
            : notice // ignore: cast_nullable_to_non_nullable
                  as SessionNotice?,
      ),
    );
  }

  /// Create a copy of SessionView
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LiveSessionCopyWith<$Res> get session {
    return $LiveSessionCopyWith<$Res>(_self.session, (value) {
      return _then(_self.copyWith(session: value));
    });
  }

  /// Create a copy of SessionView
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SyncSnapshotCopyWith<$Res> get sync {
    return $SyncSnapshotCopyWith<$Res>(_self.sync, (value) {
      return _then(_self.copyWith(sync: value));
    });
  }

  /// Create a copy of SessionView
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionPromptCopyWith<$Res>? get prompt {
    if (_self.prompt == null) {
      return null;
    }

    return $SessionPromptCopyWith<$Res>(_self.prompt!, (value) {
      return _then(_self.copyWith(prompt: value));
    });
  }

  /// Create a copy of SessionView
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionProblemCopyWith<$Res>? get problem {
    if (_self.problem == null) {
      return null;
    }

    return $SessionProblemCopyWith<$Res>(_self.problem!, (value) {
      return _then(_self.copyWith(problem: value));
    });
  }
}

/// @nodoc
mixin _$SessionPrompt {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SessionPrompt);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SessionPrompt()';
  }
}

/// @nodoc
class $SessionPromptCopyWith<$Res> {
  $SessionPromptCopyWith(SessionPrompt _, $Res Function(SessionPrompt) __);
}

/// Adds pattern-matching-related methods to [SessionPrompt].
extension SessionPromptPatterns on SessionPrompt {
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
    TResult Function(ConfirmAdvancePrompt value)? confirmAdvance,
    TResult Function(ConfirmClosePrompt value)? confirmClose,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ConfirmAdvancePrompt() when confirmAdvance != null:
        return confirmAdvance(_that);
      case ConfirmClosePrompt() when confirmClose != null:
        return confirmClose(_that);
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
    required TResult Function(ConfirmAdvancePrompt value) confirmAdvance,
    required TResult Function(ConfirmClosePrompt value) confirmClose,
  }) {
    final _that = this;
    switch (_that) {
      case ConfirmAdvancePrompt():
        return confirmAdvance(_that);
      case ConfirmClosePrompt():
        return confirmClose(_that);
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
    TResult? Function(ConfirmAdvancePrompt value)? confirmAdvance,
    TResult? Function(ConfirmClosePrompt value)? confirmClose,
  }) {
    final _that = this;
    switch (_that) {
      case ConfirmAdvancePrompt() when confirmAdvance != null:
        return confirmAdvance(_that);
      case ConfirmClosePrompt() when confirmClose != null:
        return confirmClose(_that);
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
    TResult Function(
      FacilitatorStage next,
      List<String> pendingNames,
      List<MemberStep> myMissingSteps,
    )?
    confirmAdvance,
    TResult Function(int incomplete)? confirmClose,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ConfirmAdvancePrompt() when confirmAdvance != null:
        return confirmAdvance(
          _that.next,
          _that.pendingNames,
          _that.myMissingSteps,
        );
      case ConfirmClosePrompt() when confirmClose != null:
        return confirmClose(_that.incomplete);
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
    required TResult Function(
      FacilitatorStage next,
      List<String> pendingNames,
      List<MemberStep> myMissingSteps,
    )
    confirmAdvance,
    required TResult Function(int incomplete) confirmClose,
  }) {
    final _that = this;
    switch (_that) {
      case ConfirmAdvancePrompt():
        return confirmAdvance(
          _that.next,
          _that.pendingNames,
          _that.myMissingSteps,
        );
      case ConfirmClosePrompt():
        return confirmClose(_that.incomplete);
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
    TResult? Function(
      FacilitatorStage next,
      List<String> pendingNames,
      List<MemberStep> myMissingSteps,
    )?
    confirmAdvance,
    TResult? Function(int incomplete)? confirmClose,
  }) {
    final _that = this;
    switch (_that) {
      case ConfirmAdvancePrompt() when confirmAdvance != null:
        return confirmAdvance(
          _that.next,
          _that.pendingNames,
          _that.myMissingSteps,
        );
      case ConfirmClosePrompt() when confirmClose != null:
        return confirmClose(_that.incomplete);
      case _:
        return null;
    }
  }
}

/// @nodoc

class ConfirmAdvancePrompt implements SessionPrompt {
  const ConfirmAdvancePrompt({
    required this.next,
    required final List<String> pendingNames,
    required final List<MemberStep> myMissingSteps,
  }) : _pendingNames = pendingNames,
       _myMissingSteps = myMissingSteps;

  final FacilitatorStage next;

  /// First names of members who have not answered.
  final List<String> _pendingNames;

  /// First names of members who have not answered.
  List<String> get pendingNames {
    if (_pendingNames is EqualUnmodifiableListView) return _pendingNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pendingNames);
  }

  /// The facilitator's own unanswered steps.
  final List<MemberStep> _myMissingSteps;

  /// The facilitator's own unanswered steps.
  List<MemberStep> get myMissingSteps {
    if (_myMissingSteps is EqualUnmodifiableListView) return _myMissingSteps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_myMissingSteps);
  }

  /// Create a copy of SessionPrompt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ConfirmAdvancePromptCopyWith<ConfirmAdvancePrompt> get copyWith =>
      _$ConfirmAdvancePromptCopyWithImpl<ConfirmAdvancePrompt>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ConfirmAdvancePrompt &&
            (identical(other.next, next) || other.next == next) &&
            const DeepCollectionEquality().equals(
              other._pendingNames,
              _pendingNames,
            ) &&
            const DeepCollectionEquality().equals(
              other._myMissingSteps,
              _myMissingSteps,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    next,
    const DeepCollectionEquality().hash(_pendingNames),
    const DeepCollectionEquality().hash(_myMissingSteps),
  );

  @override
  String toString() {
    return 'SessionPrompt.confirmAdvance(next: $next, pendingNames: $pendingNames, myMissingSteps: $myMissingSteps)';
  }
}

/// @nodoc
abstract mixin class $ConfirmAdvancePromptCopyWith<$Res>
    implements $SessionPromptCopyWith<$Res> {
  factory $ConfirmAdvancePromptCopyWith(
    ConfirmAdvancePrompt value,
    $Res Function(ConfirmAdvancePrompt) _then,
  ) = _$ConfirmAdvancePromptCopyWithImpl;
  @useResult
  $Res call({
    FacilitatorStage next,
    List<String> pendingNames,
    List<MemberStep> myMissingSteps,
  });
}

/// @nodoc
class _$ConfirmAdvancePromptCopyWithImpl<$Res>
    implements $ConfirmAdvancePromptCopyWith<$Res> {
  _$ConfirmAdvancePromptCopyWithImpl(this._self, this._then);

  final ConfirmAdvancePrompt _self;
  final $Res Function(ConfirmAdvancePrompt) _then;

  /// Create a copy of SessionPrompt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? next = null,
    Object? pendingNames = null,
    Object? myMissingSteps = null,
  }) {
    return _then(
      ConfirmAdvancePrompt(
        next: null == next
            ? _self.next
            : next // ignore: cast_nullable_to_non_nullable
                  as FacilitatorStage,
        pendingNames: null == pendingNames
            ? _self._pendingNames
            : pendingNames // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        myMissingSteps: null == myMissingSteps
            ? _self._myMissingSteps
            : myMissingSteps // ignore: cast_nullable_to_non_nullable
                  as List<MemberStep>,
      ),
    );
  }
}

/// @nodoc

class ConfirmClosePrompt implements SessionPrompt {
  const ConfirmClosePrompt({required this.incomplete});

  /// People with incomplete answers.
  final int incomplete;

  /// Create a copy of SessionPrompt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ConfirmClosePromptCopyWith<ConfirmClosePrompt> get copyWith =>
      _$ConfirmClosePromptCopyWithImpl<ConfirmClosePrompt>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ConfirmClosePrompt &&
            (identical(other.incomplete, incomplete) ||
                other.incomplete == incomplete));
  }

  @override
  int get hashCode => Object.hash(runtimeType, incomplete);

  @override
  String toString() {
    return 'SessionPrompt.confirmClose(incomplete: $incomplete)';
  }
}

/// @nodoc
abstract mixin class $ConfirmClosePromptCopyWith<$Res>
    implements $SessionPromptCopyWith<$Res> {
  factory $ConfirmClosePromptCopyWith(
    ConfirmClosePrompt value,
    $Res Function(ConfirmClosePrompt) _then,
  ) = _$ConfirmClosePromptCopyWithImpl;
  @useResult
  $Res call({int incomplete});
}

/// @nodoc
class _$ConfirmClosePromptCopyWithImpl<$Res>
    implements $ConfirmClosePromptCopyWith<$Res> {
  _$ConfirmClosePromptCopyWithImpl(this._self, this._then);

  final ConfirmClosePrompt _self;
  final $Res Function(ConfirmClosePrompt) _then;

  /// Create a copy of SessionPrompt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? incomplete = null}) {
    return _then(
      ConfirmClosePrompt(
        incomplete: null == incomplete
            ? _self.incomplete
            : incomplete // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
mixin _$SessionProblem {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SessionProblem);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SessionProblem()';
  }
}

/// @nodoc
class $SessionProblemCopyWith<$Res> {
  $SessionProblemCopyWith(SessionProblem _, $Res Function(SessionProblem) __);
}

/// Adds pattern-matching-related methods to [SessionProblem].
extension SessionProblemPatterns on SessionProblem {
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
    TResult Function(AttendanceIncompleteProblem value)? attendanceIncomplete,
    TResult Function(ControlFailedProblem value)? failed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case AttendanceIncompleteProblem() when attendanceIncomplete != null:
        return attendanceIncomplete(_that);
      case ControlFailedProblem() when failed != null:
        return failed(_that);
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
    required TResult Function(AttendanceIncompleteProblem value)
    attendanceIncomplete,
    required TResult Function(ControlFailedProblem value) failed,
  }) {
    final _that = this;
    switch (_that) {
      case AttendanceIncompleteProblem():
        return attendanceIncomplete(_that);
      case ControlFailedProblem():
        return failed(_that);
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
    TResult? Function(AttendanceIncompleteProblem value)? attendanceIncomplete,
    TResult? Function(ControlFailedProblem value)? failed,
  }) {
    final _that = this;
    switch (_that) {
      case AttendanceIncompleteProblem() when attendanceIncomplete != null:
        return attendanceIncomplete(_that);
      case ControlFailedProblem() when failed != null:
        return failed(_that);
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
    TResult Function(List<String> personIds)? attendanceIncomplete,
    TResult Function(Object error)? failed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case AttendanceIncompleteProblem() when attendanceIncomplete != null:
        return attendanceIncomplete(_that.personIds);
      case ControlFailedProblem() when failed != null:
        return failed(_that.error);
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
    required TResult Function(List<String> personIds) attendanceIncomplete,
    required TResult Function(Object error) failed,
  }) {
    final _that = this;
    switch (_that) {
      case AttendanceIncompleteProblem():
        return attendanceIncomplete(_that.personIds);
      case ControlFailedProblem():
        return failed(_that.error);
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
    TResult? Function(List<String> personIds)? attendanceIncomplete,
    TResult? Function(Object error)? failed,
  }) {
    final _that = this;
    switch (_that) {
      case AttendanceIncompleteProblem() when attendanceIncomplete != null:
        return attendanceIncomplete(_that.personIds);
      case ControlFailedProblem() when failed != null:
        return failed(_that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class AttendanceIncompleteProblem implements SessionProblem {
  const AttendanceIncompleteProblem(final List<String> personIds)
    : _personIds = personIds;

  final List<String> _personIds;
  List<String> get personIds {
    if (_personIds is EqualUnmodifiableListView) return _personIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_personIds);
  }

  /// Create a copy of SessionProblem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AttendanceIncompleteProblemCopyWith<AttendanceIncompleteProblem>
  get copyWith =>
      _$AttendanceIncompleteProblemCopyWithImpl<AttendanceIncompleteProblem>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AttendanceIncompleteProblem &&
            const DeepCollectionEquality().equals(
              other._personIds,
              _personIds,
            ));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_personIds));

  @override
  String toString() {
    return 'SessionProblem.attendanceIncomplete(personIds: $personIds)';
  }
}

/// @nodoc
abstract mixin class $AttendanceIncompleteProblemCopyWith<$Res>
    implements $SessionProblemCopyWith<$Res> {
  factory $AttendanceIncompleteProblemCopyWith(
    AttendanceIncompleteProblem value,
    $Res Function(AttendanceIncompleteProblem) _then,
  ) = _$AttendanceIncompleteProblemCopyWithImpl;
  @useResult
  $Res call({List<String> personIds});
}

/// @nodoc
class _$AttendanceIncompleteProblemCopyWithImpl<$Res>
    implements $AttendanceIncompleteProblemCopyWith<$Res> {
  _$AttendanceIncompleteProblemCopyWithImpl(this._self, this._then);

  final AttendanceIncompleteProblem _self;
  final $Res Function(AttendanceIncompleteProblem) _then;

  /// Create a copy of SessionProblem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? personIds = null}) {
    return _then(
      AttendanceIncompleteProblem(
        null == personIds
            ? _self._personIds
            : personIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc

class ControlFailedProblem implements SessionProblem {
  const ControlFailedProblem(this.error);

  final Object error;

  /// Create a copy of SessionProblem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ControlFailedProblemCopyWith<ControlFailedProblem> get copyWith =>
      _$ControlFailedProblemCopyWithImpl<ControlFailedProblem>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ControlFailedProblem &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @override
  String toString() {
    return 'SessionProblem.failed(error: $error)';
  }
}

/// @nodoc
abstract mixin class $ControlFailedProblemCopyWith<$Res>
    implements $SessionProblemCopyWith<$Res> {
  factory $ControlFailedProblemCopyWith(
    ControlFailedProblem value,
    $Res Function(ControlFailedProblem) _then,
  ) = _$ControlFailedProblemCopyWithImpl;
  @useResult
  $Res call({Object error});
}

/// @nodoc
class _$ControlFailedProblemCopyWithImpl<$Res>
    implements $ControlFailedProblemCopyWith<$Res> {
  _$ControlFailedProblemCopyWithImpl(this._self, this._then);

  final ControlFailedProblem _self;
  final $Res Function(ControlFailedProblem) _then;

  /// Create a copy of SessionProblem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? error = null}) {
    return _then(ControlFailedProblem(null == error ? _self.error : error));
  }
}

/// @nodoc
mixin _$ControlOverride {
  SessionStatus? get status;
  SessionStage? get stage;
  DateTime? get answersClosedAt;
  DateTime? get endedAt;

  /// Create a copy of ControlOverride
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ControlOverrideCopyWith<ControlOverride> get copyWith =>
      _$ControlOverrideCopyWithImpl<ControlOverride>(
        this as ControlOverride,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ControlOverride &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.answersClosedAt, answersClosedAt) ||
                other.answersClosedAt == answersClosedAt) &&
            (identical(other.endedAt, endedAt) || other.endedAt == endedAt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, stage, answersClosedAt, endedAt);

  @override
  String toString() {
    return 'ControlOverride(status: $status, stage: $stage, answersClosedAt: $answersClosedAt, endedAt: $endedAt)';
  }
}

/// @nodoc
abstract mixin class $ControlOverrideCopyWith<$Res> {
  factory $ControlOverrideCopyWith(
    ControlOverride value,
    $Res Function(ControlOverride) _then,
  ) = _$ControlOverrideCopyWithImpl;
  @useResult
  $Res call({
    SessionStatus? status,
    SessionStage? stage,
    DateTime? answersClosedAt,
    DateTime? endedAt,
  });
}

/// @nodoc
class _$ControlOverrideCopyWithImpl<$Res>
    implements $ControlOverrideCopyWith<$Res> {
  _$ControlOverrideCopyWithImpl(this._self, this._then);

  final ControlOverride _self;
  final $Res Function(ControlOverride) _then;

  /// Create a copy of ControlOverride
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? stage = freezed,
    Object? answersClosedAt = freezed,
    Object? endedAt = freezed,
  }) {
    return _then(
      _self.copyWith(
        status: freezed == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as SessionStatus?,
        stage: freezed == stage
            ? _self.stage
            : stage // ignore: cast_nullable_to_non_nullable
                  as SessionStage?,
        answersClosedAt: freezed == answersClosedAt
            ? _self.answersClosedAt
            : answersClosedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        endedAt: freezed == endedAt
            ? _self.endedAt
            : endedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [ControlOverride].
extension ControlOverridePatterns on ControlOverride {
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
    TResult Function(_ControlOverride value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ControlOverride() when $default != null:
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
    TResult Function(_ControlOverride value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ControlOverride():
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
    TResult? Function(_ControlOverride value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ControlOverride() when $default != null:
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
      SessionStatus? status,
      SessionStage? stage,
      DateTime? answersClosedAt,
      DateTime? endedAt,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ControlOverride() when $default != null:
        return $default(
          _that.status,
          _that.stage,
          _that.answersClosedAt,
          _that.endedAt,
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
      SessionStatus? status,
      SessionStage? stage,
      DateTime? answersClosedAt,
      DateTime? endedAt,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ControlOverride():
        return $default(
          _that.status,
          _that.stage,
          _that.answersClosedAt,
          _that.endedAt,
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
      SessionStatus? status,
      SessionStage? stage,
      DateTime? answersClosedAt,
      DateTime? endedAt,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ControlOverride() when $default != null:
        return $default(
          _that.status,
          _that.stage,
          _that.answersClosedAt,
          _that.endedAt,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ControlOverride implements ControlOverride {
  const _ControlOverride({
    this.status,
    this.stage,
    this.answersClosedAt,
    this.endedAt,
  });

  @override
  final SessionStatus? status;
  @override
  final SessionStage? stage;
  @override
  final DateTime? answersClosedAt;
  @override
  final DateTime? endedAt;

  /// Create a copy of ControlOverride
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ControlOverrideCopyWith<_ControlOverride> get copyWith =>
      __$ControlOverrideCopyWithImpl<_ControlOverride>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ControlOverride &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.answersClosedAt, answersClosedAt) ||
                other.answersClosedAt == answersClosedAt) &&
            (identical(other.endedAt, endedAt) || other.endedAt == endedAt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, stage, answersClosedAt, endedAt);

  @override
  String toString() {
    return 'ControlOverride(status: $status, stage: $stage, answersClosedAt: $answersClosedAt, endedAt: $endedAt)';
  }
}

/// @nodoc
abstract mixin class _$ControlOverrideCopyWith<$Res>
    implements $ControlOverrideCopyWith<$Res> {
  factory _$ControlOverrideCopyWith(
    _ControlOverride value,
    $Res Function(_ControlOverride) _then,
  ) = __$ControlOverrideCopyWithImpl;
  @override
  @useResult
  $Res call({
    SessionStatus? status,
    SessionStage? stage,
    DateTime? answersClosedAt,
    DateTime? endedAt,
  });
}

/// @nodoc
class __$ControlOverrideCopyWithImpl<$Res>
    implements _$ControlOverrideCopyWith<$Res> {
  __$ControlOverrideCopyWithImpl(this._self, this._then);

  final _ControlOverride _self;
  final $Res Function(_ControlOverride) _then;

  /// Create a copy of ControlOverride
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = freezed,
    Object? stage = freezed,
    Object? answersClosedAt = freezed,
    Object? endedAt = freezed,
  }) {
    return _then(
      _ControlOverride(
        status: freezed == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as SessionStatus?,
        stage: freezed == stage
            ? _self.stage
            : stage // ignore: cast_nullable_to_non_nullable
                  as SessionStage?,
        answersClosedAt: freezed == answersClosedAt
            ? _self.answersClosedAt
            : answersClosedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        endedAt: freezed == endedAt
            ? _self.endedAt
            : endedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}
