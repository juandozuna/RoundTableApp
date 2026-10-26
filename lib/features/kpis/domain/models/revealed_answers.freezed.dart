// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'revealed_answers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RevealedAssessment {
  String get id;
  String? get sessionId;
  String? get valueId;
  String? get valueName;
  String get kind;
  int? get score;
  String? get justification;
  bool get syncedLate;

  /// Create a copy of RevealedAssessment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RevealedAssessmentCopyWith<RevealedAssessment> get copyWith =>
      _$RevealedAssessmentCopyWithImpl<RevealedAssessment>(
        this as RevealedAssessment,
        _$identity,
      );

  /// Serializes this RevealedAssessment to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RevealedAssessment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.valueId, valueId) || other.valueId == valueId) &&
            (identical(other.valueName, valueName) ||
                other.valueName == valueName) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.justification, justification) ||
                other.justification == justification) &&
            (identical(other.syncedLate, syncedLate) ||
                other.syncedLate == syncedLate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    sessionId,
    valueId,
    valueName,
    kind,
    score,
    justification,
    syncedLate,
  );

  @override
  String toString() {
    return 'RevealedAssessment(id: $id, sessionId: $sessionId, valueId: $valueId, valueName: $valueName, kind: $kind, score: $score, justification: $justification, syncedLate: $syncedLate)';
  }
}

/// @nodoc
abstract mixin class $RevealedAssessmentCopyWith<$Res> {
  factory $RevealedAssessmentCopyWith(
    RevealedAssessment value,
    $Res Function(RevealedAssessment) _then,
  ) = _$RevealedAssessmentCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String? sessionId,
    String? valueId,
    String? valueName,
    String kind,
    int? score,
    String? justification,
    bool syncedLate,
  });
}

