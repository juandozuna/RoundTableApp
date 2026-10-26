// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_responses.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MyResponses {
  FollowUpResponse? get followUp;
  ReflectionResponse? get reflection;
  CommitmentResponse? get commitment;

  /// Create a copy of MyResponses
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MyResponsesCopyWith<MyResponses> get copyWith =>
      _$MyResponsesCopyWithImpl<MyResponses>(this as MyResponses, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MyResponses &&
            (identical(other.followUp, followUp) ||
                other.followUp == followUp) &&
            (identical(other.reflection, reflection) ||
                other.reflection == reflection) &&
            (identical(other.commitment, commitment) ||
                other.commitment == commitment));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, followUp, reflection, commitment);

  @override
  String toString() {
    return 'MyResponses(followUp: $followUp, reflection: $reflection, commitment: $commitment)';
  }
}

/// @nodoc
abstract mixin class $MyResponsesCopyWith<$Res> {
  factory $MyResponsesCopyWith(
    MyResponses value,
    $Res Function(MyResponses) _then,
  ) = _$MyResponsesCopyWithImpl;
  @useResult
  $Res call({
    FollowUpResponse? followUp,
    ReflectionResponse? reflection,
    CommitmentResponse? commitment,
  });

  $FollowUpResponseCopyWith<$Res>? get followUp;
  $ReflectionResponseCopyWith<$Res>? get reflection;
  $CommitmentResponseCopyWith<$Res>? get commitment;
}

/// @nodoc
class _$MyResponsesCopyWithImpl<$Res> implements $MyResponsesCopyWith<$Res> {
  _$MyResponsesCopyWithImpl(this._self, this._then);

  final MyResponses _self;
  final $Res Function(MyResponses) _then;

  /// Create a copy of MyResponses
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? followUp = freezed,
    Object? reflection = freezed,
    Object? commitment = freezed,
  }) {
    return _then(
      _self.copyWith(
        followUp: freezed == followUp
            ? _self.followUp
            : followUp // ignore: cast_nullable_to_non_nullable
                  as FollowUpResponse?,
        reflection: freezed == reflection
            ? _self.reflection
            : reflection // ignore: cast_nullable_to_non_nullable
                  as ReflectionResponse?,
        commitment: freezed == commitment
            ? _self.commitment
            : commitment // ignore: cast_nullable_to_non_nullable
                  as CommitmentResponse?,
      ),
    );
  }

  /// Create a copy of MyResponses
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowUpResponseCopyWith<$Res>? get followUp {
    if (_self.followUp == null) {
      return null;
    }

    return $FollowUpResponseCopyWith<$Res>(_self.followUp!, (value) {
      return _then(_self.copyWith(followUp: value));
    });
  }

  /// Create a copy of MyResponses
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReflectionResponseCopyWith<$Res>? get reflection {
    if (_self.reflection == null) {
      return null;
    }

    return $ReflectionResponseCopyWith<$Res>(_self.reflection!, (value) {
      return _then(_self.copyWith(reflection: value));
    });
  }

  /// Create a copy of MyResponses
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommitmentResponseCopyWith<$Res>? get commitment {
    if (_self.commitment == null) {
      return null;
    }

    return $CommitmentResponseCopyWith<$Res>(_self.commitment!, (value) {
      return _then(_self.copyWith(commitment: value));
    });
  }
}

