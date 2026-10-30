// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'curriculum_edit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CurriculumEdit {
  CurriculumEntity get entity;
  String get id;
  String? get locale;
  String? get name;
  String? get description;
  String? get bookletReference;
  String? get text;
  QuestionResponseType? get responseType;
  RecordStatus? get status;

  /// Create a copy of CurriculumEdit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CurriculumEditCopyWith<CurriculumEdit> get copyWith =>
      _$CurriculumEditCopyWithImpl<CurriculumEdit>(
        this as CurriculumEdit,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CurriculumEdit &&
            (identical(other.entity, entity) || other.entity == entity) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.bookletReference, bookletReference) ||
                other.bookletReference == bookletReference) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.responseType, responseType) ||
                other.responseType == responseType) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    entity,
    id,
    locale,
    name,
    description,
    bookletReference,
    text,
    responseType,
    status,
  );

  @override
  String toString() {
    return 'CurriculumEdit(entity: $entity, id: $id, locale: $locale, name: $name, description: $description, bookletReference: $bookletReference, text: $text, responseType: $responseType, status: $status)';
  }
}

/// @nodoc
abstract mixin class $CurriculumEditCopyWith<$Res> {
  factory $CurriculumEditCopyWith(
    CurriculumEdit value,
    $Res Function(CurriculumEdit) _then,
  ) = _$CurriculumEditCopyWithImpl;
  @useResult
  $Res call({
    CurriculumEntity entity,
    String id,
    String? locale,
    String? name,
    String? description,
    String? bookletReference,
    String? text,
    QuestionResponseType? responseType,
    RecordStatus? status,
  });
}

