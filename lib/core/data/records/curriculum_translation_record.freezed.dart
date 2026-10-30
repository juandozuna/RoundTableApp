// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'curriculum_translation_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CurriculumTranslationRecord {
  String get id;
  String get locale;
  String get entityType;
  String get entityId;
  String? get name;
  String? get description;
  String? get questionText;

  /// Create a copy of CurriculumTranslationRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CurriculumTranslationRecordCopyWith<CurriculumTranslationRecord>
  get copyWith =>
      _$CurriculumTranslationRecordCopyWithImpl<CurriculumTranslationRecord>(
        this as CurriculumTranslationRecord,
        _$identity,
      );

  /// Serializes this CurriculumTranslationRecord to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CurriculumTranslationRecord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.entityType, entityType) ||
                other.entityType == entityType) &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.questionText, questionText) ||
                other.questionText == questionText));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    locale,
    entityType,
    entityId,
    name,
    description,
    questionText,
  );

  @override
  String toString() {
    return 'CurriculumTranslationRecord(id: $id, locale: $locale, entityType: $entityType, entityId: $entityId, name: $name, description: $description, questionText: $questionText)';
  }
}

/// @nodoc
abstract mixin class $CurriculumTranslationRecordCopyWith<$Res> {
  factory $CurriculumTranslationRecordCopyWith(
    CurriculumTranslationRecord value,
    $Res Function(CurriculumTranslationRecord) _then,
  ) = _$CurriculumTranslationRecordCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String locale,
    String entityType,
    String entityId,
    String? name,
    String? description,
    String? questionText,
  });
}

/// @nodoc
class _$CurriculumTranslationRecordCopyWithImpl<$Res>
    implements $CurriculumTranslationRecordCopyWith<$Res> {
  _$CurriculumTranslationRecordCopyWithImpl(this._self, this._then);

  final CurriculumTranslationRecord _self;
  final $Res Function(CurriculumTranslationRecord) _then;

  /// Create a copy of CurriculumTranslationRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? locale = null,
    Object? entityType = null,
    Object? entityId = null,
    Object? name = freezed,
    Object? description = freezed,
    Object? questionText = freezed,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        locale: null == locale
            ? _self.locale
            : locale // ignore: cast_nullable_to_non_nullable
                  as String,
        entityType: null == entityType
            ? _self.entityType
            : entityType // ignore: cast_nullable_to_non_nullable
                  as String,
        entityId: null == entityId
            ? _self.entityId
            : entityId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: freezed == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _self.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        questionText: freezed == questionText
            ? _self.questionText
            : questionText // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [CurriculumTranslationRecord].
extension CurriculumTranslationRecordPatterns on CurriculumTranslationRecord {
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
    TResult Function(_CurriculumTranslationRecord value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CurriculumTranslationRecord() when $default != null:
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
    TResult Function(_CurriculumTranslationRecord value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumTranslationRecord():
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
    TResult? Function(_CurriculumTranslationRecord value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumTranslationRecord() when $default != null:
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
      String locale,
      String entityType,
      String entityId,
      String? name,
      String? description,
      String? questionText,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CurriculumTranslationRecord() when $default != null:
        return $default(
          _that.id,
          _that.locale,
          _that.entityType,
          _that.entityId,
          _that.name,
          _that.description,
          _that.questionText,
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
      String locale,
      String entityType,
      String entityId,
      String? name,
      String? description,
      String? questionText,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumTranslationRecord():
        return $default(
          _that.id,
          _that.locale,
          _that.entityType,
          _that.entityId,
          _that.name,
          _that.description,
          _that.questionText,
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
      String locale,
      String entityType,
      String entityId,
      String? name,
      String? description,
      String? questionText,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumTranslationRecord() when $default != null:
        return $default(
          _that.id,
          _that.locale,
          _that.entityType,
          _that.entityId,
          _that.name,
          _that.description,
          _that.questionText,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CurriculumTranslationRecord implements CurriculumTranslationRecord {
  const _CurriculumTranslationRecord({
    required this.id,
    required this.locale,
    required this.entityType,
    required this.entityId,
    this.name,
    this.description,
    this.questionText,
  });
  factory _CurriculumTranslationRecord.fromJson(Map<String, dynamic> json) =>
      _$CurriculumTranslationRecordFromJson(json);

  @override
  final String id;
  @override
  final String locale;
  @override
  final String entityType;
  @override
  final String entityId;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? questionText;

  /// Create a copy of CurriculumTranslationRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CurriculumTranslationRecordCopyWith<_CurriculumTranslationRecord>
  get copyWith =>
      __$CurriculumTranslationRecordCopyWithImpl<_CurriculumTranslationRecord>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$CurriculumTranslationRecordToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CurriculumTranslationRecord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.entityType, entityType) ||
                other.entityType == entityType) &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.questionText, questionText) ||
                other.questionText == questionText));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    locale,
    entityType,
    entityId,
    name,
    description,
    questionText,
  );

  @override
  String toString() {
    return 'CurriculumTranslationRecord(id: $id, locale: $locale, entityType: $entityType, entityId: $entityId, name: $name, description: $description, questionText: $questionText)';
  }
}

/// @nodoc
abstract mixin class _$CurriculumTranslationRecordCopyWith<$Res>
    implements $CurriculumTranslationRecordCopyWith<$Res> {
  factory _$CurriculumTranslationRecordCopyWith(
    _CurriculumTranslationRecord value,
    $Res Function(_CurriculumTranslationRecord) _then,
  ) = __$CurriculumTranslationRecordCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String locale,
    String entityType,
    String entityId,
    String? name,
    String? description,
    String? questionText,
  });
}

/// @nodoc
class __$CurriculumTranslationRecordCopyWithImpl<$Res>
    implements _$CurriculumTranslationRecordCopyWith<$Res> {
  __$CurriculumTranslationRecordCopyWithImpl(this._self, this._then);

  final _CurriculumTranslationRecord _self;
  final $Res Function(_CurriculumTranslationRecord) _then;

  /// Create a copy of CurriculumTranslationRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? locale = null,
    Object? entityType = null,
    Object? entityId = null,
    Object? name = freezed,
    Object? description = freezed,
    Object? questionText = freezed,
  }) {
    return _then(
      _CurriculumTranslationRecord(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        locale: null == locale
            ? _self.locale
            : locale // ignore: cast_nullable_to_non_nullable
                  as String,
        entityType: null == entityType
            ? _self.entityType
            : entityType // ignore: cast_nullable_to_non_nullable
                  as String,
        entityId: null == entityId
            ? _self.entityId
            : entityId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: freezed == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _self.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        questionText: freezed == questionText
            ? _self.questionText
            : questionText // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}
