// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invites_manager_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InvitesManagerEvent {
  InvitesManagerEventKind get kind;
  int get serial;
  int get count;
  InviteProblem? get problem;

  /// Create a copy of InvitesManagerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InvitesManagerEventCopyWith<InvitesManagerEvent> get copyWith =>
      _$InvitesManagerEventCopyWithImpl<InvitesManagerEvent>(
        this as InvitesManagerEvent,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvitesManagerEvent &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.serial, serial) || other.serial == serial) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.problem, problem) || other.problem == problem));
  }

  @override
  int get hashCode => Object.hash(runtimeType, kind, serial, count, problem);

  @override
  String toString() {
    return 'InvitesManagerEvent(kind: $kind, serial: $serial, count: $count, problem: $problem)';
  }
}

/// @nodoc
abstract mixin class $InvitesManagerEventCopyWith<$Res> {
  factory $InvitesManagerEventCopyWith(
    InvitesManagerEvent value,
    $Res Function(InvitesManagerEvent) _then,
  ) = _$InvitesManagerEventCopyWithImpl;
  @useResult
  $Res call({
    InvitesManagerEventKind kind,
    int serial,
    int count,
    InviteProblem? problem,
  });
}

/// @nodoc
class _$InvitesManagerEventCopyWithImpl<$Res>
    implements $InvitesManagerEventCopyWith<$Res> {
  _$InvitesManagerEventCopyWithImpl(this._self, this._then);

  final InvitesManagerEvent _self;
  final $Res Function(InvitesManagerEvent) _then;

  /// Create a copy of InvitesManagerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kind = null,
    Object? serial = null,
    Object? count = null,
    Object? problem = freezed,
  }) {
    return _then(
      _self.copyWith(
        kind: null == kind
            ? _self.kind
            : kind // ignore: cast_nullable_to_non_nullable
                  as InvitesManagerEventKind,
        serial: null == serial
            ? _self.serial
            : serial // ignore: cast_nullable_to_non_nullable
                  as int,
        count: null == count
            ? _self.count
            : count // ignore: cast_nullable_to_non_nullable
                  as int,
        problem: freezed == problem
            ? _self.problem
            : problem // ignore: cast_nullable_to_non_nullable
                  as InviteProblem?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [InvitesManagerEvent].
extension InvitesManagerEventPatterns on InvitesManagerEvent {
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
    TResult Function(_InvitesManagerEvent value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvitesManagerEvent() when $default != null:
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
    TResult Function(_InvitesManagerEvent value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvitesManagerEvent():
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
    TResult? Function(_InvitesManagerEvent value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvitesManagerEvent() when $default != null:
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
      InvitesManagerEventKind kind,
      int serial,
      int count,
      InviteProblem? problem,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvitesManagerEvent() when $default != null:
        return $default(_that.kind, _that.serial, _that.count, _that.problem);
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
      InvitesManagerEventKind kind,
      int serial,
      int count,
      InviteProblem? problem,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvitesManagerEvent():
        return $default(_that.kind, _that.serial, _that.count, _that.problem);
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
      InvitesManagerEventKind kind,
      int serial,
      int count,
      InviteProblem? problem,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvitesManagerEvent() when $default != null:
        return $default(_that.kind, _that.serial, _that.count, _that.problem);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _InvitesManagerEvent implements InvitesManagerEvent {
  const _InvitesManagerEvent({
    required this.kind,
    required this.serial,
    this.count = 1,
    this.problem,
  });

  @override
  final InvitesManagerEventKind kind;
  @override
  final int serial;
  @override
  @JsonKey()
  final int count;
  @override
  final InviteProblem? problem;

  /// Create a copy of InvitesManagerEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InvitesManagerEventCopyWith<_InvitesManagerEvent> get copyWith =>
      __$InvitesManagerEventCopyWithImpl<_InvitesManagerEvent>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InvitesManagerEvent &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.serial, serial) || other.serial == serial) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.problem, problem) || other.problem == problem));
  }

  @override
  int get hashCode => Object.hash(runtimeType, kind, serial, count, problem);

  @override
  String toString() {
    return 'InvitesManagerEvent(kind: $kind, serial: $serial, count: $count, problem: $problem)';
  }
}

/// @nodoc
abstract mixin class _$InvitesManagerEventCopyWith<$Res>
    implements $InvitesManagerEventCopyWith<$Res> {
  factory _$InvitesManagerEventCopyWith(
    _InvitesManagerEvent value,
    $Res Function(_InvitesManagerEvent) _then,
  ) = __$InvitesManagerEventCopyWithImpl;
  @override
  @useResult
  $Res call({
    InvitesManagerEventKind kind,
    int serial,
    int count,
    InviteProblem? problem,
  });
}

/// @nodoc
class __$InvitesManagerEventCopyWithImpl<$Res>
    implements _$InvitesManagerEventCopyWith<$Res> {
  __$InvitesManagerEventCopyWithImpl(this._self, this._then);

  final _InvitesManagerEvent _self;
  final $Res Function(_InvitesManagerEvent) _then;

  /// Create a copy of InvitesManagerEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? kind = null,
    Object? serial = null,
    Object? count = null,
    Object? problem = freezed,
  }) {
    return _then(
      _InvitesManagerEvent(
        kind: null == kind
            ? _self.kind
            : kind // ignore: cast_nullable_to_non_nullable
                  as InvitesManagerEventKind,
        serial: null == serial
            ? _self.serial
            : serial // ignore: cast_nullable_to_non_nullable
                  as int,
        count: null == count
            ? _self.count
            : count // ignore: cast_nullable_to_non_nullable
                  as int,
        problem: freezed == problem
            ? _self.problem
            : problem // ignore: cast_nullable_to_non_nullable
                  as InviteProblem?,
      ),
    );
  }
}