/// @nodoc
class _$RevealedAssessmentCopyWithImpl<$Res>
    implements $RevealedAssessmentCopyWith<$Res> {
  _$RevealedAssessmentCopyWithImpl(this._self, this._then);

  final RevealedAssessment _self;
  final $Res Function(RevealedAssessment) _then;

  /// Create a copy of RevealedAssessment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionId = freezed,
    Object? valueId = freezed,
    Object? valueName = freezed,
    Object? kind = null,
    Object? score = freezed,
    Object? justification = freezed,
    Object? syncedLate = null,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        sessionId: freezed == sessionId
            ? _self.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String?,
        valueId: freezed == valueId
            ? _self.valueId
            : valueId // ignore: cast_nullable_to_non_nullable
                  as String?,
        valueName: freezed == valueName
            ? _self.valueName
            : valueName // ignore: cast_nullable_to_non_nullable
                  as String?,
        kind: null == kind
            ? _self.kind
            : kind // ignore: cast_nullable_to_non_nullable
                  as String,
        score: freezed == score
            ? _self.score
            : score // ignore: cast_nullable_to_non_nullable
                  as int?,
        justification: freezed == justification
            ? _self.justification
            : justification // ignore: cast_nullable_to_non_nullable
                  as String?,
        syncedLate: null == syncedLate
            ? _self.syncedLate
            : syncedLate // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [RevealedAssessment].
extension RevealedAssessmentPatterns on RevealedAssessment {
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
    TResult Function(_RevealedAssessment value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RevealedAssessment() when $default != null:
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
    TResult Function(_RevealedAssessment value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RevealedAssessment():
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
    TResult? Function(_RevealedAssessment value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RevealedAssessment() when $default != null:
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
      String id,
      String? sessionId,
      String? valueId,
      String? valueName,
      String kind,
      int? score,
      String? justification,
      bool syncedLate,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RevealedAssessment() when $default != null:
        return $default(
          _that.id,
          _that.sessionId,
          _that.valueId,
          _that.valueName,
          _that.kind,
          _that.score,
          _that.justification,
          _that.syncedLate,
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
      String id,
      String? sessionId,
      String? valueId,
      String? valueName,
      String kind,
      int? score,
      String? justification,
      bool syncedLate,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RevealedAssessment():
        return $default(
          _that.id,
          _that.sessionId,
          _that.valueId,
          _that.valueName,
          _that.kind,
          _that.score,
          _that.justification,
          _that.syncedLate,
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
      String id,
      String? sessionId,
      String? valueId,
      String? valueName,
      String kind,
      int? score,
      String? justification,
      bool syncedLate,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RevealedAssessment() when $default != null:
        return $default(
          _that.id,
          _that.sessionId,
          _that.valueId,
          _that.valueName,
          _that.kind,
          _that.score,
          _that.justification,
          _that.syncedLate,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RevealedAssessment implements RevealedAssessment {
  const _RevealedAssessment({
    required this.id,
    this.sessionId,
    this.valueId,
    this.valueName,
    required this.kind,
    this.score,
    this.justification,
    this.syncedLate = false,
  });
  factory _RevealedAssessment.fromJson(Map<String, dynamic> json) =>
      _$RevealedAssessmentFromJson(json);

  @override
  final String id;
  @override
  final String? sessionId;
  @override
  final String? valueId;
  @override
  final String? valueName;
  @override
  final String kind;
  @override
  final int? score;
  @override
  final String? justification;
  @override
  @JsonKey()
  final bool syncedLate;

  /// Create a copy of RevealedAssessment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RevealedAssessmentCopyWith<_RevealedAssessment> get copyWith =>
      __$RevealedAssessmentCopyWithImpl<_RevealedAssessment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RevealedAssessmentToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RevealedAssessment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.valueId, valueId) || other.valueId == valueId) &&
            (identical(other.valueName, valueName) ||
                other.valueName == valueName) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.justification, justification) ||
                other.justification == justification) &&
            (identical(other.syncedLate, syncedLate) ||
                other.syncedLate == syncedLate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    sessionId,
    valueId,
    valueName,
    kind,
    score,
    justification,
    syncedLate,
  );

  @override
  String toString() {
    return 'RevealedAssessment(id: $id, sessionId: $sessionId, valueId: $valueId, valueName: $valueName, kind: $kind, score: $score, justification: $justification, syncedLate: $syncedLate)';
  }
}

/// @nodoc
abstract mixin class _$RevealedAssessmentCopyWith<$Res>
    implements $RevealedAssessmentCopyWith<$Res> {
  factory _$RevealedAssessmentCopyWith(
    _RevealedAssessment value,
    $Res Function(_RevealedAssessment) _then,
  ) = __$RevealedAssessmentCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String? sessionId,
    String? valueId,
    String? valueName,
    String kind,
    int? score,
    String? justification,
    bool syncedLate,
  });
}

/// @nodoc
class __$RevealedAssessmentCopyWithImpl<$Res>
    implements _$RevealedAssessmentCopyWith<$Res> {
  __$RevealedAssessmentCopyWithImpl(this._self, this._then);

  final _RevealedAssessment _self;
  final $Res Function(_RevealedAssessment) _then;

  /// Create a copy of RevealedAssessment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? sessionId = freezed,
    Object? valueId = freezed,
    Object? valueName = freezed,
    Object? kind = null,
    Object? score = freezed,
    Object? justification = freezed,
    Object? syncedLate = null,
  }) {
    return _then(
      _RevealedAssessment(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        sessionId: freezed == sessionId
            ? _self.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String?,
        valueId: freezed == valueId
            ? _self.valueId
            : valueId // ignore: cast_nullable_to_non_nullable
                  as String?,
        valueName: freezed == valueName
            ? _self.valueName
            : valueName // ignore: cast_nullable_to_non_nullable
                  as String?,
        kind: null == kind
            ? _self.kind
            : kind // ignore: cast_nullable_to_non_nullable
                  as String,
        score: freezed == score
            ? _self.score
            : score // ignore: cast_nullable_to_non_nullable
                  as int?,
        justification: freezed == justification
            ? _self.justification
            : justification // ignore: cast_nullable_to_non_nullable
                  as String?,
        syncedLate: null == syncedLate
            ? _self.syncedLate
            : syncedLate // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
mixin _$RevealedAnswer {
  String get id;
  String? get sessionId;
  String? get valueId;
  String? get questionId;
  String? get questionText;
  String? get answerText;
  bool get syncedLate;

  /// Create a copy of RevealedAnswer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RevealedAnswerCopyWith<RevealedAnswer> get copyWith =>
      _$RevealedAnswerCopyWithImpl<RevealedAnswer>(
        this as RevealedAnswer,
        _$identity,
      );

  /// Serializes this RevealedAnswer to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RevealedAnswer &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.valueId, valueId) || other.valueId == valueId) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.questionText, questionText) ||
                other.questionText == questionText) &&
            (identical(other.answerText, answerText) ||
                other.answerText == answerText) &&
            (identical(other.syncedLate, syncedLate) ||
                other.syncedLate == syncedLate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    sessionId,
    valueId,
    questionId,
    questionText,
    answerText,
    syncedLate,
  );

  @override
  String toString() {
    return 'RevealedAnswer(id: $id, sessionId: $sessionId, valueId: $valueId, questionId: $questionId, questionText: $questionText, answerText: $answerText, syncedLate: $syncedLate)';
  }
}

/// @nodoc
abstract mixin class $RevealedAnswerCopyWith<$Res> {
  factory $RevealedAnswerCopyWith(
    RevealedAnswer value,
    $Res Function(RevealedAnswer) _then,
  ) = _$RevealedAnswerCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String? sessionId,
    String? valueId,
    String? questionId,
    String? questionText,
    String? answerText,
    bool syncedLate,
  });
}

/// @nodoc
class _$RevealedAnswerCopyWithImpl<$Res>
    implements $RevealedAnswerCopyWith<$Res> {
  _$RevealedAnswerCopyWithImpl(this._self, this._then);

  final RevealedAnswer _self;
  final $Res Function(RevealedAnswer) _then;

  /// Create a copy of RevealedAnswer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionId = freezed,
    Object? valueId = freezed,
    Object? questionId = freezed,
    Object? questionText = freezed,
    Object? answerText = freezed,
    Object? syncedLate = null,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        sessionId: freezed == sessionId
            ? _self.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String?,
        valueId: freezed == valueId
            ? _self.valueId
            : valueId // ignore: cast_nullable_to_non_nullable
                  as String?,
        questionId: freezed == questionId
            ? _self.questionId
            : questionId // ignore: cast_nullable_to_non_nullable
                  as String?,
        questionText: freezed == questionText
            ? _self.questionText
            : questionText // ignore: cast_nullable_to_non_nullable
                  as String?,
        answerText: freezed == answerText
            ? _self.answerText
            : answerText // ignore: cast_nullable_to_non_nullable
                  as String?,
        syncedLate: null == syncedLate
            ? _self.syncedLate
            : syncedLate // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [RevealedAnswer].
extension RevealedAnswerPatterns on RevealedAnswer {
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
    TResult Function(_RevealedAnswer value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RevealedAnswer() when $default != null:
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
    TResult Function(_RevealedAnswer value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RevealedAnswer():
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
    TResult? Function(_RevealedAnswer value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RevealedAnswer() when $default != null:
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
      String id,
      String? sessionId,
      String? valueId,
      String? questionId,
      String? questionText,
      String? answerText,
      bool syncedLate,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RevealedAnswer() when $default != null:
        return $default(
          _that.id,
          _that.sessionId,
          _that.valueId,
          _that.questionId,
          _that.questionText,
          _that.answerText,
          _that.syncedLate,
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
      String id,
      String? sessionId,
      String? valueId,
      String? questionId,
      String? questionText,
      String? answerText,
      bool syncedLate,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RevealedAnswer():
        return $default(
          _that.id,
          _that.sessionId,
          _that.valueId,
          _that.questionId,
          _that.questionText,
          _that.answerText,
          _that.syncedLate,
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
      String id,
      String? sessionId,
      String? valueId,
      String? questionId,
      String? questionText,
      String? answerText,
      bool syncedLate,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RevealedAnswer() when $default != null:
        return $default(
          _that.id,
          _that.sessionId,
          _that.valueId,
          _that.questionId,
          _that.questionText,
          _that.answerText,
          _that.syncedLate,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RevealedAnswer implements RevealedAnswer {
  const _RevealedAnswer({
    required this.id,
    this.sessionId,
    this.valueId,
    this.questionId,
    this.questionText,
    this.answerText,
    this.syncedLate = false,
  });
  factory _RevealedAnswer.fromJson(Map<String, dynamic> json) =>
      _$RevealedAnswerFromJson(json);

  @override
  final String id;
  @override
  final String? sessionId;
  @override
  final String? valueId;
  @override
  final String? questionId;
  @override
  final String? questionText;
  @override
  final String? answerText;
  @override
  @JsonKey()
  final bool syncedLate;

  /// Create a copy of RevealedAnswer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RevealedAnswerCopyWith<_RevealedAnswer> get copyWith =>
      __$RevealedAnswerCopyWithImpl<_RevealedAnswer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RevealedAnswerToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RevealedAnswer &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.valueId, valueId) || other.valueId == valueId) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.questionText, questionText) ||
                other.questionText == questionText) &&
            (identical(other.answerText, answerText) ||
                other.answerText == answerText) &&
            (identical(other.syncedLate, syncedLate) ||
                other.syncedLate == syncedLate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    sessionId,
    valueId,
    questionId,
    questionText,
    answerText,
    syncedLate,
  );

  @override
  String toString() {
    return 'RevealedAnswer(id: $id, sessionId: $sessionId, valueId: $valueId, questionId: $questionId, questionText: $questionText, answerText: $answerText, syncedLate: $syncedLate)';
  }
}

/// @nodoc
abstract mixin class _$RevealedAnswerCopyWith<$Res>
    implements $RevealedAnswerCopyWith<$Res> {
  factory _$RevealedAnswerCopyWith(
    _RevealedAnswer value,
    $Res Function(_RevealedAnswer) _then,
  ) = __$RevealedAnswerCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String? sessionId,
    String? valueId,
    String? questionId,
    String? questionText,
    String? answerText,
    bool syncedLate,
  });
}

/// @nodoc
class __$RevealedAnswerCopyWithImpl<$Res>
    implements _$RevealedAnswerCopyWith<$Res> {
  __$RevealedAnswerCopyWithImpl(this._self, this._then);

  final _RevealedAnswer _self;
  final $Res Function(_RevealedAnswer) _then;

  /// Create a copy of RevealedAnswer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? sessionId = freezed,
    Object? valueId = freezed,
    Object? questionId = freezed,
    Object? questionText = freezed,
    Object? answerText = freezed,
    Object? syncedLate = null,
  }) {
    return _then(
      _RevealedAnswer(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        sessionId: freezed == sessionId
            ? _self.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String?,
        valueId: freezed == valueId
            ? _self.valueId
            : valueId // ignore: cast_nullable_to_non_nullable
                  as String?,
        questionId: freezed == questionId
            ? _self.questionId
            : questionId // ignore: cast_nullable_to_non_nullable
                  as String?,
        questionText: freezed == questionText
            ? _self.questionText
            : questionText // ignore: cast_nullable_to_non_nullable
                  as String?,
        answerText: freezed == answerText
            ? _self.answerText
            : answerText // ignore: cast_nullable_to_non_nullable
                  as String?,
        syncedLate: null == syncedLate
            ? _self.syncedLate
            : syncedLate // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
mixin _$RevealedCommitment {
  String get id;
  String? get sessionId;
  String? get valueId;
  String? get actionText;
  String? get measureText;
  String? get followUpStatus;
  String? get followUpNote;
  bool get syncedLate;

  /// Create a copy of RevealedCommitment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RevealedCommitmentCopyWith<RevealedCommitment> get copyWith =>
      _$RevealedCommitmentCopyWithImpl<RevealedCommitment>(
        this as RevealedCommitment,
        _$identity,
      );

  /// Serializes this RevealedCommitment to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RevealedCommitment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.valueId, valueId) || other.valueId == valueId) &&
            (identical(other.actionText, actionText) ||
                other.actionText == actionText) &&
            (identical(other.measureText, measureText) ||
                other.measureText == measureText) &&
            (identical(other.followUpStatus, followUpStatus) ||
                other.followUpStatus == followUpStatus) &&
            (identical(other.followUpNote, followUpNote) ||
                other.followUpNote == followUpNote) &&
            (identical(other.syncedLate, syncedLate) ||
                other.syncedLate == syncedLate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    sessionId,
    valueId,
    actionText,
    measureText,
    followUpStatus,
    followUpNote,
    syncedLate,
  );

  @override
  String toString() {
    return 'RevealedCommitment(id: $id, sessionId: $sessionId, valueId: $valueId, actionText: $actionText, measureText: $measureText, followUpStatus: $followUpStatus, followUpNote: $followUpNote, syncedLate: $syncedLate)';
  }
}

/// @nodoc
abstract mixin class $RevealedCommitmentCopyWith<$Res> {
  factory $RevealedCommitmentCopyWith(
    RevealedCommitment value,
    $Res Function(RevealedCommitment) _then,
  ) = _$RevealedCommitmentCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String? sessionId,
    String? valueId,
    String? actionText,
    String? measureText,
    String? followUpStatus,
    String? followUpNote,
    bool syncedLate,
  });
}

/// @nodoc
class _$RevealedCommitmentCopyWithImpl<$Res>
    implements $RevealedCommitmentCopyWith<$Res> {
  _$RevealedCommitmentCopyWithImpl(this._self, this._then);

  final RevealedCommitment _self;
  final $Res Function(RevealedCommitment) _then;

  /// Create a copy of RevealedCommitment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionId = freezed,
    Object? valueId = freezed,
    Object? actionText = freezed,
    Object? measureText = freezed,
    Object? followUpStatus = freezed,
    Object? followUpNote = freezed,
    Object? syncedLate = null,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        sessionId: freezed == sessionId
            ? _self.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String?,
        valueId: freezed == valueId
            ? _self.valueId
            : valueId // ignore: cast_nullable_to_non_nullable
                  as String?,
        actionText: freezed == actionText
            ? _self.actionText
            : actionText // ignore: cast_nullable_to_non_nullable
                  as String?,
        measureText: freezed == measureText
            ? _self.measureText
            : measureText // ignore: cast_nullable_to_non_nullable
                  as String?,
        followUpStatus: freezed == followUpStatus
            ? _self.followUpStatus
            : followUpStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        followUpNote: freezed == followUpNote
            ? _self.followUpNote
            : followUpNote // ignore: cast_nullable_to_non_nullable
                  as String?,
        syncedLate: null == syncedLate
            ? _self.syncedLate
            : syncedLate // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [RevealedCommitment].
extension RevealedCommitmentPatterns on RevealedCommitment {
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
    TResult Function(_RevealedCommitment value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RevealedCommitment() when $default != null:
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
    TResult Function(_RevealedCommitment value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RevealedCommitment():
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
    TResult? Function(_RevealedCommitment value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RevealedCommitment() when $default != null:
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
      String id,
      String? sessionId,
      String? valueId,
      String? actionText,
      String? measureText,
      String? followUpStatus,
      String? followUpNote,
      bool syncedLate,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RevealedCommitment() when $default != null:
        return $default(
          _that.id,
          _that.sessionId,
          _that.valueId,
          _that.actionText,
          _that.measureText,
          _that.followUpStatus,
          _that.followUpNote,
          _that.syncedLate,
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
      String id,
      String? sessionId,
      String? valueId,
      String? actionText,
      String? measureText,
      String? followUpStatus,
      String? followUpNote,
      bool syncedLate,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RevealedCommitment():
        return $default(
          _that.id,
          _that.sessionId,
          _that.valueId,
          _that.actionText,
          _that.measureText,
          _that.followUpStatus,
          _that.followUpNote,
          _that.syncedLate,
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
      String id,
      String? sessionId,
      String? valueId,
      String? actionText,
      String? measureText,
      String? followUpStatus,
      String? followUpNote,
      bool syncedLate,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RevealedCommitment() when $default != null:
        return $default(
          _that.id,
          _that.sessionId,
          _that.valueId,
          _that.actionText,
          _that.measureText,
          _that.followUpStatus,
          _that.followUpNote,
          _that.syncedLate,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RevealedCommitment implements RevealedCommitment {
  const _RevealedCommitment({
    required this.id,
    this.sessionId,
    this.valueId,
    this.actionText,
    this.measureText,
    this.followUpStatus,
    this.followUpNote,
    this.syncedLate = false,
  });
  factory _RevealedCommitment.fromJson(Map<String, dynamic> json) =>
      _$RevealedCommitmentFromJson(json);

  @override
  final String id;
  @override
  final String? sessionId;
  @override
  final String? valueId;
  @override
  final String? actionText;
  @override
  final String? measureText;
  @override
  final String? followUpStatus;
  @override
  final String? followUpNote;
  @override
  @JsonKey()
  final bool syncedLate;

  /// Create a copy of RevealedCommitment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RevealedCommitmentCopyWith<_RevealedCommitment> get copyWith =>
      __$RevealedCommitmentCopyWithImpl<_RevealedCommitment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RevealedCommitmentToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RevealedCommitment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.valueId, valueId) || other.valueId == valueId) &&
            (identical(other.actionText, actionText) ||
                other.actionText == actionText) &&
            (identical(other.measureText, measureText) ||
                other.measureText == measureText) &&
            (identical(other.followUpStatus, followUpStatus) ||
                other.followUpStatus == followUpStatus) &&
            (identical(other.followUpNote, followUpNote) ||
                other.followUpNote == followUpNote) &&
            (identical(other.syncedLate, syncedLate) ||
                other.syncedLate == syncedLate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    sessionId,
    valueId,
    actionText,
    measureText,
    followUpStatus,
    followUpNote,
    syncedLate,
  );

  @override
  String toString() {
    return 'RevealedCommitment(id: $id, sessionId: $sessionId, valueId: $valueId, actionText: $actionText, measureText: $measureText, followUpStatus: $followUpStatus, followUpNote: $followUpNote, syncedLate: $syncedLate)';
  }
}

/// @nodoc
abstract mixin class _$RevealedCommitmentCopyWith<$Res>
    implements $RevealedCommitmentCopyWith<$Res> {
  factory _$RevealedCommitmentCopyWith(
    _RevealedCommitment value,
    $Res Function(_RevealedCommitment) _then,
  ) = __$RevealedCommitmentCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String? sessionId,
    String? valueId,
    String? actionText,
    String? measureText,
    String? followUpStatus,
    String? followUpNote,
    bool syncedLate,
  });
}

/// @nodoc
class __$RevealedCommitmentCopyWithImpl<$Res>
    implements _$RevealedCommitmentCopyWith<$Res> {
  __$RevealedCommitmentCopyWithImpl(this._self, this._then);

  final _RevealedCommitment _self;
  final $Res Function(_RevealedCommitment) _then;

  /// Create a copy of RevealedCommitment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? sessionId = freezed,
    Object? valueId = freezed,
    Object? actionText = freezed,
    Object? measureText = freezed,
    Object? followUpStatus = freezed,
    Object? followUpNote = freezed,
    Object? syncedLate = null,
  }) {
    return _then(
      _RevealedCommitment(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        sessionId: freezed == sessionId
            ? _self.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String?,
        valueId: freezed == valueId
            ? _self.valueId
            : valueId // ignore: cast_nullable_to_non_nullable
                  as String?,
        actionText: freezed == actionText
            ? _self.actionText
            : actionText // ignore: cast_nullable_to_non_nullable
                  as String?,
        measureText: freezed == measureText
            ? _self.measureText
            : measureText // ignore: cast_nullable_to_non_nullable
                  as String?,
        followUpStatus: freezed == followUpStatus
            ? _self.followUpStatus
            : followUpStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        followUpNote: freezed == followUpNote
            ? _self.followUpNote
            : followUpNote // ignore: cast_nullable_to_non_nullable
                  as String?,
        syncedLate: null == syncedLate
            ? _self.syncedLate
            : syncedLate // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
mixin _$RevealedPerson {
  String get personId;
  String? get firstName;
  String? get lastName;
  List<RevealedAssessment> get assessments;
  List<RevealedAnswer> get answers;
  List<RevealedCommitment> get commitments;

  /// Create a copy of RevealedPerson
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RevealedPersonCopyWith<RevealedPerson> get copyWith =>
      _$RevealedPersonCopyWithImpl<RevealedPerson>(
        this as RevealedPerson,
        _$identity,
      );

  /// Serializes this RevealedPerson to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RevealedPerson &&
            (identical(other.personId, personId) ||
                other.personId == personId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            const DeepCollectionEquality().equals(
              other.assessments,
              assessments,
            ) &&
            const DeepCollectionEquality().equals(other.answers, answers) &&
            const DeepCollectionEquality().equals(
              other.commitments,
              commitments,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    personId,
    firstName,
    lastName,
    const DeepCollectionEquality().hash(assessments),
    const DeepCollectionEquality().hash(answers),
    const DeepCollectionEquality().hash(commitments),
  );

  @override
  String toString() {
    return 'RevealedPerson(personId: $personId, firstName: $firstName, lastName: $lastName, assessments: $assessments, answers: $answers, commitments: $commitments)';
  }
}

/// @nodoc
abstract mixin class $RevealedPersonCopyWith<$Res> {
  factory $RevealedPersonCopyWith(
    RevealedPerson value,
    $Res Function(RevealedPerson) _then,
  ) = _$RevealedPersonCopyWithImpl;
  @useResult
  $Res call({
    String personId,
    String? firstName,
    String? lastName,
    List<RevealedAssessment> assessments,
    List<RevealedAnswer> answers,
    List<RevealedCommitment> commitments,
  });
}

/// @nodoc
class _$RevealedPersonCopyWithImpl<$Res>
    implements $RevealedPersonCopyWith<$Res> {
  _$RevealedPersonCopyWithImpl(this._self, this._then);

  final RevealedPerson _self;
  final $Res Function(RevealedPerson) _then;

  /// Create a copy of RevealedPerson
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? personId = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? assessments = null,
    Object? answers = null,
    Object? commitments = null,
  }) {
    return _then(
      _self.copyWith(
        personId: null == personId
            ? _self.personId
            : personId // ignore: cast_nullable_to_non_nullable
                  as String,
        firstName: freezed == firstName
            ? _self.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastName: freezed == lastName
            ? _self.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String?,
        assessments: null == assessments
            ? _self.assessments
            : assessments // ignore: cast_nullable_to_non_nullable
                  as List<RevealedAssessment>,
        answers: null == answers
            ? _self.answers
            : answers // ignore: cast_nullable_to_non_nullable
                  as List<RevealedAnswer>,
        commitments: null == commitments
            ? _self.commitments
            : commitments // ignore: cast_nullable_to_non_nullable
                  as List<RevealedCommitment>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [RevealedPerson].
extension RevealedPersonPatterns on RevealedPerson {
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
    TResult Function(_RevealedPerson value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RevealedPerson() when $default != null:
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
    TResult Function(_RevealedPerson value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RevealedPerson():
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
    TResult? Function(_RevealedPerson value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RevealedPerson() when $default != null:
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
      String personId,
      String? firstName,
      String? lastName,
      List<RevealedAssessment> assessments,
      List<RevealedAnswer> answers,
      List<RevealedCommitment> commitments,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RevealedPerson() when $default != null:
        return $default(
          _that.personId,
          _that.firstName,
          _that.lastName,
          _that.assessments,
          _that.answers,
          _that.commitments,
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
      String personId,
      String? firstName,
      String? lastName,
      List<RevealedAssessment> assessments,
      List<RevealedAnswer> answers,
      List<RevealedCommitment> commitments,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RevealedPerson():
        return $default(
          _that.personId,
          _that.firstName,
          _that.lastName,
          _that.assessments,
          _that.answers,
          _that.commitments,
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
      String personId,
      String? firstName,
      String? lastName,
      List<RevealedAssessment> assessments,
      List<RevealedAnswer> answers,
      List<RevealedCommitment> commitments,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RevealedPerson() when $default != null:
        return $default(
          _that.personId,
          _that.firstName,
          _that.lastName,
          _that.assessments,
          _that.answers,
          _that.commitments,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RevealedPerson implements RevealedPerson {
  const _RevealedPerson({
    required this.personId,
    this.firstName,
    this.lastName,
    final List<RevealedAssessment> assessments = const [],
    final List<RevealedAnswer> answers = const [],
    final List<RevealedCommitment> commitments = const [],
  }) : _assessments = assessments,
       _answers = answers,
       _commitments = commitments;
  factory _RevealedPerson.fromJson(Map<String, dynamic> json) =>
      _$RevealedPersonFromJson(json);

  @override
  final String personId;
  @override
  final String? firstName;
  @override
  final String? lastName;
  final List<RevealedAssessment> _assessments;
  @override
  @JsonKey()
  List<RevealedAssessment> get assessments {
    if (_assessments is EqualUnmodifiableListView) return _assessments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assessments);
  }

  final List<RevealedAnswer> _answers;
  @override
  @JsonKey()
  List<RevealedAnswer> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  final List<RevealedCommitment> _commitments;
  @override
  @JsonKey()
  List<RevealedCommitment> get commitments {
    if (_commitments is EqualUnmodifiableListView) return _commitments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_commitments);
  }

  /// Create a copy of RevealedPerson
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RevealedPersonCopyWith<_RevealedPerson> get copyWith =>
      __$RevealedPersonCopyWithImpl<_RevealedPerson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RevealedPersonToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RevealedPerson &&
            (identical(other.personId, personId) ||
                other.personId == personId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            const DeepCollectionEquality().equals(
              other._assessments,
              _assessments,
            ) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            const DeepCollectionEquality().equals(
              other._commitments,
              _commitments,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    personId,
    firstName,
    lastName,
    const DeepCollectionEquality().hash(_assessments),
    const DeepCollectionEquality().hash(_answers),
    const DeepCollectionEquality().hash(_commitments),
  );

  @override
  String toString() {
    return 'RevealedPerson(personId: $personId, firstName: $firstName, lastName: $lastName, assessments: $assessments, answers: $answers, commitments: $commitments)';
  }
}

/// @nodoc
abstract mixin class _$RevealedPersonCopyWith<$Res>
    implements $RevealedPersonCopyWith<$Res> {
  factory _$RevealedPersonCopyWith(
    _RevealedPerson value,
    $Res Function(_RevealedPerson) _then,
  ) = __$RevealedPersonCopyWithImpl;
  @override
  @useResult
  $Res call({
    String personId,
    String? firstName,
    String? lastName,
    List<RevealedAssessment> assessments,
    List<RevealedAnswer> answers,
    List<RevealedCommitment> commitments,
  });
}

/// @nodoc
class __$RevealedPersonCopyWithImpl<$Res>
    implements _$RevealedPersonCopyWith<$Res> {
  __$RevealedPersonCopyWithImpl(this._self, this._then);

  final _RevealedPerson _self;
  final $Res Function(_RevealedPerson) _then;

  /// Create a copy of RevealedPerson
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? personId = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? assessments = null,
    Object? answers = null,
    Object? commitments = null,
  }) {
    return _then(
      _RevealedPerson(
        personId: null == personId
            ? _self.personId
            : personId // ignore: cast_nullable_to_non_nullable
                  as String,
        firstName: freezed == firstName
            ? _self.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastName: freezed == lastName
            ? _self.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String?,
        assessments: null == assessments
            ? _self._assessments
            : assessments // ignore: cast_nullable_to_non_nullable
                  as List<RevealedAssessment>,
        answers: null == answers
            ? _self._answers
            : answers // ignore: cast_nullable_to_non_nullable
                  as List<RevealedAnswer>,
        commitments: null == commitments
            ? _self._commitments
            : commitments // ignore: cast_nullable_to_non_nullable
                  as List<RevealedCommitment>,
      ),
    );
  }
}

/// @nodoc
mixin _$RevealedAnswers {
  String get roundTableId;
  DateTime? get revealedAt;
  List<RevealedPerson> get people;

  /// Create a copy of RevealedAnswers
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RevealedAnswersCopyWith<RevealedAnswers> get copyWith =>
      _$RevealedAnswersCopyWithImpl<RevealedAnswers>(
        this as RevealedAnswers,
        _$identity,
      );

  /// Serializes this RevealedAnswers to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RevealedAnswers &&
            (identical(other.roundTableId, roundTableId) ||
                other.roundTableId == roundTableId) &&
            (identical(other.revealedAt, revealedAt) ||
                other.revealedAt == revealedAt) &&
            const DeepCollectionEquality().equals(other.people, people));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    roundTableId,
    revealedAt,
    const DeepCollectionEquality().hash(people),
  );

  @override
  String toString() {
    return 'RevealedAnswers(roundTableId: $roundTableId, revealedAt: $revealedAt, people: $people)';
  }
}

/// @nodoc
abstract mixin class $RevealedAnswersCopyWith<$Res> {
  factory $RevealedAnswersCopyWith(
    RevealedAnswers value,
    $Res Function(RevealedAnswers) _then,
  ) = _$RevealedAnswersCopyWithImpl;
  @useResult
  $Res call({
    String roundTableId,
    DateTime? revealedAt,
    List<RevealedPerson> people,
  });
}

/// @nodoc
class _$RevealedAnswersCopyWithImpl<$Res>
    implements $RevealedAnswersCopyWith<$Res> {
  _$RevealedAnswersCopyWithImpl(this._self, this._then);

  final RevealedAnswers _self;
  final $Res Function(RevealedAnswers) _then;

  /// Create a copy of RevealedAnswers
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roundTableId = null,
    Object? revealedAt = freezed,
    Object? people = null,
  }) {
    return _then(
      _self.copyWith(
        roundTableId: null == roundTableId
            ? _self.roundTableId
            : roundTableId // ignore: cast_nullable_to_non_nullable
                  as String,
        revealedAt: freezed == revealedAt
            ? _self.revealedAt
            : revealedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        people: null == people
            ? _self.people
            : people // ignore: cast_nullable_to_non_nullable
                  as List<RevealedPerson>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [RevealedAnswers].
extension RevealedAnswersPatterns on RevealedAnswers {
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
    TResult Function(_RevealedAnswers value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RevealedAnswers() when $default != null:
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
    TResult Function(_RevealedAnswers value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RevealedAnswers():
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
    TResult? Function(_RevealedAnswers value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RevealedAnswers() when $default != null:
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
      String roundTableId,
      DateTime? revealedAt,
      List<RevealedPerson> people,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RevealedAnswers() when $default != null:
        return $default(_that.roundTableId, _that.revealedAt, _that.people);
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
      String roundTableId,
      DateTime? revealedAt,
      List<RevealedPerson> people,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RevealedAnswers():
        return $default(_that.roundTableId, _that.revealedAt, _that.people);
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
      String roundTableId,
      DateTime? revealedAt,
      List<RevealedPerson> people,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RevealedAnswers() when $default != null:
        return $default(_that.roundTableId, _that.revealedAt, _that.people);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RevealedAnswers implements RevealedAnswers {
  const _RevealedAnswers({
    required this.roundTableId,
    this.revealedAt,
    final List<RevealedPerson> people = const [],
  }) : _people = people;
  factory _RevealedAnswers.fromJson(Map<String, dynamic> json) =>
      _$RevealedAnswersFromJson(json);

  @override
  final String roundTableId;
  @override
  final DateTime? revealedAt;
  final List<RevealedPerson> _people;
  @override
  @JsonKey()
  List<RevealedPerson> get people {
    if (_people is EqualUnmodifiableListView) return _people;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_people);
  }

  /// Create a copy of RevealedAnswers
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RevealedAnswersCopyWith<_RevealedAnswers> get copyWith =>
      __$RevealedAnswersCopyWithImpl<_RevealedAnswers>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RevealedAnswersToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RevealedAnswers &&
            (identical(other.roundTableId, roundTableId) ||
                other.roundTableId == roundTableId) &&
            (identical(other.revealedAt, revealedAt) ||
                other.revealedAt == revealedAt) &&
            const DeepCollectionEquality().equals(other._people, _people));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    roundTableId,
    revealedAt,
    const DeepCollectionEquality().hash(_people),
  );

  @override
  String toString() {
    return 'RevealedAnswers(roundTableId: $roundTableId, revealedAt: $revealedAt, people: $people)';
  }
}

/// @nodoc
abstract mixin class _$RevealedAnswersCopyWith<$Res>
    implements $RevealedAnswersCopyWith<$Res> {
  factory _$RevealedAnswersCopyWith(
    _RevealedAnswers value,
    $Res Function(_RevealedAnswers) _then,
  ) = __$RevealedAnswersCopyWithImpl;
  @override
  @useResult
  $Res call({
    String roundTableId,
    DateTime? revealedAt,
    List<RevealedPerson> people,
  });
}

/// @nodoc
class __$RevealedAnswersCopyWithImpl<$Res>
    implements _$RevealedAnswersCopyWith<$Res> {
  __$RevealedAnswersCopyWithImpl(this._self, this._then);

  final _RevealedAnswers _self;
  final $Res Function(_RevealedAnswers) _then;

  /// Create a copy of RevealedAnswers
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? roundTableId = null,
    Object? revealedAt = freezed,
    Object? people = null,
  }) {
    return _then(
      _RevealedAnswers(
        roundTableId: null == roundTableId
            ? _self.roundTableId
            : roundTableId // ignore: cast_nullable_to_non_nullable
                  as String,
        revealedAt: freezed == revealedAt
            ? _self.revealedAt
            : revealedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        people: null == people
            ? _self._people
            : people // ignore: cast_nullable_to_non_nullable
                  as List<RevealedPerson>,
      ),
    );
  }
}
