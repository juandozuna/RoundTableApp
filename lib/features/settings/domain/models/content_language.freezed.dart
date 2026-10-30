// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_language.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContentLanguage {
  String get code;
  String get name;
  bool get isBase;

  /// Create a copy of ContentLanguage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ContentLanguageCopyWith<ContentLanguage> get copyWith =>
      _$ContentLanguageCopyWithImpl<ContentLanguage>(
        this as ContentLanguage,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ContentLanguage &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isBase, isBase) || other.isBase == isBase));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, name, isBase);

  @override
  String toString() {
    return 'ContentLanguage(code: $code, name: $name, isBase: $isBase)';
  }
}

/// @nodoc
abstract mixin class $ContentLanguageCopyWith<$Res> {
  factory $ContentLanguageCopyWith(
    ContentLanguage value,
    $Res Function(ContentLanguage) _then,
  ) = _$ContentLanguageCopyWithImpl;
  @useResult
  $Res call({String code, String name, bool isBase});
}

/// @nodoc
class _$ContentLanguageCopyWithImpl<$Res>
    implements $ContentLanguageCopyWith<$Res> {
  _$ContentLanguageCopyWithImpl(this._self, this._then);

  final ContentLanguage _self;
  final $Res Function(ContentLanguage) _then;

  /// Create a copy of ContentLanguage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? code = null, Object? name = null, Object? isBase = null}) {
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
        isBase: null == isBase
            ? _self.isBase
            : isBase // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [ContentLanguage].
extension ContentLanguagePatterns on ContentLanguage {
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
    TResult Function(_ContentLanguage value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ContentLanguage() when $default != null:
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
    TResult Function(_ContentLanguage value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContentLanguage():
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
    TResult? Function(_ContentLanguage value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContentLanguage() when $default != null:
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
    TResult Function(String code, String name, bool isBase)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ContentLanguage() when $default != null:
        return $default(_that.code, _that.name, _that.isBase);
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
    TResult Function(String code, String name, bool isBase) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContentLanguage():
        return $default(_that.code, _that.name, _that.isBase);
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
    TResult? Function(String code, String name, bool isBase)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContentLanguage() when $default != null:
        return $default(_that.code, _that.name, _that.isBase);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ContentLanguage implements ContentLanguage {
  const _ContentLanguage({
    required this.code,
    required this.name,
    this.isBase = false,
  });

  @override
  final String code;
  @override
  final String name;
  @override
  @JsonKey()
  final bool isBase;

  /// Create a copy of ContentLanguage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ContentLanguageCopyWith<_ContentLanguage> get copyWith =>
      __$ContentLanguageCopyWithImpl<_ContentLanguage>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ContentLanguage &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isBase, isBase) || other.isBase == isBase));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, name, isBase);

  @override
  String toString() {
    return 'ContentLanguage(code: $code, name: $name, isBase: $isBase)';
  }
}

/// @nodoc
abstract mixin class _$ContentLanguageCopyWith<$Res>
    implements $ContentLanguageCopyWith<$Res> {
  factory _$ContentLanguageCopyWith(
    _ContentLanguage value,
    $Res Function(_ContentLanguage) _then,
  ) = __$ContentLanguageCopyWithImpl;
  @override
  @useResult
  $Res call({String code, String name, bool isBase});
}

/// @nodoc
class __$ContentLanguageCopyWithImpl<$Res>
    implements _$ContentLanguageCopyWith<$Res> {
  __$ContentLanguageCopyWithImpl(this._self, this._then);

  final _ContentLanguage _self;
  final $Res Function(_ContentLanguage) _then;

  /// Create a copy of ContentLanguage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? code = null, Object? name = null, Object? isBase = null}) {
    return _then(
      _ContentLanguage(
        code: null == code
            ? _self.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        isBase: null == isBase
            ? _self.isBase
            : isBase // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
mixin _$ContentLanguageChoice {
  List<ContentLanguage> get available;
  String get selected;

  /// Create a copy of ContentLanguageChoice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ContentLanguageChoiceCopyWith<ContentLanguageChoice> get copyWith =>
      _$ContentLanguageChoiceCopyWithImpl<ContentLanguageChoice>(
        this as ContentLanguageChoice,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ContentLanguageChoice &&
            const DeepCollectionEquality().equals(other.available, available) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(available),
    selected,
  );

  @override
  String toString() {
    return 'ContentLanguageChoice(available: $available, selected: $selected)';
  }
}

/// @nodoc
abstract mixin class $ContentLanguageChoiceCopyWith<$Res> {
  factory $ContentLanguageChoiceCopyWith(
    ContentLanguageChoice value,
    $Res Function(ContentLanguageChoice) _then,
  ) = _$ContentLanguageChoiceCopyWithImpl;
  @useResult
  $Res call({List<ContentLanguage> available, String selected});
}

/// @nodoc
class _$ContentLanguageChoiceCopyWithImpl<$Res>
    implements $ContentLanguageChoiceCopyWith<$Res> {
  _$ContentLanguageChoiceCopyWithImpl(this._self, this._then);

  final ContentLanguageChoice _self;
  final $Res Function(ContentLanguageChoice) _then;

  /// Create a copy of ContentLanguageChoice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? available = null, Object? selected = null}) {
    return _then(
      _self.copyWith(
        available: null == available
            ? _self.available
            : available // ignore: cast_nullable_to_non_nullable
                  as List<ContentLanguage>,
        selected: null == selected
            ? _self.selected
            : selected // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [ContentLanguageChoice].
extension ContentLanguageChoicePatterns on ContentLanguageChoice {
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
    TResult Function(_ContentLanguageChoice value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ContentLanguageChoice() when $default != null:
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
    TResult Function(_ContentLanguageChoice value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContentLanguageChoice():
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
    TResult? Function(_ContentLanguageChoice value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContentLanguageChoice() when $default != null:
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
    TResult Function(List<ContentLanguage> available, String selected)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ContentLanguageChoice() when $default != null:
        return $default(_that.available, _that.selected);
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
    TResult Function(List<ContentLanguage> available, String selected) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContentLanguageChoice():
        return $default(_that.available, _that.selected);
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
    TResult? Function(List<ContentLanguage> available, String selected)?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContentLanguageChoice() when $default != null:
        return $default(_that.available, _that.selected);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ContentLanguageChoice extends ContentLanguageChoice {
  const _ContentLanguageChoice({
    final List<ContentLanguage> available = const [],
    this.selected = ContentLanguageChoice.baseCode,
  }) : _available = available,
       super._();

  final List<ContentLanguage> _available;
  @override
  @JsonKey()
  List<ContentLanguage> get available {
    if (_available is EqualUnmodifiableListView) return _available;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_available);
  }

  @override
  @JsonKey()
  final String selected;

  /// Create a copy of ContentLanguageChoice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ContentLanguageChoiceCopyWith<_ContentLanguageChoice> get copyWith =>
      __$ContentLanguageChoiceCopyWithImpl<_ContentLanguageChoice>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ContentLanguageChoice &&
            const DeepCollectionEquality().equals(
              other._available,
              _available,
            ) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_available),
    selected,
  );

  @override
  String toString() {
    return 'ContentLanguageChoice(available: $available, selected: $selected)';
  }
}

/// @nodoc
abstract mixin class _$ContentLanguageChoiceCopyWith<$Res>
    implements $ContentLanguageChoiceCopyWith<$Res> {
  factory _$ContentLanguageChoiceCopyWith(
    _ContentLanguageChoice value,
    $Res Function(_ContentLanguageChoice) _then,
  ) = __$ContentLanguageChoiceCopyWithImpl;
  @override
  @useResult
  $Res call({List<ContentLanguage> available, String selected});
}

/// @nodoc
class __$ContentLanguageChoiceCopyWithImpl<$Res>
    implements _$ContentLanguageChoiceCopyWith<$Res> {
  __$ContentLanguageChoiceCopyWithImpl(this._self, this._then);

  final _ContentLanguageChoice _self;
  final $Res Function(_ContentLanguageChoice) _then;

  /// Create a copy of ContentLanguageChoice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? available = null, Object? selected = null}) {
    return _then(
      _ContentLanguageChoice(
        available: null == available
            ? _self._available
            : available // ignore: cast_nullable_to_non_nullable
                  as List<ContentLanguage>,
        selected: null == selected
            ? _self.selected
            : selected // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}
