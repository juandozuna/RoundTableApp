// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'curriculum_module_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CurriculumModuleRecord {
  String get id;
  int get number;
  String get name;
  String? get description;
  int get valueCount;
  String get status;

  /// Create a copy of CurriculumModuleRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CurriculumModuleRecordCopyWith<CurriculumModuleRecord> get copyWith =>
      _$CurriculumModuleRecordCopyWithImpl<CurriculumModuleRecord>(
        this as CurriculumModuleRecord,
        _$identity,
      );

  /// Serializes this CurriculumModuleRecord to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CurriculumModuleRecord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.valueCount, valueCount) ||
                other.valueCount == valueCount) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    number,
    name,
    description,
    valueCount,
    status,
  );

  @override
  String toString() {
    return 'CurriculumModuleRecord(id: $id, number: $number, name: $name, description: $description, valueCount: $valueCount, status: $status)';
  }
}

/// @nodoc
abstract mixin class $CurriculumModuleRecordCopyWith<$Res> {
  factory $CurriculumModuleRecordCopyWith(
    CurriculumModuleRecord value,
    $Res Function(CurriculumModuleRecord) _then,
  ) = _$CurriculumModuleRecordCopyWithImpl;
  @useResult
  $Res call({
    String id,
    int number,
    String name,
    String? description,
    int valueCount,
    String status,
  });
}

/// @nodoc
class _$CurriculumModuleRecordCopyWithImpl<$Res>
    implements $CurriculumModuleRecordCopyWith<$Res> {
  _$CurriculumModuleRecordCopyWithImpl(this._self, this._then);

  final CurriculumModuleRecord _self;
  final $Res Function(CurriculumModuleRecord) _then;

  /// Create a copy of CurriculumModuleRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? number = null,
    Object? name = null,
    Object? description = freezed,
    Object? valueCount = null,
    Object? status = null,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        number: null == number
            ? _self.number
            : number // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _self.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        valueCount: null == valueCount
            ? _self.valueCount
            : valueCount // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [CurriculumModuleRecord].
extension CurriculumModuleRecordPatterns on CurriculumModuleRecord {
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
    TResult Function(_CurriculumModuleRecord value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CurriculumModuleRecord() when $default != null:
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
    TResult Function(_CurriculumModuleRecord value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumModuleRecord():
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
    TResult? Function(_CurriculumModuleRecord value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumModuleRecord() when $default != null:
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
      int number,
      String name,
      String? description,
      int valueCount,
      String status,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CurriculumModuleRecord() when $default != null:
        return $default(
          _that.id,
          _that.number,
          _that.name,
          _that.description,
          _that.valueCount,
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
      int number,
      String name,
      String? description,
      int valueCount,
      String status,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumModuleRecord():
        return $default(
          _that.id,
          _that.number,
          _that.name,
          _that.description,
          _that.valueCount,
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
      int number,
      String name,
      String? description,
      int valueCount,
      String status,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumModuleRecord() when $default != null:
        return $default(
          _that.id,
          _that.number,
          _that.name,
          _that.description,
          _that.valueCount,
          _that.status,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CurriculumModuleRecord implements CurriculumModuleRecord {
  const _CurriculumModuleRecord({
    required this.id,
    required this.number,
    required this.name,
    this.description,
    required this.valueCount,
    required this.status,
  });
  factory _CurriculumModuleRecord.fromJson(Map<String, dynamic> json) =>
      _$CurriculumModuleRecordFromJson(json);

  @override
  final String id;
  @override
  final int number;
  @override
  final String name;
  @override
  final String? description;
  @override
  final int valueCount;
  @override
  final String status;

  /// Create a copy of CurriculumModuleRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CurriculumModuleRecordCopyWith<_CurriculumModuleRecord> get copyWith =>
      __$CurriculumModuleRecordCopyWithImpl<_CurriculumModuleRecord>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$CurriculumModuleRecordToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CurriculumModuleRecord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.valueCount, valueCount) ||
                other.valueCount == valueCount) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    number,
    name,
    description,
    valueCount,
    status,
  );

  @override
  String toString() {
    return 'CurriculumModuleRecord(id: $id, number: $number, name: $name, description: $description, valueCount: $valueCount, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$CurriculumModuleRecordCopyWith<$Res>
    implements $CurriculumModuleRecordCopyWith<$Res> {
  factory _$CurriculumModuleRecordCopyWith(
    _CurriculumModuleRecord value,
    $Res Function(_CurriculumModuleRecord) _then,
  ) = __$CurriculumModuleRecordCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    int number,
    String name,
    String? description,
    int valueCount,
    String status,
  });
}

/// @nodoc
class __$CurriculumModuleRecordCopyWithImpl<$Res>
    implements _$CurriculumModuleRecordCopyWith<$Res> {
  __$CurriculumModuleRecordCopyWithImpl(this._self, this._then);

  final _CurriculumModuleRecord _self;
  final $Res Function(_CurriculumModuleRecord) _then;

  /// Create a copy of CurriculumModuleRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? number = null,
    Object? name = null,
    Object? description = freezed,
    Object? valueCount = null,
    Object? status = null,
  }) {
    return _then(
      _CurriculumModuleRecord(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        number: null == number
            ? _self.number
            : number // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _self.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        valueCount: null == valueCount
            ? _self.valueCount
            : valueCount // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}
