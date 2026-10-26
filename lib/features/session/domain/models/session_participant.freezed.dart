// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_participant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionParticipant {
  String get personId;
  String get firstName;
  String get lastName;
  bool get isFacilitator;
  bool get isMe;

  /// Whether the person has a commitment from the previous session to
  /// review. False for a first session or an absence last week.
  bool get hasPreviousCommitment;
  AttendanceStatus? get attendance;

  /// The server flipped the attendance because the person submitted
  /// answers (ADR 0005).
  bool get attendanceAuto;
  bool get attendanceSyncedLate;
  StepProgress get followUp;
  StepProgress get reflection;
  StepProgress get commitment;

  /// Create a copy of SessionParticipant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SessionParticipantCopyWith<SessionParticipant> get copyWith =>
      _$SessionParticipantCopyWithImpl<SessionParticipant>(
        this as SessionParticipant,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SessionParticipant &&
            (identical(other.personId, personId) ||
                other.personId == personId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.isFacilitator, isFacilitator) ||
                other.isFacilitator == isFacilitator) &&
            (identical(other.isMe, isMe) || other.isMe == isMe) &&
            (identical(other.hasPreviousCommitment, hasPreviousCommitment) ||
                other.hasPreviousCommitment == hasPreviousCommitment) &&
            (identical(other.attendance, attendance) ||
                other.attendance == attendance) &&
            (identical(other.attendanceAuto, attendanceAuto) ||
                other.attendanceAuto == attendanceAuto) &&
            (identical(other.attendanceSyncedLate, attendanceSyncedLate) ||
                other.attendanceSyncedLate == attendanceSyncedLate) &&
            (identical(other.followUp, followUp) ||
                other.followUp == followUp) &&
            (identical(other.reflection, reflection) ||
                other.reflection == reflection) &&
            (identical(other.commitment, commitment) ||
                other.commitment == commitment));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    personId,
    firstName,
    lastName,
    isFacilitator,
    isMe,
    hasPreviousCommitment,
    attendance,
    attendanceAuto,
    attendanceSyncedLate,
    followUp,
    reflection,
    commitment,
  );

  @override
  String toString() {
    return 'SessionParticipant(personId: $personId, firstName: $firstName, lastName: $lastName, isFacilitator: $isFacilitator, isMe: $isMe, hasPreviousCommitment: $hasPreviousCommitment, attendance: $attendance, attendanceAuto: $attendanceAuto, attendanceSyncedLate: $attendanceSyncedLate, followUp: $followUp, reflection: $reflection, commitment: $commitment)';
  }
}

/// @nodoc
abstract mixin class $SessionParticipantCopyWith<$Res> {
  factory $SessionParticipantCopyWith(
    SessionParticipant value,
    $Res Function(SessionParticipant) _then,
  ) = _$SessionParticipantCopyWithImpl;
  @useResult
  $Res call({
    String personId,
    String firstName,
    String lastName,
    bool isFacilitator,
    bool isMe,
    bool hasPreviousCommitment,
    AttendanceStatus? attendance,
    bool attendanceAuto,
    bool attendanceSyncedLate,
    StepProgress followUp,
    StepProgress reflection,
    StepProgress commitment,
  });

  $StepProgressCopyWith<$Res> get followUp;
  $StepProgressCopyWith<$Res> get reflection;
  $StepProgressCopyWith<$Res> get commitment;
}

