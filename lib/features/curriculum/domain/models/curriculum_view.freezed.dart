// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'curriculum_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CurriculumText {
  String? get name;
  String? get description;
  String? get text;

  /// Create a copy of CurriculumText
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CurriculumTextCopyWith<CurriculumText> get copyWith =>
      _$CurriculumTextCopyWithImpl<CurriculumText>(
        this as CurriculumText,
        _$identity,
      );

  /// Serializes this CurriculumText to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CurriculumText &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, description, text);

  @override
  String toString() {
    return 'CurriculumText(name: $name, description: $description, text: $text)';
  }
}

/// @nodoc
abstract mixin class $CurriculumTextCopyWith<$Res> {
  factory $CurriculumTextCopyWith(
    CurriculumText value,
    $Res Function(CurriculumText) _then,
  ) = _$CurriculumTextCopyWithImpl;
  @useResult
  $Res call({String? name, String? description, String? text});
}

/// @nodoc
class _$CurriculumTextCopyWithImpl<$Res>
    implements $CurriculumTextCopyWith<$Res> {
  _$CurriculumTextCopyWithImpl(this._self, this._then);

  final CurriculumText _self;
  final $Res Function(CurriculumText) _then;

  /// Create a copy of CurriculumText
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? text = freezed,
  }) {
    return _then(
      _self.copyWith(
        name: freezed == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _self.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        text: freezed == text
            ? _self.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [CurriculumText].
extension CurriculumTextPatterns on CurriculumText {
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
    TResult Function(_CurriculumText value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CurriculumText() when $default != null:
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
    TResult Function(_CurriculumText value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumText():
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
    TResult? Function(_CurriculumText value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumText() when $default != null:
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
    TResult Function(String? name, String? description, String? text)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CurriculumText() when $default != null:
        return $default(_that.name, _that.description, _that.text);
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
    TResult Function(String? name, String? description, String? text) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumText():
        return $default(_that.name, _that.description, _that.text);
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
    TResult? Function(String? name, String? description, String? text)?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumText() when $default != null:
        return $default(_that.name, _that.description, _that.text);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CurriculumText extends CurriculumText {
  const _CurriculumText({this.name, this.description, this.text}) : super._();
  factory _CurriculumText.fromJson(Map<String, dynamic> json) =>
      _$CurriculumTextFromJson(json);

  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? text;

  /// Create a copy of CurriculumText
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CurriculumTextCopyWith<_CurriculumText> get copyWith =>
      __$CurriculumTextCopyWithImpl<_CurriculumText>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CurriculumTextToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CurriculumText &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, description, text);

  @override
  String toString() {
    return 'CurriculumText(name: $name, description: $description, text: $text)';
  }
}

/// @nodoc
abstract mixin class _$CurriculumTextCopyWith<$Res>
    implements $CurriculumTextCopyWith<$Res> {
  factory _$CurriculumTextCopyWith(
    _CurriculumText value,
    $Res Function(_CurriculumText) _then,
  ) = __$CurriculumTextCopyWithImpl;
  @override
  @useResult
  $Res call({String? name, String? description, String? text});
}

/// @nodoc
class __$CurriculumTextCopyWithImpl<$Res>
    implements _$CurriculumTextCopyWith<$Res> {
  __$CurriculumTextCopyWithImpl(this._self, this._then);

  final _CurriculumText _self;
  final $Res Function(_CurriculumText) _then;

  /// Create a copy of CurriculumText
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? text = freezed,
  }) {
    return _then(
      _CurriculumText(
        name: freezed == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _self.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        text: freezed == text
            ? _self.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
mixin _$LocaleCompleteness {
  int get total;
  int get translated;

  /// Create a copy of LocaleCompleteness
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LocaleCompletenessCopyWith<LocaleCompleteness> get copyWith =>
      _$LocaleCompletenessCopyWithImpl<LocaleCompleteness>(
        this as LocaleCompleteness,
        _$identity,
      );

  /// Serializes this LocaleCompleteness to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LocaleCompleteness &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.translated, translated) ||
                other.translated == translated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total, translated);

  @override
  String toString() {
    return 'LocaleCompleteness(total: $total, translated: $translated)';
  }
}

/// @nodoc
abstract mixin class $LocaleCompletenessCopyWith<$Res> {
  factory $LocaleCompletenessCopyWith(
    LocaleCompleteness value,
    $Res Function(LocaleCompleteness) _then,
  ) = _$LocaleCompletenessCopyWithImpl;
  @useResult
  $Res call({int total, int translated});
}

/// @nodoc
class _$LocaleCompletenessCopyWithImpl<$Res>
    implements $LocaleCompletenessCopyWith<$Res> {
  _$LocaleCompletenessCopyWithImpl(this._self, this._then);

  final LocaleCompleteness _self;
  final $Res Function(LocaleCompleteness) _then;

  /// Create a copy of LocaleCompleteness
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? total = null, Object? translated = null}) {
    return _then(
      _self.copyWith(
        total: null == total
            ? _self.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
        translated: null == translated
            ? _self.translated
            : translated // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [LocaleCompleteness].
extension LocaleCompletenessPatterns on LocaleCompleteness {
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
    TResult Function(_LocaleCompleteness value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocaleCompleteness() when $default != null:
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
    TResult Function(_LocaleCompleteness value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocaleCompleteness():
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
    TResult? Function(_LocaleCompleteness value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocaleCompleteness() when $default != null:
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
    TResult Function(int total, int translated)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocaleCompleteness() when $default != null:
        return $default(_that.total, _that.translated);
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
    TResult Function(int total, int translated) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocaleCompleteness():
        return $default(_that.total, _that.translated);
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
    TResult? Function(int total, int translated)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocaleCompleteness() when $default != null:
        return $default(_that.total, _that.translated);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LocaleCompleteness extends LocaleCompleteness {
  const _LocaleCompleteness({this.total = 0, this.translated = 0}) : super._();
  factory _LocaleCompleteness.fromJson(Map<String, dynamic> json) =>
      _$LocaleCompletenessFromJson(json);

  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey()
  final int translated;

  /// Create a copy of LocaleCompleteness
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LocaleCompletenessCopyWith<_LocaleCompleteness> get copyWith =>
      __$LocaleCompletenessCopyWithImpl<_LocaleCompleteness>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LocaleCompletenessToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocaleCompleteness &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.translated, translated) ||
                other.translated == translated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total, translated);

  @override
  String toString() {
    return 'LocaleCompleteness(total: $total, translated: $translated)';
  }
}

/// @nodoc
abstract mixin class _$LocaleCompletenessCopyWith<$Res>
    implements $LocaleCompletenessCopyWith<$Res> {
  factory _$LocaleCompletenessCopyWith(
    _LocaleCompleteness value,
    $Res Function(_LocaleCompleteness) _then,
  ) = __$LocaleCompletenessCopyWithImpl;
  @override
  @useResult
  $Res call({int total, int translated});
}

/// @nodoc
class __$LocaleCompletenessCopyWithImpl<$Res>
    implements _$LocaleCompletenessCopyWith<$Res> {
  __$LocaleCompletenessCopyWithImpl(this._self, this._then);

  final _LocaleCompleteness _self;
  final $Res Function(_LocaleCompleteness) _then;

  /// Create a copy of LocaleCompleteness
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? total = null, Object? translated = null}) {
    return _then(
      _LocaleCompleteness(
        total: null == total
            ? _self.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
        translated: null == translated
            ? _self.translated
            : translated // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
mixin _$ContentLocale {
  String get code;
  String get name;
  bool get isDefault;
  @JsonKey(unknownEnumValue: RecordStatus.inactive)
  RecordStatus get status;
  LocaleCompleteness? get completeness;

  /// Create a copy of ContentLocale
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ContentLocaleCopyWith<ContentLocale> get copyWith =>
      _$ContentLocaleCopyWithImpl<ContentLocale>(
        this as ContentLocale,
        _$identity,
      );

  /// Serializes this ContentLocale to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ContentLocale &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.completeness, completeness) ||
                other.completeness == completeness));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, code, name, isDefault, status, completeness);

  @override
  String toString() {
    return 'ContentLocale(code: $code, name: $name, isDefault: $isDefault, status: $status, completeness: $completeness)';
  }
}

/// @nodoc
abstract mixin class $ContentLocaleCopyWith<$Res> {
  factory $ContentLocaleCopyWith(
    ContentLocale value,
    $Res Function(ContentLocale) _then,
  ) = _$ContentLocaleCopyWithImpl;
  @useResult
  $Res call({
    String code,
    String name,
    bool isDefault,
    @JsonKey(unknownEnumValue: RecordStatus.inactive) RecordStatus status,
    LocaleCompleteness? completeness,
  });

  $LocaleCompletenessCopyWith<$Res>? get completeness;
}

/// @nodoc
class _$ContentLocaleCopyWithImpl<$Res>
    implements $ContentLocaleCopyWith<$Res> {
  _$ContentLocaleCopyWithImpl(this._self, this._then);

  final ContentLocale _self;
  final $Res Function(ContentLocale) _then;

  /// Create a copy of ContentLocale
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? isDefault = null,
    Object? status = null,
    Object? completeness = freezed,
  }) {
    return _then(
      _self.copyWith(
        code: null == code
            ? _self.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        isDefault: null == isDefault
            ? _self.isDefault
            : isDefault // ignore: cast_nullable_to_non_nullable
                  as bool,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as RecordStatus,
        completeness: freezed == completeness
            ? _self.completeness
            : completeness // ignore: cast_nullable_to_non_nullable
                  as LocaleCompleteness?,
      ),
    );
  }

  /// Create a copy of ContentLocale
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocaleCompletenessCopyWith<$Res>? get completeness {
    if (_self.completeness == null) {
      return null;
    }

    return $LocaleCompletenessCopyWith<$Res>(_self.completeness!, (value) {
      return _then(_self.copyWith(completeness: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ContentLocale].
extension ContentLocalePatterns on ContentLocale {
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
    TResult Function(_ContentLocale value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ContentLocale() when $default != null:
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
    TResult Function(_ContentLocale value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContentLocale():
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
    TResult? Function(_ContentLocale value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContentLocale() when $default != null:
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
      String code,
      String name,
      bool isDefault,
      @JsonKey(unknownEnumValue: RecordStatus.inactive) RecordStatus status,
      LocaleCompleteness? completeness,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ContentLocale() when $default != null:
        return $default(
          _that.code,
          _that.name,
          _that.isDefault,
          _that.status,
          _that.completeness,
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
      String code,
      String name,
      bool isDefault,
      @JsonKey(unknownEnumValue: RecordStatus.inactive) RecordStatus status,
      LocaleCompleteness? completeness,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContentLocale():
        return $default(
          _that.code,
          _that.name,
          _that.isDefault,
          _that.status,
          _that.completeness,
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
      String code,
      String name,
      bool isDefault,
      @JsonKey(unknownEnumValue: RecordStatus.inactive) RecordStatus status,
      LocaleCompleteness? completeness,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContentLocale() when $default != null:
        return $default(
          _that.code,
          _that.name,
          _that.isDefault,
          _that.status,
          _that.completeness,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ContentLocale implements ContentLocale {
  const _ContentLocale({
    required this.code,
    required this.name,
    this.isDefault = false,
    @JsonKey(unknownEnumValue: RecordStatus.inactive)
    this.status = RecordStatus.active,
    this.completeness,
  });
  factory _ContentLocale.fromJson(Map<String, dynamic> json) =>
      _$ContentLocaleFromJson(json);

  @override
  final String code;
  @override
  final String name;
  @override
  @JsonKey()
  final bool isDefault;
  @override
  @JsonKey(unknownEnumValue: RecordStatus.inactive)
  final RecordStatus status;
  @override
  final LocaleCompleteness? completeness;

  /// Create a copy of ContentLocale
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ContentLocaleCopyWith<_ContentLocale> get copyWith =>
      __$ContentLocaleCopyWithImpl<_ContentLocale>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ContentLocaleToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ContentLocale &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.completeness, completeness) ||
                other.completeness == completeness));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, code, name, isDefault, status, completeness);

  @override
  String toString() {
    return 'ContentLocale(code: $code, name: $name, isDefault: $isDefault, status: $status, completeness: $completeness)';
  }
}

/// @nodoc
abstract mixin class _$ContentLocaleCopyWith<$Res>
    implements $ContentLocaleCopyWith<$Res> {
  factory _$ContentLocaleCopyWith(
    _ContentLocale value,
    $Res Function(_ContentLocale) _then,
  ) = __$ContentLocaleCopyWithImpl;
  @override
  @useResult
  $Res call({
    String code,
    String name,
    bool isDefault,
    @JsonKey(unknownEnumValue: RecordStatus.inactive) RecordStatus status,
    LocaleCompleteness? completeness,
  });

  @override
  $LocaleCompletenessCopyWith<$Res>? get completeness;
}

/// @nodoc
class __$ContentLocaleCopyWithImpl<$Res>
    implements _$ContentLocaleCopyWith<$Res> {
  __$ContentLocaleCopyWithImpl(this._self, this._then);

  final _ContentLocale _self;
  final $Res Function(_ContentLocale) _then;

  /// Create a copy of ContentLocale
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? isDefault = null,
    Object? status = null,
    Object? completeness = freezed,
  }) {
    return _then(
      _ContentLocale(
        code: null == code
            ? _self.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        isDefault: null == isDefault
            ? _self.isDefault
            : isDefault // ignore: cast_nullable_to_non_nullable
                  as bool,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as RecordStatus,
        completeness: freezed == completeness
            ? _self.completeness
            : completeness // ignore: cast_nullable_to_non_nullable
                  as LocaleCompleteness?,
      ),
    );
  }

  /// Create a copy of ContentLocale
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocaleCompletenessCopyWith<$Res>? get completeness {
    if (_self.completeness == null) {
      return null;
    }

    return $LocaleCompletenessCopyWith<$Res>(_self.completeness!, (value) {
      return _then(_self.copyWith(completeness: value));
    });
  }
}

/// @nodoc
mixin _$CurriculumQuestionItem {
  String get id;
  String get code;
  String get text;
  int get sortOrder;
  @JsonKey(unknownEnumValue: QuestionResponseType.text)
  QuestionResponseType get responseType;
  @JsonKey(unknownEnumValue: RecordStatus.inactive)
  RecordStatus get status;

  /// Someone has already answered it: its answer type cannot change.
  bool get answered;
  CurriculumText? get translation;

  /// Create a copy of CurriculumQuestionItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CurriculumQuestionItemCopyWith<CurriculumQuestionItem> get copyWith =>
      _$CurriculumQuestionItemCopyWithImpl<CurriculumQuestionItem>(
        this as CurriculumQuestionItem,
        _$identity,
      );

  /// Serializes this CurriculumQuestionItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CurriculumQuestionItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.responseType, responseType) ||
                other.responseType == responseType) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.answered, answered) ||
                other.answered == answered) &&
            (identical(other.translation, translation) ||
                other.translation == translation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    code,
    text,
    sortOrder,
    responseType,
    status,
    answered,
    translation,
  );

  @override
  String toString() {
    return 'CurriculumQuestionItem(id: $id, code: $code, text: $text, sortOrder: $sortOrder, responseType: $responseType, status: $status, answered: $answered, translation: $translation)';
  }
}

/// @nodoc
abstract mixin class $CurriculumQuestionItemCopyWith<$Res> {
  factory $CurriculumQuestionItemCopyWith(
    CurriculumQuestionItem value,
    $Res Function(CurriculumQuestionItem) _then,
  ) = _$CurriculumQuestionItemCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String code,
    String text,
    int sortOrder,
    @JsonKey(unknownEnumValue: QuestionResponseType.text)
    QuestionResponseType responseType,
    @JsonKey(unknownEnumValue: RecordStatus.inactive) RecordStatus status,
    bool answered,
    CurriculumText? translation,
  });

  $CurriculumTextCopyWith<$Res>? get translation;
}

/// @nodoc
class _$CurriculumQuestionItemCopyWithImpl<$Res>
    implements $CurriculumQuestionItemCopyWith<$Res> {
  _$CurriculumQuestionItemCopyWithImpl(this._self, this._then);

  final CurriculumQuestionItem _self;
  final $Res Function(CurriculumQuestionItem) _then;

  /// Create a copy of CurriculumQuestionItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? text = null,
    Object? sortOrder = null,
    Object? responseType = null,
    Object? status = null,
    Object? answered = null,
    Object? translation = freezed,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        code: null == code
            ? _self.code
            : code // ignore: cast_nullable_to_non_nullable
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
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as RecordStatus,
        answered: null == answered
            ? _self.answered
            : answered // ignore: cast_nullable_to_non_nullable
                  as bool,
        translation: freezed == translation
            ? _self.translation
            : translation // ignore: cast_nullable_to_non_nullable
                  as CurriculumText?,
      ),
    );
  }

  /// Create a copy of CurriculumQuestionItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurriculumTextCopyWith<$Res>? get translation {
    if (_self.translation == null) {
      return null;
    }

    return $CurriculumTextCopyWith<$Res>(_self.translation!, (value) {
      return _then(_self.copyWith(translation: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CurriculumQuestionItem].
extension CurriculumQuestionItemPatterns on CurriculumQuestionItem {
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
    TResult Function(_CurriculumQuestionItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CurriculumQuestionItem() when $default != null:
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
    TResult Function(_CurriculumQuestionItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumQuestionItem():
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
    TResult? Function(_CurriculumQuestionItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumQuestionItem() when $default != null:
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
      String code,
      String text,
      int sortOrder,
      @JsonKey(unknownEnumValue: QuestionResponseType.text)
      QuestionResponseType responseType,
      @JsonKey(unknownEnumValue: RecordStatus.inactive) RecordStatus status,
      bool answered,
      CurriculumText? translation,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CurriculumQuestionItem() when $default != null:
        return $default(
          _that.id,
          _that.code,
          _that.text,
          _that.sortOrder,
          _that.responseType,
          _that.status,
          _that.answered,
          _that.translation,
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
      String code,
      String text,
      int sortOrder,
      @JsonKey(unknownEnumValue: QuestionResponseType.text)
      QuestionResponseType responseType,
      @JsonKey(unknownEnumValue: RecordStatus.inactive) RecordStatus status,
      bool answered,
      CurriculumText? translation,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumQuestionItem():
        return $default(
          _that.id,
          _that.code,
          _that.text,
          _that.sortOrder,
          _that.responseType,
          _that.status,
          _that.answered,
          _that.translation,
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
      String code,
      String text,
      int sortOrder,
      @JsonKey(unknownEnumValue: QuestionResponseType.text)
      QuestionResponseType responseType,
      @JsonKey(unknownEnumValue: RecordStatus.inactive) RecordStatus status,
      bool answered,
      CurriculumText? translation,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumQuestionItem() when $default != null:
        return $default(
          _that.id,
          _that.code,
          _that.text,
          _that.sortOrder,
          _that.responseType,
          _that.status,
          _that.answered,
          _that.translation,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CurriculumQuestionItem extends CurriculumQuestionItem {
  const _CurriculumQuestionItem({
    required this.id,
    required this.code,
    required this.text,
    this.sortOrder = 1,
    @JsonKey(unknownEnumValue: QuestionResponseType.text)
    this.responseType = QuestionResponseType.text,
    @JsonKey(unknownEnumValue: RecordStatus.inactive)
    this.status = RecordStatus.active,
    this.answered = false,
    this.translation,
  }) : super._();
  factory _CurriculumQuestionItem.fromJson(Map<String, dynamic> json) =>
      _$CurriculumQuestionItemFromJson(json);

  @override
  final String id;
  @override
  final String code;
  @override
  final String text;
  @override
  @JsonKey()
  final int sortOrder;
  @override
  @JsonKey(unknownEnumValue: QuestionResponseType.text)
  final QuestionResponseType responseType;
  @override
  @JsonKey(unknownEnumValue: RecordStatus.inactive)
  final RecordStatus status;

  /// Someone has already answered it: its answer type cannot change.
  @override
  @JsonKey()
  final bool answered;
  @override
  final CurriculumText? translation;

  /// Create a copy of CurriculumQuestionItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CurriculumQuestionItemCopyWith<_CurriculumQuestionItem> get copyWith =>
      __$CurriculumQuestionItemCopyWithImpl<_CurriculumQuestionItem>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$CurriculumQuestionItemToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CurriculumQuestionItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.responseType, responseType) ||
                other.responseType == responseType) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.answered, answered) ||
                other.answered == answered) &&
            (identical(other.translation, translation) ||
                other.translation == translation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    code,
    text,
    sortOrder,
    responseType,
    status,
    answered,
    translation,
  );

  @override
  String toString() {
    return 'CurriculumQuestionItem(id: $id, code: $code, text: $text, sortOrder: $sortOrder, responseType: $responseType, status: $status, answered: $answered, translation: $translation)';
  }
}

/// @nodoc
abstract mixin class _$CurriculumQuestionItemCopyWith<$Res>
    implements $CurriculumQuestionItemCopyWith<$Res> {
  factory _$CurriculumQuestionItemCopyWith(
    _CurriculumQuestionItem value,
    $Res Function(_CurriculumQuestionItem) _then,
  ) = __$CurriculumQuestionItemCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String code,
    String text,
    int sortOrder,
    @JsonKey(unknownEnumValue: QuestionResponseType.text)
    QuestionResponseType responseType,
    @JsonKey(unknownEnumValue: RecordStatus.inactive) RecordStatus status,
    bool answered,
    CurriculumText? translation,
  });

  @override
  $CurriculumTextCopyWith<$Res>? get translation;
}

/// @nodoc
class __$CurriculumQuestionItemCopyWithImpl<$Res>
    implements _$CurriculumQuestionItemCopyWith<$Res> {
  __$CurriculumQuestionItemCopyWithImpl(this._self, this._then);

  final _CurriculumQuestionItem _self;
  final $Res Function(_CurriculumQuestionItem) _then;

  /// Create a copy of CurriculumQuestionItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? text = null,
    Object? sortOrder = null,
    Object? responseType = null,
    Object? status = null,
    Object? answered = null,
    Object? translation = freezed,
  }) {
    return _then(
      _CurriculumQuestionItem(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        code: null == code
            ? _self.code
            : code // ignore: cast_nullable_to_non_nullable
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
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as RecordStatus,
        answered: null == answered
            ? _self.answered
            : answered // ignore: cast_nullable_to_non_nullable
                  as bool,
        translation: freezed == translation
            ? _self.translation
            : translation // ignore: cast_nullable_to_non_nullable
                  as CurriculumText?,
      ),
    );
  }

  /// Create a copy of CurriculumQuestionItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurriculumTextCopyWith<$Res>? get translation {
    if (_self.translation == null) {
      return null;
    }

    return $CurriculumTextCopyWith<$Res>(_self.translation!, (value) {
      return _then(_self.copyWith(translation: value));
    });
  }
}

/// @nodoc
mixin _$CurriculumValueItem {
  String get id;
  int get number;
  int get numberInModule;
  String get name;
  String? get description;
  String? get bookletReference;
  @JsonKey(unknownEnumValue: RecordStatus.inactive)
  RecordStatus get status;

  /// A closed session worked this value: only its text can change.
  bool get usedByClosedSessions;
  CurriculumText? get translation;
  List<CurriculumQuestionItem> get questions;

  /// Create a copy of CurriculumValueItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CurriculumValueItemCopyWith<CurriculumValueItem> get copyWith =>
      _$CurriculumValueItemCopyWithImpl<CurriculumValueItem>(
        this as CurriculumValueItem,
        _$identity,
      );

  /// Serializes this CurriculumValueItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CurriculumValueItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.numberInModule, numberInModule) ||
                other.numberInModule == numberInModule) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.bookletReference, bookletReference) ||
                other.bookletReference == bookletReference) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.usedByClosedSessions, usedByClosedSessions) ||
                other.usedByClosedSessions == usedByClosedSessions) &&
            (identical(other.translation, translation) ||
                other.translation == translation) &&
            const DeepCollectionEquality().equals(other.questions, questions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    number,
    numberInModule,
    name,
    description,
    bookletReference,
    status,
    usedByClosedSessions,
    translation,
    const DeepCollectionEquality().hash(questions),
  );

  @override
  String toString() {
    return 'CurriculumValueItem(id: $id, number: $number, numberInModule: $numberInModule, name: $name, description: $description, bookletReference: $bookletReference, status: $status, usedByClosedSessions: $usedByClosedSessions, translation: $translation, questions: $questions)';
  }
}

/// @nodoc
abstract mixin class $CurriculumValueItemCopyWith<$Res> {
  factory $CurriculumValueItemCopyWith(
    CurriculumValueItem value,
    $Res Function(CurriculumValueItem) _then,
  ) = _$CurriculumValueItemCopyWithImpl;
  @useResult
  $Res call({
    String id,
    int number,
    int numberInModule,
    String name,
    String? description,
    String? bookletReference,
    @JsonKey(unknownEnumValue: RecordStatus.inactive) RecordStatus status,
    bool usedByClosedSessions,
    CurriculumText? translation,
    List<CurriculumQuestionItem> questions,
  });

  $CurriculumTextCopyWith<$Res>? get translation;
}

/// @nodoc
class _$CurriculumValueItemCopyWithImpl<$Res>
    implements $CurriculumValueItemCopyWith<$Res> {
  _$CurriculumValueItemCopyWithImpl(this._self, this._then);

  final CurriculumValueItem _self;
  final $Res Function(CurriculumValueItem) _then;

  /// Create a copy of CurriculumValueItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? number = null,
    Object? numberInModule = null,
    Object? name = null,
    Object? description = freezed,
    Object? bookletReference = freezed,
    Object? status = null,
    Object? usedByClosedSessions = null,
    Object? translation = freezed,
    Object? questions = null,
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
        numberInModule: null == numberInModule
            ? _self.numberInModule
            : numberInModule // ignore: cast_nullable_to_non_nullable
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
                  as RecordStatus,
        usedByClosedSessions: null == usedByClosedSessions
            ? _self.usedByClosedSessions
            : usedByClosedSessions // ignore: cast_nullable_to_non_nullable
                  as bool,
        translation: freezed == translation
            ? _self.translation
            : translation // ignore: cast_nullable_to_non_nullable
                  as CurriculumText?,
        questions: null == questions
            ? _self.questions
            : questions // ignore: cast_nullable_to_non_nullable
                  as List<CurriculumQuestionItem>,
      ),
    );
  }

  /// Create a copy of CurriculumValueItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurriculumTextCopyWith<$Res>? get translation {
    if (_self.translation == null) {
      return null;
    }

    return $CurriculumTextCopyWith<$Res>(_self.translation!, (value) {
      return _then(_self.copyWith(translation: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CurriculumValueItem].
extension CurriculumValueItemPatterns on CurriculumValueItem {
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
    TResult Function(_CurriculumValueItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CurriculumValueItem() when $default != null:
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
    TResult Function(_CurriculumValueItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumValueItem():
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
    TResult? Function(_CurriculumValueItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumValueItem() when $default != null:
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
      int numberInModule,
      String name,
      String? description,
      String? bookletReference,
      @JsonKey(unknownEnumValue: RecordStatus.inactive) RecordStatus status,
      bool usedByClosedSessions,
      CurriculumText? translation,
      List<CurriculumQuestionItem> questions,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CurriculumValueItem() when $default != null:
        return $default(
          _that.id,
          _that.number,
          _that.numberInModule,
          _that.name,
          _that.description,
          _that.bookletReference,
          _that.status,
          _that.usedByClosedSessions,
          _that.translation,
          _that.questions,
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
      int numberInModule,
      String name,
      String? description,
      String? bookletReference,
      @JsonKey(unknownEnumValue: RecordStatus.inactive) RecordStatus status,
      bool usedByClosedSessions,
      CurriculumText? translation,
      List<CurriculumQuestionItem> questions,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumValueItem():
        return $default(
          _that.id,
          _that.number,
          _that.numberInModule,
          _that.name,
          _that.description,
          _that.bookletReference,
          _that.status,
          _that.usedByClosedSessions,
          _that.translation,
          _that.questions,
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
      int numberInModule,
      String name,
      String? description,
      String? bookletReference,
      @JsonKey(unknownEnumValue: RecordStatus.inactive) RecordStatus status,
      bool usedByClosedSessions,
      CurriculumText? translation,
      List<CurriculumQuestionItem> questions,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumValueItem() when $default != null:
        return $default(
          _that.id,
          _that.number,
          _that.numberInModule,
          _that.name,
          _that.description,
          _that.bookletReference,
          _that.status,
          _that.usedByClosedSessions,
          _that.translation,
          _that.questions,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CurriculumValueItem extends CurriculumValueItem {
  const _CurriculumValueItem({
    required this.id,
    required this.number,
    this.numberInModule = 1,
    required this.name,
    this.description,
    this.bookletReference,
    @JsonKey(unknownEnumValue: RecordStatus.inactive)
    this.status = RecordStatus.active,
    this.usedByClosedSessions = false,
    this.translation,
    final List<CurriculumQuestionItem> questions = const [],
  }) : _questions = questions,
       super._();
  factory _CurriculumValueItem.fromJson(Map<String, dynamic> json) =>
      _$CurriculumValueItemFromJson(json);

  @override
  final String id;
  @override
  final int number;
  @override
  @JsonKey()
  final int numberInModule;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String? bookletReference;
  @override
  @JsonKey(unknownEnumValue: RecordStatus.inactive)
  final RecordStatus status;

  /// A closed session worked this value: only its text can change.
  @override
  @JsonKey()
  final bool usedByClosedSessions;
  @override
  final CurriculumText? translation;
  final List<CurriculumQuestionItem> _questions;
  @override
  @JsonKey()
  List<CurriculumQuestionItem> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  /// Create a copy of CurriculumValueItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CurriculumValueItemCopyWith<_CurriculumValueItem> get copyWith =>
      __$CurriculumValueItemCopyWithImpl<_CurriculumValueItem>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$CurriculumValueItemToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CurriculumValueItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.numberInModule, numberInModule) ||
                other.numberInModule == numberInModule) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.bookletReference, bookletReference) ||
                other.bookletReference == bookletReference) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.usedByClosedSessions, usedByClosedSessions) ||
                other.usedByClosedSessions == usedByClosedSessions) &&
            (identical(other.translation, translation) ||
                other.translation == translation) &&
            const DeepCollectionEquality().equals(
              other._questions,
              _questions,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    number,
    numberInModule,
    name,
    description,
    bookletReference,
    status,
    usedByClosedSessions,
    translation,
    const DeepCollectionEquality().hash(_questions),
  );

  @override
  String toString() {
    return 'CurriculumValueItem(id: $id, number: $number, numberInModule: $numberInModule, name: $name, description: $description, bookletReference: $bookletReference, status: $status, usedByClosedSessions: $usedByClosedSessions, translation: $translation, questions: $questions)';
  }
}

/// @nodoc
abstract mixin class _$CurriculumValueItemCopyWith<$Res>
    implements $CurriculumValueItemCopyWith<$Res> {
  factory _$CurriculumValueItemCopyWith(
    _CurriculumValueItem value,
    $Res Function(_CurriculumValueItem) _then,
  ) = __$CurriculumValueItemCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    int number,
    int numberInModule,
    String name,
    String? description,
    String? bookletReference,
    @JsonKey(unknownEnumValue: RecordStatus.inactive) RecordStatus status,
    bool usedByClosedSessions,
    CurriculumText? translation,
    List<CurriculumQuestionItem> questions,
  });

  @override
  $CurriculumTextCopyWith<$Res>? get translation;
}

/// @nodoc
class __$CurriculumValueItemCopyWithImpl<$Res>
    implements _$CurriculumValueItemCopyWith<$Res> {
  __$CurriculumValueItemCopyWithImpl(this._self, this._then);

  final _CurriculumValueItem _self;
  final $Res Function(_CurriculumValueItem) _then;

  /// Create a copy of CurriculumValueItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? number = null,
    Object? numberInModule = null,
    Object? name = null,
    Object? description = freezed,
    Object? bookletReference = freezed,
    Object? status = null,
    Object? usedByClosedSessions = null,
    Object? translation = freezed,
    Object? questions = null,
  }) {
    return _then(
      _CurriculumValueItem(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        number: null == number
            ? _self.number
            : number // ignore: cast_nullable_to_non_nullable
                  as int,
        numberInModule: null == numberInModule
            ? _self.numberInModule
            : numberInModule // ignore: cast_nullable_to_non_nullable
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
                  as RecordStatus,
        usedByClosedSessions: null == usedByClosedSessions
            ? _self.usedByClosedSessions
            : usedByClosedSessions // ignore: cast_nullable_to_non_nullable
                  as bool,
        translation: freezed == translation
            ? _self.translation
            : translation // ignore: cast_nullable_to_non_nullable
                  as CurriculumText?,
        questions: null == questions
            ? _self._questions
            : questions // ignore: cast_nullable_to_non_nullable
                  as List<CurriculumQuestionItem>,
      ),
    );
  }

  /// Create a copy of CurriculumValueItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurriculumTextCopyWith<$Res>? get translation {
    if (_self.translation == null) {
      return null;
    }

    return $CurriculumTextCopyWith<$Res>(_self.translation!, (value) {
      return _then(_self.copyWith(translation: value));
    });
  }
}

