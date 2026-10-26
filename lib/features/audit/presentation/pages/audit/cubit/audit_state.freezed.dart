// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuditState {
  AuditStatus get status;
  ApiException? get error;
  bool get refreshing;
  List<AuditEvent> get events;
  List<AdminOrganization> get organizations;
  AuditCategory? get category;
  String? get organizationId;
  String get search;
  int get limit;

  /// More events may exist on the server beyond [limit].
  bool get hasMore;

  /// Create a copy of AuditState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuditStateCopyWith<AuditState> get copyWith =>
      _$AuditStateCopyWithImpl<AuditState>(this as AuditState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuditState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.refreshing, refreshing) ||
                other.refreshing == refreshing) &&
            const DeepCollectionEquality().equals(other.events, events) &&
            const DeepCollectionEquality().equals(
              other.organizations,
              organizations,
            ) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    error,
    refreshing,
    const DeepCollectionEquality().hash(events),
    const DeepCollectionEquality().hash(organizations),
    category,
    organizationId,
    search,
    limit,
    hasMore,
  );

  @override
  String toString() {
    return 'AuditState(status: $status, error: $error, refreshing: $refreshing, events: $events, organizations: $organizations, category: $category, organizationId: $organizationId, search: $search, limit: $limit, hasMore: $hasMore)';
  }
}

/// @nodoc
abstract mixin class $AuditStateCopyWith<$Res> {
  factory $AuditStateCopyWith(
    AuditState value,
    $Res Function(AuditState) _then,
  ) = _$AuditStateCopyWithImpl;
  @useResult
  $Res call({
    AuditStatus status,
    ApiException? error,
    bool refreshing,
    List<AuditEvent> events,
    List<AdminOrganization> organizations,
    AuditCategory? category,
    String? organizationId,
    String search,
    int limit,
    bool hasMore,
  });
}

/// @nodoc
class _$AuditStateCopyWithImpl<$Res> implements $AuditStateCopyWith<$Res> {
  _$AuditStateCopyWithImpl(this._self, this._then);

  final AuditState _self;
  final $Res Function(AuditState) _then;

