// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommitmentProgress {
  String get actionText;
  String? get measureText;

  /// Null until the next session reviewed it.
  CommitmentFollowUpStatus? get status;
  String? get note;
  bool get syncedLate;

  /// Create a copy of CommitmentProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommitmentProgressCopyWith<CommitmentProgress> get copyWith =>
      _$CommitmentProgressCopyWithImpl<CommitmentProgress>(
        this as CommitmentProgress,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommitmentProgress &&
            (identical(other.actionText, actionText) ||
                other.actionText == actionText) &&
            (identical(other.measureText, measureText) ||
                other.measureText == measureText) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.syncedLate, syncedLate) ||
                other.syncedLate == syncedLate));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    actionText,
    measureText,
    status,
    note,
    syncedLate,
  );

  @override
  String toString() {
    return 'CommitmentProgress(actionText: $actionText, measureText: $measureText, status: $status, note: $note, syncedLate: $syncedLate)';
  }
}

/// @nodoc
abstract mixin class $CommitmentProgressCopyWith<$Res> {
  factory $CommitmentProgressCopyWith(
    CommitmentProgress value,
    $Res Function(CommitmentProgress) _then,
  ) = _$CommitmentProgressCopyWithImpl;
  @useResult
  $Res call({
    String actionText,
    String? measureText,
    CommitmentFollowUpStatus? status,
    String? note,
    bool syncedLate,
  });
}

