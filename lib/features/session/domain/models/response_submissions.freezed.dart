// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_submissions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FollowUpSubmission {
  String get sessionId;
  String get previousCommitmentId;
  CommitmentFollowUpStatus get status;
  int get score;
  String? get note;

  /// Optional "¿Por qué ese puntaje?" (RF-52).
  String? get justification;

  /// Create a copy of FollowUpSubmission
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowUpSubmissionCopyWith<FollowUpSubmission> get copyWith =>
      _$FollowUpSubmissionCopyWithImpl<FollowUpSubmission>(
        this as FollowUpSubmission,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FollowUpSubmission &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.previousCommitmentId, previousCommitmentId) ||
                other.previousCommitmentId == previousCommitmentId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.justification, justification) ||
                other.justification == justification));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    sessionId,
    previousCommitmentId,
    status,
    score,
    note,
    justification,
  );

  @override
  String toString() {
    return 'FollowUpSubmission(sessionId: $sessionId, previousCommitmentId: $previousCommitmentId, status: $status, score: $score, note: $note, justification: $justification)';
  }
}

/// @nodoc
abstract mixin class $FollowUpSubmissionCopyWith<$Res> {
  factory $FollowUpSubmissionCopyWith(
    FollowUpSubmission value,
    $Res Function(FollowUpSubmission) _then,
  ) = _$FollowUpSubmissionCopyWithImpl;
  @useResult
  $Res call({
    String sessionId,
    String previousCommitmentId,
    CommitmentFollowUpStatus status,
    int score,
    String? note,
    String? justification,
  });
}