/// Adds pattern-matching-related methods to [MyResponses].
extension MyResponsesPatterns on MyResponses {
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
    TResult Function(_MyResponses value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MyResponses() when $default != null:
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
    TResult Function(_MyResponses value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MyResponses():
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
    TResult? Function(_MyResponses value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MyResponses() when $default != null:
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
      FollowUpResponse? followUp,
      ReflectionResponse? reflection,
      CommitmentResponse? commitment,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MyResponses() when $default != null:
        return $default(_that.followUp, _that.reflection, _that.commitment);
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
      FollowUpResponse? followUp,
      ReflectionResponse? reflection,
      CommitmentResponse? commitment,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MyResponses():
        return $default(_that.followUp, _that.reflection, _that.commitment);
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
      FollowUpResponse? followUp,
      ReflectionResponse? reflection,
      CommitmentResponse? commitment,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MyResponses() when $default != null:
        return $default(_that.followUp, _that.reflection, _that.commitment);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MyResponses implements MyResponses {
  const _MyResponses({this.followUp, this.reflection, this.commitment});

  @override
  final FollowUpResponse? followUp;
  @override
  final ReflectionResponse? reflection;
  @override
  final CommitmentResponse? commitment;

  /// Create a copy of MyResponses
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MyResponsesCopyWith<_MyResponses> get copyWith =>
      __$MyResponsesCopyWithImpl<_MyResponses>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MyResponses &&
            (identical(other.followUp, followUp) ||
                other.followUp == followUp) &&
            (identical(other.reflection, reflection) ||
                other.reflection == reflection) &&
            (identical(other.commitment, commitment) ||
                other.commitment == commitment));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, followUp, reflection, commitment);

  @override
  String toString() {
    return 'MyResponses(followUp: $followUp, reflection: $reflection, commitment: $commitment)';
  }
}

/// @nodoc
abstract mixin class _$MyResponsesCopyWith<$Res>
    implements $MyResponsesCopyWith<$Res> {
  factory _$MyResponsesCopyWith(
    _MyResponses value,
    $Res Function(_MyResponses) _then,
  ) = __$MyResponsesCopyWithImpl;
  @override
  @useResult
  $Res call({
    FollowUpResponse? followUp,
    ReflectionResponse? reflection,
    CommitmentResponse? commitment,
  });

  @override
  $FollowUpResponseCopyWith<$Res>? get followUp;
  @override
  $ReflectionResponseCopyWith<$Res>? get reflection;
  @override
  $CommitmentResponseCopyWith<$Res>? get commitment;
}

/// @nodoc
class __$MyResponsesCopyWithImpl<$Res> implements _$MyResponsesCopyWith<$Res> {
  __$MyResponsesCopyWithImpl(this._self, this._then);

  final _MyResponses _self;
  final $Res Function(_MyResponses) _then;

  /// Create a copy of MyResponses
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? followUp = freezed,
    Object? reflection = freezed,
    Object? commitment = freezed,
  }) {
    return _then(
      _MyResponses(
        followUp: freezed == followUp
            ? _self.followUp
            : followUp // ignore: cast_nullable_to_non_nullable
                  as FollowUpResponse?,
        reflection: freezed == reflection
            ? _self.reflection
            : reflection // ignore: cast_nullable_to_non_nullable
                  as ReflectionResponse?,
        commitment: freezed == commitment
            ? _self.commitment
            : commitment // ignore: cast_nullable_to_non_nullable
                  as CommitmentResponse?,
      ),
    );
  }

  /// Create a copy of MyResponses
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowUpResponseCopyWith<$Res>? get followUp {
    if (_self.followUp == null) {
      return null;
    }

    return $FollowUpResponseCopyWith<$Res>(_self.followUp!, (value) {
      return _then(_self.copyWith(followUp: value));
    });
  }

  /// Create a copy of MyResponses
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReflectionResponseCopyWith<$Res>? get reflection {
    if (_self.reflection == null) {
      return null;
    }

    return $ReflectionResponseCopyWith<$Res>(_self.reflection!, (value) {
      return _then(_self.copyWith(reflection: value));
    });
  }

  /// Create a copy of MyResponses
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CommitmentResponseCopyWith<$Res>? get commitment {
    if (_self.commitment == null) {
      return null;
    }

    return $CommitmentResponseCopyWith<$Res>(_self.commitment!, (value) {
      return _then(_self.copyWith(commitment: value));
    });
  }
}

