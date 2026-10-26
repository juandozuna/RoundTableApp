// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TableSessionEntry {
  String get personId;
  String get name;
  AttendanceStatus? get attendance;
  int? get initialScore;
  int? get followUpScore;
  String? get commitmentText;
  bool get syncedLate;

  /// Create a copy of TableSessionEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TableSessionEntryCopyWith<TableSessionEntry> get copyWith =>
      _$TableSessionEntryCopyWithImpl<TableSessionEntry>(
        this as TableSessionEntry,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TableSessionEntry &&
            (identical(other.personId, personId) ||
                other.personId == personId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.attendance, attendance) ||
                other.attendance == attendance) &&
            (identical(other.initialScore, initialScore) ||
                other.initialScore == initialScore) &&
            (identical(other.followUpScore, followUpScore) ||
                other.followUpScore == followUpScore) &&
            (identical(other.commitmentText, commitmentText) ||
                other.commitmentText == commitmentText) &&
            (identical(other.syncedLate, syncedLate) ||
                other.syncedLate == syncedLate));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    personId,
    name,
    attendance,
    initialScore,
    followUpScore,
    commitmentText,
    syncedLate,
  );

  @override
  String toString() {
    return 'TableSessionEntry(personId: $personId, name: $name, attendance: $attendance, initialScore: $initialScore, followUpScore: $followUpScore, commitmentText: $commitmentText, syncedLate: $syncedLate)';
  }
}

/// @nodoc
abstract mixin class $TableSessionEntryCopyWith<$Res> {
  factory $TableSessionEntryCopyWith(
    TableSessionEntry value,
    $Res Function(TableSessionEntry) _then,
  ) = _$TableSessionEntryCopyWithImpl;
  @useResult
  $Res call({
    String personId,
    String name,
    AttendanceStatus? attendance,
    int? initialScore,
    int? followUpScore,
    String? commitmentText,
    bool syncedLate,
  });
}

