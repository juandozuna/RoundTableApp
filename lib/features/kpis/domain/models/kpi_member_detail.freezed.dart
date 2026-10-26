// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kpi_member_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KpiMemberScore {
  String get valueId;
  String get valueLabel;
  int get sequence;
  int? get initialScore;
  int? get followUpScore;
  int? get delta;
  bool get syncedLate;

  /// Create a copy of KpiMemberScore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $KpiMemberScoreCopyWith<KpiMemberScore> get copyWith =>
      _$KpiMemberScoreCopyWithImpl<KpiMemberScore>(
        this as KpiMemberScore,
        _$identity,
      );

  /// Serializes this KpiMemberScore to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is KpiMemberScore &&
            (identical(other.valueId, valueId) || other.valueId == valueId) &&
            (identical(other.valueLabel, valueLabel) ||
                other.valueLabel == valueLabel) &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence) &&
            (identical(other.initialScore, initialScore) ||
                other.initialScore == initialScore) &&
            (identical(other.followUpScore, followUpScore) ||
                other.followUpScore == followUpScore) &&
            (identical(other.delta, delta) || other.delta == delta) &&
            (identical(other.syncedLate, syncedLate) ||
                other.syncedLate == syncedLate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    valueId,
    valueLabel,
    sequence,
    initialScore,
    followUpScore,
    delta,
    syncedLate,
  );

  @override
  String toString() {
    return 'KpiMemberScore(valueId: $valueId, valueLabel: $valueLabel, sequence: $sequence, initialScore: $initialScore, followUpScore: $followUpScore, delta: $delta, syncedLate: $syncedLate)';
  }
}

/// @nodoc
abstract mixin class $KpiMemberScoreCopyWith<$Res> {
  factory $KpiMemberScoreCopyWith(
    KpiMemberScore value,
    $Res Function(KpiMemberScore) _then,
  ) = _$KpiMemberScoreCopyWithImpl;
  @useResult
  $Res call({
    String valueId,
    String valueLabel,
    int sequence,
    int? initialScore,
    int? followUpScore,
    int? delta,
    bool syncedLate,
  });
}

