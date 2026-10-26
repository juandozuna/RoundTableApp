// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_flow_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MemberFlowState {
  /// Step opened from the chips; null follows the session.
  MemberStep? get chosenStep;

  /// The person saw "no tienes compromiso previo" and continued.
  bool get noPreviousAcknowledged; // Follow-up draft.
  CommitmentFollowUpStatus? get followUpStatus;
  String get followUpNote;
  int? get followUpScore; // Reflection draft: answers by question id.
  Map<String, String> get answers;
  int? get reflectionScore; // Commitment draft: qué / cuándo / cómo.
  String get commitmentWhat;
  String? get commitmentWhen;
  String? get commitmentHow;

  /// Validation errors by field key (see `ResponseValidator`).
  ResponseErrors get errors;

  /// Step being saved.
  MemberStep? get submitting;

  /// Set after a step is saved, for a toast; cleared by `consumeSaved`.
  MemberStep? get justSaved;

  /// Set when saving failed unexpectedly.
  Object? get failure;

  /// Create a copy of MemberFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MemberFlowStateCopyWith<MemberFlowState> get copyWith =>
      _$MemberFlowStateCopyWithImpl<MemberFlowState>(
        this as MemberFlowState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MemberFlowState &&
            (identical(other.chosenStep, chosenStep) ||
                other.chosenStep == chosenStep) &&
            (identical(other.noPreviousAcknowledged, noPreviousAcknowledged) ||
                other.noPreviousAcknowledged == noPreviousAcknowledged) &&
            (identical(other.followUpStatus, followUpStatus) ||
                other.followUpStatus == followUpStatus) &&
            (identical(other.followUpNote, followUpNote) ||
                other.followUpNote == followUpNote) &&
            (identical(other.followUpScore, followUpScore) ||
                other.followUpScore == followUpScore) &&
            const DeepCollectionEquality().equals(other.answers, answers) &&
            (identical(other.reflectionScore, reflectionScore) ||
                other.reflectionScore == reflectionScore) &&
            (identical(other.commitmentWhat, commitmentWhat) ||
                other.commitmentWhat == commitmentWhat) &&
            (identical(other.commitmentWhen, commitmentWhen) ||
                other.commitmentWhen == commitmentWhen) &&
            (identical(other.commitmentHow, commitmentHow) ||
                other.commitmentHow == commitmentHow) &&
            const DeepCollectionEquality().equals(other.errors, errors) &&
            (identical(other.submitting, submitting) ||
                other.submitting == submitting) &&
            (identical(other.justSaved, justSaved) ||
                other.justSaved == justSaved) &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    chosenStep,
    noPreviousAcknowledged,
    followUpStatus,
    followUpNote,
    followUpScore,
    const DeepCollectionEquality().hash(answers),
    reflectionScore,
    commitmentWhat,
    commitmentWhen,
    commitmentHow,
    const DeepCollectionEquality().hash(errors),
    submitting,
    justSaved,
    const DeepCollectionEquality().hash(failure),
  );

  @override
  String toString() {
    return 'MemberFlowState(chosenStep: $chosenStep, noPreviousAcknowledged: $noPreviousAcknowledged, followUpStatus: $followUpStatus, followUpNote: $followUpNote, followUpScore: $followUpScore, answers: $answers, reflectionScore: $reflectionScore, commitmentWhat: $commitmentWhat, commitmentWhen: $commitmentWhen, commitmentHow: $commitmentHow, errors: $errors, submitting: $submitting, justSaved: $justSaved, failure: $failure)';
  }
}

/// @nodoc
abstract mixin class $MemberFlowStateCopyWith<$Res> {
  factory $MemberFlowStateCopyWith(
    MemberFlowState value,
    $Res Function(MemberFlowState) _then,
  ) = _$MemberFlowStateCopyWithImpl;
  @useResult
  $Res call({
    MemberStep? chosenStep,
    bool noPreviousAcknowledged,
    CommitmentFollowUpStatus? followUpStatus,
    String followUpNote,
    int? followUpScore,
    Map<String, String> answers,
    int? reflectionScore,
    String commitmentWhat,
    String? commitmentWhen,
    String? commitmentHow,
    ResponseErrors errors,
    MemberStep? submitting,
    MemberStep? justSaved,
    Object? failure,
  });
}

