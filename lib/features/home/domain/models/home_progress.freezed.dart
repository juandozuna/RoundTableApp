// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ModuleProgress {
  int get number;
  String get name;
  int get completed;
  int get total;

  /// Create a copy of ModuleProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ModuleProgressCopyWith<ModuleProgress> get copyWith =>
      _$ModuleProgressCopyWithImpl<ModuleProgress>(
        this as ModuleProgress,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ModuleProgress &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            (identical(other.total, total) || other.total == total));
  }

  @override
  int get hashCode => Object.hash(runtimeType, number, name, completed, total);

  @override
  String toString() {
    return 'ModuleProgress(number: $number, name: $name, completed: $completed, total: $total)';
  }
}

/// @nodoc
abstract mixin class $ModuleProgressCopyWith<$Res> {
  factory $ModuleProgressCopyWith(
    ModuleProgress value,
    $Res Function(ModuleProgress) _then,
  ) = _$ModuleProgressCopyWithImpl;
  @useResult
  $Res call({int number, String name, int completed, int total});
}

/// @nodoc
class _$ModuleProgressCopyWithImpl<$Res>
    implements $ModuleProgressCopyWith<$Res> {
  _$ModuleProgressCopyWithImpl(this._self, this._then);

  final ModuleProgress _self;
  final $Res Function(ModuleProgress) _then;

  /// Create a copy of ModuleProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? name = null,
    Object? completed = null,
    Object? total = null,
  }) {
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
        completed: null == completed
            ? _self.completed
            : completed // ignore: cast_nullable_to_non_nullable
                  as int,
        total: null == total
            ? _self.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [ModuleProgress].
extension ModuleProgressPatterns on ModuleProgress {
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
    TResult Function(_ModuleProgress value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ModuleProgress() when $default != null:
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
    TResult Function(_ModuleProgress value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ModuleProgress():
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
    TResult? Function(_ModuleProgress value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ModuleProgress() when $default != null:
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
    TResult Function(int number, String name, int completed, int total)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ModuleProgress() when $default != null:
        return $default(_that.number, _that.name, _that.completed, _that.total);
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
    TResult Function(int number, String name, int completed, int total)
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ModuleProgress():
        return $default(_that.number, _that.name, _that.completed, _that.total);
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
    TResult? Function(int number, String name, int completed, int total)?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ModuleProgress() when $default != null:
        return $default(_that.number, _that.name, _that.completed, _that.total);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ModuleProgress implements ModuleProgress {
  const _ModuleProgress({
    required this.number,
    required this.name,
    required this.completed,
    required this.total,
  });

  @override
  final int number;
  @override
  final String name;
  @override
  final int completed;
  @override
  final int total;

  /// Create a copy of ModuleProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ModuleProgressCopyWith<_ModuleProgress> get copyWith =>
      __$ModuleProgressCopyWithImpl<_ModuleProgress>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ModuleProgress &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            (identical(other.total, total) || other.total == total));
  }

  @override
  int get hashCode => Object.hash(runtimeType, number, name, completed, total);

  @override
  String toString() {
    return 'ModuleProgress(number: $number, name: $name, completed: $completed, total: $total)';
  }
}

/// @nodoc
abstract mixin class _$ModuleProgressCopyWith<$Res>
    implements $ModuleProgressCopyWith<$Res> {
  factory _$ModuleProgressCopyWith(
    _ModuleProgress value,
    $Res Function(_ModuleProgress) _then,
  ) = __$ModuleProgressCopyWithImpl;
  @override
  @useResult
  $Res call({int number, String name, int completed, int total});
}

/// @nodoc
class __$ModuleProgressCopyWithImpl<$Res>
    implements _$ModuleProgressCopyWith<$Res> {
  __$ModuleProgressCopyWithImpl(this._self, this._then);

  final _ModuleProgress _self;
  final $Res Function(_ModuleProgress) _then;

  /// Create a copy of ModuleProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? number = null,
    Object? name = null,
    Object? completed = null,
    Object? total = null,
  }) {
    return _then(
      _ModuleProgress(
        number: null == number
            ? _self.number
            : number // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        completed: null == completed
            ? _self.completed
            : completed // ignore: cast_nullable_to_non_nullable
                  as int,
        total: null == total
            ? _self.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
mixin _$HomeProgress {
  List<ModuleProgress> get modules;

  /// Create a copy of HomeProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeProgressCopyWith<HomeProgress> get copyWith =>
      _$HomeProgressCopyWithImpl<HomeProgress>(
        this as HomeProgress,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeProgress &&
            const DeepCollectionEquality().equals(other.modules, modules));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(modules));

  @override
  String toString() {
    return 'HomeProgress(modules: $modules)';
  }
}

/// @nodoc
abstract mixin class $HomeProgressCopyWith<$Res> {
  factory $HomeProgressCopyWith(
    HomeProgress value,
    $Res Function(HomeProgress) _then,
  ) = _$HomeProgressCopyWithImpl;
  @useResult
  $Res call({List<ModuleProgress> modules});
}

/// @nodoc
class _$HomeProgressCopyWithImpl<$Res> implements $HomeProgressCopyWith<$Res> {
  _$HomeProgressCopyWithImpl(this._self, this._then);

  final HomeProgress _self;
  final $Res Function(HomeProgress) _then;

  /// Create a copy of HomeProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? modules = null}) {
    return _then(
      _self.copyWith(
        modules: null == modules
            ? _self.modules
            : modules // ignore: cast_nullable_to_non_nullable
                  as List<ModuleProgress>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [HomeProgress].
extension HomeProgressPatterns on HomeProgress {
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
    TResult Function(_HomeProgress value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeProgress() when $default != null:
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
    TResult Function(_HomeProgress value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeProgress():
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
    TResult? Function(_HomeProgress value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeProgress() when $default != null:
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
    TResult Function(List<ModuleProgress> modules)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeProgress() when $default != null:
        return $default(_that.modules);
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
    TResult Function(List<ModuleProgress> modules) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeProgress():
        return $default(_that.modules);
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
    TResult? Function(List<ModuleProgress> modules)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeProgress() when $default != null:
        return $default(_that.modules);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _HomeProgress extends HomeProgress {
  const _HomeProgress({final List<ModuleProgress> modules = const []})
    : _modules = modules,
      super._();

  final List<ModuleProgress> _modules;
  @override
  @JsonKey()
  List<ModuleProgress> get modules {
    if (_modules is EqualUnmodifiableListView) return _modules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_modules);
  }

  /// Create a copy of HomeProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomeProgressCopyWith<_HomeProgress> get copyWith =>
      __$HomeProgressCopyWithImpl<_HomeProgress>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeProgress &&
            const DeepCollectionEquality().equals(other._modules, _modules));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_modules));

  @override
  String toString() {
    return 'HomeProgress(modules: $modules)';
  }
}

/// @nodoc
abstract mixin class _$HomeProgressCopyWith<$Res>
    implements $HomeProgressCopyWith<$Res> {
  factory _$HomeProgressCopyWith(
    _HomeProgress value,
    $Res Function(_HomeProgress) _then,
  ) = __$HomeProgressCopyWithImpl;
  @override
  @useResult
  $Res call({List<ModuleProgress> modules});
}

/// @nodoc
class __$HomeProgressCopyWithImpl<$Res>
    implements _$HomeProgressCopyWith<$Res> {
  __$HomeProgressCopyWithImpl(this._self, this._then);

  final _HomeProgress _self;
  final $Res Function(_HomeProgress) _then;

  /// Create a copy of HomeProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? modules = null}) {
    return _then(
      _HomeProgress(
        modules: null == modules
            ? _self._modules
            : modules // ignore: cast_nullable_to_non_nullable
                  as List<ModuleProgress>,
      ),
    );
  }
}