/// @nodoc
class _$CurriculumEditCopyWithImpl<$Res>
    implements $CurriculumEditCopyWith<$Res> {
  _$CurriculumEditCopyWithImpl(this._self, this._then);

  final CurriculumEdit _self;
  final $Res Function(CurriculumEdit) _then;

  /// Create a copy of CurriculumEdit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entity = null,
    Object? id = null,
    Object? locale = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? bookletReference = freezed,
    Object? text = freezed,
    Object? responseType = freezed,
    Object? status = freezed,
  }) {
    return _then(
      _self.copyWith(
        entity: null == entity
            ? _self.entity
            : entity // ignore: cast_nullable_to_non_nullable
                  as CurriculumEntity,
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        locale: freezed == locale
            ? _self.locale
            : locale // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _self.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        bookletReference: freezed == bookletReference
            ? _self.bookletReference
            : bookletReference // ignore: cast_nullable_to_non_nullable
                  as String?,
        text: freezed == text
            ? _self.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String?,
        responseType: freezed == responseType
            ? _self.responseType
            : responseType // ignore: cast_nullable_to_non_nullable
                  as QuestionResponseType?,
        status: freezed == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as RecordStatus?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [CurriculumEdit].
extension CurriculumEditPatterns on CurriculumEdit {
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
    TResult Function(_CurriculumEdit value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CurriculumEdit() when $default != null:
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
    TResult Function(_CurriculumEdit value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumEdit():
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
    TResult? Function(_CurriculumEdit value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumEdit() when $default != null:
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
      CurriculumEntity entity,
      String id,
      String? locale,
      String? name,
      String? description,
      String? bookletReference,
      String? text,
      QuestionResponseType? responseType,
      RecordStatus? status,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CurriculumEdit() when $default != null:
        return $default(
          _that.entity,
          _that.id,
          _that.locale,
          _that.name,
          _that.description,
          _that.bookletReference,
          _that.text,
          _that.responseType,
          _that.status,
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
      CurriculumEntity entity,
      String id,
      String? locale,
      String? name,
      String? description,
      String? bookletReference,
      String? text,
      QuestionResponseType? responseType,
      RecordStatus? status,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumEdit():
        return $default(
          _that.entity,
          _that.id,
          _that.locale,
          _that.name,
          _that.description,
          _that.bookletReference,
          _that.text,
          _that.responseType,
          _that.status,
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
      CurriculumEntity entity,
      String id,
      String? locale,
      String? name,
      String? description,
      String? bookletReference,
      String? text,
      QuestionResponseType? responseType,
      RecordStatus? status,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumEdit() when $default != null:
        return $default(
          _that.entity,
          _that.id,
          _that.locale,
          _that.name,
          _that.description,
          _that.bookletReference,
          _that.text,
          _that.responseType,
          _that.status,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CurriculumEdit implements CurriculumEdit {
  const _CurriculumEdit({
    required this.entity,
    required this.id,
    this.locale,
    this.name,
    this.description,
    this.bookletReference,
    this.text,
    this.responseType,
    this.status,
  });

  @override
  final CurriculumEntity entity;
  @override
  final String id;
  @override
  final String? locale;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? bookletReference;
  @override
  final String? text;
  @override
  final QuestionResponseType? responseType;
  @override
  final RecordStatus? status;

  /// Create a copy of CurriculumEdit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CurriculumEditCopyWith<_CurriculumEdit> get copyWith =>
      __$CurriculumEditCopyWithImpl<_CurriculumEdit>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CurriculumEdit &&
            (identical(other.entity, entity) || other.entity == entity) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.bookletReference, bookletReference) ||
                other.bookletReference == bookletReference) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.responseType, responseType) ||
                other.responseType == responseType) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    entity,
    id,
    locale,
    name,
    description,
    bookletReference,
    text,
    responseType,
    status,
  );

  @override
  String toString() {
    return 'CurriculumEdit(entity: $entity, id: $id, locale: $locale, name: $name, description: $description, bookletReference: $bookletReference, text: $text, responseType: $responseType, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$CurriculumEditCopyWith<$Res>
    implements $CurriculumEditCopyWith<$Res> {
  factory _$CurriculumEditCopyWith(
    _CurriculumEdit value,
    $Res Function(_CurriculumEdit) _then,
  ) = __$CurriculumEditCopyWithImpl;
  @override
  @useResult
  $Res call({
    CurriculumEntity entity,
    String id,
    String? locale,
    String? name,
    String? description,
    String? bookletReference,
    String? text,
    QuestionResponseType? responseType,
    RecordStatus? status,
  });
}

/// @nodoc
class __$CurriculumEditCopyWithImpl<$Res>
    implements _$CurriculumEditCopyWith<$Res> {
  __$CurriculumEditCopyWithImpl(this._self, this._then);

  final _CurriculumEdit _self;
  final $Res Function(_CurriculumEdit) _then;

  /// Create a copy of CurriculumEdit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? entity = null,
    Object? id = null,
    Object? locale = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? bookletReference = freezed,
    Object? text = freezed,
    Object? responseType = freezed,
    Object? status = freezed,
  }) {
    return _then(
      _CurriculumEdit(
        entity: null == entity
            ? _self.entity
            : entity // ignore: cast_nullable_to_non_nullable
                  as CurriculumEntity,
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        locale: freezed == locale
            ? _self.locale
            : locale // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _self.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        bookletReference: freezed == bookletReference
            ? _self.bookletReference
            : bookletReference // ignore: cast_nullable_to_non_nullable
                  as String?,
        text: freezed == text
            ? _self.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String?,
        responseType: freezed == responseType
            ? _self.responseType
            : responseType // ignore: cast_nullable_to_non_nullable
                  as QuestionResponseType?,
        status: freezed == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as RecordStatus?,
      ),
    );
  }
}

/// @nodoc
mixin _$NewQuestion {
  String get valueId;
  String get code;
  String get text;
  QuestionResponseType get responseType;

  /// Create a copy of NewQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NewQuestionCopyWith<NewQuestion> get copyWith =>
      _$NewQuestionCopyWithImpl<NewQuestion>(this as NewQuestion, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NewQuestion &&
            (identical(other.valueId, valueId) || other.valueId == valueId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.responseType, responseType) ||
                other.responseType == responseType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, valueId, code, text, responseType);

  @override
  String toString() {
    return 'NewQuestion(valueId: $valueId, code: $code, text: $text, responseType: $responseType)';
  }
}

/// @nodoc
abstract mixin class $NewQuestionCopyWith<$Res> {
  factory $NewQuestionCopyWith(
    NewQuestion value,
    $Res Function(NewQuestion) _then,
  ) = _$NewQuestionCopyWithImpl;
  @useResult
  $Res call({
    String valueId,
    String code,
    String text,
    QuestionResponseType responseType,
  });
}

/// @nodoc
class _$NewQuestionCopyWithImpl<$Res> implements $NewQuestionCopyWith<$Res> {
  _$NewQuestionCopyWithImpl(this._self, this._then);

  final NewQuestion _self;
  final $Res Function(NewQuestion) _then;

  /// Create a copy of NewQuestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? valueId = null,
    Object? code = null,
    Object? text = null,
    Object? responseType = null,
  }) {
    return _then(
      _self.copyWith(
        valueId: null == valueId
            ? _self.valueId
            : valueId // ignore: cast_nullable_to_non_nullable
                  as String,
        code: null == code
            ? _self.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        text: null == text
            ? _self.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
        responseType: null == responseType
            ? _self.responseType
            : responseType // ignore: cast_nullable_to_non_nullable
                  as QuestionResponseType,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [NewQuestion].
extension NewQuestionPatterns on NewQuestion {
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
    TResult Function(_NewQuestion value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NewQuestion() when $default != null:
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
    TResult Function(_NewQuestion value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewQuestion():
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
    TResult? Function(_NewQuestion value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewQuestion() when $default != null:
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
      String code,
      String text,
      QuestionResponseType responseType,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NewQuestion() when $default != null:
        return $default(
          _that.valueId,
          _that.code,
          _that.text,
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
      String valueId,
      String code,
      String text,
      QuestionResponseType responseType,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewQuestion():
        return $default(
          _that.valueId,
          _that.code,
          _that.text,
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
      String valueId,
      String code,
      String text,
      QuestionResponseType responseType,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewQuestion() when $default != null:
        return $default(
          _that.valueId,
          _that.code,
          _that.text,
          _that.responseType,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _NewQuestion implements NewQuestion {
  const _NewQuestion({
    required this.valueId,
    required this.code,
    required this.text,
    this.responseType = QuestionResponseType.text,
  });

  @override
  final String valueId;
  @override
  final String code;
  @override
  final String text;
  @override
  @JsonKey()
  final QuestionResponseType responseType;

  /// Create a copy of NewQuestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NewQuestionCopyWith<_NewQuestion> get copyWith =>
      __$NewQuestionCopyWithImpl<_NewQuestion>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NewQuestion &&
            (identical(other.valueId, valueId) || other.valueId == valueId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.responseType, responseType) ||
                other.responseType == responseType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, valueId, code, text, responseType);

  @override
  String toString() {
    return 'NewQuestion(valueId: $valueId, code: $code, text: $text, responseType: $responseType)';
  }
}

/// @nodoc
abstract mixin class _$NewQuestionCopyWith<$Res>
    implements $NewQuestionCopyWith<$Res> {
  factory _$NewQuestionCopyWith(
    _NewQuestion value,
    $Res Function(_NewQuestion) _then,
  ) = __$NewQuestionCopyWithImpl;
  @override
  @useResult
  $Res call({
    String valueId,
    String code,
    String text,
    QuestionResponseType responseType,
  });
}

/// @nodoc
class __$NewQuestionCopyWithImpl<$Res> implements _$NewQuestionCopyWith<$Res> {
  __$NewQuestionCopyWithImpl(this._self, this._then);

  final _NewQuestion _self;
  final $Res Function(_NewQuestion) _then;

  /// Create a copy of NewQuestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? valueId = null,
    Object? code = null,
    Object? text = null,
    Object? responseType = null,
  }) {
    return _then(
      _NewQuestion(
        valueId: null == valueId
            ? _self.valueId
            : valueId // ignore: cast_nullable_to_non_nullable
                  as String,
        code: null == code
            ? _self.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        text: null == text
            ? _self.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
        responseType: null == responseType
            ? _self.responseType
            : responseType // ignore: cast_nullable_to_non_nullable
                  as QuestionResponseType,
      ),
    );
  }
}