  /// Create a copy of AuditState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? refreshing = null,
    Object? events = null,
    Object? organizations = null,
    Object? category = freezed,
    Object? organizationId = freezed,
    Object? search = null,
    Object? limit = null,
    Object? hasMore = null,
  }) {
    return _then(
      _self.copyWith(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as AuditStatus,
        error: freezed == error
            ? _self.error
            : error // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
        refreshing: null == refreshing
            ? _self.refreshing
            : refreshing // ignore: cast_nullable_to_non_nullable
                  as bool,
        events: null == events
            ? _self.events
            : events // ignore: cast_nullable_to_non_nullable
                  as List<AuditEvent>,
        organizations: null == organizations
            ? _self.organizations
            : organizations // ignore: cast_nullable_to_non_nullable
                  as List<AdminOrganization>,
        category: freezed == category
            ? _self.category
            : category // ignore: cast_nullable_to_non_nullable
                  as AuditCategory?,
        organizationId: freezed == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        search: null == search
            ? _self.search
            : search // ignore: cast_nullable_to_non_nullable
                  as String,
        limit: null == limit
            ? _self.limit
            : limit // ignore: cast_nullable_to_non_nullable
                  as int,
        hasMore: null == hasMore
            ? _self.hasMore
            : hasMore // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [AuditState].
extension AuditStatePatterns on AuditState {
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
    TResult Function(_AuditState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuditState() when $default != null:
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
    TResult Function(_AuditState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuditState():
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
    TResult? Function(_AuditState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuditState() when $default != null:
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
      AuditStatus status,
      ApiException? error,
      bool refreshing,
      List<AuditEvent> events,
      List<AdminOrganization> organizations,
      AuditCategory? category,
      String? organizationId,
      String search,
      int limit,
      bool hasMore,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuditState() when $default != null:
        return $default(
          _that.status,
          _that.error,
          _that.refreshing,
          _that.events,
          _that.organizations,
          _that.category,
          _that.organizationId,
          _that.search,
          _that.limit,
          _that.hasMore,
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
      AuditStatus status,
      ApiException? error,
      bool refreshing,
      List<AuditEvent> events,
      List<AdminOrganization> organizations,
      AuditCategory? category,
      String? organizationId,
      String search,
      int limit,
      bool hasMore,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuditState():
        return $default(
          _that.status,
          _that.error,
          _that.refreshing,
          _that.events,
          _that.organizations,
          _that.category,
          _that.organizationId,
          _that.search,
          _that.limit,
          _that.hasMore,
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
      AuditStatus status,
      ApiException? error,
      bool refreshing,
      List<AuditEvent> events,
      List<AdminOrganization> organizations,
      AuditCategory? category,
      String? organizationId,
      String search,
      int limit,
      bool hasMore,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuditState() when $default != null:
        return $default(
          _that.status,
          _that.error,
          _that.refreshing,
          _that.events,
          _that.organizations,
          _that.category,
          _that.organizationId,
          _that.search,
          _that.limit,
          _that.hasMore,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AuditState extends AuditState {
  const _AuditState({
    this.status = AuditStatus.loading,
    this.error,
    this.refreshing = false,
    final List<AuditEvent> events = const [],
    final List<AdminOrganization> organizations = const [],
    this.category,
    this.organizationId,
    this.search = '',
    this.limit = 100,
    this.hasMore = false,
  }) : _events = events,
       _organizations = organizations,
       super._();

  @override
  @JsonKey()
  final AuditStatus status;
  @override
  final ApiException? error;
  @override
  @JsonKey()
  final bool refreshing;
  final List<AuditEvent> _events;
  @override
  @JsonKey()
  List<AuditEvent> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  final List<AdminOrganization> _organizations;
  @override
  @JsonKey()
  List<AdminOrganization> get organizations {
    if (_organizations is EqualUnmodifiableListView) return _organizations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_organizations);
  }

  @override
  final AuditCategory? category;
  @override
  final String? organizationId;
  @override
  @JsonKey()
  final String search;
  @override
  @JsonKey()
  final int limit;

  /// More events may exist on the server beyond [limit].
  @override
  @JsonKey()
  final bool hasMore;

  /// Create a copy of AuditState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuditStateCopyWith<_AuditState> get copyWith =>
      __$AuditStateCopyWithImpl<_AuditState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuditState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.refreshing, refreshing) ||
                other.refreshing == refreshing) &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            const DeepCollectionEquality().equals(
              other._organizations,
              _organizations,
            ) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    error,
    refreshing,
    const DeepCollectionEquality().hash(_events),
    const DeepCollectionEquality().hash(_organizations),
    category,
    organizationId,
    search,
    limit,
    hasMore,
  );

  @override
  String toString() {
    return 'AuditState(status: $status, error: $error, refreshing: $refreshing, events: $events, organizations: $organizations, category: $category, organizationId: $organizationId, search: $search, limit: $limit, hasMore: $hasMore)';
  }
}

/// @nodoc
abstract mixin class _$AuditStateCopyWith<$Res>
    implements $AuditStateCopyWith<$Res> {
  factory _$AuditStateCopyWith(
    _AuditState value,
    $Res Function(_AuditState) _then,
  ) = __$AuditStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    AuditStatus status,
    ApiException? error,
    bool refreshing,
    List<AuditEvent> events,
    List<AdminOrganization> organizations,
    AuditCategory? category,
    String? organizationId,
    String search,
    int limit,
    bool hasMore,
  });
}

/// @nodoc
class __$AuditStateCopyWithImpl<$Res> implements _$AuditStateCopyWith<$Res> {
  __$AuditStateCopyWithImpl(this._self, this._then);

  final _AuditState _self;
  final $Res Function(_AuditState) _then;

  /// Create a copy of AuditState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? refreshing = null,
    Object? events = null,
    Object? organizations = null,
    Object? category = freezed,
    Object? organizationId = freezed,
    Object? search = null,
    Object? limit = null,
    Object? hasMore = null,
  }) {
    return _then(
      _AuditState(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as AuditStatus,
        error: freezed == error
            ? _self.error
            : error // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
        refreshing: null == refreshing
            ? _self.refreshing
            : refreshing // ignore: cast_nullable_to_non_nullable
                  as bool,
        events: null == events
            ? _self._events
            : events // ignore: cast_nullable_to_non_nullable
                  as List<AuditEvent>,
        organizations: null == organizations
            ? _self._organizations
            : organizations // ignore: cast_nullable_to_non_nullable
                  as List<AdminOrganization>,
        category: freezed == category
            ? _self.category
            : category // ignore: cast_nullable_to_non_nullable
                  as AuditCategory?,
        organizationId: freezed == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        search: null == search
            ? _self.search
            : search // ignore: cast_nullable_to_non_nullable
                  as String,
        limit: null == limit
            ? _self.limit
            : limit // ignore: cast_nullable_to_non_nullable
                  as int,
        hasMore: null == hasMore
            ? _self.hasMore
            : hasMore // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}
