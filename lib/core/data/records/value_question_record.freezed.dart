// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'value_question_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ValueQuestionRecord {
  String get id;
  String get valueId;
  String get questionCode;
  String get questionText;
  int get sortOrder;
  String get responseType;
  String get status;

  /// Create a copy of ValueQuestionRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ValueQuestionRecordCopyWith<ValueQuestionRecord> get copyWith =>
      _$ValueQuestionRecordCopyWithImpl<ValueQuestionRecord>(
        this as ValueQuestionRecord,
        _$identity,
      );

  /// Serializes this ValueQuestionRecord to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ValueQuestionRecord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.valueId, valueId) || other.valueId == valueId) &&
            (identical(other.questionCode, questionCode) ||
                other.questionCode == questionCode) &&
            (identical(other.questionText, questionText) ||
                other.questionText == questionText) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.responseType, responseType) ||
                other.responseType == responseType) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    valueId,
    questionCode,
    questionText,
    sortOrder,
    responseType,
    status,
  );

  @override
  String toString() {
    return 'ValueQuestionRecord(id: $id, valueId: $valueId, questionCode: $questionCode, questionText: $questionText, sortOrder: $sortOrder, responseType: $responseType, status: $status)';
  }
}

/// @nodoc
abstract mixin class $ValueQuestionRecordCopyWith<$Res> {
  factory $ValueQuestionRecordCopyWith(
    ValueQuestionRecord value,
    $Res Function(ValueQuestionRecord) _then,
  ) = _$ValueQuestionRecordCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String valueId,
    String questionCode,
    String questionText,
    int sortOrder,
    String responseType,
    String status,
  });
}

/// @nodoc
class _$ValueQuestionRecordCopyWithImpl<$Res>
    implements $ValueQuestionRecordCopyWith<$Res> {
  _$ValueQuestionRecordCopyWithImpl(this._self, this._then);

  final ValueQuestionRecord _self;
  final $Res Function(ValueQuestionRecord) _then;

  /// Create a copy of ValueQuestionRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? valueId = null,
    Object? questionCode = null,
    Object? questionText = null,
    Object? sortOrder = null,
    Object? responseType = null,
    Object? status = null,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        valueId: null == valueId
            ? _self.valueId
            : valueId // ignore: cast_nullable_to_non_nullable
                  as String,
        questionCode: null == questionCode
            ? _self.questionCode
            : questionCode // ignore: cast_nullable_to_non_nullable
                  as String,
        questionText: null == questionText
            ? _self.questionText
            : questionText // ignore: cast_nullable_to_non_nullable
                  as String,
        sortOrder: null == sortOrder
            ? _self.sortOrder
            : sortOrder // ignore: cast_nullable_to_non_nullable
                  as int,
        responseType: null == responseType
            ? _self.responseType
            : responseType // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [ValueQuestionRecord].
extension ValueQuestionRecordPatterns on ValueQuestionRecord {
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
    TResult Function(_ValueQuestionRecord value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ValueQuestionRecord() when $default != null:
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
    TResult Function(_ValueQuestionRecord value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ValueQuestionRecord():
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
    TResult? Function(_ValueQuestionRecord value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ValueQuestionRecord() when $default != null:
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
      String valueId,
      String questionCode,
      String questionText,
      int sortOrder,
      String responseType,
      String status,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ValueQuestionRecord() when $default != null:
        return $default(
          _that.id,
          _that.valueId,
          _that.questionCode,
          _that.questionText,
          _that.sortOrder,
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
      String id,
      String valueId,
      String questionCode,
      String questionText,
      int sortOrder,
      String responseType,
      String status,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ValueQuestionRecord():
        return $default(
          _that.id,
          _that.valueId,
          _that.questionCode,
          _that.questionText,
          _that.sortOrder,
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
      String id,
      String valueId,
      String questionCode,
      String questionText,
      int sortOrder,
      String responseType,
      String status,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ValueQuestionRecord() when $default != null:
        return $default(
          _that.id,
          _that.valueId,
          _that.questionCode,
          _that.questionText,
          _that.sortOrder,
          _that.responseType,
          _that.status,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ValueQuestionRecord implements ValueQuestionRecord {
  const _ValueQuestionRecord({
    required this.id,
    required this.valueId,
    required this.questionCode,
    required this.questionText,
    required this.sortOrder,
    required this.responseType,
    required this.status,
  });
  factory _ValueQuestionRecord.fromJson(Map<String, dynamic> json) =>
      _$ValueQuestionRecordFromJson(json);

  @override
  final String id;
  @override
  final String valueId;
  @override
  final String questionCode;
  @override
  final String questionText;
  @override
  final int sortOrder;
  @override
  final String responseType;
  @override
  final String status;

  /// Create a copy of ValueQuestionRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ValueQuestionRecordCopyWith<_ValueQuestionRecord> get copyWith =>
      __$ValueQuestionRecordCopyWithImpl<_ValueQuestionRecord>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$ValueQuestionRecordToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ValueQuestionRecord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.valueId, valueId) || other.valueId == valueId) &&
            (identical(other.questionCode, questionCode) ||
                other.questionCode == questionCode) &&
            (identical(other.questionText, questionText) ||
                other.questionText == questionText) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.responseType, responseType) ||
                other.responseType == responseType) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    valueId,
    questionCode,
    questionText,
    sortOrder,
    responseType,
    status,
  );

  @override
  String toString() {
    return 'ValueQuestionRecord(id: $id, valueId: $valueId, questionCode: $questionCode, questionText: $questionText, sortOrder: $sortOrder, responseType: $responseType, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$ValueQuestionRecordCopyWith<$Res>
    implements $ValueQuestionRecordCopyWith<$Res> {
  factory _$ValueQuestionRecordCopyWith(
    _ValueQuestionRecord value,
    $Res Function(_ValueQuestionRecord) _then,
  ) = __$ValueQuestionRecordCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String valueId,
    String questionCode,
    String questionText,
    int sortOrder,
    String responseType,
    String status,
  });
}

/// @nodoc
class __$ValueQuestionRecordCopyWithImpl<$Res>
    implements _$ValueQuestionRecordCopyWith<$Res> {
  __$ValueQuestionRecordCopyWithImpl(this._self, this._then);

  final _ValueQuestionRecord _self;
  final $Res Function(_ValueQuestionRecord) _then;

  /// Create a copy of ValueQuestionRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? valueId = null,
    Object? questionCode = null,
    Object? questionText = null,
    Object? sortOrder = null,
    Object? responseType = null,
    Object? status = null,
  }) {
    return _then(
      _ValueQuestionRecord(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        valueId: null == valueId
            ? _self.valueId
            : valueId // ignore: cast_nullable_to_non_nullable
                  as String,
        questionCode: null == questionCode
            ? _self.questionCode
            : questionCode // ignore: cast_nullable_to_non_nullable
                  as String,
        questionText: null == questionText
            ? _self.questionText
            : questionText // ignore: cast_nullable_to_non_nullable
                  as String,
        sortOrder: null == sortOrder
            ? _self.sortOrder
            : sortOrder // ignore: cast_nullable_to_non_nullable
                  as int,
        responseType: null == responseType
            ? _self.responseType
            : responseType // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}
