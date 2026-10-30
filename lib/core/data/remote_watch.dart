import 'dart:async';

import 'package:injectable/injectable.dart';

import '../services/app_lifecycle/app_lifecycle_service.dart';
import '../services/connectivity/connectivity_service.dart';
import 'data_change_signal.dart';
import 'data_scope.dart';

/// How often the screens that are not live (home, calendar, history) look for
/// other people's changes while they are open. The running session polls
/// faster (`LiveSessionServiceImpl.pollInterval`, 5 s); everything else
/// refetches only on the app's own writes, the foreground and reconnecting.
const Duration slowPollInterval = Duration(seconds: 30);

/// Turns a one-shot remote read into the `Stream` shape of the domain
/// contracts, for the online-only data layer (see
/// `docs/implementation/online-data-layer.md`).
///
/// Each call of [call] returns an independent single-subscription stream:
/// - fetches on first listen and emits the result;
/// - refetches when [DataChangeSignal] fires for one of `scopes`;
/// - refetches when the app returns to the foreground and when the connection
///   comes back, so a screen recovers without a tap;
/// - when `pollInterval` is set, also refetches on that period while the app
///   is in the foreground (polling stops in the background);
/// - skips an emission equal to the previous one (lists, sets and maps
///   compare by content);
/// - reports a failed fetch as a stream error and keeps watching, so the next
///   trigger retries; the next successful fetch is always emitted, even when
///   equal to the value before the error, so consumers see the recovery;
/// - runs at most one fetch at a time; a trigger during a fetch queues exactly
///   one more run;
/// - cancels its timer and subscriptions when the listener cancels.
@lazySingleton
class RemoteWatch {
  RemoteWatch(this._signal, this._lifecycle, [this._connectivity]);

  final DataChangeSignal _signal;
  final AppLifecycleService _lifecycle;
  final ConnectivityService? _connectivity;

  /// [scopes] null (the default) reacts to every signal; an empty set to none.
  Stream<T> call<T>(
    Future<T> Function() fetch, {
    Set<DataScope>? scopes,
    Duration? pollInterval,
    bool Function(T previous, T next)? equals,
  }) {
    final session = _WatchSession<T>(
      fetch: fetch,
      signal: _signal,
      lifecycle: _lifecycle,
      connectivity: _connectivity,
      scopes: scopes,
      pollInterval: pollInterval,
      equals: equals ?? _contentEquals,
    );
    return session.stream;
  }

  static bool _contentEquals(Object? a, Object? b) {
    if (identical(a, b)) return true;
    if (a is List && b is List) {
      if (a.length != b.length) return false;
      for (var i = 0; i < a.length; i++) {
        if (!_contentEquals(a[i], b[i])) return false;
      }
      return true;
    }
    if (a is Set && b is Set) {
      return a.length == b.length && a.every(b.contains);
    }
    if (a is Map && b is Map) {
      if (a.length != b.length) return false;
      for (final key in a.keys) {
        if (!b.containsKey(key) || !_contentEquals(a[key], b[key])) {
          return false;
        }
      }
      return true;
    }
    return a == b;
  }
}

class _WatchSession<T> {
  _WatchSession({
    required this.fetch,
    required this.signal,
    required this.lifecycle,
    required this.connectivity,
    required this.scopes,
    required this.pollInterval,
    required this.equals,
  }) {
    _controller = StreamController<T>(onListen: _start, onCancel: _stop);
  }

  final Future<T> Function() fetch;
  final DataChangeSignal signal;
  final AppLifecycleService lifecycle;
  final ConnectivityService? connectivity;
  final Set<DataScope>? scopes;
  final Duration? pollInterval;
  final bool Function(T previous, T next) equals;

  late final StreamController<T> _controller;
  StreamSubscription<DataScope>? _signalSubscription;
  StreamSubscription<bool>? _lifecycleSubscription;
  StreamSubscription<bool>? _connectivitySubscription;
  bool? _online;
  Timer? _timer;
  bool _closed = false;
  bool _fetching = false;
  bool _refetchQueued = false;
  bool _hasValue = false;
  late T _last;

  Stream<T> get stream => _controller.stream;

  void _start() {
    _signalSubscription = signal.changes.listen(_onSignal);
    _lifecycleSubscription = lifecycle.watchForeground().listen(
      _onForegroundChanged,
    );
    _connectivitySubscription = connectivity?.watchOnline().listen(
      _onOnlineChanged,
    );
    if (pollInterval != null && lifecycle.isForeground) _startTimer();
    unawaited(_refresh());
  }

  Future<void> _stop() async {
    _closed = true;
    _timer?.cancel();
    _timer = null;
    await _signalSubscription?.cancel();
    await _lifecycleSubscription?.cancel();
    await _connectivitySubscription?.cancel();
  }

  void _onSignal(DataScope scope) {
    final wanted = scopes;
    if (wanted != null && !wanted.contains(scope)) return;
    unawaited(_refresh());
  }

  void _onForegroundChanged(bool foreground) {
    if (!foreground) {
      _timer?.cancel();
      _timer = null;
      return;
    }
    if (pollInterval != null) _startTimer();
    unawaited(_refresh());
  }

  void _onOnlineChanged(bool online) {
    final reconnected = _online == false && online;
    _online = online;
    if (reconnected) unawaited(_refresh());
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(pollInterval!, (_) => unawaited(_refresh()));
  }

  Future<void> _refresh() async {
    if (_closed) return;
    if (_fetching) {
      _refetchQueued = true;
      return;
    }
    _fetching = true;
    try {
      final value = await fetch();
      if (_closed) return;
      if (!_hasValue || !equals(_last, value)) {
        _last = value;
        _hasValue = true;
        _controller.add(value);
      }
    } on Object catch (error, stackTrace) {
      if (!_closed) {
        _hasValue = false;
        _controller.addError(error, stackTrace);
      }
    } finally {
      _fetching = false;
      if (_refetchQueued && !_closed) {
        _refetchQueued = false;
        unawaited(_refresh());
      }
    }
  }
}