/// @nodoc
class _$FollowUpSubmissionCopyWithImpl<$Res>
    implements $FollowUpSubmissionCopyWith<$Res> {
  _$FollowUpSubmissionCopyWithImpl(this._self, this._then);

  final FollowUpSubmission _self;
  final $Res Function(FollowUpSubmission) _then;

  /// Create a copy of FollowUpSubmission
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? previousCommitmentId = null,
    Object? status = null,
    Object? score = null,
    Object? note = freezed,
    Object? justification = freezed,
  }) {
    return _then(
      _self.copyWith(
        sessionId: null == sessionId
            ? _self.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String,
        previousCommitmentId: null == previousCommitmentId
            ? _self.previousCommitmentId
            : previousCommitmentId // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as CommitmentFollowUpStatus,
        score: null == score
            ? _self.score
            : score // ignore: cast_nullable_to_non_nullable
                  as int,
        note: freezed == note
            ? _self.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String?,
        justification: freezed == justification
            ? _self.justification
            : justification // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [FollowUpSubmission].
extension FollowUpSubmissionPatterns on FollowUpSubmission {
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
    TResult Function(_FollowUpSubmission value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowUpSubmission() when $default != null:
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
    TResult Function(_FollowUpSubmission value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowUpSubmission():
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
    TResult? Function(_FollowUpSubmission value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowUpSubmission() when $default != null:
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
      String sessionId,
      String previousCommitmentId,
      CommitmentFollowUpStatus status,
      int score,
      String? note,
      String? justification,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowUpSubmission() when $default != null:
        return $default(
          _that.sessionId,
          _that.previousCommitmentId,
          _that.status,
          _that.score,
          _that.note,
          _that.justification,
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
      String sessionId,
      String previousCommitmentId,
      CommitmentFollowUpStatus status,
      int score,
      String? note,
      String? justification,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowUpSubmission():
        return $default(
          _that.sessionId,
          _that.previousCommitmentId,
          _that.status,
          _that.score,
          _that.note,
          _that.justification,
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
      String sessionId,
      String previousCommitmentId,
      CommitmentFollowUpStatus status,
      int score,
      String? note,
      String? justification,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowUpSubmission() when $default != null:
        return $default(
          _that.sessionId,
          _that.previousCommitmentId,
          _that.status,
          _that.score,
          _that.note,
          _that.justification,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FollowUpSubmission implements FollowUpSubmission {
  const _FollowUpSubmission({
    required this.sessionId,
    required this.previousCommitmentId,
    required this.status,
    required this.score,
    this.note,
    this.justification,
  });

  @override
  final String sessionId;
  @override
  final String previousCommitmentId;
  @override
  final CommitmentFollowUpStatus status;
  @override
  final int score;
  @override
  final String? note;

  /// Optional "¿Por qué ese puntaje?" (RF-52).
  @override
  final String? justification;

  /// Create a copy of FollowUpSubmission
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FollowUpSubmissionCopyWith<_FollowUpSubmission> get copyWith =>
      __$FollowUpSubmissionCopyWithImpl<_FollowUpSubmission>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FollowUpSubmission &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.previousCommitmentId, previousCommitmentId) ||
                other.previousCommitmentId == previousCommitmentId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.justification, justification) ||
                other.justification == justification));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    sessionId,
    previousCommitmentId,
    status,
    score,
    note,
    justification,
  );

  @override
  String toString() {
    return 'FollowUpSubmission(sessionId: $sessionId, previousCommitmentId: $previousCommitmentId, status: $status, score: $score, note: $note, justification: $justification)';
  }
}

/// @nodoc
abstract mixin class _$FollowUpSubmissionCopyWith<$Res>
    implements $FollowUpSubmissionCopyWith<$Res> {
  factory _$FollowUpSubmissionCopyWith(
    _FollowUpSubmission value,
    $Res Function(_FollowUpSubmission) _then,
  ) = __$FollowUpSubmissionCopyWithImpl;
  @override
  @useResult
  $Res call({
    String sessionId,
    String previousCommitmentId,
    CommitmentFollowUpStatus status,
    int score,
    String? note,
    String? justification,
  });
}

/// @nodoc
class __$FollowUpSubmissionCopyWithImpl<$Res>
    implements _$FollowUpSubmissionCopyWith<$Res> {
  __$FollowUpSubmissionCopyWithImpl(this._self, this._then);

  final _FollowUpSubmission _self;
  final $Res Function(_FollowUpSubmission) _then;

  /// Create a copy of FollowUpSubmission
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sessionId = null,
    Object? previousCommitmentId = null,
    Object? status = null,
    Object? score = null,
    Object? note = freezed,
    Object? justification = freezed,
  }) {
    return _then(
      _FollowUpSubmission(
        sessionId: null == sessionId
            ? _self.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String,
        previousCommitmentId: null == previousCommitmentId
            ? _self.previousCommitmentId
            : previousCommitmentId // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as CommitmentFollowUpStatus,
        score: null == score
            ? _self.score
            : score // ignore: cast_nullable_to_non_nullable
                  as int,
        note: freezed == note
            ? _self.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String?,
        justification: freezed == justification
            ? _self.justification
            : justification // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
mixin _$ReflectionSubmission {
  String get sessionId;

  /// Answer text by question id. A picked person's answer is their name.
  Map<String, String> get answers;
  int get score;

  /// Person picked for a `person` question, by question id (RF-54). A
  /// question missing here was answered with free text.
  Map<String, String> get answerPersonIds;

  /// Optional "¿Por qué ese puntaje?" (RF-52).
  String? get justification;

  /// Create a copy of ReflectionSubmission
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReflectionSubmissionCopyWith<ReflectionSubmission> get copyWith =>
      _$ReflectionSubmissionCopyWithImpl<ReflectionSubmission>(
        this as ReflectionSubmission,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReflectionSubmission &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            const DeepCollectionEquality().equals(other.answers, answers) &&
            (identical(other.score, score) || other.score == score) &&
            const DeepCollectionEquality().equals(
              other.answerPersonIds,
              answerPersonIds,
            ) &&
            (identical(other.justification, justification) ||
                other.justification == justification));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    sessionId,
    const DeepCollectionEquality().hash(answers),
    score,
    const DeepCollectionEquality().hash(answerPersonIds),
    justification,
  );

  @override
  String toString() {
    return 'ReflectionSubmission(sessionId: $sessionId, answers: $answers, score: $score, answerPersonIds: $answerPersonIds, justification: $justification)';
  }
}

/// @nodoc
abstract mixin class $ReflectionSubmissionCopyWith<$Res> {
  factory $ReflectionSubmissionCopyWith(
    ReflectionSubmission value,
    $Res Function(ReflectionSubmission) _then,
  ) = _$ReflectionSubmissionCopyWithImpl;
  @useResult
  $Res call({
    String sessionId,
    Map<String, String> answers,
    int score,
    Map<String, String> answerPersonIds,
    String? justification,
  });
}

/// @nodoc
class _$ReflectionSubmissionCopyWithImpl<$Res>
    implements $ReflectionSubmissionCopyWith<$Res> {
  _$ReflectionSubmissionCopyWithImpl(this._self, this._then);

  final ReflectionSubmission _self;
  final $Res Function(ReflectionSubmission) _then;

  /// Create a copy of ReflectionSubmission
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? answers = null,
    Object? score = null,
    Object? answerPersonIds = null,
    Object? justification = freezed,
  }) {
    return _then(
      _self.copyWith(
        sessionId: null == sessionId
            ? _self.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String,
        answers: null == answers
            ? _self.answers
            : answers // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>,
        score: null == score
            ? _self.score
            : score // ignore: cast_nullable_to_non_nullable
                  as int,
        answerPersonIds: null == answerPersonIds
            ? _self.answerPersonIds
            : answerPersonIds // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>,
        justification: freezed == justification
            ? _self.justification
            : justification // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [ReflectionSubmission].
extension ReflectionSubmissionPatterns on ReflectionSubmission {
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
    TResult Function(_ReflectionSubmission value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReflectionSubmission() when $default != null:
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
    TResult Function(_ReflectionSubmission value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReflectionSubmission():
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
    TResult? Function(_ReflectionSubmission value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReflectionSubmission() when $default != null:
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
      String sessionId,
      Map<String, String> answers,
      int score,
      Map<String, String> answerPersonIds,
      String? justification,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReflectionSubmission() when $default != null:
        return $default(
          _that.sessionId,
          _that.answers,
          _that.score,
          _that.answerPersonIds,
          _that.justification,
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
      String sessionId,
      Map<String, String> answers,
      int score,
      Map<String, String> answerPersonIds,
      String? justification,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReflectionSubmission():
        return $default(
          _that.sessionId,
          _that.answers,
          _that.score,
          _that.answerPersonIds,
          _that.justification,
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
      String sessionId,
      Map<String, String> answers,
      int score,
      Map<String, String> answerPersonIds,
      String? justification,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReflectionSubmission() when $default != null:
        return $default(
          _that.sessionId,
          _that.answers,
          _that.score,
          _that.answerPersonIds,
          _that.justification,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ReflectionSubmission implements ReflectionSubmission {
  const _ReflectionSubmission({
    required this.sessionId,
    required final Map<String, String> answers,
    required this.score,
    final Map<String, String> answerPersonIds = const {},
    this.justification,
  }) : _answers = answers,
       _answerPersonIds = answerPersonIds;

  @override
  final String sessionId;

  /// Answer text by question id. A picked person's answer is their name.
  final Map<String, String> _answers;

  /// Answer text by question id. A picked person's answer is their name.
  @override
  Map<String, String> get answers {
    if (_answers is EqualUnmodifiableMapView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_answers);
  }

  @override
  final int score;

  /// Person picked for a `person` question, by question id (RF-54). A
  /// question missing here was answered with free text.
  final Map<String, String> _answerPersonIds;

  /// Person picked for a `person` question, by question id (RF-54). A
  /// question missing here was answered with free text.
  @override
  @JsonKey()
  Map<String, String> get answerPersonIds {
    if (_answerPersonIds is EqualUnmodifiableMapView) return _answerPersonIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_answerPersonIds);
  }

  /// Optional "¿Por qué ese puntaje?" (RF-52).
  @override
  final String? justification;

  /// Create a copy of ReflectionSubmission
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReflectionSubmissionCopyWith<_ReflectionSubmission> get copyWith =>
      __$ReflectionSubmissionCopyWithImpl<_ReflectionSubmission>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReflectionSubmission &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.score, score) || other.score == score) &&
            const DeepCollectionEquality().equals(
              other._answerPersonIds,
              _answerPersonIds,
            ) &&
            (identical(other.justification, justification) ||
                other.justification == justification));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    sessionId,
    const DeepCollectionEquality().hash(_answers),
    score,
    const DeepCollectionEquality().hash(_answerPersonIds),
    justification,
  );

  @override
  String toString() {
    return 'ReflectionSubmission(sessionId: $sessionId, answers: $answers, score: $score, answerPersonIds: $answerPersonIds, justification: $justification)';
  }
}

/// @nodoc
abstract mixin class _$ReflectionSubmissionCopyWith<$Res>
    implements $ReflectionSubmissionCopyWith<$Res> {
  factory _$ReflectionSubmissionCopyWith(
    _ReflectionSubmission value,
    $Res Function(_ReflectionSubmission) _then,
  ) = __$ReflectionSubmissionCopyWithImpl;
  @override
  @useResult
  $Res call({
    String sessionId,
    Map<String, String> answers,
    int score,
    Map<String, String> answerPersonIds,
    String? justification,
  });
}

/// @nodoc
class __$ReflectionSubmissionCopyWithImpl<$Res>
    implements _$ReflectionSubmissionCopyWith<$Res> {
  __$ReflectionSubmissionCopyWithImpl(this._self, this._then);

  final _ReflectionSubmission _self;
  final $Res Function(_ReflectionSubmission) _then;

  /// Create a copy of ReflectionSubmission
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sessionId = null,
    Object? answers = null,
    Object? score = null,
    Object? answerPersonIds = null,
    Object? justification = freezed,
  }) {
    return _then(
      _ReflectionSubmission(
        sessionId: null == sessionId
            ? _self.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String,
        answers: null == answers
            ? _self._answers
            : answers // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>,
        score: null == score
            ? _self.score
            : score // ignore: cast_nullable_to_non_nullable
                  as int,
        answerPersonIds: null == answerPersonIds
            ? _self._answerPersonIds
            : answerPersonIds // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>,
        justification: freezed == justification
            ? _self.justification
            : justification // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
mixin _$CommitmentSubmission {
  String get sessionId;
  String get what;
  String get when;
  String get how;

  /// Create a copy of CommitmentSubmission
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommitmentSubmissionCopyWith<CommitmentSubmission> get copyWith =>
      _$CommitmentSubmissionCopyWithImpl<CommitmentSubmission>(
        this as CommitmentSubmission,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommitmentSubmission &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.what, what) || other.what == what) &&
            (identical(other.when, when) || other.when == when) &&
            (identical(other.how, how) || other.how == how));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sessionId, what, when, how);

  @override
  String toString() {
    return 'CommitmentSubmission(sessionId: $sessionId, what: $what, when: $when, how: $how)';
  }
}

/// @nodoc
abstract mixin class $CommitmentSubmissionCopyWith<$Res> {
  factory $CommitmentSubmissionCopyWith(
    CommitmentSubmission value,
    $Res Function(CommitmentSubmission) _then,
  ) = _$CommitmentSubmissionCopyWithImpl;
  @useResult
  $Res call({String sessionId, String what, String when, String how});
}

/// @nodoc
class _$CommitmentSubmissionCopyWithImpl<$Res>
    implements $CommitmentSubmissionCopyWith<$Res> {
  _$CommitmentSubmissionCopyWithImpl(this._self, this._then);

  final CommitmentSubmission _self;
  final $Res Function(CommitmentSubmission) _then;

  /// Create a copy of CommitmentSubmission
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? what = null,
    Object? when = null,
    Object? how = null,
  }) {
    return _then(
      _self.copyWith(
        sessionId: null == sessionId
            ? _self.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String,
        what: null == what
            ? _self.what
            : what // ignore: cast_nullable_to_non_nullable
                  as String,
        when: null == when
            ? _self.when
            : when // ignore: cast_nullable_to_non_nullable
                  as String,
        how: null == how
            ? _self.how
            : how // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [CommitmentSubmission].
extension CommitmentSubmissionPatterns on CommitmentSubmission {
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
    TResult Function(_CommitmentSubmission value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CommitmentSubmission() when $default != null:
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
    TResult Function(_CommitmentSubmission value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CommitmentSubmission():
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
    TResult? Function(_CommitmentSubmission value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CommitmentSubmission() when $default != null:
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
    TResult Function(String sessionId, String what, String when, String how)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CommitmentSubmission() when $default != null:
        return $default(_that.sessionId, _that.what, _that.when, _that.how);
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
    TResult Function(String sessionId, String what, String when, String how)
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CommitmentSubmission():
        return $default(_that.sessionId, _that.what, _that.when, _that.how);
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
    TResult? Function(String sessionId, String what, String when, String how)?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CommitmentSubmission() when $default != null:
        return $default(_that.sessionId, _that.what, _that.when, _that.how);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CommitmentSubmission extends CommitmentSubmission {
  const _CommitmentSubmission({
    required this.sessionId,
    required this.what,
    required this.when,
    required this.how,
  }) : super._();

  @override
  final String sessionId;
  @override
  final String what;
  @override
  final String when;
  @override
  final String how;

  /// Create a copy of CommitmentSubmission
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CommitmentSubmissionCopyWith<_CommitmentSubmission> get copyWith =>
      __$CommitmentSubmissionCopyWithImpl<_CommitmentSubmission>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CommitmentSubmission &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.what, what) || other.what == what) &&
            (identical(other.when, when) || other.when == when) &&
            (identical(other.how, how) || other.how == how));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sessionId, what, when, how);

  @override
  String toString() {
    return 'CommitmentSubmission(sessionId: $sessionId, what: $what, when: $when, how: $how)';
  }
}

/// @nodoc
abstract mixin class _$CommitmentSubmissionCopyWith<$Res>
    implements $CommitmentSubmissionCopyWith<$Res> {
  factory _$CommitmentSubmissionCopyWith(
    _CommitmentSubmission value,
    $Res Function(_CommitmentSubmission) _then,
  ) = __$CommitmentSubmissionCopyWithImpl;
  @override
  @useResult
  $Res call({String sessionId, String what, String when, String how});
}

/// @nodoc
class __$CommitmentSubmissionCopyWithImpl<$Res>
    implements _$CommitmentSubmissionCopyWith<$Res> {
  __$CommitmentSubmissionCopyWithImpl(this._self, this._then);

  final _CommitmentSubmission _self;
  final $Res Function(_CommitmentSubmission) _then;

  /// Create a copy of CommitmentSubmission
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sessionId = null,
    Object? what = null,
    Object? when = null,
    Object? how = null,
  }) {
    return _then(
      _CommitmentSubmission(
        sessionId: null == sessionId
            ? _self.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String,
        what: null == what
            ? _self.what
            : what // ignore: cast_nullable_to_non_nullable
                  as String,
        when: null == when
            ? _self.when
            : when // ignore: cast_nullable_to_non_nullable
                  as String,
        how: null == how
            ? _self.how
            : how // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}
