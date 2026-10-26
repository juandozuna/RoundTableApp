// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_draft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionDraft {
  CommitmentFollowUpStatus? get followUpStatus;
  String get followUpNote;
  int? get followUpScore;
  String get followUpJustification;
  Map<String, String> get answers;
  int? get reflectionScore;
  String get reflectionJustification;
  String get commitmentWhat;
  String? get commitmentWhen;
  String? get commitmentHow;

  /// Create a copy of SessionDraft
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SessionDraftCopyWith<SessionDraft> get copyWith =>
      _$SessionDraftCopyWithImpl<SessionDraft>(
        this as SessionDraft,
        _$identity,
      );

  /// Serializes this SessionDraft to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SessionDraft &&
            (identical(other.followUpStatus, followUpStatus) ||
                other.followUpStatus == followUpStatus) &&
            (identical(other.followUpNote, followUpNote) ||
                other.followUpNote == followUpNote) &&
            (identical(other.followUpScore, followUpScore) ||
                other.followUpScore == followUpScore) &&
            (identical(other.followUpJustification, followUpJustification) ||
                other.followUpJustification == followUpJustification) &&
            const DeepCollectionEquality().equals(other.answers, answers) &&
            (identical(other.reflectionScore, reflectionScore) ||
                other.reflectionScore == reflectionScore) &&
            (identical(
                  other.reflectionJustification,
                  reflectionJustification,
                ) ||
                other.reflectionJustification == reflectionJustification) &&
            (identical(other.commitmentWhat, commitmentWhat) ||
                other.commitmentWhat == commitmentWhat) &&
            (identical(other.commitmentWhen, commitmentWhen) ||
                other.commitmentWhen == commitmentWhen) &&
            (identical(other.commitmentHow, commitmentHow) ||
                other.commitmentHow == commitmentHow));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    followUpStatus,
    followUpNote,
    followUpScore,
    followUpJustification,
    const DeepCollectionEquality().hash(answers),
    reflectionScore,
    reflectionJustification,
    commitmentWhat,
    commitmentWhen,
    commitmentHow,
  );

  @override
  String toString() {
    return 'SessionDraft(followUpStatus: $followUpStatus, followUpNote: $followUpNote, followUpScore: $followUpScore, followUpJustification: $followUpJustification, answers: $answers, reflectionScore: $reflectionScore, reflectionJustification: $reflectionJustification, commitmentWhat: $commitmentWhat, commitmentWhen: $commitmentWhen, commitmentHow: $commitmentHow)';
  }
}

/// @nodoc
abstract mixin class $SessionDraftCopyWith<$Res> {
  factory $SessionDraftCopyWith(
    SessionDraft value,
    $Res Function(SessionDraft) _then,
  ) = _$SessionDraftCopyWithImpl;
  @useResult
  $Res call({
    CommitmentFollowUpStatus? followUpStatus,
    String followUpNote,
    int? followUpScore,
    String followUpJustification,
    Map<String, String> answers,
    int? reflectionScore,
    String reflectionJustification,
    String commitmentWhat,
    String? commitmentWhen,
    String? commitmentHow,
  });
}

/// @nodoc
class _$SessionDraftCopyWithImpl<$Res> implements $SessionDraftCopyWith<$Res> {
  _$SessionDraftCopyWithImpl(this._self, this._then);

  final SessionDraft _self;
  final $Res Function(SessionDraft) _then;

