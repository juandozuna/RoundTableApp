// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LiveSession {
  SessionInfo get session;
  SessionTable get table;
  CurriculumValue get value;
  List<ValueQuestion> get questions;

  /// Facilitator first, then members by name.
  List<SessionParticipant> get participants;
  String get myPersonId;

  /// The session is within its meeting window (or already open), so
  /// answers can be captured.
  bool get isToday;
  CurriculumValue? get followUpValue;
  PreviousCommitment? get previousCommitment;
  MyResponses get myResponses;
  List<SessionActivity> get activity;

  /// Local session-row changes (stage, status) still waiting to upload.
  bool get controlChangesPending;

  /// Spanish messages for captured rows the server refused permanently
  /// (for example, "La sesión ya se cerró").
  List<String> get rejectedMessages;

  /// Create a copy of LiveSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LiveSessionCopyWith<LiveSession> get copyWith =>
      _$LiveSessionCopyWithImpl<LiveSession>(this as LiveSession, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LiveSession &&
            (identical(other.session, session) || other.session == session) &&
            (identical(other.table, table) || other.table == table) &&
            (identical(other.value, value) || other.value == value) &&
            const DeepCollectionEquality().equals(other.questions, questions) &&
            const DeepCollectionEquality().equals(
              other.participants,
              participants,
            ) &&
            (identical(other.myPersonId, myPersonId) ||
                other.myPersonId == myPersonId) &&
            (identical(other.isToday, isToday) || other.isToday == isToday) &&
            (identical(other.followUpValue, followUpValue) ||
                other.followUpValue == followUpValue) &&
            (identical(other.previousCommitment, previousCommitment) ||
                other.previousCommitment == previousCommitment) &&
            (identical(other.myResponses, myResponses) ||
                other.myResponses == myResponses) &&
            const DeepCollectionEquality().equals(other.activity, activity) &&
            (identical(other.controlChangesPending, controlChangesPending) ||
                other.controlChangesPending == controlChangesPending) &&
            const DeepCollectionEquality().equals(
              other.rejectedMessages,
              rejectedMessages,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    session,
    table,
    value,
    const DeepCollectionEquality().hash(questions),
    const DeepCollectionEquality().hash(participants),
    myPersonId,
    isToday,
    followUpValue,
    previousCommitment,
    myResponses,
    const DeepCollectionEquality().hash(activity),
    controlChangesPending,
    const DeepCollectionEquality().hash(rejectedMessages),
  );

  @override
  String toString() {
    return 'LiveSession(session: $session, table: $table, value: $value, questions: $questions, participants: $participants, myPersonId: $myPersonId, isToday: $isToday, followUpValue: $followUpValue, previousCommitment: $previousCommitment, myResponses: $myResponses, activity: $activity, controlChangesPending: $controlChangesPending, rejectedMessages: $rejectedMessages)';
  }
}

/// @nodoc
abstract mixin class $LiveSessionCopyWith<$Res> {
  factory $LiveSessionCopyWith(
    LiveSession value,
    $Res Function(LiveSession) _then,
  ) = _$LiveSessionCopyWithImpl;
  @useResult
  $Res call({
    SessionInfo session,
    SessionTable table,
    CurriculumValue value,
    List<ValueQuestion> questions,
    List<SessionParticipant> participants,
    String myPersonId,
    bool isToday,
    CurriculumValue? followUpValue,
    PreviousCommitment? previousCommitment,
    MyResponses myResponses,
    List<SessionActivity> activity,
    bool controlChangesPending,
    List<String> rejectedMessages,
  });

  $SessionInfoCopyWith<$Res> get session;
  $SessionTableCopyWith<$Res> get table;
  $CurriculumValueCopyWith<$Res> get value;
  $CurriculumValueCopyWith<$Res>? get followUpValue;
  $PreviousCommitmentCopyWith<$Res>? get previousCommitment;
  $MyResponsesCopyWith<$Res> get myResponses;
}

/// @nodoc
class _$LiveSessionCopyWithImpl<$Res> implements $LiveSessionCopyWith<$Res> {
  _$LiveSessionCopyWithImpl(this._self, this._then);