/// @nodoc
class _$KpiMemberScoreCopyWithImpl<$Res>
    implements $KpiMemberScoreCopyWith<$Res> {
  _$KpiMemberScoreCopyWithImpl(this._self, this._then);

  final KpiMemberScore _self;
  final $Res Function(KpiMemberScore) _then;

  /// Create a copy of KpiMemberScore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? valueId = null,
    Object? valueLabel = null,
    Object? sequence = null,
    Object? initialScore = freezed,
    Object? followUpScore = freezed,
    Object? delta = freezed,
    Object? syncedLate = null,
  }) {
    return _then(
      _self.copyWith(
        valueId: null == valueId
            ? _self.valueId
            : valueId // ignore: cast_nullable_to_non_nullable
                  as String,
        valueLabel: null == valueLabel
            ? _self.valueLabel
            : valueLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        sequence: null == sequence
            ? _self.sequence
            : sequence // ignore: cast_nullable_to_non_nullable
                  as int,
        initialScore: freezed == initialScore
            ? _self.initialScore
            : initialScore // ignore: cast_nullable_to_non_nullable
                  as int?,
        followUpScore: freezed == followUpScore
            ? _self.followUpScore
            : followUpScore // ignore: cast_nullable_to_non_nullable
                  as int?,
        delta: freezed == delta
            ? _self.delta
            : delta // ignore: cast_nullable_to_non_nullable
                  as int?,
        syncedLate: null == syncedLate
            ? _self.syncedLate
            : syncedLate // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [KpiMemberScore].
extension KpiMemberScorePatterns on KpiMemberScore {
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
    TResult Function(_KpiMemberScore value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _KpiMemberScore() when $default != null:
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
    TResult Function(_KpiMemberScore value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KpiMemberScore():
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
    TResult? Function(_KpiMemberScore value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KpiMemberScore() when $default != null:
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
      String valueId,
      String valueLabel,
      int sequence,
      int? initialScore,
      int? followUpScore,
      int? delta,
      bool syncedLate,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _KpiMemberScore() when $default != null:
        return $default(
          _that.valueId,
          _that.valueLabel,
          _that.sequence,
          _that.initialScore,
          _that.followUpScore,
          _that.delta,
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
      String valueId,
      String valueLabel,
      int sequence,
      int? initialScore,
      int? followUpScore,
      int? delta,
      bool syncedLate,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KpiMemberScore():
        return $default(
          _that.valueId,
          _that.valueLabel,
          _that.sequence,
          _that.initialScore,
          _that.followUpScore,
          _that.delta,
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
      String valueId,
      String valueLabel,
      int sequence,
      int? initialScore,
      int? followUpScore,
      int? delta,
      bool syncedLate,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KpiMemberScore() when $default != null:
        return $default(
          _that.valueId,
          _that.valueLabel,
          _that.sequence,
          _that.initialScore,
          _that.followUpScore,
          _that.delta,
          _that.syncedLate,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _KpiMemberScore implements KpiMemberScore {
  const _KpiMemberScore({
    required this.valueId,
    required this.valueLabel,
    this.sequence = 0,
    this.initialScore,
    this.followUpScore,
    this.delta,
    this.syncedLate = false,
  });
  factory _KpiMemberScore.fromJson(Map<String, dynamic> json) =>
      _$KpiMemberScoreFromJson(json);

  @override
  final String valueId;
  @override
  final String valueLabel;
  @override
  @JsonKey()
  final int sequence;
  @override
  final int? initialScore;
  @override
  final int? followUpScore;
  @override
  final int? delta;
  @override
  @JsonKey()
  final bool syncedLate;

  /// Create a copy of KpiMemberScore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$KpiMemberScoreCopyWith<_KpiMemberScore> get copyWith =>
      __$KpiMemberScoreCopyWithImpl<_KpiMemberScore>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$KpiMemberScoreToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _KpiMemberScore &&
            (identical(other.valueId, valueId) || other.valueId == valueId) &&
            (identical(other.valueLabel, valueLabel) ||
                other.valueLabel == valueLabel) &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence) &&
            (identical(other.initialScore, initialScore) ||
                other.initialScore == initialScore) &&
            (identical(other.followUpScore, followUpScore) ||
                other.followUpScore == followUpScore) &&
            (identical(other.delta, delta) || other.delta == delta) &&
            (identical(other.syncedLate, syncedLate) ||
                other.syncedLate == syncedLate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    valueId,
    valueLabel,
    sequence,
    initialScore,
    followUpScore,
    delta,
    syncedLate,
  );

  @override
  String toString() {
    return 'KpiMemberScore(valueId: $valueId, valueLabel: $valueLabel, sequence: $sequence, initialScore: $initialScore, followUpScore: $followUpScore, delta: $delta, syncedLate: $syncedLate)';
  }
}

/// @nodoc
abstract mixin class _$KpiMemberScoreCopyWith<$Res>
    implements $KpiMemberScoreCopyWith<$Res> {
  factory _$KpiMemberScoreCopyWith(
    _KpiMemberScore value,
    $Res Function(_KpiMemberScore) _then,
  ) = __$KpiMemberScoreCopyWithImpl;
  @override
  @useResult
  $Res call({
    String valueId,
    String valueLabel,
    int sequence,
    int? initialScore,
    int? followUpScore,
    int? delta,
    bool syncedLate,
  });
}

/// @nodoc
class __$KpiMemberScoreCopyWithImpl<$Res>
    implements _$KpiMemberScoreCopyWith<$Res> {
  __$KpiMemberScoreCopyWithImpl(this._self, this._then);

  final _KpiMemberScore _self;
  final $Res Function(_KpiMemberScore) _then;

  /// Create a copy of KpiMemberScore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? valueId = null,
    Object? valueLabel = null,
    Object? sequence = null,
    Object? initialScore = freezed,
    Object? followUpScore = freezed,
    Object? delta = freezed,
    Object? syncedLate = null,
  }) {
    return _then(
      _KpiMemberScore(
        valueId: null == valueId
            ? _self.valueId
            : valueId // ignore: cast_nullable_to_non_nullable
                  as String,
        valueLabel: null == valueLabel
            ? _self.valueLabel
            : valueLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        sequence: null == sequence
            ? _self.sequence
            : sequence // ignore: cast_nullable_to_non_nullable
                  as int,
        initialScore: freezed == initialScore
            ? _self.initialScore
            : initialScore // ignore: cast_nullable_to_non_nullable
                  as int?,
        followUpScore: freezed == followUpScore
            ? _self.followUpScore
            : followUpScore // ignore: cast_nullable_to_non_nullable
                  as int?,
        delta: freezed == delta
            ? _self.delta
            : delta // ignore: cast_nullable_to_non_nullable
                  as int?,
        syncedLate: null == syncedLate
            ? _self.syncedLate
            : syncedLate // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
mixin _$KpiMemberDetail {
  String get personId;
  String get firstName;
  String get lastName;
  String? get role;
  String? get membershipStatus;
  int get sessionsExpected;
  int get sessionsPresent;
  double? get attendancePct;
  int get valuesCompleted;
  double? get improvementAvg;
  int get syncedLateSessions;
  List<KpiMemberScore> get scores;

  /// Create a copy of KpiMemberDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $KpiMemberDetailCopyWith<KpiMemberDetail> get copyWith =>
      _$KpiMemberDetailCopyWithImpl<KpiMemberDetail>(
        this as KpiMemberDetail,
        _$identity,
      );

  /// Serializes this KpiMemberDetail to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is KpiMemberDetail &&
            (identical(other.personId, personId) ||
                other.personId == personId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.membershipStatus, membershipStatus) ||
                other.membershipStatus == membershipStatus) &&
            (identical(other.sessionsExpected, sessionsExpected) ||
                other.sessionsExpected == sessionsExpected) &&
            (identical(other.sessionsPresent, sessionsPresent) ||
                other.sessionsPresent == sessionsPresent) &&
            (identical(other.attendancePct, attendancePct) ||
                other.attendancePct == attendancePct) &&
            (identical(other.valuesCompleted, valuesCompleted) ||
                other.valuesCompleted == valuesCompleted) &&
            (identical(other.improvementAvg, improvementAvg) ||
                other.improvementAvg == improvementAvg) &&
            (identical(other.syncedLateSessions, syncedLateSessions) ||
                other.syncedLateSessions == syncedLateSessions) &&
            const DeepCollectionEquality().equals(other.scores, scores));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    personId,
    firstName,
    lastName,
    role,
    membershipStatus,
    sessionsExpected,
    sessionsPresent,
    attendancePct,
    valuesCompleted,
    improvementAvg,
    syncedLateSessions,
    const DeepCollectionEquality().hash(scores),
  );

  @override
  String toString() {
    return 'KpiMemberDetail(personId: $personId, firstName: $firstName, lastName: $lastName, role: $role, membershipStatus: $membershipStatus, sessionsExpected: $sessionsExpected, sessionsPresent: $sessionsPresent, attendancePct: $attendancePct, valuesCompleted: $valuesCompleted, improvementAvg: $improvementAvg, syncedLateSessions: $syncedLateSessions, scores: $scores)';
  }
}

/// @nodoc
abstract mixin class $KpiMemberDetailCopyWith<$Res> {
  factory $KpiMemberDetailCopyWith(
    KpiMemberDetail value,
    $Res Function(KpiMemberDetail) _then,
  ) = _$KpiMemberDetailCopyWithImpl;
  @useResult
  $Res call({
    String personId,
    String firstName,
    String lastName,
    String? role,
    String? membershipStatus,
    int sessionsExpected,
    int sessionsPresent,
    double? attendancePct,
    int valuesCompleted,
    double? improvementAvg,
    int syncedLateSessions,
    List<KpiMemberScore> scores,
  });
}

/// @nodoc
class _$KpiMemberDetailCopyWithImpl<$Res>
    implements $KpiMemberDetailCopyWith<$Res> {
  _$KpiMemberDetailCopyWithImpl(this._self, this._then);

  final KpiMemberDetail _self;
  final $Res Function(KpiMemberDetail) _then;

  /// Create a copy of KpiMemberDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? personId = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? role = freezed,
    Object? membershipStatus = freezed,
    Object? sessionsExpected = null,
    Object? sessionsPresent = null,
    Object? attendancePct = freezed,
    Object? valuesCompleted = null,
    Object? improvementAvg = freezed,
    Object? syncedLateSessions = null,
    Object? scores = null,
  }) {
    return _then(
      _self.copyWith(
        personId: null == personId
            ? _self.personId
            : personId // ignore: cast_nullable_to_non_nullable
                  as String,
        firstName: null == firstName
            ? _self.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
        lastName: null == lastName
            ? _self.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String,
        role: freezed == role
            ? _self.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String?,
        membershipStatus: freezed == membershipStatus
            ? _self.membershipStatus
            : membershipStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        sessionsExpected: null == sessionsExpected
            ? _self.sessionsExpected
            : sessionsExpected // ignore: cast_nullable_to_non_nullable
                  as int,
        sessionsPresent: null == sessionsPresent
            ? _self.sessionsPresent
            : sessionsPresent // ignore: cast_nullable_to_non_nullable
                  as int,
        attendancePct: freezed == attendancePct
            ? _self.attendancePct
            : attendancePct // ignore: cast_nullable_to_non_nullable
                  as double?,
        valuesCompleted: null == valuesCompleted
            ? _self.valuesCompleted
            : valuesCompleted // ignore: cast_nullable_to_non_nullable
                  as int,
        improvementAvg: freezed == improvementAvg
            ? _self.improvementAvg
            : improvementAvg // ignore: cast_nullable_to_non_nullable
                  as double?,
        syncedLateSessions: null == syncedLateSessions
            ? _self.syncedLateSessions
            : syncedLateSessions // ignore: cast_nullable_to_non_nullable
                  as int,
        scores: null == scores
            ? _self.scores
            : scores // ignore: cast_nullable_to_non_nullable
                  as List<KpiMemberScore>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [KpiMemberDetail].
extension KpiMemberDetailPatterns on KpiMemberDetail {
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
    TResult Function(_KpiMemberDetail value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _KpiMemberDetail() when $default != null:
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
    TResult Function(_KpiMemberDetail value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KpiMemberDetail():
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
    TResult? Function(_KpiMemberDetail value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KpiMemberDetail() when $default != null:
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
      String firstName,
      String lastName,
      String? role,
      String? membershipStatus,
      int sessionsExpected,
      int sessionsPresent,
      double? attendancePct,
      int valuesCompleted,
      double? improvementAvg,
      int syncedLateSessions,
      List<KpiMemberScore> scores,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _KpiMemberDetail() when $default != null:
        return $default(
          _that.personId,
          _that.firstName,
          _that.lastName,
          _that.role,
          _that.membershipStatus,
          _that.sessionsExpected,
          _that.sessionsPresent,
          _that.attendancePct,
          _that.valuesCompleted,
          _that.improvementAvg,
          _that.syncedLateSessions,
          _that.scores,
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
      String firstName,
      String lastName,
      String? role,
      String? membershipStatus,
      int sessionsExpected,
      int sessionsPresent,
      double? attendancePct,
      int valuesCompleted,
      double? improvementAvg,
      int syncedLateSessions,
      List<KpiMemberScore> scores,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KpiMemberDetail():
        return $default(
          _that.personId,
          _that.firstName,
          _that.lastName,
          _that.role,
          _that.membershipStatus,
          _that.sessionsExpected,
          _that.sessionsPresent,
          _that.attendancePct,
          _that.valuesCompleted,
          _that.improvementAvg,
          _that.syncedLateSessions,
          _that.scores,
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
      String firstName,
      String lastName,
      String? role,
      String? membershipStatus,
      int sessionsExpected,
      int sessionsPresent,
      double? attendancePct,
      int valuesCompleted,
      double? improvementAvg,
      int syncedLateSessions,
      List<KpiMemberScore> scores,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KpiMemberDetail() when $default != null:
        return $default(
          _that.personId,
          _that.firstName,
          _that.lastName,
          _that.role,
          _that.membershipStatus,
          _that.sessionsExpected,
          _that.sessionsPresent,
          _that.attendancePct,
          _that.valuesCompleted,
          _that.improvementAvg,
          _that.syncedLateSessions,
          _that.scores,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _KpiMemberDetail extends KpiMemberDetail {
  const _KpiMemberDetail({
    required this.personId,
    required this.firstName,
    required this.lastName,
    this.role,
    this.membershipStatus,
    this.sessionsExpected = 0,
    this.sessionsPresent = 0,
    this.attendancePct,
    this.valuesCompleted = 0,
    this.improvementAvg,
    this.syncedLateSessions = 0,
    final List<KpiMemberScore> scores = const [],
  }) : _scores = scores,
       super._();
  factory _KpiMemberDetail.fromJson(Map<String, dynamic> json) =>
      _$KpiMemberDetailFromJson(json);

  @override
  final String personId;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String? role;
  @override
  final String? membershipStatus;
  @override
  @JsonKey()
  final int sessionsExpected;
  @override
  @JsonKey()
  final int sessionsPresent;
  @override
  final double? attendancePct;
  @override
  @JsonKey()
  final int valuesCompleted;
  @override
  final double? improvementAvg;
  @override
  @JsonKey()
  final int syncedLateSessions;
  final List<KpiMemberScore> _scores;
  @override
  @JsonKey()
  List<KpiMemberScore> get scores {
    if (_scores is EqualUnmodifiableListView) return _scores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scores);
  }

  /// Create a copy of KpiMemberDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$KpiMemberDetailCopyWith<_KpiMemberDetail> get copyWith =>
      __$KpiMemberDetailCopyWithImpl<_KpiMemberDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$KpiMemberDetailToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _KpiMemberDetail &&
            (identical(other.personId, personId) ||
                other.personId == personId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.membershipStatus, membershipStatus) ||
                other.membershipStatus == membershipStatus) &&
            (identical(other.sessionsExpected, sessionsExpected) ||
                other.sessionsExpected == sessionsExpected) &&
            (identical(other.sessionsPresent, sessionsPresent) ||
                other.sessionsPresent == sessionsPresent) &&
            (identical(other.attendancePct, attendancePct) ||
                other.attendancePct == attendancePct) &&
            (identical(other.valuesCompleted, valuesCompleted) ||
                other.valuesCompleted == valuesCompleted) &&
            (identical(other.improvementAvg, improvementAvg) ||
                other.improvementAvg == improvementAvg) &&
            (identical(other.syncedLateSessions, syncedLateSessions) ||
                other.syncedLateSessions == syncedLateSessions) &&
            const DeepCollectionEquality().equals(other._scores, _scores));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    personId,
    firstName,
    lastName,
    role,
    membershipStatus,
    sessionsExpected,
    sessionsPresent,
    attendancePct,
    valuesCompleted,
    improvementAvg,
    syncedLateSessions,
    const DeepCollectionEquality().hash(_scores),
  );

  @override
  String toString() {
    return 'KpiMemberDetail(personId: $personId, firstName: $firstName, lastName: $lastName, role: $role, membershipStatus: $membershipStatus, sessionsExpected: $sessionsExpected, sessionsPresent: $sessionsPresent, attendancePct: $attendancePct, valuesCompleted: $valuesCompleted, improvementAvg: $improvementAvg, syncedLateSessions: $syncedLateSessions, scores: $scores)';
  }
}

/// @nodoc
abstract mixin class _$KpiMemberDetailCopyWith<$Res>
    implements $KpiMemberDetailCopyWith<$Res> {
  factory _$KpiMemberDetailCopyWith(
    _KpiMemberDetail value,
    $Res Function(_KpiMemberDetail) _then,
  ) = __$KpiMemberDetailCopyWithImpl;
  @override
  @useResult
  $Res call({
    String personId,
    String firstName,
    String lastName,
    String? role,
    String? membershipStatus,
    int sessionsExpected,
    int sessionsPresent,
    double? attendancePct,
    int valuesCompleted,
    double? improvementAvg,
    int syncedLateSessions,
    List<KpiMemberScore> scores,
  });
}

/// @nodoc
class __$KpiMemberDetailCopyWithImpl<$Res>
    implements _$KpiMemberDetailCopyWith<$Res> {
  __$KpiMemberDetailCopyWithImpl(this._self, this._then);

  final _KpiMemberDetail _self;
  final $Res Function(_KpiMemberDetail) _then;

  /// Create a copy of KpiMemberDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? personId = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? role = freezed,
    Object? membershipStatus = freezed,
    Object? sessionsExpected = null,
    Object? sessionsPresent = null,
    Object? attendancePct = freezed,
    Object? valuesCompleted = null,
    Object? improvementAvg = freezed,
    Object? syncedLateSessions = null,
    Object? scores = null,
  }) {
    return _then(
      _KpiMemberDetail(
        personId: null == personId
            ? _self.personId
            : personId // ignore: cast_nullable_to_non_nullable
                  as String,
        firstName: null == firstName
            ? _self.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
        lastName: null == lastName
            ? _self.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String,
        role: freezed == role
            ? _self.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String?,
        membershipStatus: freezed == membershipStatus
            ? _self.membershipStatus
            : membershipStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        sessionsExpected: null == sessionsExpected
            ? _self.sessionsExpected
            : sessionsExpected // ignore: cast_nullable_to_non_nullable
                  as int,
        sessionsPresent: null == sessionsPresent
            ? _self.sessionsPresent
            : sessionsPresent // ignore: cast_nullable_to_non_nullable
                  as int,
        attendancePct: freezed == attendancePct
            ? _self.attendancePct
            : attendancePct // ignore: cast_nullable_to_non_nullable
                  as double?,
        valuesCompleted: null == valuesCompleted
            ? _self.valuesCompleted
            : valuesCompleted // ignore: cast_nullable_to_non_nullable
                  as int,
        improvementAvg: freezed == improvementAvg
            ? _self.improvementAvg
            : improvementAvg // ignore: cast_nullable_to_non_nullable
                  as double?,
        syncedLateSessions: null == syncedLateSessions
            ? _self.syncedLateSessions
            : syncedLateSessions // ignore: cast_nullable_to_non_nullable
                  as int,
        scores: null == scores
            ? _self._scores
            : scores // ignore: cast_nullable_to_non_nullable
                  as List<KpiMemberScore>,
      ),
    );
  }
}