  /// Create a copy of SessionDraft
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followUpStatus = freezed,
    Object? followUpNote = null,
    Object? followUpScore = freezed,
    Object? followUpJustification = null,
    Object? answers = null,
    Object? reflectionScore = freezed,
    Object? reflectionJustification = null,
    Object? commitmentWhat = null,
    Object? commitmentWhen = freezed,
    Object? commitmentHow = freezed,
  }) {
    return _then(
      _self.copyWith(
        followUpStatus: freezed == followUpStatus
            ? _self.followUpStatus
            : followUpStatus // ignore: cast_nullable_to_non_nullable
                  as CommitmentFollowUpStatus?,
        followUpNote: null == followUpNote
            ? _self.followUpNote
            : followUpNote // ignore: cast_nullable_to_non_nullable
                  as String,
        followUpScore: freezed == followUpScore
            ? _self.followUpScore
            : followUpScore // ignore: cast_nullable_to_non_nullable
                  as int?,
        followUpJustification: null == followUpJustification
            ? _self.followUpJustification
            : followUpJustification // ignore: cast_nullable_to_non_nullable
                  as String,
        answers: null == answers
            ? _self.answers
            : answers // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>,
        reflectionScore: freezed == reflectionScore
            ? _self.reflectionScore
            : reflectionScore // ignore: cast_nullable_to_non_nullable
                  as int?,
        reflectionJustification: null == reflectionJustification
            ? _self.reflectionJustification
            : reflectionJustification // ignore: cast_nullable_to_non_nullable
                  as String,
        commitmentWhat: null == commitmentWhat
            ? _self.commitmentWhat
            : commitmentWhat // ignore: cast_nullable_to_non_nullable
                  as String,
        commitmentWhen: freezed == commitmentWhen
            ? _self.commitmentWhen
            : commitmentWhen // ignore: cast_nullable_to_non_nullable
                  as String?,
        commitmentHow: freezed == commitmentHow
            ? _self.commitmentHow
            : commitmentHow // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [SessionDraft].
extension SessionDraftPatterns on SessionDraft {
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
    TResult Function(_SessionDraft value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SessionDraft() when $default != null:
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
    TResult Function(_SessionDraft value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionDraft():
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
    TResult? Function(_SessionDraft value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionDraft() when $default != null:
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
      CommitmentFollowUpStatus? followUpStatus,
      String followUpNote,
      int? followUpScore,
      String followUpJustification,
      Map<String, String> answers,
      int? reflectionScore,
      String reflectionJustification,
      String commitmentWhat,
      String? commitmentWhen,
      String? commitmentHow,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SessionDraft() when $default != null:
        return $default(
          _that.followUpStatus,
          _that.followUpNote,
          _that.followUpScore,
          _that.followUpJustification,
          _that.answers,
          _that.reflectionScore,
          _that.reflectionJustification,
          _that.commitmentWhat,
          _that.commitmentWhen,
          _that.commitmentHow,
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
      CommitmentFollowUpStatus? followUpStatus,
      String followUpNote,
      int? followUpScore,
      String followUpJustification,
      Map<String, String> answers,
      int? reflectionScore,
      String reflectionJustification,
      String commitmentWhat,
      String? commitmentWhen,
      String? commitmentHow,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionDraft():
        return $default(
          _that.followUpStatus,
          _that.followUpNote,
          _that.followUpScore,
          _that.followUpJustification,
          _that.answers,
          _that.reflectionScore,
          _that.reflectionJustification,
          _that.commitmentWhat,
          _that.commitmentWhen,
          _that.commitmentHow,
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
      CommitmentFollowUpStatus? followUpStatus,
      String followUpNote,
      int? followUpScore,
      String followUpJustification,
      Map<String, String> answers,
      int? reflectionScore,
      String reflectionJustification,
      String commitmentWhat,
      String? commitmentWhen,
      String? commitmentHow,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionDraft() when $default != null:
        return $default(
          _that.followUpStatus,
          _that.followUpNote,
          _that.followUpScore,
          _that.followUpJustification,
          _that.answers,
          _that.reflectionScore,
          _that.reflectionJustification,
          _that.commitmentWhat,
          _that.commitmentWhen,
          _that.commitmentHow,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SessionDraft extends SessionDraft {
  const _SessionDraft({
    this.followUpStatus,
    this.followUpNote = '',
    this.followUpScore,
    this.followUpJustification = '',
    final Map<String, String> answers = const {},
    this.reflectionScore,
    this.reflectionJustification = '',
    this.commitmentWhat = '',
    this.commitmentWhen,
    this.commitmentHow,
  }) : _answers = answers,
       super._();
  factory _SessionDraft.fromJson(Map<String, dynamic> json) =>
      _$SessionDraftFromJson(json);

  @override
  final CommitmentFollowUpStatus? followUpStatus;
  @override
  @JsonKey()
  final String followUpNote;
  @override
  final int? followUpScore;
  @override
  @JsonKey()
  final String followUpJustification;
  final Map<String, String> _answers;
  @override
  @JsonKey()
  Map<String, String> get answers {
    if (_answers is EqualUnmodifiableMapView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_answers);
  }

  @override
  final int? reflectionScore;
  @override
  @JsonKey()
  final String reflectionJustification;
  @override
  @JsonKey()
  final String commitmentWhat;
  @override
  final String? commitmentWhen;
  @override
  final String? commitmentHow;

  /// Create a copy of SessionDraft
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SessionDraftCopyWith<_SessionDraft> get copyWith =>
      __$SessionDraftCopyWithImpl<_SessionDraft>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SessionDraftToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SessionDraft &&
            (identical(other.followUpStatus, followUpStatus) ||
                other.followUpStatus == followUpStatus) &&
            (identical(other.followUpNote, followUpNote) ||
                other.followUpNote == followUpNote) &&
            (identical(other.followUpScore, followUpScore) ||
                other.followUpScore == followUpScore) &&
            (identical(other.followUpJustification, followUpJustification) ||
                other.followUpJustification == followUpJustification) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.reflectionScore, reflectionScore) ||
                other.reflectionScore == reflectionScore) &&
            (identical(
                  other.reflectionJustification,
                  reflectionJustification,
                ) ||
                other.reflectionJustification == reflectionJustification) &&
            (identical(other.commitmentWhat, commitmentWhat) ||
                other.commitmentWhat == commitmentWhat) &&
            (identical(other.commitmentWhen, commitmentWhen) ||
                other.commitmentWhen == commitmentWhen) &&
            (identical(other.commitmentHow, commitmentHow) ||
                other.commitmentHow == commitmentHow));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    followUpStatus,
    followUpNote,
    followUpScore,
    followUpJustification,
    const DeepCollectionEquality().hash(_answers),
    reflectionScore,
    reflectionJustification,
    commitmentWhat,
    commitmentWhen,
    commitmentHow,
  );

  @override
  String toString() {
    return 'SessionDraft(followUpStatus: $followUpStatus, followUpNote: $followUpNote, followUpScore: $followUpScore, followUpJustification: $followUpJustification, answers: $answers, reflectionScore: $reflectionScore, reflectionJustification: $reflectionJustification, commitmentWhat: $commitmentWhat, commitmentWhen: $commitmentWhen, commitmentHow: $commitmentHow)';
  }
}

/// @nodoc
abstract mixin class _$SessionDraftCopyWith<$Res>
    implements $SessionDraftCopyWith<$Res> {
  factory _$SessionDraftCopyWith(
    _SessionDraft value,
    $Res Function(_SessionDraft) _then,
  ) = __$SessionDraftCopyWithImpl;
  @override
  @useResult
  $Res call({
    CommitmentFollowUpStatus? followUpStatus,
    String followUpNote,
    int? followUpScore,
    String followUpJustification,
    Map<String, String> answers,
    int? reflectionScore,
    String reflectionJustification,
    String commitmentWhat,
    String? commitmentWhen,
    String? commitmentHow,
  });
}

/// @nodoc
class __$SessionDraftCopyWithImpl<$Res>
    implements _$SessionDraftCopyWith<$Res> {
  __$SessionDraftCopyWithImpl(this._self, this._then);

  final _SessionDraft _self;
  final $Res Function(_SessionDraft) _then;

  /// Create a copy of SessionDraft
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? followUpStatus = freezed,
    Object? followUpNote = null,
    Object? followUpScore = freezed,
    Object? followUpJustification = null,
    Object? answers = null,
    Object? reflectionScore = freezed,
    Object? reflectionJustification = null,
    Object? commitmentWhat = null,
    Object? commitmentWhen = freezed,
    Object? commitmentHow = freezed,
  }) {
    return _then(
      _SessionDraft(
        followUpStatus: freezed == followUpStatus
            ? _self.followUpStatus
            : followUpStatus // ignore: cast_nullable_to_non_nullable
                  as CommitmentFollowUpStatus?,
        followUpNote: null == followUpNote
            ? _self.followUpNote
            : followUpNote // ignore: cast_nullable_to_non_nullable
                  as String,
        followUpScore: freezed == followUpScore
            ? _self.followUpScore
            : followUpScore // ignore: cast_nullable_to_non_nullable
                  as int?,
        followUpJustification: null == followUpJustification
            ? _self.followUpJustification
            : followUpJustification // ignore: cast_nullable_to_non_nullable
                  as String,
        answers: null == answers
            ? _self._answers
            : answers // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>,
        reflectionScore: freezed == reflectionScore
            ? _self.reflectionScore
            : reflectionScore // ignore: cast_nullable_to_non_nullable
                  as int?,
        reflectionJustification: null == reflectionJustification
            ? _self.reflectionJustification
            : reflectionJustification // ignore: cast_nullable_to_non_nullable
                  as String,
        commitmentWhat: null == commitmentWhat
            ? _self.commitmentWhat
            : commitmentWhat // ignore: cast_nullable_to_non_nullable
                  as String,
        commitmentWhen: freezed == commitmentWhen
            ? _self.commitmentWhen
            : commitmentWhen // ignore: cast_nullable_to_non_nullable
                  as String?,
        commitmentHow: freezed == commitmentHow
            ? _self.commitmentHow
            : commitmentHow // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}