/// @nodoc
mixin _$FollowUpResponse {
  CommitmentFollowUpStatus get status;
  int get score;
  String? get note;

  /// Create a copy of FollowUpResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowUpResponseCopyWith<FollowUpResponse> get copyWith =>
      _$FollowUpResponseCopyWithImpl<FollowUpResponse>(
        this as FollowUpResponse,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FollowUpResponse &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, score, note);

  @override
  String toString() {
    return 'FollowUpResponse(status: $status, score: $score, note: $note)';
  }
}

/// @nodoc
abstract mixin class $FollowUpResponseCopyWith<$Res> {
  factory $FollowUpResponseCopyWith(
    FollowUpResponse value,
    $Res Function(FollowUpResponse) _then,
  ) = _$FollowUpResponseCopyWithImpl;
  @useResult
  $Res call({CommitmentFollowUpStatus status, int score, String? note});
}

/// @nodoc
class _$FollowUpResponseCopyWithImpl<$Res>
    implements $FollowUpResponseCopyWith<$Res> {
  _$FollowUpResponseCopyWithImpl(this._self, this._then);

  final FollowUpResponse _self;
  final $Res Function(FollowUpResponse) _then;

  /// Create a copy of FollowUpResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? score = null,
    Object? note = freezed,
  }) {
    return _then(
      _self.copyWith(
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
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [FollowUpResponse].
extension FollowUpResponsePatterns on FollowUpResponse {
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
    TResult Function(_FollowUpResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowUpResponse() when $default != null:
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
    TResult Function(_FollowUpResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowUpResponse():
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
    TResult? Function(_FollowUpResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowUpResponse() when $default != null:
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
    TResult Function(CommitmentFollowUpStatus status, int score, String? note)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowUpResponse() when $default != null:
        return $default(_that.status, _that.score, _that.note);
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
    TResult Function(CommitmentFollowUpStatus status, int score, String? note)
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowUpResponse():
        return $default(_that.status, _that.score, _that.note);
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
    TResult? Function(CommitmentFollowUpStatus status, int score, String? note)?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowUpResponse() when $default != null:
        return $default(_that.status, _that.score, _that.note);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FollowUpResponse implements FollowUpResponse {
  const _FollowUpResponse({
    required this.status,
    required this.score,
    this.note,
  });

  @override
  final CommitmentFollowUpStatus status;
  @override
  final int score;
  @override
  final String? note;

  /// Create a copy of FollowUpResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FollowUpResponseCopyWith<_FollowUpResponse> get copyWith =>
      __$FollowUpResponseCopyWithImpl<_FollowUpResponse>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FollowUpResponse &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, score, note);

  @override
  String toString() {
    return 'FollowUpResponse(status: $status, score: $score, note: $note)';
  }
}

/// @nodoc
abstract mixin class _$FollowUpResponseCopyWith<$Res>
    implements $FollowUpResponseCopyWith<$Res> {
  factory _$FollowUpResponseCopyWith(
    _FollowUpResponse value,
    $Res Function(_FollowUpResponse) _then,
  ) = __$FollowUpResponseCopyWithImpl;
  @override
  @useResult
  $Res call({CommitmentFollowUpStatus status, int score, String? note});
}

/// @nodoc
class __$FollowUpResponseCopyWithImpl<$Res>
    implements _$FollowUpResponseCopyWith<$Res> {
  __$FollowUpResponseCopyWithImpl(this._self, this._then);

  final _FollowUpResponse _self;
  final $Res Function(_FollowUpResponse) _then;

  /// Create a copy of FollowUpResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? score = null,
    Object? note = freezed,
  }) {
    return _then(
      _FollowUpResponse(
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
      ),
    );
  }
}

/// @nodoc
mixin _$ReflectionResponse {
  /// Answer text by question id.
  Map<String, String> get answers;
  int get score;

  /// Create a copy of ReflectionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReflectionResponseCopyWith<ReflectionResponse> get copyWith =>
      _$ReflectionResponseCopyWithImpl<ReflectionResponse>(
        this as ReflectionResponse,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReflectionResponse &&
            const DeepCollectionEquality().equals(other.answers, answers) &&
            (identical(other.score, score) || other.score == score));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(answers),
    score,
  );

  @override
  String toString() {
    return 'ReflectionResponse(answers: $answers, score: $score)';
  }
}

/// @nodoc
abstract mixin class $ReflectionResponseCopyWith<$Res> {
  factory $ReflectionResponseCopyWith(
    ReflectionResponse value,
    $Res Function(ReflectionResponse) _then,
  ) = _$ReflectionResponseCopyWithImpl;
  @useResult
  $Res call({Map<String, String> answers, int score});
}

/// @nodoc
class _$ReflectionResponseCopyWithImpl<$Res>
    implements $ReflectionResponseCopyWith<$Res> {
  _$ReflectionResponseCopyWithImpl(this._self, this._then);

  final ReflectionResponse _self;
  final $Res Function(ReflectionResponse) _then;

  /// Create a copy of ReflectionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? answers = null, Object? score = null}) {
    return _then(
      _self.copyWith(
        answers: null == answers
            ? _self.answers
            : answers // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>,
        score: null == score
            ? _self.score
            : score // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [ReflectionResponse].
extension ReflectionResponsePatterns on ReflectionResponse {
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
    TResult Function(_ReflectionResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReflectionResponse() when $default != null:
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
    TResult Function(_ReflectionResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReflectionResponse():
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
    TResult? Function(_ReflectionResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReflectionResponse() when $default != null:
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
    TResult Function(Map<String, String> answers, int score)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReflectionResponse() when $default != null:
        return $default(_that.answers, _that.score);
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
    TResult Function(Map<String, String> answers, int score) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReflectionResponse():
        return $default(_that.answers, _that.score);
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
    TResult? Function(Map<String, String> answers, int score)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReflectionResponse() when $default != null:
        return $default(_that.answers, _that.score);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ReflectionResponse implements ReflectionResponse {
  const _ReflectionResponse({
    required final Map<String, String> answers,
    required this.score,
  }) : _answers = answers;

  /// Answer text by question id.
  final Map<String, String> _answers;

  /// Answer text by question id.
  @override
  Map<String, String> get answers {
    if (_answers is EqualUnmodifiableMapView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_answers);
  }

  @override
  final int score;

  /// Create a copy of ReflectionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReflectionResponseCopyWith<_ReflectionResponse> get copyWith =>
      __$ReflectionResponseCopyWithImpl<_ReflectionResponse>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReflectionResponse &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.score, score) || other.score == score));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_answers),
    score,
  );

  @override
  String toString() {
    return 'ReflectionResponse(answers: $answers, score: $score)';
  }
}

/// @nodoc
abstract mixin class _$ReflectionResponseCopyWith<$Res>
    implements $ReflectionResponseCopyWith<$Res> {
  factory _$ReflectionResponseCopyWith(
    _ReflectionResponse value,
    $Res Function(_ReflectionResponse) _then,
  ) = __$ReflectionResponseCopyWithImpl;
  @override
  @useResult
  $Res call({Map<String, String> answers, int score});
}

/// @nodoc
class __$ReflectionResponseCopyWithImpl<$Res>
    implements _$ReflectionResponseCopyWith<$Res> {
  __$ReflectionResponseCopyWithImpl(this._self, this._then);

  final _ReflectionResponse _self;
  final $Res Function(_ReflectionResponse) _then;

  /// Create a copy of ReflectionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? answers = null, Object? score = null}) {
    return _then(
      _ReflectionResponse(
        answers: null == answers
            ? _self._answers
            : answers // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>,
        score: null == score
            ? _self.score
            : score // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
mixin _$CommitmentResponse {
  String get actionText;
  String? get measureText;

  /// Create a copy of CommitmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CommitmentResponseCopyWith<CommitmentResponse> get copyWith =>
      _$CommitmentResponseCopyWithImpl<CommitmentResponse>(
        this as CommitmentResponse,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CommitmentResponse &&
            (identical(other.actionText, actionText) ||
                other.actionText == actionText) &&
            (identical(other.measureText, measureText) ||
                other.measureText == measureText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, actionText, measureText);

  @override
  String toString() {
    return 'CommitmentResponse(actionText: $actionText, measureText: $measureText)';
  }
}

/// @nodoc
abstract mixin class $CommitmentResponseCopyWith<$Res> {
  factory $CommitmentResponseCopyWith(
    CommitmentResponse value,
    $Res Function(CommitmentResponse) _then,
  ) = _$CommitmentResponseCopyWithImpl;
  @useResult
  $Res call({String actionText, String? measureText});
}

/// @nodoc
class _$CommitmentResponseCopyWithImpl<$Res>
    implements $CommitmentResponseCopyWith<$Res> {
  _$CommitmentResponseCopyWithImpl(this._self, this._then);

  final CommitmentResponse _self;
  final $Res Function(CommitmentResponse) _then;

  /// Create a copy of CommitmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? actionText = null, Object? measureText = freezed}) {
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
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [CommitmentResponse].
extension CommitmentResponsePatterns on CommitmentResponse {
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
    TResult Function(_CommitmentResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CommitmentResponse() when $default != null:
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
    TResult Function(_CommitmentResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CommitmentResponse():
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
    TResult? Function(_CommitmentResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CommitmentResponse() when $default != null:
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
    TResult Function(String actionText, String? measureText)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CommitmentResponse() when $default != null:
        return $default(_that.actionText, _that.measureText);
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
    TResult Function(String actionText, String? measureText) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CommitmentResponse():
        return $default(_that.actionText, _that.measureText);
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
    TResult? Function(String actionText, String? measureText)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CommitmentResponse() when $default != null:
        return $default(_that.actionText, _that.measureText);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CommitmentResponse implements CommitmentResponse {
  const _CommitmentResponse({required this.actionText, this.measureText});

  @override
  final String actionText;
  @override
  final String? measureText;

  /// Create a copy of CommitmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CommitmentResponseCopyWith<_CommitmentResponse> get copyWith =>
      __$CommitmentResponseCopyWithImpl<_CommitmentResponse>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CommitmentResponse &&
            (identical(other.actionText, actionText) ||
                other.actionText == actionText) &&
            (identical(other.measureText, measureText) ||
                other.measureText == measureText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, actionText, measureText);

  @override
  String toString() {
    return 'CommitmentResponse(actionText: $actionText, measureText: $measureText)';
  }
}

/// @nodoc
abstract mixin class _$CommitmentResponseCopyWith<$Res>
    implements $CommitmentResponseCopyWith<$Res> {
  factory _$CommitmentResponseCopyWith(
    _CommitmentResponse value,
    $Res Function(_CommitmentResponse) _then,
  ) = __$CommitmentResponseCopyWithImpl;
  @override
  @useResult
  $Res call({String actionText, String? measureText});
}

/// @nodoc
class __$CommitmentResponseCopyWithImpl<$Res>
    implements _$CommitmentResponseCopyWith<$Res> {
  __$CommitmentResponseCopyWithImpl(this._self, this._then);

  final _CommitmentResponse _self;
  final $Res Function(_CommitmentResponse) _then;

  /// Create a copy of CommitmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? actionText = null, Object? measureText = freezed}) {
    return _then(
      _CommitmentResponse(
        actionText: null == actionText
            ? _self.actionText
            : actionText // ignore: cast_nullable_to_non_nullable
                  as String,
        measureText: freezed == measureText
            ? _self.measureText
            : measureText // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}