/// @nodoc
mixin _$InvitesManagerState {
  InvitesManagerStatus get status;
  List<Invite> get invites;

  /// Invites the signed-in role may renew or revoke (ADR 0016).
  Set<String> get manageableIds;

  /// `null` shows every status.
  InviteStatus? get filter;
  String get query;
  Set<String> get selectedIds;

  /// A renew/revoke call is running.
  bool get busy;
  InviteProblem? get problem;
  bool get online;
  InvitesManagerEvent? get event;

  /// Create a copy of InvitesManagerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InvitesManagerStateCopyWith<InvitesManagerState> get copyWith =>
      _$InvitesManagerStateCopyWithImpl<InvitesManagerState>(
        this as InvitesManagerState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvitesManagerState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.invites, invites) &&
            const DeepCollectionEquality().equals(
              other.manageableIds,
              manageableIds,
            ) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.query, query) || other.query == query) &&
            const DeepCollectionEquality().equals(
              other.selectedIds,
              selectedIds,
            ) &&
            (identical(other.busy, busy) || other.busy == busy) &&
            (identical(other.problem, problem) || other.problem == problem) &&
            (identical(other.online, online) || other.online == online) &&
            (identical(other.event, event) || other.event == event));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    const DeepCollectionEquality().hash(invites),
    const DeepCollectionEquality().hash(manageableIds),
    filter,
    query,
    const DeepCollectionEquality().hash(selectedIds),
    busy,
    problem,
    online,
    event,
  );

  @override
  String toString() {
    return 'InvitesManagerState(status: $status, invites: $invites, manageableIds: $manageableIds, filter: $filter, query: $query, selectedIds: $selectedIds, busy: $busy, problem: $problem, online: $online, event: $event)';
  }
}

/// @nodoc
abstract mixin class $InvitesManagerStateCopyWith<$Res> {
  factory $InvitesManagerStateCopyWith(
    InvitesManagerState value,
    $Res Function(InvitesManagerState) _then,
  ) = _$InvitesManagerStateCopyWithImpl;
  @useResult
  $Res call({
    InvitesManagerStatus status,
    List<Invite> invites,
    Set<String> manageableIds,
    InviteStatus? filter,
    String query,
    Set<String> selectedIds,
    bool busy,
    InviteProblem? problem,
    bool online,
    InvitesManagerEvent? event,
  });

  $InvitesManagerEventCopyWith<$Res>? get event;
}

