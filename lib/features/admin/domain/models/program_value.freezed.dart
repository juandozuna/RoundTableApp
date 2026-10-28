// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProgramModule {
  int get number;
  String get name;

  /// Create a copy of ProgramModule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProgramModuleCopyWith<ProgramModule> get copyWith =>
      _$ProgramModuleCopyWithImpl<ProgramModule>(
        this as ProgramModule,
        _$identity,
      );

  /// Serializes this ProgramModule to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProgramModule &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, number, name);

  @override
  String toString() {
    return 'ProgramModule(number: $number, name: $name)';
  }
}

/// @nodoc
abstract mixin class $ProgramModuleCopyWith<$Res> {
  factory $ProgramModuleCopyWith(
    ProgramModule value,
    $Res Function(ProgramModule) _then,
  ) = _$ProgramModuleCopyWithImpl;
  @useResult
  $Res call({int number, String name});
}

/// @nodoc
class _$ProgramModuleCopyWithImpl<$Res>
    implements $ProgramModuleCopyWith<$Res> {
  _$ProgramModuleCopyWithImpl(this._self, this._then);

  final ProgramModule _self;
  final $Res Function(ProgramModule) _then;

  /// Create a copy of ProgramModule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? number = null, Object? name = null}) {
    return _then(
      _self.copyWith(
        number: null == number
            ? _self.number
            : number // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [ProgramModule].
extension ProgramModulePatterns on ProgramModule {
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
    TResult Function(_ProgramModule value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProgramModule() when $default != null:
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
    TResult Function(_ProgramModule value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProgramModule():
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
    TResult? Function(_ProgramModule value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProgramModule() when $default != null:
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
    TResult Function(int number, String name)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProgramModule() when $default != null:
        return $default(_that.number, _that.name);
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
    TResult Function(int number, String name) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProgramModule():
        return $default(_that.number, _that.name);
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
    TResult? Function(int number, String name)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProgramModule() when $default != null:
        return $default(_that.number, _that.name);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ProgramModule implements ProgramModule {
  const _ProgramModule({required this.number, required this.name});
  factory _ProgramModule.fromJson(Map<String, dynamic> json) =>
      _$ProgramModuleFromJson(json);

  @override
  final int number;
  @override
  final String name;

  /// Create a copy of ProgramModule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProgramModuleCopyWith<_ProgramModule> get copyWith =>
      __$ProgramModuleCopyWithImpl<_ProgramModule>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProgramModuleToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProgramModule &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, number, name);

  @override
  String toString() {
    return 'ProgramModule(number: $number, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$ProgramModuleCopyWith<$Res>
    implements $ProgramModuleCopyWith<$Res> {
  factory _$ProgramModuleCopyWith(
    _ProgramModule value,
    $Res Function(_ProgramModule) _then,
  ) = __$ProgramModuleCopyWithImpl;
  @override
  @useResult
  $Res call({int number, String name});
}

/// @nodoc
class __$ProgramModuleCopyWithImpl<$Res>
    implements _$ProgramModuleCopyWith<$Res> {
  __$ProgramModuleCopyWithImpl(this._self, this._then);

  final _ProgramModule _self;
  final $Res Function(_ProgramModule) _then;

  /// Create a copy of ProgramModule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? number = null, Object? name = null}) {
    return _then(
      _ProgramModule(
        number: null == number
            ? _self.number
            : number // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
mixin _$ProgramValue {
  String get id;
  int get sequence;
  int get numberInModule;
  String get name;
  ProgramModule get module;

  /// Create a copy of ProgramValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProgramValueCopyWith<ProgramValue> get copyWith =>
      _$ProgramValueCopyWithImpl<ProgramValue>(
        this as ProgramValue,
        _$identity,
      );

  /// Serializes this ProgramValue to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProgramValue &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence) &&
            (identical(other.numberInModule, numberInModule) ||
                other.numberInModule == numberInModule) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.module, module) || other.module == module));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, sequence, numberInModule, name, module);

  @override
  String toString() {
    return 'ProgramValue(id: $id, sequence: $sequence, numberInModule: $numberInModule, name: $name, module: $module)';
  }
}

/// @nodoc
abstract mixin class $ProgramValueCopyWith<$Res> {
  factory $ProgramValueCopyWith(
    ProgramValue value,
    $Res Function(ProgramValue) _then,
  ) = _$ProgramValueCopyWithImpl;
  @useResult
  $Res call({
    String id,
    int sequence,
    int numberInModule,
    String name,
    ProgramModule module,
  });

  $ProgramModuleCopyWith<$Res> get module;
}

/// @nodoc
class _$ProgramValueCopyWithImpl<$Res> implements $ProgramValueCopyWith<$Res> {
  _$ProgramValueCopyWithImpl(this._self, this._then);

  final ProgramValue _self;
  final $Res Function(ProgramValue) _then;

  /// Create a copy of ProgramValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sequence = null,
    Object? numberInModule = null,
    Object? name = null,
    Object? module = null,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        sequence: null == sequence
            ? _self.sequence
            : sequence // ignore: cast_nullable_to_non_nullable
                  as int,
        numberInModule: null == numberInModule
            ? _self.numberInModule
            : numberInModule // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        module: null == module
            ? _self.module
            : module // ignore: cast_nullable_to_non_nullable
                  as ProgramModule,
      ),
    );
  }

  /// Create a copy of ProgramValue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProgramModuleCopyWith<$Res> get module {
    return $ProgramModuleCopyWith<$Res>(_self.module, (value) {
      return _then(_self.copyWith(module: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ProgramValue].
extension ProgramValuePatterns on ProgramValue {
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
    TResult Function(_ProgramValue value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProgramValue() when $default != null:
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
    TResult Function(_ProgramValue value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProgramValue():
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
    TResult? Function(_ProgramValue value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProgramValue() when $default != null:
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
      int sequence,
      int numberInModule,
      String name,
      ProgramModule module,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProgramValue() when $default != null:
        return $default(
          _that.id,
          _that.sequence,
          _that.numberInModule,
          _that.name,
          _that.module,
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
      int sequence,
      int numberInModule,
      String name,
      ProgramModule module,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProgramValue():
        return $default(
          _that.id,
          _that.sequence,
          _that.numberInModule,
          _that.name,
          _that.module,
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
      int sequence,
      int numberInModule,
      String name,
      ProgramModule module,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProgramValue() when $default != null:
        return $default(
          _that.id,
          _that.sequence,
          _that.numberInModule,
          _that.name,
          _that.module,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ProgramValue implements ProgramValue {
  const _ProgramValue({
    required this.id,
    required this.sequence,
    required this.numberInModule,
    required this.name,
    required this.module,
  });
  factory _ProgramValue.fromJson(Map<String, dynamic> json) =>
      _$ProgramValueFromJson(json);

  @override
  final String id;
  @override
  final int sequence;
  @override
  final int numberInModule;
  @override
  final String name;
  @override
  final ProgramModule module;

  /// Create a copy of ProgramValue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProgramValueCopyWith<_ProgramValue> get copyWith =>
      __$ProgramValueCopyWithImpl<_ProgramValue>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProgramValueToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProgramValue &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence) &&
            (identical(other.numberInModule, numberInModule) ||
                other.numberInModule == numberInModule) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.module, module) || other.module == module));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, sequence, numberInModule, name, module);

  @override
  String toString() {
    return 'ProgramValue(id: $id, sequence: $sequence, numberInModule: $numberInModule, name: $name, module: $module)';
  }
}

/// @nodoc
abstract mixin class _$ProgramValueCopyWith<$Res>
    implements $ProgramValueCopyWith<$Res> {
  factory _$ProgramValueCopyWith(
    _ProgramValue value,
    $Res Function(_ProgramValue) _then,
  ) = __$ProgramValueCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    int sequence,
    int numberInModule,
    String name,
    ProgramModule module,
  });

  @override
  $ProgramModuleCopyWith<$Res> get module;
}

/// @nodoc
class __$ProgramValueCopyWithImpl<$Res>
    implements _$ProgramValueCopyWith<$Res> {
  __$ProgramValueCopyWithImpl(this._self, this._then);

  final _ProgramValue _self;
  final $Res Function(_ProgramValue) _then;

  /// Create a copy of ProgramValue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? sequence = null,
    Object? numberInModule = null,
    Object? name = null,
    Object? module = null,
  }) {
    return _then(
      _ProgramValue(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        sequence: null == sequence
            ? _self.sequence
            : sequence // ignore: cast_nullable_to_non_nullable
                  as int,
        numberInModule: null == numberInModule
            ? _self.numberInModule
            : numberInModule // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        module: null == module
            ? _self.module
            : module // ignore: cast_nullable_to_non_nullable
                  as ProgramModule,
      ),
    );
  }

  /// Create a copy of ProgramValue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProgramModuleCopyWith<$Res> get module {
    return $ProgramModuleCopyWith<$Res>(_self.module, (value) {
      return _then(_self.copyWith(module: value));
    });
  }
}