/// @nodoc
mixin _$CurriculumModuleItem {
  String get id;
  int get number;
  String get name;
  String? get description;
  @JsonKey(unknownEnumValue: RecordStatus.inactive)
  RecordStatus get status;
  CurriculumText? get translation;
  List<CurriculumValueItem> get values;

  /// Create a copy of CurriculumModuleItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CurriculumModuleItemCopyWith<CurriculumModuleItem> get copyWith =>
      _$CurriculumModuleItemCopyWithImpl<CurriculumModuleItem>(
        this as CurriculumModuleItem,
        _$identity,
      );

  /// Serializes this CurriculumModuleItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CurriculumModuleItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.translation, translation) ||
                other.translation == translation) &&
            const DeepCollectionEquality().equals(other.values, values));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    number,
    name,
    description,
    status,
    translation,
    const DeepCollectionEquality().hash(values),
  );

  @override
  String toString() {
    return 'CurriculumModuleItem(id: $id, number: $number, name: $name, description: $description, status: $status, translation: $translation, values: $values)';
  }
}

/// @nodoc
abstract mixin class $CurriculumModuleItemCopyWith<$Res> {
  factory $CurriculumModuleItemCopyWith(
    CurriculumModuleItem value,
    $Res Function(CurriculumModuleItem) _then,
  ) = _$CurriculumModuleItemCopyWithImpl;
  @useResult
  $Res call({
    String id,
    int number,
    String name,
    String? description,
    @JsonKey(unknownEnumValue: RecordStatus.inactive) RecordStatus status,
    CurriculumText? translation,
    List<CurriculumValueItem> values,
  });

  $CurriculumTextCopyWith<$Res>? get translation;
}