/// @nodoc
class _$InvitesManagerStateCopyWithImpl<$Res>
    implements $InvitesManagerStateCopyWith<$Res> {
  _$InvitesManagerStateCopyWithImpl(this._self, this._then);

  final InvitesManagerState _self;
  final $Res Function(InvitesManagerState) _then;

  /// Create a copy of InvitesManagerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? invites = null,
    Object? manageableIds = null,
    Object? filter = freezed,
    Object? query = null,
    Object? selectedIds = null,
    Object? busy = null,
    Object? problem = freezed,
    Object? online = null,
    Object? event = freezed,
  }) {
    return _then(
      _self.copyWith(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as InvitesManagerStatus,
        invites: null == invites
            ? _self.invites
            : invites // ignore: cast_nullable_to_non_nullable
                  as List<Invite>,
        manageableIds: null == manageableIds
            ? _self.manageableIds
            : manageableIds // ignore: cast_nullable_to_non_nullable
                  as Set<String>,
        filter: freezed == filter
            ? _self.filter
            : filter // ignore: cast_nullable_to_non_nullable
                  as InviteStatus?,
        query: null == query
            ? _self.query
            : query // ignore: cast_nullable_to_non_nullable
                  as String,
        selectedIds: null == selectedIds
            ? _self.selectedIds
            : selectedIds // ignore: cast_nullable_to_non_nullable
                  as Set<String>,
        busy: null == busy
            ? _self.busy
            : busy // ignore: cast_nullable_to_non_nullable
                  as bool,
        problem: freezed == problem
            ? _self.problem
            : problem // ignore: cast_nullable_to_non_nullable
                  as InviteProblem?,
        online: null == online
            ? _self.online
            : online // ignore: cast_nullable_to_non_nullable
                  as bool,
        event: freezed == event
            ? _self.event
            : event // ignore: cast_nullable_to_non_nullable
                  as InvitesManagerEvent?,
      ),
    );
  }

  /// Create a copy of InvitesManagerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvitesManagerEventCopyWith<$Res>? get event {
    if (_self.event == null) {
      return null;
    }

    return $InvitesManagerEventCopyWith<$Res>(_self.event!, (value) {
      return _then(_self.copyWith(event: value));
    });
  }
}

/// Adds pattern-matching-related methods to [InvitesManagerState].
extension InvitesManagerStatePatterns on InvitesManagerState {
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
    TResult Function(_InvitesManagerState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvitesManagerState() when $default != null:
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
    TResult Function(_InvitesManagerState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvitesManagerState():
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
    TResult? Function(_InvitesManagerState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvitesManagerState() when $default != null:
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
      InvitesManagerStatus status,
      List<Invite> invites,
      Set<String> manageableIds,
      InviteStatus? filter,
      String query,
      Set<String> selectedIds,
      bool busy,
      InviteProblem? problem,
      bool online,
      InvitesManagerEvent? event,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InvitesManagerState() when $default != null:
        return $default(
          _that.status,
          _that.invites,
          _that.manageableIds,
          _that.filter,
          _that.query,
          _that.selectedIds,
          _that.busy,
          _that.problem,
          _that.online,
          _that.event,
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
      InvitesManagerStatus status,
      List<Invite> invites,
      Set<String> manageableIds,
      InviteStatus? filter,
      String query,
      Set<String> selectedIds,
      bool busy,
      InviteProblem? problem,
      bool online,
      InvitesManagerEvent? event,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvitesManagerState():
        return $default(
          _that.status,
          _that.invites,
          _that.manageableIds,
          _that.filter,
          _that.query,
          _that.selectedIds,
          _that.busy,
          _that.problem,
          _that.online,
          _that.event,
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
      InvitesManagerStatus status,
      List<Invite> invites,
      Set<String> manageableIds,
      InviteStatus? filter,
      String query,
      Set<String> selectedIds,
      bool busy,
      InviteProblem? problem,
      bool online,
      InvitesManagerEvent? event,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InvitesManagerState() when $default != null:
        return $default(
          _that.status,
          _that.invites,
          _that.manageableIds,
          _that.filter,
          _that.query,
          _that.selectedIds,
          _that.busy,
          _that.problem,
          _that.online,
          _that.event,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _InvitesManagerState extends InvitesManagerState {
  const _InvitesManagerState({
    this.status = InvitesManagerStatus.loading,
    final List<Invite> invites = const [],
    final Set<String> manageableIds = const {},
    this.filter,
    this.query = '',
    final Set<String> selectedIds = const {},
    this.busy = false,
    this.problem,
    this.online = true,
    this.event,
  }) : _invites = invites,
       _manageableIds = manageableIds,
       _selectedIds = selectedIds,
       super._();

  @override
  @JsonKey()
  final InvitesManagerStatus status;
  final List<Invite> _invites;
  @override
  @JsonKey()
  List<Invite> get invites {
    if (_invites is EqualUnmodifiableListView) return _invites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invites);
  }

  /// Invites the signed-in role may renew or revoke (ADR 0016).
  final Set<String> _manageableIds;

  /// Invites the signed-in role may renew or revoke (ADR 0016).
  @override
  @JsonKey()
  Set<String> get manageableIds {
    if (_manageableIds is EqualUnmodifiableSetView) return _manageableIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_manageableIds);
  }

  /// `null` shows every status.
  @override
  final InviteStatus? filter;
  @override
  @JsonKey()
  final String query;
  final Set<String> _selectedIds;
  @override
  @JsonKey()
  Set<String> get selectedIds {
    if (_selectedIds is EqualUnmodifiableSetView) return _selectedIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedIds);
  }

  /// A renew/revoke call is running.
  @override
  @JsonKey()
  final bool busy;
  @override
  final InviteProblem? problem;
  @override
  @JsonKey()
  final bool online;
  @override
  final InvitesManagerEvent? event;

  /// Create a copy of InvitesManagerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InvitesManagerStateCopyWith<_InvitesManagerState> get copyWith =>
      __$InvitesManagerStateCopyWithImpl<_InvitesManagerState>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InvitesManagerState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._invites, _invites) &&
            const DeepCollectionEquality().equals(
              other._manageableIds,
              _manageableIds,
            ) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.query, query) || other.query == query) &&
            const DeepCollectionEquality().equals(
              other._selectedIds,
              _selectedIds,
            ) &&
            (identical(other.busy, busy) || other.busy == busy) &&
            (identical(other.problem, problem) || other.problem == problem) &&
            (identical(other.online, online) || other.online == online) &&
            (identical(other.event, event) || other.event == event));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    const DeepCollectionEquality().hash(_invites),
    const DeepCollectionEquality().hash(_manageableIds),
    filter,
    query,
    const DeepCollectionEquality().hash(_selectedIds),
    busy,
    problem,
    online,
    event,
  );

  @override
  String toString() {
    return 'InvitesManagerState(status: $status, invites: $invites, manageableIds: $manageableIds, filter: $filter, query: $query, selectedIds: $selectedIds, busy: $busy, problem: $problem, online: $online, event: $event)';
  }
}

