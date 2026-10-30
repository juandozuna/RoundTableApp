// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'curriculum_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FieldChange {
  String? get from;
  String? get to;

  /// Create a copy of FieldChange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FieldChangeCopyWith<FieldChange> get copyWith =>
      _$FieldChangeCopyWithImpl<FieldChange>(this as FieldChange, _$identity);

  /// Serializes this FieldChange to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FieldChange &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, from, to);

  @override
  String toString() {
    return 'FieldChange(from: $from, to: $to)';
  }
}

/// @nodoc
abstract mixin class $FieldChangeCopyWith<$Res> {
  factory $FieldChangeCopyWith(
    FieldChange value,
    $Res Function(FieldChange) _then,
  ) = _$FieldChangeCopyWithImpl;
  @useResult
  $Res call({String? from, String? to});
}

/// @nodoc
class _$FieldChangeCopyWithImpl<$Res> implements $FieldChangeCopyWith<$Res> {
  _$FieldChangeCopyWithImpl(this._self, this._then);

  final FieldChange _self;
  final $Res Function(FieldChange) _then;

  /// Create a copy of FieldChange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? from = freezed, Object? to = freezed}) {
    return _then(
      _self.copyWith(
        from: freezed == from
            ? _self.from
            : from // ignore: cast_nullable_to_non_nullable
                  as String?,
        to: freezed == to
            ? _self.to
            : to // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [FieldChange].
extension FieldChangePatterns on FieldChange {
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
    TResult Function(_FieldChange value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FieldChange() when $default != null:
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
    TResult Function(_FieldChange value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FieldChange():
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
    TResult? Function(_FieldChange value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FieldChange() when $default != null:
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
    TResult Function(String? from, String? to)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FieldChange() when $default != null:
        return $default(_that.from, _that.to);
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
    TResult Function(String? from, String? to) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FieldChange():
        return $default(_that.from, _that.to);
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
    TResult? Function(String? from, String? to)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FieldChange() when $default != null:
        return $default(_that.from, _that.to);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FieldChange implements FieldChange {
  const _FieldChange({this.from, this.to});
  factory _FieldChange.fromJson(Map<String, dynamic> json) =>
      _$FieldChangeFromJson(json);

  @override
  final String? from;
  @override
  final String? to;

  /// Create a copy of FieldChange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FieldChangeCopyWith<_FieldChange> get copyWith =>
      __$FieldChangeCopyWithImpl<_FieldChange>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FieldChangeToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FieldChange &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, from, to);

  @override
  String toString() {
    return 'FieldChange(from: $from, to: $to)';
  }
}

/// @nodoc
abstract mixin class _$FieldChangeCopyWith<$Res>
    implements $FieldChangeCopyWith<$Res> {
  factory _$FieldChangeCopyWith(
    _FieldChange value,
    $Res Function(_FieldChange) _then,
  ) = __$FieldChangeCopyWithImpl;
  @override
  @useResult
  $Res call({String? from, String? to});
}

/// @nodoc
class __$FieldChangeCopyWithImpl<$Res> implements _$FieldChangeCopyWith<$Res> {
  __$FieldChangeCopyWithImpl(this._self, this._then);

  final _FieldChange _self;
  final $Res Function(_FieldChange) _then;

  /// Create a copy of FieldChange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? from = freezed, Object? to = freezed}) {
    return _then(
      _FieldChange(
        from: freezed == from
            ? _self.from
            : from // ignore: cast_nullable_to_non_nullable
                  as String?,
        to: freezed == to
            ? _self.to
            : to // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
mixin _$CurriculumChange {
  @JsonKey(unknownEnumValue: CurriculumEntity.value)
  CurriculumEntity get entity;

  /// Module / value number, or `value/code` for a question.
  String get key;
  String get label;
  @JsonKey(unknownEnumValue: CurriculumChangeAction.update)
  CurriculumChangeAction get action;
  Map<String, FieldChange> get fields;

  /// For deactivated questions: answers exist, so it is kept, not deleted.
  bool get answered;

  /// Create a copy of CurriculumChange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CurriculumChangeCopyWith<CurriculumChange> get copyWith =>
      _$CurriculumChangeCopyWithImpl<CurriculumChange>(
        this as CurriculumChange,
        _$identity,
      );

  /// Serializes this CurriculumChange to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CurriculumChange &&
            (identical(other.entity, entity) || other.entity == entity) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.action, action) || other.action == action) &&
            const DeepCollectionEquality().equals(other.fields, fields) &&
            (identical(other.answered, answered) ||
                other.answered == answered));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    entity,
    key,
    label,
    action,
    const DeepCollectionEquality().hash(fields),
    answered,
  );

  @override
  String toString() {
    return 'CurriculumChange(entity: $entity, key: $key, label: $label, action: $action, fields: $fields, answered: $answered)';
  }
}

/// @nodoc
abstract mixin class $CurriculumChangeCopyWith<$Res> {
  factory $CurriculumChangeCopyWith(
    CurriculumChange value,
    $Res Function(CurriculumChange) _then,
  ) = _$CurriculumChangeCopyWithImpl;
  @useResult
  $Res call({
    @JsonKey(unknownEnumValue: CurriculumEntity.value) CurriculumEntity entity,
    String key,
    String label,
    @JsonKey(unknownEnumValue: CurriculumChangeAction.update)
    CurriculumChangeAction action,
    Map<String, FieldChange> fields,
    bool answered,
  });
}

/// @nodoc
class _$CurriculumChangeCopyWithImpl<$Res>
    implements $CurriculumChangeCopyWith<$Res> {
  _$CurriculumChangeCopyWithImpl(this._self, this._then);

  final CurriculumChange _self;
  final $Res Function(CurriculumChange) _then;

  /// Create a copy of CurriculumChange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entity = null,
    Object? key = null,
    Object? label = null,
    Object? action = null,
    Object? fields = null,
    Object? answered = null,
  }) {
    return _then(
      _self.copyWith(
        entity: null == entity
            ? _self.entity
            : entity // ignore: cast_nullable_to_non_nullable
                  as CurriculumEntity,
        key: null == key
            ? _self.key
            : key // ignore: cast_nullable_to_non_nullable
                  as String,
        label: null == label
            ? _self.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        action: null == action
            ? _self.action
            : action // ignore: cast_nullable_to_non_nullable
                  as CurriculumChangeAction,
        fields: null == fields
            ? _self.fields
            : fields // ignore: cast_nullable_to_non_nullable
                  as Map<String, FieldChange>,
        answered: null == answered
            ? _self.answered
            : answered // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [CurriculumChange].
extension CurriculumChangePatterns on CurriculumChange {
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
    TResult Function(_CurriculumChange value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CurriculumChange() when $default != null:
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
    TResult Function(_CurriculumChange value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumChange():
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
    TResult? Function(_CurriculumChange value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumChange() when $default != null:
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
      @JsonKey(unknownEnumValue: CurriculumEntity.value)
      CurriculumEntity entity,
      String key,
      String label,
      @JsonKey(unknownEnumValue: CurriculumChangeAction.update)
      CurriculumChangeAction action,
      Map<String, FieldChange> fields,
      bool answered,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CurriculumChange() when $default != null:
        return $default(
          _that.entity,
          _that.key,
          _that.label,
          _that.action,
          _that.fields,
          _that.answered,
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
      @JsonKey(unknownEnumValue: CurriculumEntity.value)
      CurriculumEntity entity,
      String key,
      String label,
      @JsonKey(unknownEnumValue: CurriculumChangeAction.update)
      CurriculumChangeAction action,
      Map<String, FieldChange> fields,
      bool answered,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumChange():
        return $default(
          _that.entity,
          _that.key,
          _that.label,
          _that.action,
          _that.fields,
          _that.answered,
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
      @JsonKey(unknownEnumValue: CurriculumEntity.value)
      CurriculumEntity entity,
      String key,
      String label,
      @JsonKey(unknownEnumValue: CurriculumChangeAction.update)
      CurriculumChangeAction action,
      Map<String, FieldChange> fields,
      bool answered,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumChange() when $default != null:
        return $default(
          _that.entity,
          _that.key,
          _that.label,
          _that.action,
          _that.fields,
          _that.answered,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CurriculumChange implements CurriculumChange {
  const _CurriculumChange({
    @JsonKey(unknownEnumValue: CurriculumEntity.value) required this.entity,
    required this.key,
    this.label = '',
    @JsonKey(unknownEnumValue: CurriculumChangeAction.update)
    required this.action,
    final Map<String, FieldChange> fields = const {},
    this.answered = false,
  }) : _fields = fields;
  factory _CurriculumChange.fromJson(Map<String, dynamic> json) =>
      _$CurriculumChangeFromJson(json);

  @override
  @JsonKey(unknownEnumValue: CurriculumEntity.value)
  final CurriculumEntity entity;

  /// Module / value number, or `value/code` for a question.
  @override
  final String key;
  @override
  @JsonKey()
  final String label;
  @override
  @JsonKey(unknownEnumValue: CurriculumChangeAction.update)
  final CurriculumChangeAction action;
  final Map<String, FieldChange> _fields;
  @override
  @JsonKey()
  Map<String, FieldChange> get fields {
    if (_fields is EqualUnmodifiableMapView) return _fields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_fields);
  }

  /// For deactivated questions: answers exist, so it is kept, not deleted.
  @override
  @JsonKey()
  final bool answered;

  /// Create a copy of CurriculumChange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CurriculumChangeCopyWith<_CurriculumChange> get copyWith =>
      __$CurriculumChangeCopyWithImpl<_CurriculumChange>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CurriculumChangeToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CurriculumChange &&
            (identical(other.entity, entity) || other.entity == entity) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.action, action) || other.action == action) &&
            const DeepCollectionEquality().equals(other._fields, _fields) &&
            (identical(other.answered, answered) ||
                other.answered == answered));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    entity,
    key,
    label,
    action,
    const DeepCollectionEquality().hash(_fields),
    answered,
  );

  @override
  String toString() {
    return 'CurriculumChange(entity: $entity, key: $key, label: $label, action: $action, fields: $fields, answered: $answered)';
  }
}

/// @nodoc
abstract mixin class _$CurriculumChangeCopyWith<$Res>
    implements $CurriculumChangeCopyWith<$Res> {
  factory _$CurriculumChangeCopyWith(
    _CurriculumChange value,
    $Res Function(_CurriculumChange) _then,
  ) = __$CurriculumChangeCopyWithImpl;
  @override
  @useResult
  $Res call({
    @JsonKey(unknownEnumValue: CurriculumEntity.value) CurriculumEntity entity,
    String key,
    String label,
    @JsonKey(unknownEnumValue: CurriculumChangeAction.update)
    CurriculumChangeAction action,
    Map<String, FieldChange> fields,
    bool answered,
  });
}

/// @nodoc
class __$CurriculumChangeCopyWithImpl<$Res>
    implements _$CurriculumChangeCopyWith<$Res> {
  __$CurriculumChangeCopyWithImpl(this._self, this._then);

  final _CurriculumChange _self;
  final $Res Function(_CurriculumChange) _then;

  /// Create a copy of CurriculumChange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? entity = null,
    Object? key = null,
    Object? label = null,
    Object? action = null,
    Object? fields = null,
    Object? answered = null,
  }) {
    return _then(
      _CurriculumChange(
        entity: null == entity
            ? _self.entity
            : entity // ignore: cast_nullable_to_non_nullable
                  as CurriculumEntity,
        key: null == key
            ? _self.key
            : key // ignore: cast_nullable_to_non_nullable
                  as String,
        label: null == label
            ? _self.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        action: null == action
            ? _self.action
            : action // ignore: cast_nullable_to_non_nullable
                  as CurriculumChangeAction,
        fields: null == fields
            ? _self._fields
            : fields // ignore: cast_nullable_to_non_nullable
                  as Map<String, FieldChange>,
        answered: null == answered
            ? _self.answered
            : answered // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
mixin _$CurriculumRefusal {
  String get key;
  String get label;
  String get message;

  /// Create a copy of CurriculumRefusal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CurriculumRefusalCopyWith<CurriculumRefusal> get copyWith =>
      _$CurriculumRefusalCopyWithImpl<CurriculumRefusal>(
        this as CurriculumRefusal,
        _$identity,
      );

  /// Serializes this CurriculumRefusal to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CurriculumRefusal &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, key, label, message);

  @override
  String toString() {
    return 'CurriculumRefusal(key: $key, label: $label, message: $message)';
  }
}

/// @nodoc
abstract mixin class $CurriculumRefusalCopyWith<$Res> {
  factory $CurriculumRefusalCopyWith(
    CurriculumRefusal value,
    $Res Function(CurriculumRefusal) _then,
  ) = _$CurriculumRefusalCopyWithImpl;
  @useResult
  $Res call({String key, String label, String message});
}

/// @nodoc
class _$CurriculumRefusalCopyWithImpl<$Res>
    implements $CurriculumRefusalCopyWith<$Res> {
  _$CurriculumRefusalCopyWithImpl(this._self, this._then);

  final CurriculumRefusal _self;
  final $Res Function(CurriculumRefusal) _then;

  /// Create a copy of CurriculumRefusal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? label = null,
    Object? message = null,
  }) {
    return _then(
      _self.copyWith(
        key: null == key
            ? _self.key
            : key // ignore: cast_nullable_to_non_nullable
                  as String,
        label: null == label
            ? _self.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        message: null == message
            ? _self.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [CurriculumRefusal].
extension CurriculumRefusalPatterns on CurriculumRefusal {
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
    TResult Function(_CurriculumRefusal value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CurriculumRefusal() when $default != null:
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
    TResult Function(_CurriculumRefusal value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumRefusal():
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
    TResult? Function(_CurriculumRefusal value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumRefusal() when $default != null:
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
    TResult Function(String key, String label, String message)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CurriculumRefusal() when $default != null:
        return $default(_that.key, _that.label, _that.message);
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
    TResult Function(String key, String label, String message) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumRefusal():
        return $default(_that.key, _that.label, _that.message);
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
    TResult? Function(String key, String label, String message)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumRefusal() when $default != null:
        return $default(_that.key, _that.label, _that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CurriculumRefusal implements CurriculumRefusal {
  const _CurriculumRefusal({
    required this.key,
    this.label = '',
    this.message = '',
  });
  factory _CurriculumRefusal.fromJson(Map<String, dynamic> json) =>
      _$CurriculumRefusalFromJson(json);

  @override
  final String key;
  @override
  @JsonKey()
  final String label;
  @override
  @JsonKey()
  final String message;

  /// Create a copy of CurriculumRefusal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CurriculumRefusalCopyWith<_CurriculumRefusal> get copyWith =>
      __$CurriculumRefusalCopyWithImpl<_CurriculumRefusal>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CurriculumRefusalToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CurriculumRefusal &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, key, label, message);

  @override
  String toString() {
    return 'CurriculumRefusal(key: $key, label: $label, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$CurriculumRefusalCopyWith<$Res>
    implements $CurriculumRefusalCopyWith<$Res> {
  factory _$CurriculumRefusalCopyWith(
    _CurriculumRefusal value,
    $Res Function(_CurriculumRefusal) _then,
  ) = __$CurriculumRefusalCopyWithImpl;
  @override
  @useResult
  $Res call({String key, String label, String message});
}

/// @nodoc
class __$CurriculumRefusalCopyWithImpl<$Res>
    implements _$CurriculumRefusalCopyWith<$Res> {
  __$CurriculumRefusalCopyWithImpl(this._self, this._then);

  final _CurriculumRefusal _self;
  final $Res Function(_CurriculumRefusal) _then;

  /// Create a copy of CurriculumRefusal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? key = null,
    Object? label = null,
    Object? message = null,
  }) {
    return _then(
      _CurriculumRefusal(
        key: null == key
            ? _self.key
            : key // ignore: cast_nullable_to_non_nullable
                  as String,
        label: null == label
            ? _self.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        message: null == message
            ? _self.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
mixin _$CurriculumPlan {
  bool get dryRun;
  bool get applied;
  List<CurriculumChange> get changes;
  List<CurriculumRefusal> get refused;

  /// Create a copy of CurriculumPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CurriculumPlanCopyWith<CurriculumPlan> get copyWith =>
      _$CurriculumPlanCopyWithImpl<CurriculumPlan>(
        this as CurriculumPlan,
        _$identity,
      );

  /// Serializes this CurriculumPlan to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CurriculumPlan &&
            (identical(other.dryRun, dryRun) || other.dryRun == dryRun) &&
            (identical(other.applied, applied) || other.applied == applied) &&
            const DeepCollectionEquality().equals(other.changes, changes) &&
            const DeepCollectionEquality().equals(other.refused, refused));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    dryRun,
    applied,
    const DeepCollectionEquality().hash(changes),
    const DeepCollectionEquality().hash(refused),
  );

  @override
  String toString() {
    return 'CurriculumPlan(dryRun: $dryRun, applied: $applied, changes: $changes, refused: $refused)';
  }
}

/// @nodoc
abstract mixin class $CurriculumPlanCopyWith<$Res> {
  factory $CurriculumPlanCopyWith(
    CurriculumPlan value,
    $Res Function(CurriculumPlan) _then,
  ) = _$CurriculumPlanCopyWithImpl;
  @useResult
  $Res call({
    bool dryRun,
    bool applied,
    List<CurriculumChange> changes,
    List<CurriculumRefusal> refused,
  });
}

/// @nodoc
class _$CurriculumPlanCopyWithImpl<$Res>
    implements $CurriculumPlanCopyWith<$Res> {
  _$CurriculumPlanCopyWithImpl(this._self, this._then);

  final CurriculumPlan _self;
  final $Res Function(CurriculumPlan) _then;

  /// Create a copy of CurriculumPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dryRun = null,
    Object? applied = null,
    Object? changes = null,
    Object? refused = null,
  }) {
    return _then(
      _self.copyWith(
        dryRun: null == dryRun
            ? _self.dryRun
            : dryRun // ignore: cast_nullable_to_non_nullable
                  as bool,
        applied: null == applied
            ? _self.applied
            : applied // ignore: cast_nullable_to_non_nullable
                  as bool,
        changes: null == changes
            ? _self.changes
            : changes // ignore: cast_nullable_to_non_nullable
                  as List<CurriculumChange>,
        refused: null == refused
            ? _self.refused
            : refused // ignore: cast_nullable_to_non_nullable
                  as List<CurriculumRefusal>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [CurriculumPlan].
extension CurriculumPlanPatterns on CurriculumPlan {
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
    TResult Function(_CurriculumPlan value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CurriculumPlan() when $default != null:
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
    TResult Function(_CurriculumPlan value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumPlan():
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
    TResult? Function(_CurriculumPlan value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumPlan() when $default != null:
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
      bool dryRun,
      bool applied,
      List<CurriculumChange> changes,
      List<CurriculumRefusal> refused,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CurriculumPlan() when $default != null:
        return $default(
          _that.dryRun,
          _that.applied,
          _that.changes,
          _that.refused,
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
      bool dryRun,
      bool applied,
      List<CurriculumChange> changes,
      List<CurriculumRefusal> refused,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumPlan():
        return $default(
          _that.dryRun,
          _that.applied,
          _that.changes,
          _that.refused,
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
      bool dryRun,
      bool applied,
      List<CurriculumChange> changes,
      List<CurriculumRefusal> refused,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumPlan() when $default != null:
        return $default(
          _that.dryRun,
          _that.applied,
          _that.changes,
          _that.refused,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CurriculumPlan extends CurriculumPlan {
  const _CurriculumPlan({
    this.dryRun = true,
    this.applied = false,
    final List<CurriculumChange> changes = const [],
    final List<CurriculumRefusal> refused = const [],
  }) : _changes = changes,
       _refused = refused,
       super._();
  factory _CurriculumPlan.fromJson(Map<String, dynamic> json) =>
      _$CurriculumPlanFromJson(json);

  @override
  @JsonKey()
  final bool dryRun;
  @override
  @JsonKey()
  final bool applied;
  final List<CurriculumChange> _changes;
  @override
  @JsonKey()
  List<CurriculumChange> get changes {
    if (_changes is EqualUnmodifiableListView) return _changes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_changes);
  }

  final List<CurriculumRefusal> _refused;
  @override
  @JsonKey()
  List<CurriculumRefusal> get refused {
    if (_refused is EqualUnmodifiableListView) return _refused;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_refused);
  }

  /// Create a copy of CurriculumPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CurriculumPlanCopyWith<_CurriculumPlan> get copyWith =>
      __$CurriculumPlanCopyWithImpl<_CurriculumPlan>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CurriculumPlanToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CurriculumPlan &&
            (identical(other.dryRun, dryRun) || other.dryRun == dryRun) &&
            (identical(other.applied, applied) || other.applied == applied) &&
            const DeepCollectionEquality().equals(other._changes, _changes) &&
            const DeepCollectionEquality().equals(other._refused, _refused));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    dryRun,
    applied,
    const DeepCollectionEquality().hash(_changes),
    const DeepCollectionEquality().hash(_refused),
  );

  @override
  String toString() {
    return 'CurriculumPlan(dryRun: $dryRun, applied: $applied, changes: $changes, refused: $refused)';
  }
}

/// @nodoc
abstract mixin class _$CurriculumPlanCopyWith<$Res>
    implements $CurriculumPlanCopyWith<$Res> {
  factory _$CurriculumPlanCopyWith(
    _CurriculumPlan value,
    $Res Function(_CurriculumPlan) _then,
  ) = __$CurriculumPlanCopyWithImpl;
  @override
  @useResult
  $Res call({
    bool dryRun,
    bool applied,
    List<CurriculumChange> changes,
    List<CurriculumRefusal> refused,
  });
}

/// @nodoc
class __$CurriculumPlanCopyWithImpl<$Res>
    implements _$CurriculumPlanCopyWith<$Res> {
  __$CurriculumPlanCopyWithImpl(this._self, this._then);

  final _CurriculumPlan _self;
  final $Res Function(_CurriculumPlan) _then;

  /// Create a copy of CurriculumPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? dryRun = null,
    Object? applied = null,
    Object? changes = null,
    Object? refused = null,
  }) {
    return _then(
      _CurriculumPlan(
        dryRun: null == dryRun
            ? _self.dryRun
            : dryRun // ignore: cast_nullable_to_non_nullable
                  as bool,
        applied: null == applied
            ? _self.applied
            : applied // ignore: cast_nullable_to_non_nullable
                  as bool,
        changes: null == changes
            ? _self._changes
            : changes // ignore: cast_nullable_to_non_nullable
                  as List<CurriculumChange>,
        refused: null == refused
            ? _self._refused
            : refused // ignore: cast_nullable_to_non_nullable
                  as List<CurriculumRefusal>,
      ),
    );
  }
}