/// @nodoc
class _$CurriculumModuleItemCopyWithImpl<$Res>
    implements $CurriculumModuleItemCopyWith<$Res> {
  _$CurriculumModuleItemCopyWithImpl(this._self, this._then);

  final CurriculumModuleItem _self;
  final $Res Function(CurriculumModuleItem) _then;

  /// Create a copy of CurriculumModuleItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? number = null,
    Object? name = null,
    Object? description = freezed,
    Object? status = null,
    Object? translation = freezed,
    Object? values = null,
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
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as RecordStatus,
        translation: freezed == translation
            ? _self.translation
            : translation // ignore: cast_nullable_to_non_nullable
                  as CurriculumText?,
        values: null == values
            ? _self.values
            : values // ignore: cast_nullable_to_non_nullable
                  as List<CurriculumValueItem>,
      ),
    );
  }

  /// Create a copy of CurriculumModuleItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurriculumTextCopyWith<$Res>? get translation {
    if (_self.translation == null) {
      return null;
    }

    return $CurriculumTextCopyWith<$Res>(_self.translation!, (value) {
      return _then(_self.copyWith(translation: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CurriculumModuleItem].
extension CurriculumModuleItemPatterns on CurriculumModuleItem {
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
    TResult Function(_CurriculumModuleItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CurriculumModuleItem() when $default != null:
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
    TResult Function(_CurriculumModuleItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumModuleItem():
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
    TResult? Function(_CurriculumModuleItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumModuleItem() when $default != null:
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
      @JsonKey(unknownEnumValue: RecordStatus.inactive) RecordStatus status,
      CurriculumText? translation,
      List<CurriculumValueItem> values,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CurriculumModuleItem() when $default != null:
        return $default(
          _that.id,
          _that.number,
          _that.name,
          _that.description,
          _that.status,
          _that.translation,
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
      String id,
      int number,
      String name,
      String? description,
      @JsonKey(unknownEnumValue: RecordStatus.inactive) RecordStatus status,
      CurriculumText? translation,
      List<CurriculumValueItem> values,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumModuleItem():
        return $default(
          _that.id,
          _that.number,
          _that.name,
          _that.description,
          _that.status,
          _that.translation,
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
      String id,
      int number,
      String name,
      String? description,
      @JsonKey(unknownEnumValue: RecordStatus.inactive) RecordStatus status,
      CurriculumText? translation,
      List<CurriculumValueItem> values,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumModuleItem() when $default != null:
        return $default(
          _that.id,
          _that.number,
          _that.name,
          _that.description,
          _that.status,
          _that.translation,
          _that.values,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CurriculumModuleItem implements CurriculumModuleItem {
  const _CurriculumModuleItem({
    required this.id,
    required this.number,
    required this.name,
    this.description,
    @JsonKey(unknownEnumValue: RecordStatus.inactive)
    this.status = RecordStatus.active,
    this.translation,
    final List<CurriculumValueItem> values = const [],
  }) : _values = values;
  factory _CurriculumModuleItem.fromJson(Map<String, dynamic> json) =>
      _$CurriculumModuleItemFromJson(json);

  @override
  final String id;
  @override
  final int number;
  @override
  final String name;
  @override
  final String? description;
  @override
  @JsonKey(unknownEnumValue: RecordStatus.inactive)
  final RecordStatus status;
  @override
  final CurriculumText? translation;
  final List<CurriculumValueItem> _values;
  @override
  @JsonKey()
  List<CurriculumValueItem> get values {
    if (_values is EqualUnmodifiableListView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_values);
  }

  /// Create a copy of CurriculumModuleItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CurriculumModuleItemCopyWith<_CurriculumModuleItem> get copyWith =>
      __$CurriculumModuleItemCopyWithImpl<_CurriculumModuleItem>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$CurriculumModuleItemToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CurriculumModuleItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.translation, translation) ||
                other.translation == translation) &&
            const DeepCollectionEquality().equals(other._values, _values));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    number,
    name,
    description,
    status,
    translation,
    const DeepCollectionEquality().hash(_values),
  );

  @override
  String toString() {
    return 'CurriculumModuleItem(id: $id, number: $number, name: $name, description: $description, status: $status, translation: $translation, values: $values)';
  }
}

/// @nodoc
abstract mixin class _$CurriculumModuleItemCopyWith<$Res>
    implements $CurriculumModuleItemCopyWith<$Res> {
  factory _$CurriculumModuleItemCopyWith(
    _CurriculumModuleItem value,
    $Res Function(_CurriculumModuleItem) _then,
  ) = __$CurriculumModuleItemCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    int number,
    String name,
    String? description,
    @JsonKey(unknownEnumValue: RecordStatus.inactive) RecordStatus status,
    CurriculumText? translation,
    List<CurriculumValueItem> values,
  });

  @override
  $CurriculumTextCopyWith<$Res>? get translation;
}

/// @nodoc
class __$CurriculumModuleItemCopyWithImpl<$Res>
    implements _$CurriculumModuleItemCopyWith<$Res> {
  __$CurriculumModuleItemCopyWithImpl(this._self, this._then);

  final _CurriculumModuleItem _self;
  final $Res Function(_CurriculumModuleItem) _then;

  /// Create a copy of CurriculumModuleItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? number = null,
    Object? name = null,
    Object? description = freezed,
    Object? status = null,
    Object? translation = freezed,
    Object? values = null,
  }) {
    return _then(
      _CurriculumModuleItem(
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
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as RecordStatus,
        translation: freezed == translation
            ? _self.translation
            : translation // ignore: cast_nullable_to_non_nullable
                  as CurriculumText?,
        values: null == values
            ? _self._values
            : values // ignore: cast_nullable_to_non_nullable
                  as List<CurriculumValueItem>,
      ),
    );
  }

  /// Create a copy of CurriculumModuleItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurriculumTextCopyWith<$Res>? get translation {
    if (_self.translation == null) {
      return null;
    }

    return $CurriculumTextCopyWith<$Res>(_self.translation!, (value) {
      return _then(_self.copyWith(translation: value));
    });
  }
}

/// @nodoc
mixin _$CurriculumView {
  String? get locale;
  List<ContentLocale> get locales;
  List<CurriculumModuleItem> get modules;

  /// Create a copy of CurriculumView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CurriculumViewCopyWith<CurriculumView> get copyWith =>
      _$CurriculumViewCopyWithImpl<CurriculumView>(
        this as CurriculumView,
        _$identity,
      );

  /// Serializes this CurriculumView to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CurriculumView &&
            (identical(other.locale, locale) || other.locale == locale) &&
            const DeepCollectionEquality().equals(other.locales, locales) &&
            const DeepCollectionEquality().equals(other.modules, modules));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    locale,
    const DeepCollectionEquality().hash(locales),
    const DeepCollectionEquality().hash(modules),
  );

  @override
  String toString() {
    return 'CurriculumView(locale: $locale, locales: $locales, modules: $modules)';
  }
}

