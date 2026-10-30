// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_language_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContentLanguageState {
  ContentLanguageChoice get choice;

  /// Create a copy of ContentLanguageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ContentLanguageStateCopyWith<ContentLanguageState> get copyWith =>
      _$ContentLanguageStateCopyWithImpl<ContentLanguageState>(
        this as ContentLanguageState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ContentLanguageState &&
            (identical(other.choice, choice) || other.choice == choice));
  }

  @override
  int get hashCode => Object.hash(runtimeType, choice);

  @override
  String toString() {
    return 'ContentLanguageState(choice: $choice)';
  }
}

/// @nodoc
abstract mixin class $ContentLanguageStateCopyWith<$Res> {
  factory $ContentLanguageStateCopyWith(
    ContentLanguageState value,
    $Res Function(ContentLanguageState) _then,
  ) = _$ContentLanguageStateCopyWithImpl;
  @useResult
  $Res call({ContentLanguageChoice choice});

  $ContentLanguageChoiceCopyWith<$Res> get choice;
}

/// @nodoc
class _$ContentLanguageStateCopyWithImpl<$Res>
    implements $ContentLanguageStateCopyWith<$Res> {
  _$ContentLanguageStateCopyWithImpl(this._self, this._then);

  final ContentLanguageState _self;
  final $Res Function(ContentLanguageState) _then;

  /// Create a copy of ContentLanguageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? choice = null}) {
    return _then(
      _self.copyWith(
        choice: null == choice
            ? _self.choice
            : choice // ignore: cast_nullable_to_non_nullable
                  as ContentLanguageChoice,
      ),
    );
  }

  /// Create a copy of ContentLanguageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContentLanguageChoiceCopyWith<$Res> get choice {
    return $ContentLanguageChoiceCopyWith<$Res>(_self.choice, (value) {
      return _then(_self.copyWith(choice: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ContentLanguageState].
extension ContentLanguageStatePatterns on ContentLanguageState {
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
    TResult Function(_ContentLanguageState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ContentLanguageState() when $default != null:
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
    TResult Function(_ContentLanguageState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContentLanguageState():
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
    TResult? Function(_ContentLanguageState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContentLanguageState() when $default != null:
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
    TResult Function(ContentLanguageChoice choice)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ContentLanguageState() when $default != null:
        return $default(_that.choice);
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
    TResult Function(ContentLanguageChoice choice) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContentLanguageState():
        return $default(_that.choice);
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
    TResult? Function(ContentLanguageChoice choice)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContentLanguageState() when $default != null:
        return $default(_that.choice);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ContentLanguageState implements ContentLanguageState {
  const _ContentLanguageState({this.choice = const ContentLanguageChoice()});

  @override
  @JsonKey()
  final ContentLanguageChoice choice;

  /// Create a copy of ContentLanguageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ContentLanguageStateCopyWith<_ContentLanguageState> get copyWith =>
      __$ContentLanguageStateCopyWithImpl<_ContentLanguageState>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ContentLanguageState &&
            (identical(other.choice, choice) || other.choice == choice));
  }

  @override
  int get hashCode => Object.hash(runtimeType, choice);

  @override
  String toString() {
    return 'ContentLanguageState(choice: $choice)';
  }
}

/// @nodoc
abstract mixin class _$ContentLanguageStateCopyWith<$Res>
    implements $ContentLanguageStateCopyWith<$Res> {
  factory _$ContentLanguageStateCopyWith(
    _ContentLanguageState value,
    $Res Function(_ContentLanguageState) _then,
  ) = __$ContentLanguageStateCopyWithImpl;
  @override
  @useResult
  $Res call({ContentLanguageChoice choice});

  @override
  $ContentLanguageChoiceCopyWith<$Res> get choice;
}

/// @nodoc
class __$ContentLanguageStateCopyWithImpl<$Res>
    implements _$ContentLanguageStateCopyWith<$Res> {
  __$ContentLanguageStateCopyWithImpl(this._self, this._then);

  final _ContentLanguageState _self;
  final $Res Function(_ContentLanguageState) _then;

  /// Create a copy of ContentLanguageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? choice = null}) {
    return _then(
      _ContentLanguageState(
        choice: null == choice
            ? _self.choice
            : choice // ignore: cast_nullable_to_non_nullable
                  as ContentLanguageChoice,
      ),
    );
  }

  /// Create a copy of ContentLanguageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContentLanguageChoiceCopyWith<$Res> get choice {
    return $ContentLanguageChoiceCopyWith<$Res>(_self.choice, (value) {
      return _then(_self.copyWith(choice: value));
    });
  }
}