/// @nodoc
abstract mixin class _$InvitesManagerStateCopyWith<$Res>
    implements $InvitesManagerStateCopyWith<$Res> {
  factory _$InvitesManagerStateCopyWith(
    _InvitesManagerState value,
    $Res Function(_InvitesManagerState) _then,
  ) = __$InvitesManagerStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    InvitesManagerStatus status,
    List<Invite> invites,
    Set<String> manageableIds,
    InviteStatus? filter,
    String query,
    Set<String> selectedIds,
    bool busy,
    InviteProblem? problem,
    bool online,
    InvitesManagerEvent? event,
  });

  @override
  $InvitesManagerEventCopyWith<$Res>? get event;
}

/// @nodoc
class __$InvitesManagerStateCopyWithImpl<$Res>
    implements _$InvitesManagerStateCopyWith<$Res> {
  __$InvitesManagerStateCopyWithImpl(this._self, this._then);

  final _InvitesManagerState _self;
  final $Res Function(_InvitesManagerState) _then;

  /// Create a copy of InvitesManagerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? invites = null,
    Object? manageableIds = null,
    Object? filter = freezed,
    Object? query = null,
    Object? selectedIds = null,
    Object? busy = null,
    Object? problem = freezed,
    Object? online = null,
    Object? event = freezed,
  }) {
    return _then(
      _InvitesManagerState(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as InvitesManagerStatus,
        invites: null == invites
            ? _self._invites
            : invites // ignore: cast_nullable_to_non_nullable
                  as List<Invite>,
        manageableIds: null == manageableIds
            ? _self._manageableIds
            : manageableIds // ignore: cast_nullable_to_non_nullable
                  as Set<String>,
        filter: freezed == filter
            ? _self.filter
            : filter // ignore: cast_nullable_to_non_nullable
                  as InviteStatus?,
        query: null == query
            ? _self.query
            : query // ignore: cast_nullable_to_non_nullable
                  as String,
        selectedIds: null == selectedIds
            ? _self._selectedIds
            : selectedIds // ignore: cast_nullable_to_non_nullable
                  as Set<String>,
        busy: null == busy
            ? _self.busy
            : busy // ignore: cast_nullable_to_non_nullable
                  as bool,
        problem: freezed == problem
            ? _self.problem
            : problem // ignore: cast_nullable_to_non_nullable
                  as InviteProblem?,
        online: null == online
            ? _self.online
            : online // ignore: cast_nullable_to_non_nullable
                  as bool,
        event: freezed == event
            ? _self.event
            : event // ignore: cast_nullable_to_non_nullable
                  as InvitesManagerEvent?,
      ),
    );
  }

  /// Create a copy of InvitesManagerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvitesManagerEventCopyWith<$Res>? get event {
    if (_self.event == null) {
      return null;
    }

    return $InvitesManagerEventCopyWith<$Res>(_self.event!, (value) {
      return _then(_self.copyWith(event: value));
    });
  }
}