  final LiveSession _self;
  final $Res Function(LiveSession) _then;

  /// Create a copy of LiveSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? session = null,
    Object? table = null,
    Object? value = null,
    Object? questions = null,
    Object? participants = null,
    Object? myPersonId = null,
    Object? isToday = null,
    Object? followUpValue = freezed,
    Object? previousCommitment = freezed,
    Object? myResponses = null,
    Object? activity = null,
    Object? controlChangesPending = null,
    Object? rejectedMessages = null,
  }) {
    return _then(
      _self.copyWith(
        session: null == session
            ? _self.session
            : session // ignore: cast_nullable_to_non_nullable
                  as SessionInfo,
        table: null == table
            ? _self.table
            : table // ignore: cast_nullable_to_non_nullable
                  as SessionTable,
        value: null == value
            ? _self.value
            : value // ignore: cast_nullable_to_non_nullable
                  as CurriculumValue,
        questions: null == questions
            ? _self.questions
            : questions // ignore: cast_nullable_to_non_nullable
                  as List<ValueQuestion>,
        participants: null == participants
            ? _self.participants
            : participants // ignore: cast_nullable_to_non_nullable
                  as List<SessionParticipant>,
        myPersonId: null == myPersonId
            ? _self.myPersonId
            : myPersonId // ignore: cast_nullable_to_non_nullable
                  as String,
        isToday: null == isToday
            ? _self.isToday
            : isToday // ignore: cast_nullable_to_non_nullable
                  as bool,
        followUpValue: freezed == followUpValue
            ? _self.followUpValue
            : followUpValue // ignore: cast_nullable_to_non_nullable
                  as CurriculumValue?,
        previousCommitment: freezed == previousCommitment
            ? _self.previousCommitment
            : previousCommitment // ignore: cast_nullable_to_non_nullable
                  as PreviousCommitment?,
        myResponses: null == myResponses
            ? _self.myResponses
            : myResponses // ignore: cast_nullable_to_non_nullable
                  as MyResponses,
        activity: null == activity
            ? _self.activity
            : activity // ignore: cast_nullable_to_non_nullable
                  as List<SessionActivity>,
        controlChangesPending: null == controlChangesPending
            ? _self.controlChangesPending
            : controlChangesPending // ignore: cast_nullable_to_non_nullable
                  as bool,
        rejectedMessages: null == rejectedMessages
            ? _self.rejectedMessages
            : rejectedMessages // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }

  /// Create a copy of LiveSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionInfoCopyWith<$Res> get session {
    return $SessionInfoCopyWith<$Res>(_self.session, (value) {
      return _then(_self.copyWith(session: value));
    });
  }

  /// Create a copy of LiveSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionTableCopyWith<$Res> get table {
    return $SessionTableCopyWith<$Res>(_self.table, (value) {
      return _then(_self.copyWith(table: value));
    });
  }

  /// Create a copy of LiveSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurriculumValueCopyWith<$Res> get value {
    return $CurriculumValueCopyWith<$Res>(_self.value, (value) {
      return _then(_self.copyWith(value: value));
    });
  }

  /// Create a copy of LiveSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurriculumValueCopyWith<$Res>? get followUpValue {
    if (_self.followUpValue == null) {
      return null;
    }

    return $CurriculumValueCopyWith<$Res>(_self.followUpValue!, (value) {
      return _then(_self.copyWith(followUpValue: value));
    });
  }

  /// Create a copy of LiveSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PreviousCommitmentCopyWith<$Res>? get previousCommitment {
    if (_self.previousCommitment == null) {
      return null;
    }

    return $PreviousCommitmentCopyWith<$Res>(_self.previousCommitment!, (
      value,
    ) {
      return _then(_self.copyWith(previousCommitment: value));
    });
  }

  /// Create a copy of LiveSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MyResponsesCopyWith<$Res> get myResponses {
    return $MyResponsesCopyWith<$Res>(_self.myResponses, (value) {
      return _then(_self.copyWith(myResponses: value));
    });
  }
}