/// @nodoc
class _$MemberFlowStateCopyWithImpl<$Res>
    implements $MemberFlowStateCopyWith<$Res> {
  _$MemberFlowStateCopyWithImpl(this._self, this._then);

  final MemberFlowState _self;
  final $Res Function(MemberFlowState) _then;

  /// Create a copy of MemberFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chosenStep = freezed,
    Object? noPreviousAcknowledged = null,
    Object? followUpStatus = freezed,
    Object? followUpNote = null,
    Object? followUpScore = freezed,
    Object? answers = null,
    Object? reflectionScore = freezed,
    Object? commitmentWhat = null,
    Object? commitmentWhen = freezed,
    Object? commitmentHow = freezed,
    Object? errors = null,
    Object? submitting = freezed,
    Object? justSaved = freezed,
    Object? failure = freezed,
  }) {
    return _then(
      _self.copyWith(
        chosenStep: freezed == chosenStep
            ? _self.chosenStep
            : chosenStep // ignore: cast_nullable_to_non_nullable
                  as MemberStep?,
        noPreviousAcknowledged: null == noPreviousAcknowledged
            ? _self.noPreviousAcknowledged
            : noPreviousAcknowledged // ignore: cast_nullable_to_non_nullable
                  as bool,
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
        answers: null == answers
            ? _self.answers
            : answers // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>,
        reflectionScore: freezed == reflectionScore
            ? _self.reflectionScore
            : reflectionScore // ignore: cast_nullable_to_non_nullable
                  as int?,
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
        errors: null == errors
            ? _self.errors
            : errors // ignore: cast_nullable_to_non_nullable
                  as ResponseErrors,
        submitting: freezed == submitting
            ? _self.submitting
            : submitting // ignore: cast_nullable_to_non_nullable
                  as MemberStep?,
        justSaved: freezed == justSaved
            ? _self.justSaved
            : justSaved // ignore: cast_nullable_to_non_nullable
                  as MemberStep?,
        failure: freezed == failure ? _self.failure : failure,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [MemberFlowState].
extension MemberFlowStatePatterns on MemberFlowState {
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
    TResult Function(_MemberFlowState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MemberFlowState() when $default != null:
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
    TResult Function(_MemberFlowState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberFlowState():
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
    TResult? Function(_MemberFlowState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberFlowState() when $default != null:
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
      MemberStep? chosenStep,
      bool noPreviousAcknowledged,
      CommitmentFollowUpStatus? followUpStatus,
      String followUpNote,
      int? followUpScore,
      Map<String, String> answers,
      int? reflectionScore,
      String commitmentWhat,
      String? commitmentWhen,
      String? commitmentHow,
      ResponseErrors errors,
      MemberStep? submitting,
      MemberStep? justSaved,
      Object? failure,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MemberFlowState() when $default != null:
        return $default(
          _that.chosenStep,
          _that.noPreviousAcknowledged,
          _that.followUpStatus,
          _that.followUpNote,
          _that.followUpScore,
          _that.answers,
          _that.reflectionScore,
          _that.commitmentWhat,
          _that.commitmentWhen,
          _that.commitmentHow,
          _that.errors,
          _that.submitting,
          _that.justSaved,
          _that.failure,
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
      MemberStep? chosenStep,
      bool noPreviousAcknowledged,
      CommitmentFollowUpStatus? followUpStatus,
      String followUpNote,
      int? followUpScore,
      Map<String, String> answers,
      int? reflectionScore,
      String commitmentWhat,
      String? commitmentWhen,
      String? commitmentHow,
      ResponseErrors errors,
      MemberStep? submitting,
      MemberStep? justSaved,
      Object? failure,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberFlowState():
        return $default(
          _that.chosenStep,
          _that.noPreviousAcknowledged,
          _that.followUpStatus,
          _that.followUpNote,
          _that.followUpScore,
          _that.answers,
          _that.reflectionScore,
          _that.commitmentWhat,
          _that.commitmentWhen,
          _that.commitmentHow,
          _that.errors,
          _that.submitting,
          _that.justSaved,
          _that.failure,
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
      MemberStep? chosenStep,
      bool noPreviousAcknowledged,
      CommitmentFollowUpStatus? followUpStatus,
      String followUpNote,
      int? followUpScore,
      Map<String, String> answers,
      int? reflectionScore,
      String commitmentWhat,
      String? commitmentWhen,
      String? commitmentHow,
      ResponseErrors errors,
      MemberStep? submitting,
      MemberStep? justSaved,
      Object? failure,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberFlowState() when $default != null:
        return $default(
          _that.chosenStep,
          _that.noPreviousAcknowledged,
          _that.followUpStatus,
          _that.followUpNote,
          _that.followUpScore,
          _that.answers,
          _that.reflectionScore,
          _that.commitmentWhat,
          _that.commitmentWhen,
          _that.commitmentHow,
          _that.errors,
          _that.submitting,
          _that.justSaved,
          _that.failure,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MemberFlowState implements MemberFlowState {
  const _MemberFlowState({
    this.chosenStep,
    this.noPreviousAcknowledged = false,
    this.followUpStatus,
    this.followUpNote = '',
    this.followUpScore,
    final Map<String, String> answers = const {},
    this.reflectionScore,
    this.commitmentWhat = '',
    this.commitmentWhen,
    this.commitmentHow,
    final ResponseErrors errors = const {},
    this.submitting,
    this.justSaved,
    this.failure,
  }) : _answers = answers,
       _errors = errors;

  /// Step opened from the chips; null follows the session.
  @override
  final MemberStep? chosenStep;

  /// The person saw "no tienes compromiso previo" and continued.
  @override
  @JsonKey()
  final bool noPreviousAcknowledged;
  // Follow-up draft.
  @override
  final CommitmentFollowUpStatus? followUpStatus;
  @override
  @JsonKey()
  final String followUpNote;
  @override
  final int? followUpScore;
  // Reflection draft: answers by question id.
  final Map<String, String> _answers;
  // Reflection draft: answers by question id.
  @override
  @JsonKey()
  Map<String, String> get answers {
    if (_answers is EqualUnmodifiableMapView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_answers);
  }

  @override
  final int? reflectionScore;
  // Commitment draft: qué / cuándo / cómo.
  @override
  @JsonKey()
  final String commitmentWhat;
  @override
  final String? commitmentWhen;
  @override
  final String? commitmentHow;

  /// Validation errors by field key (see `ResponseValidator`).
  final ResponseErrors _errors;

  /// Validation errors by field key (see `ResponseValidator`).
  @override
  @JsonKey()
  ResponseErrors get errors {
    if (_errors is EqualUnmodifiableMapView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_errors);
  }

  /// Step being saved.
  @override
  final MemberStep? submitting;

  /// Set after a step is saved, for a toast; cleared by `consumeSaved`.
  @override
  final MemberStep? justSaved;

  /// Set when saving failed unexpectedly.
  @override
  final Object? failure;

  /// Create a copy of MemberFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MemberFlowStateCopyWith<_MemberFlowState> get copyWith =>
      __$MemberFlowStateCopyWithImpl<_MemberFlowState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MemberFlowState &&
            (identical(other.chosenStep, chosenStep) ||
                other.chosenStep == chosenStep) &&
            (identical(other.noPreviousAcknowledged, noPreviousAcknowledged) ||
                other.noPreviousAcknowledged == noPreviousAcknowledged) &&
            (identical(other.followUpStatus, followUpStatus) ||
                other.followUpStatus == followUpStatus) &&
            (identical(other.followUpNote, followUpNote) ||
                other.followUpNote == followUpNote) &&
            (identical(other.followUpScore, followUpScore) ||
                other.followUpScore == followUpScore) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.reflectionScore, reflectionScore) ||
                other.reflectionScore == reflectionScore) &&
            (identical(other.commitmentWhat, commitmentWhat) ||
                other.commitmentWhat == commitmentWhat) &&
            (identical(other.commitmentWhen, commitmentWhen) ||
                other.commitmentWhen == commitmentWhen) &&
            (identical(other.commitmentHow, commitmentHow) ||
                other.commitmentHow == commitmentHow) &&
            const DeepCollectionEquality().equals(other._errors, _errors) &&
            (identical(other.submitting, submitting) ||
                other.submitting == submitting) &&
            (identical(other.justSaved, justSaved) ||
                other.justSaved == justSaved) &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    chosenStep,
    noPreviousAcknowledged,
    followUpStatus,
    followUpNote,
    followUpScore,
    const DeepCollectionEquality().hash(_answers),
    reflectionScore,
    commitmentWhat,
    commitmentWhen,
    commitmentHow,
    const DeepCollectionEquality().hash(_errors),
    submitting,
    justSaved,
    const DeepCollectionEquality().hash(failure),
  );

  @override
  String toString() {
    return 'MemberFlowState(chosenStep: $chosenStep, noPreviousAcknowledged: $noPreviousAcknowledged, followUpStatus: $followUpStatus, followUpNote: $followUpNote, followUpScore: $followUpScore, answers: $answers, reflectionScore: $reflectionScore, commitmentWhat: $commitmentWhat, commitmentWhen: $commitmentWhen, commitmentHow: $commitmentHow, errors: $errors, submitting: $submitting, justSaved: $justSaved, failure: $failure)';
  }
}

/// @nodoc
abstract mixin class _$MemberFlowStateCopyWith<$Res>
    implements $MemberFlowStateCopyWith<$Res> {
  factory _$MemberFlowStateCopyWith(
    _MemberFlowState value,
    $Res Function(_MemberFlowState) _then,
  ) = __$MemberFlowStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    MemberStep? chosenStep,
    bool noPreviousAcknowledged,
    CommitmentFollowUpStatus? followUpStatus,
    String followUpNote,
    int? followUpScore,
    Map<String, String> answers,
    int? reflectionScore,
    String commitmentWhat,
    String? commitmentWhen,
    String? commitmentHow,
    ResponseErrors errors,
    MemberStep? submitting,
    MemberStep? justSaved,
    Object? failure,
  });
}

/// @nodoc
class __$MemberFlowStateCopyWithImpl<$Res>
    implements _$MemberFlowStateCopyWith<$Res> {
  __$MemberFlowStateCopyWithImpl(this._self, this._then);

  final _MemberFlowState _self;
  final $Res Function(_MemberFlowState) _then;

  /// Create a copy of MemberFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? chosenStep = freezed,
    Object? noPreviousAcknowledged = null,
    Object? followUpStatus = freezed,
    Object? followUpNote = null,
    Object? followUpScore = freezed,
    Object? answers = null,
    Object? reflectionScore = freezed,
    Object? commitmentWhat = null,
    Object? commitmentWhen = freezed,
    Object? commitmentHow = freezed,
    Object? errors = null,
    Object? submitting = freezed,
    Object? justSaved = freezed,
    Object? failure = freezed,
  }) {
    return _then(
      _MemberFlowState(
        chosenStep: freezed == chosenStep
            ? _self.chosenStep
            : chosenStep // ignore: cast_nullable_to_non_nullable
                  as MemberStep?,
        noPreviousAcknowledged: null == noPreviousAcknowledged
            ? _self.noPreviousAcknowledged
            : noPreviousAcknowledged // ignore: cast_nullable_to_non_nullable
                  as bool,
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
        answers: null == answers
            ? _self._answers
            : answers // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>,
        reflectionScore: freezed == reflectionScore
            ? _self.reflectionScore
            : reflectionScore // ignore: cast_nullable_to_non_nullable
                  as int?,
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
        errors: null == errors
            ? _self._errors
            : errors // ignore: cast_nullable_to_non_nullable
                  as ResponseErrors,
        submitting: freezed == submitting
            ? _self.submitting
            : submitting // ignore: cast_nullable_to_non_nullable
                  as MemberStep?,
        justSaved: freezed == justSaved
            ? _self.justSaved
            : justSaved // ignore: cast_nullable_to_non_nullable
                  as MemberStep?,
        failure: freezed == failure ? _self.failure : failure,
      ),
    );
  }
}