/// @nodoc
abstract mixin class $CurriculumViewCopyWith<$Res> {
  factory $CurriculumViewCopyWith(
    CurriculumView value,
    $Res Function(CurriculumView) _then,
  ) = _$CurriculumViewCopyWithImpl;
  @useResult
  $Res call({
    String? locale,
    List<ContentLocale> locales,
    List<CurriculumModuleItem> modules,
  });
}

/// @nodoc
class _$CurriculumViewCopyWithImpl<$Res>
    implements $CurriculumViewCopyWith<$Res> {
  _$CurriculumViewCopyWithImpl(this._self, this._then);

  final CurriculumView _self;
  final $Res Function(CurriculumView) _then;

  /// Create a copy of CurriculumView
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = freezed,
    Object? locales = null,
    Object? modules = null,
  }) {
    return _then(
      _self.copyWith(
        locale: freezed == locale
            ? _self.locale
            : locale // ignore: cast_nullable_to_non_nullable
                  as String?,
        locales: null == locales
            ? _self.locales
            : locales // ignore: cast_nullable_to_non_nullable
                  as List<ContentLocale>,
        modules: null == modules
            ? _self.modules
            : modules // ignore: cast_nullable_to_non_nullable
                  as List<CurriculumModuleItem>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [CurriculumView].
extension CurriculumViewPatterns on CurriculumView {
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
    TResult Function(_CurriculumView value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CurriculumView() when $default != null:
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
    TResult Function(_CurriculumView value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumView():
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
    TResult? Function(_CurriculumView value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumView() when $default != null:
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
      String? locale,
      List<ContentLocale> locales,
      List<CurriculumModuleItem> modules,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CurriculumView() when $default != null:
        return $default(_that.locale, _that.locales, _that.modules);
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
      String? locale,
      List<ContentLocale> locales,
      List<CurriculumModuleItem> modules,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumView():
        return $default(_that.locale, _that.locales, _that.modules);
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
      String? locale,
      List<ContentLocale> locales,
      List<CurriculumModuleItem> modules,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumView() when $default != null:
        return $default(_that.locale, _that.locales, _that.modules);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CurriculumView extends CurriculumView {
  const _CurriculumView({
    this.locale,
    final List<ContentLocale> locales = const [],
    final List<CurriculumModuleItem> modules = const [],
  }) : _locales = locales,
       _modules = modules,
       super._();
  factory _CurriculumView.fromJson(Map<String, dynamic> json) =>
      _$CurriculumViewFromJson(json);

  @override
  final String? locale;
  final List<ContentLocale> _locales;
  @override
  @JsonKey()
  List<ContentLocale> get locales {
    if (_locales is EqualUnmodifiableListView) return _locales;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_locales);
  }

  final List<CurriculumModuleItem> _modules;
  @override
  @JsonKey()
  List<CurriculumModuleItem> get modules {
    if (_modules is EqualUnmodifiableListView) return _modules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_modules);
  }

  /// Create a copy of CurriculumView
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CurriculumViewCopyWith<_CurriculumView> get copyWith =>
      __$CurriculumViewCopyWithImpl<_CurriculumView>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CurriculumViewToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CurriculumView &&
            (identical(other.locale, locale) || other.locale == locale) &&
            const DeepCollectionEquality().equals(other._locales, _locales) &&
            const DeepCollectionEquality().equals(other._modules, _modules));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    locale,
    const DeepCollectionEquality().hash(_locales),
    const DeepCollectionEquality().hash(_modules),
  );

  @override
  String toString() {
    return 'CurriculumView(locale: $locale, locales: $locales, modules: $modules)';
  }
}

/// @nodoc
abstract mixin class _$CurriculumViewCopyWith<$Res>
    implements $CurriculumViewCopyWith<$Res> {
  factory _$CurriculumViewCopyWith(
    _CurriculumView value,
    $Res Function(_CurriculumView) _then,
  ) = __$CurriculumViewCopyWithImpl;
  @override
  @useResult
  $Res call({
    String? locale,
    List<ContentLocale> locales,
    List<CurriculumModuleItem> modules,
  });
}

/// @nodoc
class __$CurriculumViewCopyWithImpl<$Res>
    implements _$CurriculumViewCopyWith<$Res> {
  __$CurriculumViewCopyWithImpl(this._self, this._then);

  final _CurriculumView _self;
  final $Res Function(_CurriculumView) _then;

  /// Create a copy of CurriculumView
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? locale = freezed,
    Object? locales = null,
    Object? modules = null,
  }) {
    return _then(
      _CurriculumView(
        locale: freezed == locale
            ? _self.locale
            : locale // ignore: cast_nullable_to_non_nullable
                  as String?,
        locales: null == locales
            ? _self._locales
            : locales // ignore: cast_nullable_to_non_nullable
                  as List<ContentLocale>,
        modules: null == modules
            ? _self._modules
            : modules // ignore: cast_nullable_to_non_nullable
                  as List<CurriculumModuleItem>,
      ),
    );
  }
}