/// Adds pattern-matching-related methods to [LiveSession].
extension LiveSessionPatterns on LiveSession {
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
    TResult Function(_LiveSession value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LiveSession() when $default != null:
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
    TResult Function(_LiveSession value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveSession():
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
    TResult? Function(_LiveSession value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveSession() when $default != null:
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
      SessionInfo session,
      SessionTable table,
      CurriculumValue value,
      List<ValueQuestion> questions,
      List<SessionParticipant> participants,
      String myPersonId,
      bool isToday,
      CurriculumValue? followUpValue,
      PreviousCommitment? previousCommitment,
      MyResponses myResponses,
      List<SessionActivity> activity,
      bool controlChangesPending,
      List<String> rejectedMessages,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LiveSession() when $default != null:
        return $default(
          _that.session,
          _that.table,
          _that.value,
          _that.questions,
          _that.participants,
          _that.myPersonId,
          _that.isToday,
          _that.followUpValue,
          _that.previousCommitment,
          _that.myResponses,
          _that.activity,
          _that.controlChangesPending,
          _that.rejectedMessages,
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
      SessionInfo session,
      SessionTable table,
      CurriculumValue value,
      List<ValueQuestion> questions,
      List<SessionParticipant> participants,
      String myPersonId,
      bool isToday,
      CurriculumValue? followUpValue,
      PreviousCommitment? previousCommitment,
      MyResponses myResponses,
      List<SessionActivity> activity,
      bool controlChangesPending,
      List<String> rejectedMessages,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveSession():
        return $default(
          _that.session,
          _that.table,
          _that.value,
          _that.questions,
          _that.participants,
          _that.myPersonId,
          _that.isToday,
          _that.followUpValue,
          _that.previousCommitment,
          _that.myResponses,
          _that.activity,
          _that.controlChangesPending,
          _that.rejectedMessages,
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
      SessionInfo session,
      SessionTable table,
      CurriculumValue value,
      List<ValueQuestion> questions,
      List<SessionParticipant> participants,
      String myPersonId,
      bool isToday,
      CurriculumValue? followUpValue,
      PreviousCommitment? previousCommitment,
      MyResponses myResponses,
      List<SessionActivity> activity,
      bool controlChangesPending,
      List<String> rejectedMessages,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveSession() when $default != null:
        return $default(
          _that.session,
          _that.table,
          _that.value,
          _that.questions,
          _that.participants,
          _that.myPersonId,
          _that.isToday,
          _that.followUpValue,
          _that.previousCommitment,
          _that.myResponses,
          _that.activity,
          _that.controlChangesPending,
          _that.rejectedMessages,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LiveSession extends LiveSession {
  const _LiveSession({
    required this.session,
    required this.table,
    required this.value,
    required final List<ValueQuestion> questions,
    required final List<SessionParticipant> participants,
    required this.myPersonId,
    required this.isToday,
    this.followUpValue,
    this.previousCommitment,
    this.myResponses = const MyResponses(),
    final List<SessionActivity> activity = const [],
    this.controlChangesPending = false,
    final List<String> rejectedMessages = const [],
  }) : _questions = questions,
       _participants = participants,
       _activity = activity,
       _rejectedMessages = rejectedMessages,
       super._();

  @override
  final SessionInfo session;
  @override
  final SessionTable table;
  @override
  final CurriculumValue value;
  final List<ValueQuestion> _questions;
  @override
  List<ValueQuestion> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  /// Facilitator first, then members by name.
  final List<SessionParticipant> _participants;

  /// Facilitator first, then members by name.
  @override
  List<SessionParticipant> get participants {
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

  @override
  final String myPersonId;

  /// The session is within its meeting window (or already open), so
  /// answers can be captured.
  @override
  final bool isToday;
  @override
  final CurriculumValue? followUpValue;
  @override
  final PreviousCommitment? previousCommitment;
  @override
  @JsonKey()
  final MyResponses myResponses;
  final List<SessionActivity> _activity;
  @override
  @JsonKey()
  List<SessionActivity> get activity {
    if (_activity is EqualUnmodifiableListView) return _activity;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activity);
  }

  /// Local session-row changes (stage, status) still waiting to upload.
  @override
  @JsonKey()
  final bool controlChangesPending;

  /// Spanish messages for captured rows the server refused permanently
  /// (for example, "La sesión ya se cerró").
  final List<String> _rejectedMessages;

  /// Spanish messages for captured rows the server refused permanently
  /// (for example, "La sesión ya se cerró").
  @override
  @JsonKey()
  List<String> get rejectedMessages {
    if (_rejectedMessages is EqualUnmodifiableListView)
      return _rejectedMessages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rejectedMessages);
  }

  /// Create a copy of LiveSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LiveSessionCopyWith<_LiveSession> get copyWith =>
      __$LiveSessionCopyWithImpl<_LiveSession>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LiveSession &&
            (identical(other.session, session) || other.session == session) &&
            (identical(other.table, table) || other.table == table) &&
            (identical(other.value, value) || other.value == value) &&
            const DeepCollectionEquality().equals(
              other._questions,
              _questions,
            ) &&
            const DeepCollectionEquality().equals(
              other._participants,
              _participants,
            ) &&
            (identical(other.myPersonId, myPersonId) ||
                other.myPersonId == myPersonId) &&
            (identical(other.isToday, isToday) || other.isToday == isToday) &&
            (identical(other.followUpValue, followUpValue) ||
                other.followUpValue == followUpValue) &&
            (identical(other.previousCommitment, previousCommitment) ||
                other.previousCommitment == previousCommitment) &&
            (identical(other.myResponses, myResponses) ||
                other.myResponses == myResponses) &&
            const DeepCollectionEquality().equals(other._activity, _activity) &&
            (identical(other.controlChangesPending, controlChangesPending) ||
                other.controlChangesPending == controlChangesPending) &&
            const DeepCollectionEquality().equals(
              other._rejectedMessages,
              _rejectedMessages,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    session,
    table,
    value,
    const DeepCollectionEquality().hash(_questions),
    const DeepCollectionEquality().hash(_participants),
    myPersonId,
    isToday,
    followUpValue,
    previousCommitment,
    myResponses,
    const DeepCollectionEquality().hash(_activity),
    controlChangesPending,
    const DeepCollectionEquality().hash(_rejectedMessages),
  );

  @override
  String toString() {
    return 'LiveSession(session: $session, table: $table, value: $value, questions: $questions, participants: $participants, myPersonId: $myPersonId, isToday: $isToday, followUpValue: $followUpValue, previousCommitment: $previousCommitment, myResponses: $myResponses, activity: $activity, controlChangesPending: $controlChangesPending, rejectedMessages: $rejectedMessages)';
  }
}

/// @nodoc
abstract mixin class _$LiveSessionCopyWith<$Res>
    implements $LiveSessionCopyWith<$Res> {
  factory _$LiveSessionCopyWith(
    _LiveSession value,
    $Res Function(_LiveSession) _then,
  ) = __$LiveSessionCopyWithImpl;
  @override
  @useResult
  $Res call({
    SessionInfo session,
    SessionTable table,
    CurriculumValue value,
    List<ValueQuestion> questions,
    List<SessionParticipant> participants,
    String myPersonId,
    bool isToday,
    CurriculumValue? followUpValue,
    PreviousCommitment? previousCommitment,
    MyResponses myResponses,
    List<SessionActivity> activity,
    bool controlChangesPending,
    List<String> rejectedMessages,
  });

  @override
  $SessionInfoCopyWith<$Res> get session;
  @override
  $SessionTableCopyWith<$Res> get table;
  @override
  $CurriculumValueCopyWith<$Res> get value;
  @override
  $CurriculumValueCopyWith<$Res>? get followUpValue;
  @override
  $PreviousCommitmentCopyWith<$Res>? get previousCommitment;
  @override
  $MyResponsesCopyWith<$Res> get myResponses;
}

/// @nodoc
class __$LiveSessionCopyWithImpl<$Res> implements _$LiveSessionCopyWith<$Res> {
  __$LiveSessionCopyWithImpl(this._self, this._then);

  final _LiveSession _self;
  final $Res Function(_LiveSession) _then;

  /// Create a copy of LiveSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? session = null,
    Object? table = null,
    Object? value = null,
    Object? questions = null,
    Object? participants = null,
    Object? myPersonId = null,
    Object? isToday = null,
    Object? followUpValue = freezed,
    Object? previousCommitment = freezed,
    Object? myResponses = null,
    Object? activity = null,
    Object? controlChangesPending = null,
    Object? rejectedMessages = null,
  }) {
    return _then(
      _LiveSession(
        session: null == session
            ? _self.session
            : session // ignore: cast_nullable_to_non_nullable
                  as SessionInfo,
        table: null == table
            ? _self.table
            : table // ignore: cast_nullable_to_non_nullable
                  as SessionTable,
        value: null == value
            ? _self.value
            : value // ignore: cast_nullable_to_non_nullable
                  as CurriculumValue,
        questions: null == questions
            ? _self._questions
            : questions // ignore: cast_nullable_to_non_nullable
                  as List<ValueQuestion>,
        participants: null == participants
            ? _self._participants
            : participants // ignore: cast_nullable_to_non_nullable
                  as List<SessionParticipant>,
        myPersonId: null == myPersonId
            ? _self.myPersonId
            : myPersonId // ignore: cast_nullable_to_non_nullable
                  as String,
        isToday: null == isToday
            ? _self.isToday
            : isToday // ignore: cast_nullable_to_non_nullable
                  as bool,
        followUpValue: freezed == followUpValue
            ? _self.followUpValue
            : followUpValue // ignore: cast_nullable_to_non_nullable
                  as CurriculumValue?,
        previousCommitment: freezed == previousCommitment
            ? _self.previousCommitment
            : previousCommitment // ignore: cast_nullable_to_non_nullable
                  as PreviousCommitment?,
        myResponses: null == myResponses
            ? _self.myResponses
            : myResponses // ignore: cast_nullable_to_non_nullable
                  as MyResponses,
        activity: null == activity
            ? _self._activity
            : activity // ignore: cast_nullable_to_non_nullable
                  as List<SessionActivity>,
        controlChangesPending: null == controlChangesPending
            ? _self.controlChangesPending
            : controlChangesPending // ignore: cast_nullable_to_non_nullable
                  as bool,
        rejectedMessages: null == rejectedMessages
            ? _self._rejectedMessages
            : rejectedMessages // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }

  /// Create a copy of LiveSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionInfoCopyWith<$Res> get session {
    return $SessionInfoCopyWith<$Res>(_self.session, (value) {
      return _then(_self.copyWith(session: value));
    });
  }

  /// Create a copy of LiveSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionTableCopyWith<$Res> get table {
    return $SessionTableCopyWith<$Res>(_self.table, (value) {
      return _then(_self.copyWith(table: value));
    });
  }

  /// Create a copy of LiveSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurriculumValueCopyWith<$Res> get value {
    return $CurriculumValueCopyWith<$Res>(_self.value, (value) {
      return _then(_self.copyWith(value: value));
    });
  }

  /// Create a copy of LiveSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurriculumValueCopyWith<$Res>? get followUpValue {
    if (_self.followUpValue == null) {
      return null;
    }

    return $CurriculumValueCopyWith<$Res>(_self.followUpValue!, (value) {
      return _then(_self.copyWith(followUpValue: value));
    });
  }

  /// Create a copy of LiveSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PreviousCommitmentCopyWith<$Res>? get previousCommitment {
    if (_self.previousCommitment == null) {
      return null;
    }

    return $PreviousCommitmentCopyWith<$Res>(_self.previousCommitment!, (
      value,
    ) {
      return _then(_self.copyWith(previousCommitment: value));
    });
  }

  /// Create a copy of LiveSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MyResponsesCopyWith<$Res> get myResponses {
    return $MyResponsesCopyWith<$Res>(_self.myResponses, (value) {
      return _then(_self.copyWith(myResponses: value));
    });
  }
}
