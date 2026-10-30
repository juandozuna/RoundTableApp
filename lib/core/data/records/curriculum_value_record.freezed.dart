// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'curriculum_value_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CurriculumValueRecord {
  String get id;
  String get moduleId;
  int get numberInModule;
  int get sequence;
  String get name;
  String? get description;
  String? get bookletReference;
  String get status;

  /// Create a copy of CurriculumValueRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CurriculumValueRecordCopyWith<CurriculumValueRecord> get copyWith =>
      _$CurriculumValueRecordCopyWithImpl<CurriculumValueRecord>(
        this as CurriculumValueRecord,
        _$identity,
      );

  /// Serializes this CurriculumValueRecord to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CurriculumValueRecord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.moduleId, moduleId) ||
                other.moduleId == moduleId) &&
            (identical(other.numberInModule, numberInModule) ||
                other.numberInModule == numberInModule) &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.bookletReference, bookletReference) ||
                other.bookletReference == bookletReference) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    moduleId,
    numberInModule,
    sequence,
    name,
    description,
    bookletReference,
    status,
  );

  @override
  String toString() {
    return 'CurriculumValueRecord(id: $id, moduleId: $moduleId, numberInModule: $numberInModule, sequence: $sequence, name: $name, description: $description, bookletReference: $bookletReference, status: $status)';
  }
}

/// @nodoc
abstract mixin class $CurriculumValueRecordCopyWith<$Res> {
  factory $CurriculumValueRecordCopyWith(
    CurriculumValueRecord value,
    $Res Function(CurriculumValueRecord) _then,
  ) = _$CurriculumValueRecordCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String moduleId,
    int numberInModule,
    int sequence,
    String name,
    String? description,
    String? bookletReference,
    String status,
  });
}

/// @nodoc
class _$CurriculumValueRecordCopyWithImpl<$Res>
    implements $CurriculumValueRecordCopyWith<$Res> {
  _$CurriculumValueRecordCopyWithImpl(this._self, this._then);

  final CurriculumValueRecord _self;
  final $Res Function(CurriculumValueRecord) _then;

  /// Create a copy of CurriculumValueRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? moduleId = null,
    Object? numberInModule = null,
    Object? sequence = null,
    Object? name = null,
    Object? description = freezed,
    Object? bookletReference = freezed,
    Object? status = null,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        moduleId: null == moduleId
            ? _self.moduleId
            : moduleId // ignore: cast_nullable_to_non_nullable
                  as String,
        numberInModule: null == numberInModule
            ? _self.numberInModule
            : numberInModule // ignore: cast_nullable_to_non_nullable
                  as int,
        sequence: null == sequence
            ? _self.sequence
            : sequence // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _self.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        bookletReference: freezed == bookletReference
            ? _self.bookletReference
            : bookletReference // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [CurriculumValueRecord].
extension CurriculumValueRecordPatterns on CurriculumValueRecord {
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
    TResult Function(_CurriculumValueRecord value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CurriculumValueRecord() when $default != null:
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
    TResult Function(_CurriculumValueRecord value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumValueRecord():
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
    TResult? Function(_CurriculumValueRecord value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumValueRecord() when $default != null:
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
      String moduleId,
      int numberInModule,
      int sequence,
      String name,
      String? description,
      String? bookletReference,
      String status,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CurriculumValueRecord() when $default != null:
        return $default(
          _that.id,
          _that.moduleId,
          _that.numberInModule,
          _that.sequence,
          _that.name,
          _that.description,
          _that.bookletReference,
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
      String moduleId,
      int numberInModule,
      int sequence,
      String name,
      String? description,
      String? bookletReference,
      String status,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumValueRecord():
        return $default(
          _that.id,
          _that.moduleId,
          _that.numberInModule,
          _that.sequence,
          _that.name,
          _that.description,
          _that.bookletReference,
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
      String moduleId,
      int numberInModule,
      int sequence,
      String name,
      String? description,
      String? bookletReference,
      String status,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumValueRecord() when $default != null:
        return $default(
          _that.id,
          _that.moduleId,
          _that.numberInModule,
          _that.sequence,
          _that.name,
          _that.description,
          _that.bookletReference,
          _that.status,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CurriculumValueRecord implements CurriculumValueRecord {
  const _CurriculumValueRecord({
    required this.id,
    required this.moduleId,
    required this.numberInModule,
    required this.sequence,
    required this.name,
    this.description,
    this.bookletReference,
    required this.status,
  });
  factory _CurriculumValueRecord.fromJson(Map<String, dynamic> json) =>
      _$CurriculumValueRecordFromJson(json);

  @override
  final String id;
  @override
  final String moduleId;
  @override
  final int numberInModule;
  @override
  final int sequence;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String? bookletReference;
  @override
  final String status;

  /// Create a copy of CurriculumValueRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CurriculumValueRecordCopyWith<_CurriculumValueRecord> get copyWith =>
      __$CurriculumValueRecordCopyWithImpl<_CurriculumValueRecord>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$CurriculumValueRecordToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CurriculumValueRecord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.moduleId, moduleId) ||
                other.moduleId == moduleId) &&
            (identical(other.numberInModule, numberInModule) ||
                other.numberInModule == numberInModule) &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.bookletReference, bookletReference) ||
                other.bookletReference == bookletReference) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    moduleId,
    numberInModule,
    sequence,
    name,
    description,
    bookletReference,
    status,
  );

  @override
  String toString() {
    return 'CurriculumValueRecord(id: $id, moduleId: $moduleId, numberInModule: $numberInModule, sequence: $sequence, name: $name, description: $description, bookletReference: $bookletReference, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$CurriculumValueRecordCopyWith<$Res>
    implements $CurriculumValueRecordCopyWith<$Res> {
  factory _$CurriculumValueRecordCopyWith(
    _CurriculumValueRecord value,
    $Res Function(_CurriculumValueRecord) _then,
  ) = __$CurriculumValueRecordCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String moduleId,
    int numberInModule,
    int sequence,
    String name,
    String? description,
    String? bookletReference,
    String status,
  });
}

/// @nodoc
class __$CurriculumValueRecordCopyWithImpl<$Res>
    implements _$CurriculumValueRecordCopyWith<$Res> {
  __$CurriculumValueRecordCopyWithImpl(this._self, this._then);

  final _CurriculumValueRecord _self;
  final $Res Function(_CurriculumValueRecord) _then;

  /// Create a copy of CurriculumValueRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? moduleId = null,
    Object? numberInModule = null,
    Object? sequence = null,
    Object? name = null,
    Object? description = freezed,
    Object? bookletReference = freezed,
    Object? status = null,
  }) {
    return _then(
      _CurriculumValueRecord(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        moduleId: null == moduleId
            ? _self.moduleId
            : moduleId // ignore: cast_nullable_to_non_nullable
                  as String,
        numberInModule: null == numberInModule
            ? _self.numberInModule
            : numberInModule // ignore: cast_nullable_to_non_nullable
                  as int,
        sequence: null == sequence
            ? _self.sequence
            : sequence // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _self.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        bookletReference: freezed == bookletReference
            ? _self.bookletReference
            : bookletReference // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}