/// @nodoc
class _$SessionParticipantCopyWithImpl<$Res>
    implements $SessionParticipantCopyWith<$Res> {
  _$SessionParticipantCopyWithImpl(this._self, this._then);

  final SessionParticipant _self;
  final $Res Function(SessionParticipant) _then;

  /// Create a copy of SessionParticipant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? personId = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? isFacilitator = null,
    Object? isMe = null,
    Object? hasPreviousCommitment = null,
    Object? attendance = freezed,
    Object? attendanceAuto = null,
    Object? attendanceSyncedLate = null,
    Object? followUp = null,
    Object? reflection = null,
    Object? commitment = null,
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
        isFacilitator: null == isFacilitator
            ? _self.isFacilitator
            : isFacilitator // ignore: cast_nullable_to_non_nullable
                  as bool,
        isMe: null == isMe
            ? _self.isMe
            : isMe // ignore: cast_nullable_to_non_nullable
                  as bool,
        hasPreviousCommitment: null == hasPreviousCommitment
            ? _self.hasPreviousCommitment
            : hasPreviousCommitment // ignore: cast_nullable_to_non_nullable
                  as bool,
        attendance: freezed == attendance
            ? _self.attendance
            : attendance // ignore: cast_nullable_to_non_nullable
                  as AttendanceStatus?,
        attendanceAuto: null == attendanceAuto
            ? _self.attendanceAuto
            : attendanceAuto // ignore: cast_nullable_to_non_nullable
                  as bool,
        attendanceSyncedLate: null == attendanceSyncedLate
            ? _self.attendanceSyncedLate
            : attendanceSyncedLate // ignore: cast_nullable_to_non_nullable
                  as bool,
        followUp: null == followUp
            ? _self.followUp
            : followUp // ignore: cast_nullable_to_non_nullable
                  as StepProgress,
        reflection: null == reflection
            ? _self.reflection
            : reflection // ignore: cast_nullable_to_non_nullable
                  as StepProgress,
        commitment: null == commitment
            ? _self.commitment
            : commitment // ignore: cast_nullable_to_non_nullable
                  as StepProgress,
      ),
    );
  }

  /// Create a copy of SessionParticipant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StepProgressCopyWith<$Res> get followUp {
    return $StepProgressCopyWith<$Res>(_self.followUp, (value) {
      return _then(_self.copyWith(followUp: value));
    });
  }

  /// Create a copy of SessionParticipant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StepProgressCopyWith<$Res> get reflection {
    return $StepProgressCopyWith<$Res>(_self.reflection, (value) {
      return _then(_self.copyWith(reflection: value));
    });
  }

  /// Create a copy of SessionParticipant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StepProgressCopyWith<$Res> get commitment {
    return $StepProgressCopyWith<$Res>(_self.commitment, (value) {
      return _then(_self.copyWith(commitment: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SessionParticipant].
extension SessionParticipantPatterns on SessionParticipant {
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
    TResult Function(_SessionParticipant value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SessionParticipant() when $default != null:
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
    TResult Function(_SessionParticipant value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionParticipant():
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
    TResult? Function(_SessionParticipant value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionParticipant() when $default != null:
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
      bool isFacilitator,
      bool isMe,
      bool hasPreviousCommitment,
      AttendanceStatus? attendance,
      bool attendanceAuto,
      bool attendanceSyncedLate,
      StepProgress followUp,
      StepProgress reflection,
      StepProgress commitment,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SessionParticipant() when $default != null:
        return $default(
          _that.personId,
          _that.firstName,
          _that.lastName,
          _that.isFacilitator,
          _that.isMe,
          _that.hasPreviousCommitment,
          _that.attendance,
          _that.attendanceAuto,
          _that.attendanceSyncedLate,
          _that.followUp,
          _that.reflection,
          _that.commitment,
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
      bool isFacilitator,
      bool isMe,
      bool hasPreviousCommitment,
      AttendanceStatus? attendance,
      bool attendanceAuto,
      bool attendanceSyncedLate,
      StepProgress followUp,
      StepProgress reflection,
      StepProgress commitment,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionParticipant():
        return $default(
          _that.personId,
          _that.firstName,
          _that.lastName,
          _that.isFacilitator,
          _that.isMe,
          _that.hasPreviousCommitment,
          _that.attendance,
          _that.attendanceAuto,
          _that.attendanceSyncedLate,
          _that.followUp,
          _that.reflection,
          _that.commitment,
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
      bool isFacilitator,
      bool isMe,
      bool hasPreviousCommitment,
      AttendanceStatus? attendance,
      bool attendanceAuto,
      bool attendanceSyncedLate,
      StepProgress followUp,
      StepProgress reflection,
      StepProgress commitment,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionParticipant() when $default != null:
        return $default(
          _that.personId,
          _that.firstName,
          _that.lastName,
          _that.isFacilitator,
          _that.isMe,
          _that.hasPreviousCommitment,
          _that.attendance,
          _that.attendanceAuto,
          _that.attendanceSyncedLate,
          _that.followUp,
          _that.reflection,
          _that.commitment,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SessionParticipant extends SessionParticipant {
  const _SessionParticipant({
    required this.personId,
    required this.firstName,
    required this.lastName,
    required this.isFacilitator,
    required this.isMe,
    required this.hasPreviousCommitment,
    this.attendance,
    this.attendanceAuto = false,
    this.attendanceSyncedLate = false,
    this.followUp = StepProgress.none,
    this.reflection = StepProgress.none,
    this.commitment = StepProgress.none,
  }) : super._();

  @override
  final String personId;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final bool isFacilitator;
  @override
  final bool isMe;

  /// Whether the person has a commitment from the previous session to
  /// review. False for a first session or an absence last week.
  @override
  final bool hasPreviousCommitment;
  @override
  final AttendanceStatus? attendance;

  /// The server flipped the attendance because the person submitted
  /// answers (ADR 0005).
  @override
  @JsonKey()
  final bool attendanceAuto;
  @override
  @JsonKey()
  final bool attendanceSyncedLate;
  @override
  @JsonKey()
  final StepProgress followUp;
  @override
  @JsonKey()
  final StepProgress reflection;
  @override
  @JsonKey()
  final StepProgress commitment;

  /// Create a copy of SessionParticipant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SessionParticipantCopyWith<_SessionParticipant> get copyWith =>
      __$SessionParticipantCopyWithImpl<_SessionParticipant>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SessionParticipant &&
            (identical(other.personId, personId) ||
                other.personId == personId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.isFacilitator, isFacilitator) ||
                other.isFacilitator == isFacilitator) &&
            (identical(other.isMe, isMe) || other.isMe == isMe) &&
            (identical(other.hasPreviousCommitment, hasPreviousCommitment) ||
                other.hasPreviousCommitment == hasPreviousCommitment) &&
            (identical(other.attendance, attendance) ||
                other.attendance == attendance) &&
            (identical(other.attendanceAuto, attendanceAuto) ||
                other.attendanceAuto == attendanceAuto) &&
            (identical(other.attendanceSyncedLate, attendanceSyncedLate) ||
                other.attendanceSyncedLate == attendanceSyncedLate) &&
            (identical(other.followUp, followUp) ||
                other.followUp == followUp) &&
            (identical(other.reflection, reflection) ||
                other.reflection == reflection) &&
            (identical(other.commitment, commitment) ||
                other.commitment == commitment));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    personId,
    firstName,
    lastName,
    isFacilitator,
    isMe,
    hasPreviousCommitment,
    attendance,
    attendanceAuto,
    attendanceSyncedLate,
    followUp,
    reflection,
    commitment,
  );

  @override
  String toString() {
    return 'SessionParticipant(personId: $personId, firstName: $firstName, lastName: $lastName, isFacilitator: $isFacilitator, isMe: $isMe, hasPreviousCommitment: $hasPreviousCommitment, attendance: $attendance, attendanceAuto: $attendanceAuto, attendanceSyncedLate: $attendanceSyncedLate, followUp: $followUp, reflection: $reflection, commitment: $commitment)';
  }
}

/// @nodoc
abstract mixin class _$SessionParticipantCopyWith<$Res>
    implements $SessionParticipantCopyWith<$Res> {
  factory _$SessionParticipantCopyWith(
    _SessionParticipant value,
    $Res Function(_SessionParticipant) _then,
  ) = __$SessionParticipantCopyWithImpl;
  @override
  @useResult
  $Res call({
    String personId,
    String firstName,
    String lastName,
    bool isFacilitator,
    bool isMe,
    bool hasPreviousCommitment,
    AttendanceStatus? attendance,
    bool attendanceAuto,
    bool attendanceSyncedLate,
    StepProgress followUp,
    StepProgress reflection,
    StepProgress commitment,
  });

  @override
  $StepProgressCopyWith<$Res> get followUp;
  @override
  $StepProgressCopyWith<$Res> get reflection;
  @override
  $StepProgressCopyWith<$Res> get commitment;
}

/// @nodoc
class __$SessionParticipantCopyWithImpl<$Res>
    implements _$SessionParticipantCopyWith<$Res> {
  __$SessionParticipantCopyWithImpl(this._self, this._then);

  final _SessionParticipant _self;
  final $Res Function(_SessionParticipant) _then;

  /// Create a copy of SessionParticipant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? personId = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? isFacilitator = null,
    Object? isMe = null,
    Object? hasPreviousCommitment = null,
    Object? attendance = freezed,
    Object? attendanceAuto = null,
    Object? attendanceSyncedLate = null,
    Object? followUp = null,
    Object? reflection = null,
    Object? commitment = null,
  }) {
    return _then(
      _SessionParticipant(
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
        isFacilitator: null == isFacilitator
            ? _self.isFacilitator
            : isFacilitator // ignore: cast_nullable_to_non_nullable
                  as bool,
        isMe: null == isMe
            ? _self.isMe
            : isMe // ignore: cast_nullable_to_non_nullable
                  as bool,
        hasPreviousCommitment: null == hasPreviousCommitment
            ? _self.hasPreviousCommitment
            : hasPreviousCommitment // ignore: cast_nullable_to_non_nullable
                  as bool,
        attendance: freezed == attendance
            ? _self.attendance
            : attendance // ignore: cast_nullable_to_non_nullable
                  as AttendanceStatus?,
        attendanceAuto: null == attendanceAuto
            ? _self.attendanceAuto
            : attendanceAuto // ignore: cast_nullable_to_non_nullable
                  as bool,
        attendanceSyncedLate: null == attendanceSyncedLate
            ? _self.attendanceSyncedLate
            : attendanceSyncedLate // ignore: cast_nullable_to_non_nullable
                  as bool,
        followUp: null == followUp
            ? _self.followUp
            : followUp // ignore: cast_nullable_to_non_nullable
                  as StepProgress,
        reflection: null == reflection
            ? _self.reflection
            : reflection // ignore: cast_nullable_to_non_nullable
                  as StepProgress,
        commitment: null == commitment
            ? _self.commitment
            : commitment // ignore: cast_nullable_to_non_nullable
                  as StepProgress,
      ),
    );
  }

  /// Create a copy of SessionParticipant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StepProgressCopyWith<$Res> get followUp {
    return $StepProgressCopyWith<$Res>(_self.followUp, (value) {
      return _then(_self.copyWith(followUp: value));
    });
  }

  /// Create a copy of SessionParticipant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StepProgressCopyWith<$Res> get reflection {
    return $StepProgressCopyWith<$Res>(_self.reflection, (value) {
      return _then(_self.copyWith(reflection: value));
    });
  }

  /// Create a copy of SessionParticipant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StepProgressCopyWith<$Res> get commitment {
    return $StepProgressCopyWith<$Res>(_self.commitment, (value) {
      return _then(_self.copyWith(commitment: value));
    });
  }
}