/// @nodoc
class _$TableSessionEntryCopyWithImpl<$Res>
    implements $TableSessionEntryCopyWith<$Res> {
  _$TableSessionEntryCopyWithImpl(this._self, this._then);

  final TableSessionEntry _self;
  final $Res Function(TableSessionEntry) _then;

  /// Create a copy of TableSessionEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? personId = null,
    Object? name = null,
    Object? attendance = freezed,
    Object? initialScore = freezed,
    Object? followUpScore = freezed,
    Object? commitmentText = freezed,
    Object? syncedLate = null,
  }) {
    return _then(
      _self.copyWith(
        personId: null == personId
            ? _self.personId
            : personId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        attendance: freezed == attendance
            ? _self.attendance
            : attendance // ignore: cast_nullable_to_non_nullable
                  as AttendanceStatus?,
        initialScore: freezed == initialScore
            ? _self.initialScore
            : initialScore // ignore: cast_nullable_to_non_nullable
                  as int?,
        followUpScore: freezed == followUpScore
            ? _self.followUpScore
            : followUpScore // ignore: cast_nullable_to_non_nullable
                  as int?,
        commitmentText: freezed == commitmentText
            ? _self.commitmentText
            : commitmentText // ignore: cast_nullable_to_non_nullable
                  as String?,
        syncedLate: null == syncedLate
            ? _self.syncedLate
            : syncedLate // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [TableSessionEntry].
extension TableSessionEntryPatterns on TableSessionEntry {
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
    TResult Function(_TableSessionEntry value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TableSessionEntry() when $default != null:
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
    TResult Function(_TableSessionEntry value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableSessionEntry():
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
    TResult? Function(_TableSessionEntry value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableSessionEntry() when $default != null:
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
      String name,
      AttendanceStatus? attendance,
      int? initialScore,
      int? followUpScore,
      String? commitmentText,
      bool syncedLate,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TableSessionEntry() when $default != null:
        return $default(
          _that.personId,
          _that.name,
          _that.attendance,
          _that.initialScore,
          _that.followUpScore,
          _that.commitmentText,
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
      String personId,
      String name,
      AttendanceStatus? attendance,
      int? initialScore,
      int? followUpScore,
      String? commitmentText,
      bool syncedLate,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableSessionEntry():
        return $default(
          _that.personId,
          _that.name,
          _that.attendance,
          _that.initialScore,
          _that.followUpScore,
          _that.commitmentText,
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
      String personId,
      String name,
      AttendanceStatus? attendance,
      int? initialScore,
      int? followUpScore,
      String? commitmentText,
      bool syncedLate,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableSessionEntry() when $default != null:
        return $default(
          _that.personId,
          _that.name,
          _that.attendance,
          _that.initialScore,
          _that.followUpScore,
          _that.commitmentText,
          _that.syncedLate,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TableSessionEntry implements TableSessionEntry {
  const _TableSessionEntry({
    required this.personId,
    required this.name,
    this.attendance,
    this.initialScore,
    this.followUpScore,
    this.commitmentText,
    this.syncedLate = false,
  });

  @override
  final String personId;
  @override
  final String name;
  @override
  final AttendanceStatus? attendance;
  @override
  final int? initialScore;
  @override
  final int? followUpScore;
  @override
  final String? commitmentText;
  @override
  @JsonKey()
  final bool syncedLate;

  /// Create a copy of TableSessionEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TableSessionEntryCopyWith<_TableSessionEntry> get copyWith =>
      __$TableSessionEntryCopyWithImpl<_TableSessionEntry>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TableSessionEntry &&
            (identical(other.personId, personId) ||
                other.personId == personId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.attendance, attendance) ||
                other.attendance == attendance) &&
            (identical(other.initialScore, initialScore) ||
                other.initialScore == initialScore) &&
            (identical(other.followUpScore, followUpScore) ||
                other.followUpScore == followUpScore) &&
            (identical(other.commitmentText, commitmentText) ||
                other.commitmentText == commitmentText) &&
            (identical(other.syncedLate, syncedLate) ||
                other.syncedLate == syncedLate));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    personId,
    name,
    attendance,
    initialScore,
    followUpScore,
    commitmentText,
    syncedLate,
  );

  @override
  String toString() {
    return 'TableSessionEntry(personId: $personId, name: $name, attendance: $attendance, initialScore: $initialScore, followUpScore: $followUpScore, commitmentText: $commitmentText, syncedLate: $syncedLate)';
  }
}

/// @nodoc
abstract mixin class _$TableSessionEntryCopyWith<$Res>
    implements $TableSessionEntryCopyWith<$Res> {
  factory _$TableSessionEntryCopyWith(
    _TableSessionEntry value,
    $Res Function(_TableSessionEntry) _then,
  ) = __$TableSessionEntryCopyWithImpl;
  @override
  @useResult
  $Res call({
    String personId,
    String name,
    AttendanceStatus? attendance,
    int? initialScore,
    int? followUpScore,
    String? commitmentText,
    bool syncedLate,
  });
}

/// @nodoc
class __$TableSessionEntryCopyWithImpl<$Res>
    implements _$TableSessionEntryCopyWith<$Res> {
  __$TableSessionEntryCopyWithImpl(this._self, this._then);

  final _TableSessionEntry _self;
  final $Res Function(_TableSessionEntry) _then;

  /// Create a copy of TableSessionEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? personId = null,
    Object? name = null,
    Object? attendance = freezed,
    Object? initialScore = freezed,
    Object? followUpScore = freezed,
    Object? commitmentText = freezed,
    Object? syncedLate = null,
  }) {
    return _then(
      _TableSessionEntry(
        personId: null == personId
            ? _self.personId
            : personId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        attendance: freezed == attendance
            ? _self.attendance
            : attendance // ignore: cast_nullable_to_non_nullable
                  as AttendanceStatus?,
        initialScore: freezed == initialScore
            ? _self.initialScore
            : initialScore // ignore: cast_nullable_to_non_nullable
                  as int?,
        followUpScore: freezed == followUpScore
            ? _self.followUpScore
            : followUpScore // ignore: cast_nullable_to_non_nullable
                  as int?,
        commitmentText: freezed == commitmentText
            ? _self.commitmentText
            : commitmentText // ignore: cast_nullable_to_non_nullable
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
mixin _$TableSessionSummary {
  String get sessionId;
  DateTime get scheduledAt;
  bool get isOpen;
  int? get valueSequence;
  String? get valueName;
  List<TableSessionEntry> get entries;

  /// Create a copy of TableSessionSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TableSessionSummaryCopyWith<TableSessionSummary> get copyWith =>
      _$TableSessionSummaryCopyWithImpl<TableSessionSummary>(
        this as TableSessionSummary,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TableSessionSummary &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen) &&
            (identical(other.valueSequence, valueSequence) ||
                other.valueSequence == valueSequence) &&
            (identical(other.valueName, valueName) ||
                other.valueName == valueName) &&
            const DeepCollectionEquality().equals(other.entries, entries));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    sessionId,
    scheduledAt,
    isOpen,
    valueSequence,
    valueName,
    const DeepCollectionEquality().hash(entries),
  );

  @override
  String toString() {
    return 'TableSessionSummary(sessionId: $sessionId, scheduledAt: $scheduledAt, isOpen: $isOpen, valueSequence: $valueSequence, valueName: $valueName, entries: $entries)';
  }
}

/// @nodoc
abstract mixin class $TableSessionSummaryCopyWith<$Res> {
  factory $TableSessionSummaryCopyWith(
    TableSessionSummary value,
    $Res Function(TableSessionSummary) _then,
  ) = _$TableSessionSummaryCopyWithImpl;
  @useResult
  $Res call({
    String sessionId,
    DateTime scheduledAt,
    bool isOpen,
    int? valueSequence,
    String? valueName,
    List<TableSessionEntry> entries,
  });
}

/// @nodoc
class _$TableSessionSummaryCopyWithImpl<$Res>
    implements $TableSessionSummaryCopyWith<$Res> {
  _$TableSessionSummaryCopyWithImpl(this._self, this._then);

  final TableSessionSummary _self;
  final $Res Function(TableSessionSummary) _then;

  /// Create a copy of TableSessionSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? scheduledAt = null,
    Object? isOpen = null,
    Object? valueSequence = freezed,
    Object? valueName = freezed,
    Object? entries = null,
  }) {
    return _then(
      _self.copyWith(
        sessionId: null == sessionId
            ? _self.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String,
        scheduledAt: null == scheduledAt
            ? _self.scheduledAt
            : scheduledAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        isOpen: null == isOpen
            ? _self.isOpen
            : isOpen // ignore: cast_nullable_to_non_nullable
                  as bool,
        valueSequence: freezed == valueSequence
            ? _self.valueSequence
            : valueSequence // ignore: cast_nullable_to_non_nullable
                  as int?,
        valueName: freezed == valueName
            ? _self.valueName
            : valueName // ignore: cast_nullable_to_non_nullable
                  as String?,
        entries: null == entries
            ? _self.entries
            : entries // ignore: cast_nullable_to_non_nullable
                  as List<TableSessionEntry>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [TableSessionSummary].
extension TableSessionSummaryPatterns on TableSessionSummary {
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
    TResult Function(_TableSessionSummary value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TableSessionSummary() when $default != null:
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
    TResult Function(_TableSessionSummary value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableSessionSummary():
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
    TResult? Function(_TableSessionSummary value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableSessionSummary() when $default != null:
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
      DateTime scheduledAt,
      bool isOpen,
      int? valueSequence,
      String? valueName,
      List<TableSessionEntry> entries,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TableSessionSummary() when $default != null:
        return $default(
          _that.sessionId,
          _that.scheduledAt,
          _that.isOpen,
          _that.valueSequence,
          _that.valueName,
          _that.entries,
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
      DateTime scheduledAt,
      bool isOpen,
      int? valueSequence,
      String? valueName,
      List<TableSessionEntry> entries,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableSessionSummary():
        return $default(
          _that.sessionId,
          _that.scheduledAt,
          _that.isOpen,
          _that.valueSequence,
          _that.valueName,
          _that.entries,
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
      DateTime scheduledAt,
      bool isOpen,
      int? valueSequence,
      String? valueName,
      List<TableSessionEntry> entries,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableSessionSummary() when $default != null:
        return $default(
          _that.sessionId,
          _that.scheduledAt,
          _that.isOpen,
          _that.valueSequence,
          _that.valueName,
          _that.entries,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TableSessionSummary extends TableSessionSummary {
  const _TableSessionSummary({
    required this.sessionId,
    required this.scheduledAt,
    required this.isOpen,
    this.valueSequence,
    this.valueName,
    final List<TableSessionEntry> entries = const [],
  }) : _entries = entries,
       super._();

  @override
  final String sessionId;
  @override
  final DateTime scheduledAt;
  @override
  final bool isOpen;
  @override
  final int? valueSequence;
  @override
  final String? valueName;
  final List<TableSessionEntry> _entries;
  @override
  @JsonKey()
  List<TableSessionEntry> get entries {
    if (_entries is EqualUnmodifiableListView) return _entries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entries);
  }

  /// Create a copy of TableSessionSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TableSessionSummaryCopyWith<_TableSessionSummary> get copyWith =>
      __$TableSessionSummaryCopyWithImpl<_TableSessionSummary>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TableSessionSummary &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen) &&
            (identical(other.valueSequence, valueSequence) ||
                other.valueSequence == valueSequence) &&
            (identical(other.valueName, valueName) ||
                other.valueName == valueName) &&
            const DeepCollectionEquality().equals(other._entries, _entries));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    sessionId,
    scheduledAt,
    isOpen,
    valueSequence,
    valueName,
    const DeepCollectionEquality().hash(_entries),
  );

  @override
  String toString() {
    return 'TableSessionSummary(sessionId: $sessionId, scheduledAt: $scheduledAt, isOpen: $isOpen, valueSequence: $valueSequence, valueName: $valueName, entries: $entries)';
  }
}

/// @nodoc
abstract mixin class _$TableSessionSummaryCopyWith<$Res>
    implements $TableSessionSummaryCopyWith<$Res> {
  factory _$TableSessionSummaryCopyWith(
    _TableSessionSummary value,
    $Res Function(_TableSessionSummary) _then,
  ) = __$TableSessionSummaryCopyWithImpl;
  @override
  @useResult
  $Res call({
    String sessionId,
    DateTime scheduledAt,
    bool isOpen,
    int? valueSequence,
    String? valueName,
    List<TableSessionEntry> entries,
  });
}

/// @nodoc
class __$TableSessionSummaryCopyWithImpl<$Res>
    implements _$TableSessionSummaryCopyWith<$Res> {
  __$TableSessionSummaryCopyWithImpl(this._self, this._then);

  final _TableSessionSummary _self;
  final $Res Function(_TableSessionSummary) _then;

  /// Create a copy of TableSessionSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sessionId = null,
    Object? scheduledAt = null,
    Object? isOpen = null,
    Object? valueSequence = freezed,
    Object? valueName = freezed,
    Object? entries = null,
  }) {
    return _then(
      _TableSessionSummary(
        sessionId: null == sessionId
            ? _self.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String,
        scheduledAt: null == scheduledAt
            ? _self.scheduledAt
            : scheduledAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        isOpen: null == isOpen
            ? _self.isOpen
            : isOpen // ignore: cast_nullable_to_non_nullable
                  as bool,
        valueSequence: freezed == valueSequence
            ? _self.valueSequence
            : valueSequence // ignore: cast_nullable_to_non_nullable
                  as int?,
        valueName: freezed == valueName
            ? _self.valueName
            : valueName // ignore: cast_nullable_to_non_nullable
                  as String?,
        entries: null == entries
            ? _self._entries
            : entries // ignore: cast_nullable_to_non_nullable
                  as List<TableSessionEntry>,
      ),
    );
  }
}

/// @nodoc
mixin _$TableValueSummary {
  String get valueId;
  int get sequence;
  String get name;
  double? get averageInitial;
  double? get averageFollowUp;

  /// Mean of follow-up minus initial over the people who gave both.
  double? get averageImprovement;
  int get initialCount;
  int get followUpCount;

  /// Create a copy of TableValueSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TableValueSummaryCopyWith<TableValueSummary> get copyWith =>
      _$TableValueSummaryCopyWithImpl<TableValueSummary>(
        this as TableValueSummary,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TableValueSummary &&
            (identical(other.valueId, valueId) || other.valueId == valueId) &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.averageInitial, averageInitial) ||
                other.averageInitial == averageInitial) &&
            (identical(other.averageFollowUp, averageFollowUp) ||
                other.averageFollowUp == averageFollowUp) &&
            (identical(other.averageImprovement, averageImprovement) ||
                other.averageImprovement == averageImprovement) &&
            (identical(other.initialCount, initialCount) ||
                other.initialCount == initialCount) &&
            (identical(other.followUpCount, followUpCount) ||
                other.followUpCount == followUpCount));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    valueId,
    sequence,
    name,
    averageInitial,
    averageFollowUp,
    averageImprovement,
    initialCount,
    followUpCount,
  );

  @override
  String toString() {
    return 'TableValueSummary(valueId: $valueId, sequence: $sequence, name: $name, averageInitial: $averageInitial, averageFollowUp: $averageFollowUp, averageImprovement: $averageImprovement, initialCount: $initialCount, followUpCount: $followUpCount)';
  }
}

/// @nodoc
abstract mixin class $TableValueSummaryCopyWith<$Res> {
  factory $TableValueSummaryCopyWith(
    TableValueSummary value,
    $Res Function(TableValueSummary) _then,
  ) = _$TableValueSummaryCopyWithImpl;
  @useResult
  $Res call({
    String valueId,
    int sequence,
    String name,
    double? averageInitial,
    double? averageFollowUp,
    double? averageImprovement,
    int initialCount,
    int followUpCount,
  });
}

/// @nodoc
class _$TableValueSummaryCopyWithImpl<$Res>
    implements $TableValueSummaryCopyWith<$Res> {
  _$TableValueSummaryCopyWithImpl(this._self, this._then);

  final TableValueSummary _self;
  final $Res Function(TableValueSummary) _then;

  /// Create a copy of TableValueSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? valueId = null,
    Object? sequence = null,
    Object? name = null,
    Object? averageInitial = freezed,
    Object? averageFollowUp = freezed,
    Object? averageImprovement = freezed,
    Object? initialCount = null,
    Object? followUpCount = null,
  }) {
    return _then(
      _self.copyWith(
        valueId: null == valueId
            ? _self.valueId
            : valueId // ignore: cast_nullable_to_non_nullable
                  as String,
        sequence: null == sequence
            ? _self.sequence
            : sequence // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        averageInitial: freezed == averageInitial
            ? _self.averageInitial
            : averageInitial // ignore: cast_nullable_to_non_nullable
                  as double?,
        averageFollowUp: freezed == averageFollowUp
            ? _self.averageFollowUp
            : averageFollowUp // ignore: cast_nullable_to_non_nullable
                  as double?,
        averageImprovement: freezed == averageImprovement
            ? _self.averageImprovement
            : averageImprovement // ignore: cast_nullable_to_non_nullable
                  as double?,
        initialCount: null == initialCount
            ? _self.initialCount
            : initialCount // ignore: cast_nullable_to_non_nullable
                  as int,
        followUpCount: null == followUpCount
            ? _self.followUpCount
            : followUpCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [TableValueSummary].
extension TableValueSummaryPatterns on TableValueSummary {
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
    TResult Function(_TableValueSummary value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TableValueSummary() when $default != null:
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
    TResult Function(_TableValueSummary value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableValueSummary():
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
    TResult? Function(_TableValueSummary value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableValueSummary() when $default != null:
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
      int sequence,
      String name,
      double? averageInitial,
      double? averageFollowUp,
      double? averageImprovement,
      int initialCount,
      int followUpCount,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TableValueSummary() when $default != null:
        return $default(
          _that.valueId,
          _that.sequence,
          _that.name,
          _that.averageInitial,
          _that.averageFollowUp,
          _that.averageImprovement,
          _that.initialCount,
          _that.followUpCount,
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
      int sequence,
      String name,
      double? averageInitial,
      double? averageFollowUp,
      double? averageImprovement,
      int initialCount,
      int followUpCount,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableValueSummary():
        return $default(
          _that.valueId,
          _that.sequence,
          _that.name,
          _that.averageInitial,
          _that.averageFollowUp,
          _that.averageImprovement,
          _that.initialCount,
          _that.followUpCount,
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
      int sequence,
      String name,
      double? averageInitial,
      double? averageFollowUp,
      double? averageImprovement,
      int initialCount,
      int followUpCount,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableValueSummary() when $default != null:
        return $default(
          _that.valueId,
          _that.sequence,
          _that.name,
          _that.averageInitial,
          _that.averageFollowUp,
          _that.averageImprovement,
          _that.initialCount,
          _that.followUpCount,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TableValueSummary implements TableValueSummary {
  const _TableValueSummary({
    required this.valueId,
    required this.sequence,
    required this.name,
    this.averageInitial,
    this.averageFollowUp,
    this.averageImprovement,
    this.initialCount = 0,
    this.followUpCount = 0,
  });

  @override
  final String valueId;
  @override
  final int sequence;
  @override
  final String name;
  @override
  final double? averageInitial;
  @override
  final double? averageFollowUp;

  /// Mean of follow-up minus initial over the people who gave both.
  @override
  final double? averageImprovement;
  @override
  @JsonKey()
  final int initialCount;
  @override
  @JsonKey()
  final int followUpCount;

  /// Create a copy of TableValueSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TableValueSummaryCopyWith<_TableValueSummary> get copyWith =>
      __$TableValueSummaryCopyWithImpl<_TableValueSummary>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TableValueSummary &&
            (identical(other.valueId, valueId) || other.valueId == valueId) &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.averageInitial, averageInitial) ||
                other.averageInitial == averageInitial) &&
            (identical(other.averageFollowUp, averageFollowUp) ||
                other.averageFollowUp == averageFollowUp) &&
            (identical(other.averageImprovement, averageImprovement) ||
                other.averageImprovement == averageImprovement) &&
            (identical(other.initialCount, initialCount) ||
                other.initialCount == initialCount) &&
            (identical(other.followUpCount, followUpCount) ||
                other.followUpCount == followUpCount));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    valueId,
    sequence,
    name,
    averageInitial,
    averageFollowUp,
    averageImprovement,
    initialCount,
    followUpCount,
  );

  @override
  String toString() {
    return 'TableValueSummary(valueId: $valueId, sequence: $sequence, name: $name, averageInitial: $averageInitial, averageFollowUp: $averageFollowUp, averageImprovement: $averageImprovement, initialCount: $initialCount, followUpCount: $followUpCount)';
  }
}

/// @nodoc
abstract mixin class _$TableValueSummaryCopyWith<$Res>
    implements $TableValueSummaryCopyWith<$Res> {
  factory _$TableValueSummaryCopyWith(
    _TableValueSummary value,
    $Res Function(_TableValueSummary) _then,
  ) = __$TableValueSummaryCopyWithImpl;
  @override
  @useResult
  $Res call({
    String valueId,
    int sequence,
    String name,
    double? averageInitial,
    double? averageFollowUp,
    double? averageImprovement,
    int initialCount,
    int followUpCount,
  });
}

/// @nodoc
class __$TableValueSummaryCopyWithImpl<$Res>
    implements _$TableValueSummaryCopyWith<$Res> {
  __$TableValueSummaryCopyWithImpl(this._self, this._then);

  final _TableValueSummary _self;
  final $Res Function(_TableValueSummary) _then;

  /// Create a copy of TableValueSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? valueId = null,
    Object? sequence = null,
    Object? name = null,
    Object? averageInitial = freezed,
    Object? averageFollowUp = freezed,
    Object? averageImprovement = freezed,
    Object? initialCount = null,
    Object? followUpCount = null,
  }) {
    return _then(
      _TableValueSummary(
        valueId: null == valueId
            ? _self.valueId
            : valueId // ignore: cast_nullable_to_non_nullable
                  as String,
        sequence: null == sequence
            ? _self.sequence
            : sequence // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        averageInitial: freezed == averageInitial
            ? _self.averageInitial
            : averageInitial // ignore: cast_nullable_to_non_nullable
                  as double?,
        averageFollowUp: freezed == averageFollowUp
            ? _self.averageFollowUp
            : averageFollowUp // ignore: cast_nullable_to_non_nullable
                  as double?,
        averageImprovement: freezed == averageImprovement
            ? _self.averageImprovement
            : averageImprovement // ignore: cast_nullable_to_non_nullable
                  as double?,
        initialCount: null == initialCount
            ? _self.initialCount
            : initialCount // ignore: cast_nullable_to_non_nullable
                  as int,
        followUpCount: null == followUpCount
            ? _self.followUpCount
            : followUpCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
mixin _$TableMemberSummary {
  String get personId;
  String get name;
  bool get isFacilitator;
  int get attendedSessions;
  int get closedSessions;
  double? get averageInitial;
  double? get averageFollowUp;
  double? get averageImprovement;

  /// Create a copy of TableMemberSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TableMemberSummaryCopyWith<TableMemberSummary> get copyWith =>
      _$TableMemberSummaryCopyWithImpl<TableMemberSummary>(
        this as TableMemberSummary,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TableMemberSummary &&
            (identical(other.personId, personId) ||
                other.personId == personId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isFacilitator, isFacilitator) ||
                other.isFacilitator == isFacilitator) &&
            (identical(other.attendedSessions, attendedSessions) ||
                other.attendedSessions == attendedSessions) &&
            (identical(other.closedSessions, closedSessions) ||
                other.closedSessions == closedSessions) &&
            (identical(other.averageInitial, averageInitial) ||
                other.averageInitial == averageInitial) &&
            (identical(other.averageFollowUp, averageFollowUp) ||
                other.averageFollowUp == averageFollowUp) &&
            (identical(other.averageImprovement, averageImprovement) ||
                other.averageImprovement == averageImprovement));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    personId,
    name,
    isFacilitator,
    attendedSessions,
    closedSessions,
    averageInitial,
    averageFollowUp,
    averageImprovement,
  );

  @override
  String toString() {
    return 'TableMemberSummary(personId: $personId, name: $name, isFacilitator: $isFacilitator, attendedSessions: $attendedSessions, closedSessions: $closedSessions, averageInitial: $averageInitial, averageFollowUp: $averageFollowUp, averageImprovement: $averageImprovement)';
  }
}

/// @nodoc
abstract mixin class $TableMemberSummaryCopyWith<$Res> {
  factory $TableMemberSummaryCopyWith(
    TableMemberSummary value,
    $Res Function(TableMemberSummary) _then,
  ) = _$TableMemberSummaryCopyWithImpl;
  @useResult
  $Res call({
    String personId,
    String name,
    bool isFacilitator,
    int attendedSessions,
    int closedSessions,
    double? averageInitial,
    double? averageFollowUp,
    double? averageImprovement,
  });
}

/// @nodoc
class _$TableMemberSummaryCopyWithImpl<$Res>
    implements $TableMemberSummaryCopyWith<$Res> {
  _$TableMemberSummaryCopyWithImpl(this._self, this._then);

  final TableMemberSummary _self;
  final $Res Function(TableMemberSummary) _then;

  /// Create a copy of TableMemberSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? personId = null,
    Object? name = null,
    Object? isFacilitator = null,
    Object? attendedSessions = null,
    Object? closedSessions = null,
    Object? averageInitial = freezed,
    Object? averageFollowUp = freezed,
    Object? averageImprovement = freezed,
  }) {
    return _then(
      _self.copyWith(
        personId: null == personId
            ? _self.personId
            : personId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        isFacilitator: null == isFacilitator
            ? _self.isFacilitator
            : isFacilitator // ignore: cast_nullable_to_non_nullable
                  as bool,
        attendedSessions: null == attendedSessions
            ? _self.attendedSessions
            : attendedSessions // ignore: cast_nullable_to_non_nullable
                  as int,
        closedSessions: null == closedSessions
            ? _self.closedSessions
            : closedSessions // ignore: cast_nullable_to_non_nullable
                  as int,
        averageInitial: freezed == averageInitial
            ? _self.averageInitial
            : averageInitial // ignore: cast_nullable_to_non_nullable
                  as double?,
        averageFollowUp: freezed == averageFollowUp
            ? _self.averageFollowUp
            : averageFollowUp // ignore: cast_nullable_to_non_nullable
                  as double?,
        averageImprovement: freezed == averageImprovement
            ? _self.averageImprovement
            : averageImprovement // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [TableMemberSummary].
extension TableMemberSummaryPatterns on TableMemberSummary {
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
    TResult Function(_TableMemberSummary value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TableMemberSummary() when $default != null:
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
    TResult Function(_TableMemberSummary value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableMemberSummary():
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
    TResult? Function(_TableMemberSummary value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableMemberSummary() when $default != null:
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
      String name,
      bool isFacilitator,
      int attendedSessions,
      int closedSessions,
      double? averageInitial,
      double? averageFollowUp,
      double? averageImprovement,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TableMemberSummary() when $default != null:
        return $default(
          _that.personId,
          _that.name,
          _that.isFacilitator,
          _that.attendedSessions,
          _that.closedSessions,
          _that.averageInitial,
          _that.averageFollowUp,
          _that.averageImprovement,
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
      String name,
      bool isFacilitator,
      int attendedSessions,
      int closedSessions,
      double? averageInitial,
      double? averageFollowUp,
      double? averageImprovement,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableMemberSummary():
        return $default(
          _that.personId,
          _that.name,
          _that.isFacilitator,
          _that.attendedSessions,
          _that.closedSessions,
          _that.averageInitial,
          _that.averageFollowUp,
          _that.averageImprovement,
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
      String name,
      bool isFacilitator,
      int attendedSessions,
      int closedSessions,
      double? averageInitial,
      double? averageFollowUp,
      double? averageImprovement,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableMemberSummary() when $default != null:
        return $default(
          _that.personId,
          _that.name,
          _that.isFacilitator,
          _that.attendedSessions,
          _that.closedSessions,
          _that.averageInitial,
          _that.averageFollowUp,
          _that.averageImprovement,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TableMemberSummary implements TableMemberSummary {
  const _TableMemberSummary({
    required this.personId,
    required this.name,
    required this.isFacilitator,
    required this.attendedSessions,
    required this.closedSessions,
    this.averageInitial,
    this.averageFollowUp,
    this.averageImprovement,
  });

  @override
  final String personId;
  @override
  final String name;
  @override
  final bool isFacilitator;
  @override
  final int attendedSessions;
  @override
  final int closedSessions;
  @override
  final double? averageInitial;
  @override
  final double? averageFollowUp;
  @override
  final double? averageImprovement;

  /// Create a copy of TableMemberSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TableMemberSummaryCopyWith<_TableMemberSummary> get copyWith =>
      __$TableMemberSummaryCopyWithImpl<_TableMemberSummary>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TableMemberSummary &&
            (identical(other.personId, personId) ||
                other.personId == personId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isFacilitator, isFacilitator) ||
                other.isFacilitator == isFacilitator) &&
            (identical(other.attendedSessions, attendedSessions) ||
                other.attendedSessions == attendedSessions) &&
            (identical(other.closedSessions, closedSessions) ||
                other.closedSessions == closedSessions) &&
            (identical(other.averageInitial, averageInitial) ||
                other.averageInitial == averageInitial) &&
            (identical(other.averageFollowUp, averageFollowUp) ||
                other.averageFollowUp == averageFollowUp) &&
            (identical(other.averageImprovement, averageImprovement) ||
                other.averageImprovement == averageImprovement));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    personId,
    name,
    isFacilitator,
    attendedSessions,
    closedSessions,
    averageInitial,
    averageFollowUp,
    averageImprovement,
  );

  @override
  String toString() {
    return 'TableMemberSummary(personId: $personId, name: $name, isFacilitator: $isFacilitator, attendedSessions: $attendedSessions, closedSessions: $closedSessions, averageInitial: $averageInitial, averageFollowUp: $averageFollowUp, averageImprovement: $averageImprovement)';
  }
}

/// @nodoc
abstract mixin class _$TableMemberSummaryCopyWith<$Res>
    implements $TableMemberSummaryCopyWith<$Res> {
  factory _$TableMemberSummaryCopyWith(
    _TableMemberSummary value,
    $Res Function(_TableMemberSummary) _then,
  ) = __$TableMemberSummaryCopyWithImpl;
  @override
  @useResult
  $Res call({
    String personId,
    String name,
    bool isFacilitator,
    int attendedSessions,
    int closedSessions,
    double? averageInitial,
    double? averageFollowUp,
    double? averageImprovement,
  });
}

/// @nodoc
class __$TableMemberSummaryCopyWithImpl<$Res>
    implements _$TableMemberSummaryCopyWith<$Res> {
  __$TableMemberSummaryCopyWithImpl(this._self, this._then);

  final _TableMemberSummary _self;
  final $Res Function(_TableMemberSummary) _then;

  /// Create a copy of TableMemberSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? personId = null,
    Object? name = null,
    Object? isFacilitator = null,
    Object? attendedSessions = null,
    Object? closedSessions = null,
    Object? averageInitial = freezed,
    Object? averageFollowUp = freezed,
    Object? averageImprovement = freezed,
  }) {
    return _then(
      _TableMemberSummary(
        personId: null == personId
            ? _self.personId
            : personId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        isFacilitator: null == isFacilitator
            ? _self.isFacilitator
            : isFacilitator // ignore: cast_nullable_to_non_nullable
                  as bool,
        attendedSessions: null == attendedSessions
            ? _self.attendedSessions
            : attendedSessions // ignore: cast_nullable_to_non_nullable
                  as int,
        closedSessions: null == closedSessions
            ? _self.closedSessions
            : closedSessions // ignore: cast_nullable_to_non_nullable
                  as int,
        averageInitial: freezed == averageInitial
            ? _self.averageInitial
            : averageInitial // ignore: cast_nullable_to_non_nullable
                  as double?,
        averageFollowUp: freezed == averageFollowUp
            ? _self.averageFollowUp
            : averageFollowUp // ignore: cast_nullable_to_non_nullable
                  as double?,
        averageImprovement: freezed == averageImprovement
            ? _self.averageImprovement
            : averageImprovement // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc
mixin _$TableHistory {
  String get tableId;
  String get tableName;
  List<TableMemberSummary> get members;

  /// Newest first.
  List<TableSessionSummary> get sessions;
  List<TableValueSummary> get values;

  /// Create a copy of TableHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TableHistoryCopyWith<TableHistory> get copyWith =>
      _$TableHistoryCopyWithImpl<TableHistory>(
        this as TableHistory,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TableHistory &&
            (identical(other.tableId, tableId) || other.tableId == tableId) &&
            (identical(other.tableName, tableName) ||
                other.tableName == tableName) &&
            const DeepCollectionEquality().equals(other.members, members) &&
            const DeepCollectionEquality().equals(other.sessions, sessions) &&
            const DeepCollectionEquality().equals(other.values, values));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    tableId,
    tableName,
    const DeepCollectionEquality().hash(members),
    const DeepCollectionEquality().hash(sessions),
    const DeepCollectionEquality().hash(values),
  );

  @override
  String toString() {
    return 'TableHistory(tableId: $tableId, tableName: $tableName, members: $members, sessions: $sessions, values: $values)';
  }
}

/// @nodoc
abstract mixin class $TableHistoryCopyWith<$Res> {
  factory $TableHistoryCopyWith(
    TableHistory value,
    $Res Function(TableHistory) _then,
  ) = _$TableHistoryCopyWithImpl;
  @useResult
  $Res call({
    String tableId,
    String tableName,
    List<TableMemberSummary> members,
    List<TableSessionSummary> sessions,
    List<TableValueSummary> values,
  });
}

/// @nodoc
class _$TableHistoryCopyWithImpl<$Res> implements $TableHistoryCopyWith<$Res> {
  _$TableHistoryCopyWithImpl(this._self, this._then);

  final TableHistory _self;
  final $Res Function(TableHistory) _then;

  /// Create a copy of TableHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tableId = null,
    Object? tableName = null,
    Object? members = null,
    Object? sessions = null,
    Object? values = null,
  }) {
    return _then(
      _self.copyWith(
        tableId: null == tableId
            ? _self.tableId
            : tableId // ignore: cast_nullable_to_non_nullable
                  as String,
        tableName: null == tableName
            ? _self.tableName
            : tableName // ignore: cast_nullable_to_non_nullable
                  as String,
        members: null == members
            ? _self.members
            : members // ignore: cast_nullable_to_non_nullable
                  as List<TableMemberSummary>,
        sessions: null == sessions
            ? _self.sessions
            : sessions // ignore: cast_nullable_to_non_nullable
                  as List<TableSessionSummary>,
        values: null == values
            ? _self.values
            : values // ignore: cast_nullable_to_non_nullable
                  as List<TableValueSummary>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [TableHistory].
extension TableHistoryPatterns on TableHistory {
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
    TResult Function(_TableHistory value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TableHistory() when $default != null:
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
    TResult Function(_TableHistory value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableHistory():
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
    TResult? Function(_TableHistory value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableHistory() when $default != null:
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
      String tableId,
      String tableName,
      List<TableMemberSummary> members,
      List<TableSessionSummary> sessions,
      List<TableValueSummary> values,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TableHistory() when $default != null:
        return $default(
          _that.tableId,
          _that.tableName,
          _that.members,
          _that.sessions,
          _that.values,
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
      String tableId,
      String tableName,
      List<TableMemberSummary> members,
      List<TableSessionSummary> sessions,
      List<TableValueSummary> values,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableHistory():
        return $default(
          _that.tableId,
          _that.tableName,
          _that.members,
          _that.sessions,
          _that.values,
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
      String tableId,
      String tableName,
      List<TableMemberSummary> members,
      List<TableSessionSummary> sessions,
      List<TableValueSummary> values,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableHistory() when $default != null:
        return $default(
          _that.tableId,
          _that.tableName,
          _that.members,
          _that.sessions,
          _that.values,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TableHistory extends TableHistory {
  const _TableHistory({
    required this.tableId,
    required this.tableName,
    final List<TableMemberSummary> members = const [],
    final List<TableSessionSummary> sessions = const [],
    final List<TableValueSummary> values = const [],
  }) : _members = members,
       _sessions = sessions,
       _values = values,
       super._();

  @override
  final String tableId;
  @override
  final String tableName;
  final List<TableMemberSummary> _members;
  @override
  @JsonKey()
  List<TableMemberSummary> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  /// Newest first.
  final List<TableSessionSummary> _sessions;

  /// Newest first.
  @override
  @JsonKey()
  List<TableSessionSummary> get sessions {
    if (_sessions is EqualUnmodifiableListView) return _sessions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sessions);
  }

  final List<TableValueSummary> _values;
  @override
  @JsonKey()
  List<TableValueSummary> get values {
    if (_values is EqualUnmodifiableListView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_values);
  }

  /// Create a copy of TableHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TableHistoryCopyWith<_TableHistory> get copyWith =>
      __$TableHistoryCopyWithImpl<_TableHistory>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TableHistory &&
            (identical(other.tableId, tableId) || other.tableId == tableId) &&
            (identical(other.tableName, tableName) ||
                other.tableName == tableName) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            const DeepCollectionEquality().equals(other._sessions, _sessions) &&
            const DeepCollectionEquality().equals(other._values, _values));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    tableId,
    tableName,
    const DeepCollectionEquality().hash(_members),
    const DeepCollectionEquality().hash(_sessions),
    const DeepCollectionEquality().hash(_values),
  );

  @override
  String toString() {
    return 'TableHistory(tableId: $tableId, tableName: $tableName, members: $members, sessions: $sessions, values: $values)';
  }
}

/// @nodoc
abstract mixin class _$TableHistoryCopyWith<$Res>
    implements $TableHistoryCopyWith<$Res> {
  factory _$TableHistoryCopyWith(
    _TableHistory value,
    $Res Function(_TableHistory) _then,
  ) = __$TableHistoryCopyWithImpl;
  @override
  @useResult
  $Res call({
    String tableId,
    String tableName,
    List<TableMemberSummary> members,
    List<TableSessionSummary> sessions,
    List<TableValueSummary> values,
  });
}

/// @nodoc
class __$TableHistoryCopyWithImpl<$Res>
    implements _$TableHistoryCopyWith<$Res> {
  __$TableHistoryCopyWithImpl(this._self, this._then);

  final _TableHistory _self;
  final $Res Function(_TableHistory) _then;

  /// Create a copy of TableHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tableId = null,
    Object? tableName = null,
    Object? members = null,
    Object? sessions = null,
    Object? values = null,
  }) {
    return _then(
      _TableHistory(
        tableId: null == tableId
            ? _self.tableId
            : tableId // ignore: cast_nullable_to_non_nullable
                  as String,
        tableName: null == tableName
            ? _self.tableName
            : tableName // ignore: cast_nullable_to_non_nullable
                  as String,
        members: null == members
            ? _self._members
            : members // ignore: cast_nullable_to_non_nullable
                  as List<TableMemberSummary>,
        sessions: null == sessions
            ? _self._sessions
            : sessions // ignore: cast_nullable_to_non_nullable
                  as List<TableSessionSummary>,
        values: null == values
            ? _self._values
            : values // ignore: cast_nullable_to_non_nullable
                  as List<TableValueSummary>,
      ),
    );
  }
}
