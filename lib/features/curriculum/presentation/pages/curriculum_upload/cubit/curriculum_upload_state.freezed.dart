// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'curriculum_upload_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CurriculumUploadState {
  CurriculumUploadStatus get status;
  String? get fileName;

  /// Contents of the file just chosen; the page copies them into the text box.
  String? get pickedContent;
  CurriculumPlan? get plan;
  ApiException? get error;

  /// Create a copy of CurriculumUploadState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CurriculumUploadStateCopyWith<CurriculumUploadState> get copyWith =>
      _$CurriculumUploadStateCopyWithImpl<CurriculumUploadState>(
        this as CurriculumUploadState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CurriculumUploadState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.pickedContent, pickedContent) ||
                other.pickedContent == pickedContent) &&
            (identical(other.plan, plan) || other.plan == plan) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, fileName, pickedContent, plan, error);

  @override
  String toString() {
    return 'CurriculumUploadState(status: $status, fileName: $fileName, pickedContent: $pickedContent, plan: $plan, error: $error)';
  }
}

/// @nodoc
abstract mixin class $CurriculumUploadStateCopyWith<$Res> {
  factory $CurriculumUploadStateCopyWith(
    CurriculumUploadState value,
    $Res Function(CurriculumUploadState) _then,
  ) = _$CurriculumUploadStateCopyWithImpl;
  @useResult
  $Res call({
    CurriculumUploadStatus status,
    String? fileName,
    String? pickedContent,
    CurriculumPlan? plan,
    ApiException? error,
  });

  $CurriculumPlanCopyWith<$Res>? get plan;
}

/// @nodoc
class _$CurriculumUploadStateCopyWithImpl<$Res>
    implements $CurriculumUploadStateCopyWith<$Res> {
  _$CurriculumUploadStateCopyWithImpl(this._self, this._then);

  final CurriculumUploadState _self;
  final $Res Function(CurriculumUploadState) _then;

  /// Create a copy of CurriculumUploadState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? fileName = freezed,
    Object? pickedContent = freezed,
    Object? plan = freezed,
    Object? error = freezed,
  }) {
    return _then(
      _self.copyWith(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as CurriculumUploadStatus,
        fileName: freezed == fileName
            ? _self.fileName
            : fileName // ignore: cast_nullable_to_non_nullable
                  as String?,
        pickedContent: freezed == pickedContent
            ? _self.pickedContent
            : pickedContent // ignore: cast_nullable_to_non_nullable
                  as String?,
        plan: freezed == plan
            ? _self.plan
            : plan // ignore: cast_nullable_to_non_nullable
                  as CurriculumPlan?,
        error: freezed == error
            ? _self.error
            : error // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
      ),
    );
  }

  /// Create a copy of CurriculumUploadState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurriculumPlanCopyWith<$Res>? get plan {
    if (_self.plan == null) {
      return null;
    }

    return $CurriculumPlanCopyWith<$Res>(_self.plan!, (value) {
      return _then(_self.copyWith(plan: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CurriculumUploadState].
extension CurriculumUploadStatePatterns on CurriculumUploadState {
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
    TResult Function(_CurriculumUploadState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CurriculumUploadState() when $default != null:
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
    TResult Function(_CurriculumUploadState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumUploadState():
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
    TResult? Function(_CurriculumUploadState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumUploadState() when $default != null:
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
      CurriculumUploadStatus status,
      String? fileName,
      String? pickedContent,
      CurriculumPlan? plan,
      ApiException? error,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CurriculumUploadState() when $default != null:
        return $default(
          _that.status,
          _that.fileName,
          _that.pickedContent,
          _that.plan,
          _that.error,
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
      CurriculumUploadStatus status,
      String? fileName,
      String? pickedContent,
      CurriculumPlan? plan,
      ApiException? error,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumUploadState():
        return $default(
          _that.status,
          _that.fileName,
          _that.pickedContent,
          _that.plan,
          _that.error,
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
      CurriculumUploadStatus status,
      String? fileName,
      String? pickedContent,
      CurriculumPlan? plan,
      ApiException? error,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumUploadState() when $default != null:
        return $default(
          _that.status,
          _that.fileName,
          _that.pickedContent,
          _that.plan,
          _that.error,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CurriculumUploadState implements CurriculumUploadState {
  const _CurriculumUploadState({
    this.status = CurriculumUploadStatus.editing,
    this.fileName,
    this.pickedContent,
    this.plan,
    this.error,
  });

  @override
  @JsonKey()
  final CurriculumUploadStatus status;
  @override
  final String? fileName;

  /// Contents of the file just chosen; the page copies them into the text box.
  @override
  final String? pickedContent;
  @override
  final CurriculumPlan? plan;
  @override
  final ApiException? error;

  /// Create a copy of CurriculumUploadState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CurriculumUploadStateCopyWith<_CurriculumUploadState> get copyWith =>
      __$CurriculumUploadStateCopyWithImpl<_CurriculumUploadState>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CurriculumUploadState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.pickedContent, pickedContent) ||
                other.pickedContent == pickedContent) &&
            (identical(other.plan, plan) || other.plan == plan) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, fileName, pickedContent, plan, error);

  @override
  String toString() {
    return 'CurriculumUploadState(status: $status, fileName: $fileName, pickedContent: $pickedContent, plan: $plan, error: $error)';
  }
}

/// @nodoc
abstract mixin class _$CurriculumUploadStateCopyWith<$Res>
    implements $CurriculumUploadStateCopyWith<$Res> {
  factory _$CurriculumUploadStateCopyWith(
    _CurriculumUploadState value,
    $Res Function(_CurriculumUploadState) _then,
  ) = __$CurriculumUploadStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    CurriculumUploadStatus status,
    String? fileName,
    String? pickedContent,
    CurriculumPlan? plan,
    ApiException? error,
  });

  @override
  $CurriculumPlanCopyWith<$Res>? get plan;
}

/// @nodoc
class __$CurriculumUploadStateCopyWithImpl<$Res>
    implements _$CurriculumUploadStateCopyWith<$Res> {
  __$CurriculumUploadStateCopyWithImpl(this._self, this._then);

  final _CurriculumUploadState _self;
  final $Res Function(_CurriculumUploadState) _then;

  /// Create a copy of CurriculumUploadState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? fileName = freezed,
    Object? pickedContent = freezed,
    Object? plan = freezed,
    Object? error = freezed,
  }) {
    return _then(
      _CurriculumUploadState(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as CurriculumUploadStatus,
        fileName: freezed == fileName
            ? _self.fileName
            : fileName // ignore: cast_nullable_to_non_nullable
                  as String?,
        pickedContent: freezed == pickedContent
            ? _self.pickedContent
            : pickedContent // ignore: cast_nullable_to_non_nullable
                  as String?,
        plan: freezed == plan
            ? _self.plan
            : plan // ignore: cast_nullable_to_non_nullable
                  as CurriculumPlan?,
        error: freezed == error
            ? _self.error
            : error // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
      ),
    );
  }

  /// Create a copy of CurriculumUploadState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurriculumPlanCopyWith<$Res>? get plan {
    if (_self.plan == null) {
      return null;
    }

    return $CurriculumPlanCopyWith<$Res>(_self.plan!, (value) {
      return _then(_self.copyWith(plan: value));
    });
  }
}
