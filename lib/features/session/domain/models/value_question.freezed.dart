// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'value_question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ValueQuestion {
  String get id;
  String get text;
  int get sortOrder;
  QuestionResponseType get responseType;

  /// Create a copy of ValueQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ValueQuestionCopyWith<ValueQuestion> get copyWith =>
      _$ValueQuestionCopyWithImpl<ValueQuestion>(
        this as ValueQuestion,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ValueQuestion &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.responseType, responseType) ||
                other.responseType == responseType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, text, sortOrder, responseType);

  @override
  String toString() {
    return 'ValueQuestion(id: $id, text: $text, sortOrder: $sortOrder, responseType: $responseType)';
  }
}

/// @nodoc
abstract mixin class $ValueQuestionCopyWith<$Res> {
  factory $ValueQuestionCopyWith(
    ValueQuestion value,
    $Res Function(ValueQuestion) _then,
  ) = _$ValueQuestionCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String text,
    int sortOrder,
    QuestionResponseType responseType,
  });
}

/// @nodoc
class _$ValueQuestionCopyWithImpl<$Res>
    implements $ValueQuestionCopyWith<$Res> {
  _$ValueQuestionCopyWithImpl(this._self, this._then);

  final ValueQuestion _self;
  final $Res Function(ValueQuestion) _then;

  /// Create a copy of ValueQuestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? sortOrder = null,
    Object? responseType = null,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        text: null == text
            ? _self.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
        sortOrder: null == sortOrder
            ? _self.sortOrder
            : sortOrder // ignore: cast_nullable_to_non_nullable
                  as int,
        responseType: null == responseType
            ? _self.responseType
            : responseType // ignore: cast_nullable_to_non_nullable
                  as QuestionResponseType,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [ValueQuestion].
extension ValueQuestionPatterns on ValueQuestion {
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
    TResult Function(_ValueQuestion value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ValueQuestion() when $default != null:
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
    TResult Function(_ValueQuestion value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ValueQuestion():
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
    TResult? Function(_ValueQuestion value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ValueQuestion() when $default != null:
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
      String text,
      int sortOrder,
      QuestionResponseType responseType,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ValueQuestion() when $default != null:
        return $default(
          _that.id,
          _that.text,
          _that.sortOrder,
          _that.responseType,
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
      String text,
      int sortOrder,
      QuestionResponseType responseType,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ValueQuestion():
        return $default(
          _that.id,
          _that.text,
          _that.sortOrder,
          _that.responseType,
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
      String text,
      int sortOrder,
      QuestionResponseType responseType,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ValueQuestion() when $default != null:
        return $default(
          _that.id,
          _that.text,
          _that.sortOrder,
          _that.responseType,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ValueQuestion implements ValueQuestion {
  const _ValueQuestion({
    required this.id,
    required this.text,
    required this.sortOrder,
    this.responseType = QuestionResponseType.text,
  });

  @override
  final String id;
  @override
  final String text;
  @override
  final int sortOrder;
  @override
  @JsonKey()
  final QuestionResponseType responseType;

  /// Create a copy of ValueQuestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ValueQuestionCopyWith<_ValueQuestion> get copyWith =>
      __$ValueQuestionCopyWithImpl<_ValueQuestion>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ValueQuestion &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.responseType, responseType) ||
                other.responseType == responseType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, text, sortOrder, responseType);

  @override
  String toString() {
    return 'ValueQuestion(id: $id, text: $text, sortOrder: $sortOrder, responseType: $responseType)';
  }
}

/// @nodoc
abstract mixin class _$ValueQuestionCopyWith<$Res>
    implements $ValueQuestionCopyWith<$Res> {
  factory _$ValueQuestionCopyWith(
    _ValueQuestion value,
    $Res Function(_ValueQuestion) _then,
  ) = __$ValueQuestionCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String text,
    int sortOrder,
    QuestionResponseType responseType,
  });
}

/// @nodoc
class __$ValueQuestionCopyWithImpl<$Res>
    implements _$ValueQuestionCopyWith<$Res> {
  __$ValueQuestionCopyWithImpl(this._self, this._then);

  final _ValueQuestion _self;
  final $Res Function(_ValueQuestion) _then;

  /// Create a copy of ValueQuestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? sortOrder = null,
    Object? responseType = null,
  }) {
    return _then(
      _ValueQuestion(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        text: null == text
            ? _self.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
        sortOrder: null == sortOrder
            ? _self.sortOrder
            : sortOrder // ignore: cast_nullable_to_non_nullable
                  as int,
        responseType: null == responseType
            ? _self.responseType
            : responseType // ignore: cast_nullable_to_non_nullable
                  as QuestionResponseType,
      ),
    );
  }
}