/// @nodoc
class _$CommitmentProgressCopyWithImpl<$Res>
    implements $CommitmentProgressCopyWith<$Res> {
  _$CommitmentProgressCopyWithImpl(this._self, this._then);

  final CommitmentProgress _self;
  final $Res Function(CommitmentProgress) _then;

  /// Create a copy of CommitmentProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? actionText = null,
    Object? measureText = freezed,
    Object? status = freezed,
    Object? note = freezed,
    Object? syncedLate = null,
  }) {
    return _then(
      _self.copyWith(
        actionText: null == actionText
            ? _self.actionText
            : actionText // ignore: cast_nullable_to_non_nullable
                  as String,
        measureText: freezed == measureText
            ? _self.measureText
            : measureText // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as CommitmentFollowUpStatus?,
        note: freezed == note
            ? _self.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String?,
        syncedLate: null == syncedLate
            ? _self.syncedLate
            : syncedLate // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [CommitmentProgress].
extension CommitmentProgressPatterns on CommitmentProgress {
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
    TResult Function(_CommitmentProgress value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CommitmentProgress() when $default != null:
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
    TResult Function(_CommitmentProgress value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CommitmentProgress():
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
    TResult? Function(_CommitmentProgress value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CommitmentProgress() when $default != null:
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
      String actionText,
      String? measureText,
      CommitmentFollowUpStatus? status,
      String? note,
      bool syncedLate,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CommitmentProgress() when $default != null:
        return $default(
          _that.actionText,
          _that.measureText,
          _that.status,
          _that.note,
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
      String actionText,
      String? measureText,
      CommitmentFollowUpStatus? status,
      String? note,
      bool syncedLate,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CommitmentProgress():
        return $default(
          _that.actionText,
          _that.measureText,
          _that.status,
          _that.note,
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
      String actionText,
      String? measureText,
      CommitmentFollowUpStatus? status,
      String? note,
      bool syncedLate,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CommitmentProgress() when $default != null:
        return $default(
          _that.actionText,
          _that.measureText,
          _that.status,
          _that.note,
          _that.syncedLate,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CommitmentProgress implements CommitmentProgress {
  const _CommitmentProgress({
    required this.actionText,
    this.measureText,
    this.status,
    this.note,
    this.syncedLate = false,
  });

  @override
  final String actionText;
  @override
  final String? measureText;

  /// Null until the next session reviewed it.
  @override
  final CommitmentFollowUpStatus? status;
  @override
  final String? note;
  @override
  @JsonKey()
  final bool syncedLate;

  /// Create a copy of CommitmentProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CommitmentProgressCopyWith<_CommitmentProgress> get copyWith =>
      __$CommitmentProgressCopyWithImpl<_CommitmentProgress>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CommitmentProgress &&
            (identical(other.actionText, actionText) ||
                other.actionText == actionText) &&
            (identical(other.measureText, measureText) ||
                other.measureText == measureText) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.syncedLate, syncedLate) ||
                other.syncedLate == syncedLate));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    actionText,
    measureText,
    status,
    note,
    syncedLate,
  );

  @override
  String toString() {
    return 'CommitmentProgress(actionText: $actionText, measureText: $measureText, status: $status, note: $note, syncedLate: $syncedLate)';
  }
}

/// @nodoc
abstract mixin class _$CommitmentProgressCopyWith<$Res>
    implements $CommitmentProgressCopyWith<$Res> {
  factory _$CommitmentProgressCopyWith(
    _CommitmentProgress value,
    $Res Function(_CommitmentProgress) _then,
  ) = __$CommitmentProgressCopyWithImpl;
  @override
  @useResult
  $Res call({
    String actionText,
    String? measureText,
    CommitmentFollowUpStatus? status,
    String? note,
    bool syncedLate,
  });
}

/// @nodoc
class __$CommitmentProgressCopyWithImpl<$Res>
    implements _$CommitmentProgressCopyWith<$Res> {
  __$CommitmentProgressCopyWithImpl(this._self, this._then);

  final _CommitmentProgress _self;
  final $Res Function(_CommitmentProgress) _then;

  /// Create a copy of CommitmentProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? actionText = null,
    Object? measureText = freezed,
    Object? status = freezed,
    Object? note = freezed,
    Object? syncedLate = null,
  }) {
    return _then(
      _CommitmentProgress(
        actionText: null == actionText
            ? _self.actionText
            : actionText // ignore: cast_nullable_to_non_nullable
                  as String,
        measureText: freezed == measureText
            ? _self.measureText
            : measureText // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as CommitmentFollowUpStatus?,
        note: freezed == note
            ? _self.note
            : note // ignore: cast_nullable_to_non_nullable
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
mixin _$ValueProgress {
  String get valueId;
  int get sequence;
  String get name;
  int? get moduleNumber;
  String? get moduleName;
  int? get initialScore;
  String? get initialJustification;
  bool get initialSyncedLate;
  int? get followUpScore;
  String? get followUpJustification;
  bool get followUpSyncedLate;
  CommitmentProgress? get commitment;

  /// Create a copy of ValueProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ValueProgressCopyWith<ValueProgress> get copyWith =>
      _$ValueProgressCopyWithImpl<ValueProgress>(
        this as ValueProgress,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ValueProgress &&
            (identical(other.valueId, valueId) || other.valueId == valueId) &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.moduleNumber, moduleNumber) ||
                other.moduleNumber == moduleNumber) &&
            (identical(other.moduleName, moduleName) ||
                other.moduleName == moduleName) &&
            (identical(other.initialScore, initialScore) ||
                other.initialScore == initialScore) &&
            (identical(other.initialJustification, initialJustification) ||
                other.initialJustification == initialJustification) &&
            (identical(other.initialSyncedLate, initialSyncedLate) ||
                other.initialSyncedLate == initialSyncedLate) &&
            (identical(other.followUpScore, followUpScore) ||
                other.followUpScore == followUpScore) &&
            (identical(other.followUpJustification, followUpJustification) ||
                other.followUpJustification == followUpJustification) &&
            (identical(other.followUpSyncedLate, followUpSyncedLate) ||
                other.followUpSyncedLate == followUpSyncedLate) &&
            (identical(other.commitment, commitment) ||
                other.commitment == commitment));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    valueId,
    sequence,
    name,
    moduleNumber,
    moduleName,
    initialScore,
    initialJustification,
    initialSyncedLate,
    followUpScore,
    followUpJustification,
    followUpSyncedLate,
    commitment,
  );

  @override
  String toString() {
    return 'ValueProgress(valueId: $valueId, sequence: $sequence, name: $name, moduleNumber: $moduleNumber, moduleName: $moduleName, initialScore: $initialScore, initialJustification: $initialJustification, initialSyncedLate: $initialSyncedLate, followUpScore: $followUpScore, followUpJustification: $followUpJustification, followUpSyncedLate: $followUpSyncedLate, commitment: $commitment)';
  }
}

/// @nodoc
abstract mixin class $ValueProgressCopyWith<$Res> {
  factory $ValueProgressCopyWith(
    ValueProgress value,
    $Res Function(ValueProgress) _then,
  ) = _$ValueProgressCopyWithImpl;
  @useResult
  $Res call({
    String valueId,
    int sequence,
    String name,
    int? moduleNumber,
    String? moduleName,
    int? initialScore,
    String? initialJustification,
    bool initialSyncedLate,
    int? followUpScore,
    String? followUpJustification,
    bool followUpSyncedLate,
    CommitmentProgress? commitment,
  });

  $CommitmentProgressCopyWith<$Res>? get commitment;
}

/// @nodoc
class _$ValueProgressCopyWithImpl<$Res>
    implements $ValueProgressCopyWith<$Res> {
  _$ValueProgressCopyWithImpl(this._self, this._then);

  final ValueProgress _self;
  final $Res Function(ValueProgress) _then;

  /// Create a copy of ValueProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? valueId = null,
    Object? sequence = null,
    Object? name = null,
    Object? moduleNumber = freezed,
    Object? moduleName = freezed,
    Object? initialScore = freezed,
    Object? initialJustification = freezed,
    Object? initialSyncedLate = null,
    Object? followUpScore = freezed,
    Object? followUpJustification = freezed,
    Object? followUpSyncedLate = null,
    Object? commitment = freezed,
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
        moduleNumber: freezed == moduleNumber
            ? _self.moduleNumber
            : moduleNumber // ignore: cast_nullable_to_non_nullable
                  as int?,
        moduleName: freezed == moduleName
            ? _self.moduleName
            : moduleName // ignore: cast_nullable_to_non_nullable
                  as String?,
        initialScore: freezed == initialScore
            ? _self.initialScore
            : initialScore // ignore: cast_nullable_to_non_nullable
                  as int?,
        initialJustification: freezed == initialJustification
            ? _self.initialJustification
            : initialJustification // ignore: cast_nullable_to_non_nullable
                  as String?,
        initialSyncedLate: null == initialSyncedLate
            ? _self.initialSyncedLate
            : initialSyncedLate // ignore: cast_nullable_to_non_nullable
                  as bool,
        followUpScore: freezed == followUpScore
            ? _self.followUpScore
            : followUpScore // ignore: cast_nullable_to_non_nullable
                  as int?,
        followUpJustification: freezed == followUpJustification
            ? _self.followUpJustification
            : followUpJustification // ignore: cast_nullable_to_non_nullable
                  as String?,
        followUpSyncedLate: null == followUpSyncedLate
            ? _self.followUpSyncedLate
            : followUpSyncedLate // ignore: cast_nullable_to_non_nullable
                  as bool,
        commitment: freezed == commitment
            ? _self.commitment
            : commitment // ignore: cast_nullable_to_non_nullable
                  as CommitmentProgress?,
      ),
    );
  }

  /// Create a copy of ValueProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommitmentProgressCopyWith<$Res>? get commitment {
    if (_self.commitment == null) {
      return null;
    }

    return $CommitmentProgressCopyWith<$Res>(_self.commitment!, (value) {
      return _then(_self.copyWith(commitment: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ValueProgress].
extension ValueProgressPatterns on ValueProgress {
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
    TResult Function(_ValueProgress value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ValueProgress() when $default != null:
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
    TResult Function(_ValueProgress value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ValueProgress():
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
    TResult? Function(_ValueProgress value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ValueProgress() when $default != null:
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
      int? moduleNumber,
      String? moduleName,
      int? initialScore,
      String? initialJustification,
      bool initialSyncedLate,
      int? followUpScore,
      String? followUpJustification,
      bool followUpSyncedLate,
      CommitmentProgress? commitment,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ValueProgress() when $default != null:
        return $default(
          _that.valueId,
          _that.sequence,
          _that.name,
          _that.moduleNumber,
          _that.moduleName,
          _that.initialScore,
          _that.initialJustification,
          _that.initialSyncedLate,
          _that.followUpScore,
          _that.followUpJustification,
          _that.followUpSyncedLate,
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
      String valueId,
      int sequence,
      String name,
      int? moduleNumber,
      String? moduleName,
      int? initialScore,
      String? initialJustification,
      bool initialSyncedLate,
      int? followUpScore,
      String? followUpJustification,
      bool followUpSyncedLate,
      CommitmentProgress? commitment,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ValueProgress():
        return $default(
          _that.valueId,
          _that.sequence,
          _that.name,
          _that.moduleNumber,
          _that.moduleName,
          _that.initialScore,
          _that.initialJustification,
          _that.initialSyncedLate,
          _that.followUpScore,
          _that.followUpJustification,
          _that.followUpSyncedLate,
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
      String valueId,
      int sequence,
      String name,
      int? moduleNumber,
      String? moduleName,
      int? initialScore,
      String? initialJustification,
      bool initialSyncedLate,
      int? followUpScore,
      String? followUpJustification,
      bool followUpSyncedLate,
      CommitmentProgress? commitment,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ValueProgress() when $default != null:
        return $default(
          _that.valueId,
          _that.sequence,
          _that.name,
          _that.moduleNumber,
          _that.moduleName,
          _that.initialScore,
          _that.initialJustification,
          _that.initialSyncedLate,
          _that.followUpScore,
          _that.followUpJustification,
          _that.followUpSyncedLate,
          _that.commitment,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ValueProgress extends ValueProgress {
  const _ValueProgress({
    required this.valueId,
    required this.sequence,
    required this.name,
    this.moduleNumber,
    this.moduleName,
    this.initialScore,
    this.initialJustification,
    this.initialSyncedLate = false,
    this.followUpScore,
    this.followUpJustification,
    this.followUpSyncedLate = false,
    this.commitment,
  }) : super._();

  @override
  final String valueId;
  @override
  final int sequence;
  @override
  final String name;
  @override
  final int? moduleNumber;
  @override
  final String? moduleName;
  @override
  final int? initialScore;
  @override
  final String? initialJustification;
  @override
  @JsonKey()
  final bool initialSyncedLate;
  @override
  final int? followUpScore;
  @override
  final String? followUpJustification;
  @override
  @JsonKey()
  final bool followUpSyncedLate;
  @override
  final CommitmentProgress? commitment;

  /// Create a copy of ValueProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ValueProgressCopyWith<_ValueProgress> get copyWith =>
      __$ValueProgressCopyWithImpl<_ValueProgress>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ValueProgress &&
            (identical(other.valueId, valueId) || other.valueId == valueId) &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.moduleNumber, moduleNumber) ||
                other.moduleNumber == moduleNumber) &&
            (identical(other.moduleName, moduleName) ||
                other.moduleName == moduleName) &&
            (identical(other.initialScore, initialScore) ||
                other.initialScore == initialScore) &&
            (identical(other.initialJustification, initialJustification) ||
                other.initialJustification == initialJustification) &&
            (identical(other.initialSyncedLate, initialSyncedLate) ||
                other.initialSyncedLate == initialSyncedLate) &&
            (identical(other.followUpScore, followUpScore) ||
                other.followUpScore == followUpScore) &&
            (identical(other.followUpJustification, followUpJustification) ||
                other.followUpJustification == followUpJustification) &&
            (identical(other.followUpSyncedLate, followUpSyncedLate) ||
                other.followUpSyncedLate == followUpSyncedLate) &&
            (identical(other.commitment, commitment) ||
                other.commitment == commitment));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    valueId,
    sequence,
    name,
    moduleNumber,
    moduleName,
    initialScore,
    initialJustification,
    initialSyncedLate,
    followUpScore,
    followUpJustification,
    followUpSyncedLate,
    commitment,
  );

  @override
  String toString() {
    return 'ValueProgress(valueId: $valueId, sequence: $sequence, name: $name, moduleNumber: $moduleNumber, moduleName: $moduleName, initialScore: $initialScore, initialJustification: $initialJustification, initialSyncedLate: $initialSyncedLate, followUpScore: $followUpScore, followUpJustification: $followUpJustification, followUpSyncedLate: $followUpSyncedLate, commitment: $commitment)';
  }
}

/// @nodoc
abstract mixin class _$ValueProgressCopyWith<$Res>
    implements $ValueProgressCopyWith<$Res> {
  factory _$ValueProgressCopyWith(
    _ValueProgress value,
    $Res Function(_ValueProgress) _then,
  ) = __$ValueProgressCopyWithImpl;
  @override
  @useResult
  $Res call({
    String valueId,
    int sequence,
    String name,
    int? moduleNumber,
    String? moduleName,
    int? initialScore,
    String? initialJustification,
    bool initialSyncedLate,
    int? followUpScore,
    String? followUpJustification,
    bool followUpSyncedLate,
    CommitmentProgress? commitment,
  });

  @override
  $CommitmentProgressCopyWith<$Res>? get commitment;
}

/// @nodoc
class __$ValueProgressCopyWithImpl<$Res>
    implements _$ValueProgressCopyWith<$Res> {
  __$ValueProgressCopyWithImpl(this._self, this._then);

  final _ValueProgress _self;
  final $Res Function(_ValueProgress) _then;

  /// Create a copy of ValueProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? valueId = null,
    Object? sequence = null,
    Object? name = null,
    Object? moduleNumber = freezed,
    Object? moduleName = freezed,
    Object? initialScore = freezed,
    Object? initialJustification = freezed,
    Object? initialSyncedLate = null,
    Object? followUpScore = freezed,
    Object? followUpJustification = freezed,
    Object? followUpSyncedLate = null,
    Object? commitment = freezed,
  }) {
    return _then(
      _ValueProgress(
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
        moduleNumber: freezed == moduleNumber
            ? _self.moduleNumber
            : moduleNumber // ignore: cast_nullable_to_non_nullable
                  as int?,
        moduleName: freezed == moduleName
            ? _self.moduleName
            : moduleName // ignore: cast_nullable_to_non_nullable
                  as String?,
        initialScore: freezed == initialScore
            ? _self.initialScore
            : initialScore // ignore: cast_nullable_to_non_nullable
                  as int?,
        initialJustification: freezed == initialJustification
            ? _self.initialJustification
            : initialJustification // ignore: cast_nullable_to_non_nullable
                  as String?,
        initialSyncedLate: null == initialSyncedLate
            ? _self.initialSyncedLate
            : initialSyncedLate // ignore: cast_nullable_to_non_nullable
                  as bool,
        followUpScore: freezed == followUpScore
            ? _self.followUpScore
            : followUpScore // ignore: cast_nullable_to_non_nullable
                  as int?,
        followUpJustification: freezed == followUpJustification
            ? _self.followUpJustification
            : followUpJustification // ignore: cast_nullable_to_non_nullable
                  as String?,
        followUpSyncedLate: null == followUpSyncedLate
            ? _self.followUpSyncedLate
            : followUpSyncedLate // ignore: cast_nullable_to_non_nullable
                  as bool,
        commitment: freezed == commitment
            ? _self.commitment
            : commitment // ignore: cast_nullable_to_non_nullable
                  as CommitmentProgress?,
      ),
    );
  }

  /// Create a copy of ValueProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommitmentProgressCopyWith<$Res>? get commitment {
    if (_self.commitment == null) {
      return null;
    }

    return $CommitmentProgressCopyWith<$Res>(_self.commitment!, (value) {
      return _then(_self.copyWith(commitment: value));
    });
  }
}

/// @nodoc
mixin _$SessionRecord {
  String get sessionId;
  DateTime get scheduledAt;
  bool get isOpen;
  int? get valueSequence;
  String? get valueName;

  /// Null when no attendance was recorded.
  AttendanceStatus? get attendance;

  /// The session was closed before the answers stage (RF-50).
  bool get incomplete;

  /// Something this person sent for the session reached the server late.
  bool get syncedLate;

  /// Create a copy of SessionRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SessionRecordCopyWith<SessionRecord> get copyWith =>
      _$SessionRecordCopyWithImpl<SessionRecord>(
        this as SessionRecord,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SessionRecord &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen) &&
            (identical(other.valueSequence, valueSequence) ||
                other.valueSequence == valueSequence) &&
            (identical(other.valueName, valueName) ||
                other.valueName == valueName) &&
            (identical(other.attendance, attendance) ||
                other.attendance == attendance) &&
            (identical(other.incomplete, incomplete) ||
                other.incomplete == incomplete) &&
            (identical(other.syncedLate, syncedLate) ||
                other.syncedLate == syncedLate));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    sessionId,
    scheduledAt,
    isOpen,
    valueSequence,
    valueName,
    attendance,
    incomplete,
    syncedLate,
  );

  @override
  String toString() {
    return 'SessionRecord(sessionId: $sessionId, scheduledAt: $scheduledAt, isOpen: $isOpen, valueSequence: $valueSequence, valueName: $valueName, attendance: $attendance, incomplete: $incomplete, syncedLate: $syncedLate)';
  }
}

/// @nodoc
abstract mixin class $SessionRecordCopyWith<$Res> {
  factory $SessionRecordCopyWith(
    SessionRecord value,
    $Res Function(SessionRecord) _then,
  ) = _$SessionRecordCopyWithImpl;
  @useResult
  $Res call({
    String sessionId,
    DateTime scheduledAt,
    bool isOpen,
    int? valueSequence,
    String? valueName,
    AttendanceStatus? attendance,
    bool incomplete,
    bool syncedLate,
  });
}

/// @nodoc
class _$SessionRecordCopyWithImpl<$Res>
    implements $SessionRecordCopyWith<$Res> {
  _$SessionRecordCopyWithImpl(this._self, this._then);

  final SessionRecord _self;
  final $Res Function(SessionRecord) _then;

  /// Create a copy of SessionRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? scheduledAt = null,
    Object? isOpen = null,
    Object? valueSequence = freezed,
    Object? valueName = freezed,
    Object? attendance = freezed,
    Object? incomplete = null,
    Object? syncedLate = null,
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
        attendance: freezed == attendance
            ? _self.attendance
            : attendance // ignore: cast_nullable_to_non_nullable
                  as AttendanceStatus?,
        incomplete: null == incomplete
            ? _self.incomplete
            : incomplete // ignore: cast_nullable_to_non_nullable
                  as bool,
        syncedLate: null == syncedLate
            ? _self.syncedLate
            : syncedLate // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [SessionRecord].
extension SessionRecordPatterns on SessionRecord {
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
    TResult Function(_SessionRecord value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SessionRecord() when $default != null:
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
    TResult Function(_SessionRecord value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionRecord():
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
    TResult? Function(_SessionRecord value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionRecord() when $default != null:
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
      AttendanceStatus? attendance,
      bool incomplete,
      bool syncedLate,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SessionRecord() when $default != null:
        return $default(
          _that.sessionId,
          _that.scheduledAt,
          _that.isOpen,
          _that.valueSequence,
          _that.valueName,
          _that.attendance,
          _that.incomplete,
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
      String sessionId,
      DateTime scheduledAt,
      bool isOpen,
      int? valueSequence,
      String? valueName,
      AttendanceStatus? attendance,
      bool incomplete,
      bool syncedLate,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionRecord():
        return $default(
          _that.sessionId,
          _that.scheduledAt,
          _that.isOpen,
          _that.valueSequence,
          _that.valueName,
          _that.attendance,
          _that.incomplete,
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
      String sessionId,
      DateTime scheduledAt,
      bool isOpen,
      int? valueSequence,
      String? valueName,
      AttendanceStatus? attendance,
      bool incomplete,
      bool syncedLate,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionRecord() when $default != null:
        return $default(
          _that.sessionId,
          _that.scheduledAt,
          _that.isOpen,
          _that.valueSequence,
          _that.valueName,
          _that.attendance,
          _that.incomplete,
          _that.syncedLate,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SessionRecord extends SessionRecord {
  const _SessionRecord({
    required this.sessionId,
    required this.scheduledAt,
    required this.isOpen,
    this.valueSequence,
    this.valueName,
    this.attendance,
    this.incomplete = false,
    this.syncedLate = false,
  }) : super._();

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

  /// Null when no attendance was recorded.
  @override
  final AttendanceStatus? attendance;

  /// The session was closed before the answers stage (RF-50).
  @override
  @JsonKey()
  final bool incomplete;

  /// Something this person sent for the session reached the server late.
  @override
  @JsonKey()
  final bool syncedLate;

  /// Create a copy of SessionRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SessionRecordCopyWith<_SessionRecord> get copyWith =>
      __$SessionRecordCopyWithImpl<_SessionRecord>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SessionRecord &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen) &&
            (identical(other.valueSequence, valueSequence) ||
                other.valueSequence == valueSequence) &&
            (identical(other.valueName, valueName) ||
                other.valueName == valueName) &&
            (identical(other.attendance, attendance) ||
                other.attendance == attendance) &&
            (identical(other.incomplete, incomplete) ||
                other.incomplete == incomplete) &&
            (identical(other.syncedLate, syncedLate) ||
                other.syncedLate == syncedLate));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    sessionId,
    scheduledAt,
    isOpen,
    valueSequence,
    valueName,
    attendance,
    incomplete,
    syncedLate,
  );

  @override
  String toString() {
    return 'SessionRecord(sessionId: $sessionId, scheduledAt: $scheduledAt, isOpen: $isOpen, valueSequence: $valueSequence, valueName: $valueName, attendance: $attendance, incomplete: $incomplete, syncedLate: $syncedLate)';
  }
}

/// @nodoc
abstract mixin class _$SessionRecordCopyWith<$Res>
    implements $SessionRecordCopyWith<$Res> {
  factory _$SessionRecordCopyWith(
    _SessionRecord value,
    $Res Function(_SessionRecord) _then,
  ) = __$SessionRecordCopyWithImpl;
  @override
  @useResult
  $Res call({
    String sessionId,
    DateTime scheduledAt,
    bool isOpen,
    int? valueSequence,
    String? valueName,
    AttendanceStatus? attendance,
    bool incomplete,
    bool syncedLate,
  });
}

/// @nodoc
class __$SessionRecordCopyWithImpl<$Res>
    implements _$SessionRecordCopyWith<$Res> {
  __$SessionRecordCopyWithImpl(this._self, this._then);

  final _SessionRecord _self;
  final $Res Function(_SessionRecord) _then;

  /// Create a copy of SessionRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sessionId = null,
    Object? scheduledAt = null,
    Object? isOpen = null,
    Object? valueSequence = freezed,
    Object? valueName = freezed,
    Object? attendance = freezed,
    Object? incomplete = null,
    Object? syncedLate = null,
  }) {
    return _then(
      _SessionRecord(
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
        attendance: freezed == attendance
            ? _self.attendance
            : attendance // ignore: cast_nullable_to_non_nullable
                  as AttendanceStatus?,
        incomplete: null == incomplete
            ? _self.incomplete
            : incomplete // ignore: cast_nullable_to_non_nullable
                  as bool,
        syncedLate: null == syncedLate
            ? _self.syncedLate
            : syncedLate // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
mixin _$MemberHistory {
  String get personId;
  String get name;
  List<ValueProgress> get values;

  /// Newest first.
  List<SessionRecord> get sessions;

  /// Create a copy of MemberHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MemberHistoryCopyWith<MemberHistory> get copyWith =>
      _$MemberHistoryCopyWithImpl<MemberHistory>(
        this as MemberHistory,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MemberHistory &&
            (identical(other.personId, personId) ||
                other.personId == personId) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.values, values) &&
            const DeepCollectionEquality().equals(other.sessions, sessions));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    personId,
    name,
    const DeepCollectionEquality().hash(values),
    const DeepCollectionEquality().hash(sessions),
  );

  @override
  String toString() {
    return 'MemberHistory(personId: $personId, name: $name, values: $values, sessions: $sessions)';
  }
}

/// @nodoc
abstract mixin class $MemberHistoryCopyWith<$Res> {
  factory $MemberHistoryCopyWith(
    MemberHistory value,
    $Res Function(MemberHistory) _then,
  ) = _$MemberHistoryCopyWithImpl;
  @useResult
  $Res call({
    String personId,
    String name,
    List<ValueProgress> values,
    List<SessionRecord> sessions,
  });
}

/// @nodoc
class _$MemberHistoryCopyWithImpl<$Res>
    implements $MemberHistoryCopyWith<$Res> {
  _$MemberHistoryCopyWithImpl(this._self, this._then);

  final MemberHistory _self;
  final $Res Function(MemberHistory) _then;

  /// Create a copy of MemberHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? personId = null,
    Object? name = null,
    Object? values = null,
    Object? sessions = null,
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
        values: null == values
            ? _self.values
            : values // ignore: cast_nullable_to_non_nullable
                  as List<ValueProgress>,
        sessions: null == sessions
            ? _self.sessions
            : sessions // ignore: cast_nullable_to_non_nullable
                  as List<SessionRecord>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [MemberHistory].
extension MemberHistoryPatterns on MemberHistory {
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
    TResult Function(_MemberHistory value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MemberHistory() when $default != null:
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
    TResult Function(_MemberHistory value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberHistory():
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
    TResult? Function(_MemberHistory value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberHistory() when $default != null:
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
      List<ValueProgress> values,
      List<SessionRecord> sessions,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MemberHistory() when $default != null:
        return $default(
          _that.personId,
          _that.name,
          _that.values,
          _that.sessions,
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
      List<ValueProgress> values,
      List<SessionRecord> sessions,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberHistory():
        return $default(
          _that.personId,
          _that.name,
          _that.values,
          _that.sessions,
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
      List<ValueProgress> values,
      List<SessionRecord> sessions,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MemberHistory() when $default != null:
        return $default(
          _that.personId,
          _that.name,
          _that.values,
          _that.sessions,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MemberHistory extends MemberHistory {
  const _MemberHistory({
    required this.personId,
    required this.name,
    final List<ValueProgress> values = const [],
    final List<SessionRecord> sessions = const [],
  }) : _values = values,
       _sessions = sessions,
       super._();

  @override
  final String personId;
  @override
  final String name;
  final List<ValueProgress> _values;
  @override
  @JsonKey()
  List<ValueProgress> get values {
    if (_values is EqualUnmodifiableListView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_values);
  }

  /// Newest first.
  final List<SessionRecord> _sessions;

  /// Newest first.
  @override
  @JsonKey()
  List<SessionRecord> get sessions {
    if (_sessions is EqualUnmodifiableListView) return _sessions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sessions);
  }

  /// Create a copy of MemberHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MemberHistoryCopyWith<_MemberHistory> get copyWith =>
      __$MemberHistoryCopyWithImpl<_MemberHistory>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MemberHistory &&
            (identical(other.personId, personId) ||
                other.personId == personId) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._values, _values) &&
            const DeepCollectionEquality().equals(other._sessions, _sessions));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    personId,
    name,
    const DeepCollectionEquality().hash(_values),
    const DeepCollectionEquality().hash(_sessions),
  );

  @override
  String toString() {
    return 'MemberHistory(personId: $personId, name: $name, values: $values, sessions: $sessions)';
  }
}

/// @nodoc
abstract mixin class _$MemberHistoryCopyWith<$Res>
    implements $MemberHistoryCopyWith<$Res> {
  factory _$MemberHistoryCopyWith(
    _MemberHistory value,
    $Res Function(_MemberHistory) _then,
  ) = __$MemberHistoryCopyWithImpl;
  @override
  @useResult
  $Res call({
    String personId,
    String name,
    List<ValueProgress> values,
    List<SessionRecord> sessions,
  });
}

/// @nodoc
class __$MemberHistoryCopyWithImpl<$Res>
    implements _$MemberHistoryCopyWith<$Res> {
  __$MemberHistoryCopyWithImpl(this._self, this._then);

  final _MemberHistory _self;
  final $Res Function(_MemberHistory) _then;

  /// Create a copy of MemberHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? personId = null,
    Object? name = null,
    Object? values = null,
    Object? sessions = null,
  }) {
    return _then(
      _MemberHistory(
        personId: null == personId
            ? _self.personId
            : personId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        values: null == values
            ? _self._values
            : values // ignore: cast_nullable_to_non_nullable
                  as List<ValueProgress>,
        sessions: null == sessions
            ? _self._sessions
            : sessions // ignore: cast_nullable_to_non_nullable
                  as List<SessionRecord>,
      ),
    );
  }
}
