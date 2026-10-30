import 'dart:async';

import 'package:fake_async/fake_async.dart'; // ignore: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/data/data_change_signal.dart';
import 'package:gold_roundtables/core/data/data_scope.dart';
import 'package:gold_roundtables/core/data/remote_watch.dart';
import 'package:gold_roundtables/core/services/app_lifecycle/app_lifecycle_service.dart';
import 'package:gold_roundtables/core/services/connectivity/connectivity_service.dart';

class FakeLifecycle implements AppLifecycleService {
  final StreamController<bool> _controller = StreamController<bool>.broadcast(
    sync: true,
  );
  bool _foreground = true;

  @override
  bool get isForeground => _foreground;

  @override
  Stream<bool> watchForeground() => _controller.stream;

  void setForeground(bool value) {
    _foreground = value;
    _controller.add(value);
  }
}

class FakeConnectivity implements ConnectivityService {
  FakeConnectivity({bool online = true}) : _online = online;

  final StreamController<bool> _controller = StreamController<bool>.broadcast(
    sync: true,
  );
  bool _online;

  @override
  Future<bool> isOnline() async => _online;

  @override
  Stream<bool> watchOnline() async* {
    yield _online;
    yield* _controller.stream;
  }

  void setOnline(bool value) {
    _online = value;
    _controller.add(value);
  }
}

class Harness {
  Harness({bool online = true})
    : connectivity = FakeConnectivity(online: online) {
    watch = RemoteWatch(signal, lifecycle, connectivity);
  }

  final DataChangeSignal signal = DataChangeSignal();
  final FakeLifecycle lifecycle = FakeLifecycle();
  final FakeConnectivity connectivity;
  late final RemoteWatch watch;
  final List<Object?> values = [];
  final List<Object> errors = [];
  int fetches = 0;

  StreamSubscription<T> listen<T>(Stream<T> stream) =>
      stream.listen(values.add, onError: errors.add);
}

void main() {
  const poll = Duration(seconds: 5);

  test('emits the first fetch on listen', () {
    fakeAsync((async) {
      final h = Harness();
      final sub = h.listen(h.watch(() async => ++h.fetches));
      async.flushMicrotasks();

      expect(h.values, [1]);
      sub.cancel();
    });
  });

  test('does not fetch before the first listener', () {
    fakeAsync((async) {
      final h = Harness();
      h.watch(() async => ++h.fetches);
      async.flushMicrotasks();

      expect(h.fetches, 0);
    });
  });

  test('refetches when a signal fires', () {
    fakeAsync((async) {
      final h = Harness();
      final sub = h.listen(h.watch(() async => ++h.fetches));
      async.flushMicrotasks();

      h.signal.notify(DataScope.session);
      async.flushMicrotasks();

      expect(h.values, [1, 2]);
      sub.cancel();
    });
  });

  test('ignores signals outside the watched scopes', () {
    fakeAsync((async) {
      final h = Harness();
      final sub = h.listen(
        h.watch(() async => ++h.fetches, scopes: {DataScope.session}),
      );
      async.flushMicrotasks();

      h.signal.notify(DataScope.admin);
      async.flushMicrotasks();
      expect(h.values, [1]);

      h.signal.notify(DataScope.session);
      async.flushMicrotasks();
      expect(h.values, [1, 2]);
      sub.cancel();
    });
  });

  test('polls on the interval while a listener is subscribed', () {
    fakeAsync((async) {
      final h = Harness();
      final sub = h.listen(
        h.watch(() async => ++h.fetches, pollInterval: poll),
      );
      async.flushMicrotasks();
      async.elapse(poll * 3);

      expect(h.values, [1, 2, 3, 4]);
      sub.cancel();
    });
  });

  test('does not poll without a poll interval', () {
    fakeAsync((async) {
      final h = Harness();
      final sub = h.listen(h.watch(() async => ++h.fetches));
      async.flushMicrotasks();
      async.elapse(poll * 10);

      expect(h.fetches, 1);
      sub.cancel();
    });
  });

  test('skips emissions equal to the previous one', () {
    fakeAsync((async) {
      final h = Harness();
      final sub = h.listen(
        h.watch(() async {
          h.fetches++;
          return h.fetches < 3 ? const ['a', 'b'] : const ['a', 'c'];
        }, pollInterval: poll),
      );
      async.flushMicrotasks();
      async.elapse(poll * 3);

      expect(h.fetches, 4);
      expect(h.values, [
        ['a', 'b'],
        ['a', 'c'],
      ]);
      sub.cancel();
    });
  });

  test('uses the custom equality when given', () {
    fakeAsync((async) {
      final h = Harness();
      final sub = h.listen(
        h.watch(
          () async => ++h.fetches,
          pollInterval: poll,
          equals: (previous, next) => previous.isOdd == next.isOdd,
        ),
      );
      async.flushMicrotasks();
      async.elapse(poll * 2);

      expect(h.values, [1, 2, 3]);
      sub.cancel();
    });
  });

  test('surfaces a failure as an error and retries on the next tick', () {
    fakeAsync((async) {
      final h = Harness();
      final sub = h.listen(
        h.watch(() async {
          h.fetches++;
          if (h.fetches == 2) throw StateError('offline');
          return h.fetches;
        }, pollInterval: poll),
      );
      async.flushMicrotasks();
      async.elapse(poll);
      expect(h.errors, hasLength(1));
      expect(h.values, [1]);

      async.elapse(poll);
      expect(h.values, [1, 3]);
      sub.cancel();
    });
  });

  test('emits a value equal to the one before an error as the recovery', () {
    fakeAsync((async) {
      final h = Harness();
      final sub = h.listen(
        h.watch(() async {
          h.fetches++;
          if (h.fetches == 2) throw StateError('offline');
          return 'A';
        }, pollInterval: poll),
      );
      async.flushMicrotasks();
      async.elapse(poll);
      expect(h.errors, hasLength(1));

      async.elapse(poll);
      expect(h.values, ['A', 'A']);
      sub.cancel();
    });
  });

  test('a failed first fetch is retried by the next signal', () {
    fakeAsync((async) {
      final h = Harness();
      final sub = h.listen(
        h.watch(() async {
          h.fetches++;
          if (h.fetches == 1) throw StateError('offline');
          return h.fetches;
        }),
      );
      async.flushMicrotasks();
      expect(h.errors, hasLength(1));

      h.signal.notify(DataScope.home);
      async.flushMicrotasks();
      expect(h.values, [2]);
      sub.cancel();
    });
  });

  test('pauses polling in the background and refetches on return', () {
    fakeAsync((async) {
      final h = Harness();
      final sub = h.listen(
        h.watch(() async => ++h.fetches, pollInterval: poll),
      );
      async.flushMicrotasks();

      h.lifecycle.setForeground(false);
      async.elapse(poll * 4);
      expect(h.fetches, 1);

      h.lifecycle.setForeground(true);
      async.flushMicrotasks();
      expect(h.fetches, 2);

      async.elapse(poll);
      expect(h.fetches, 3);
      sub.cancel();
    });
  });

  test('refetches on return to the foreground without a poll interval', () {
    fakeAsync((async) {
      final h = Harness();
      final sub = h.listen(h.watch(() async => ++h.fetches));
      async.flushMicrotasks();

      h.lifecycle.setForeground(false);
      async.flushMicrotasks();
      expect(h.fetches, 1);

      h.lifecycle.setForeground(true);
      async.flushMicrotasks();
      expect(h.values, [1, 2]);
      async.elapse(poll * 5);
      expect(h.fetches, 2);
      sub.cancel();
    });
  });

  test('refetches when the connection comes back', () {
    fakeAsync((async) {
      final h = Harness();
      final sub = h.listen(h.watch(() async => ++h.fetches));
      async.flushMicrotasks();

      h.connectivity.setOnline(false);
      async.flushMicrotasks();
      expect(h.fetches, 1);

      h.connectivity.setOnline(true);
      async.flushMicrotasks();
      expect(h.values, [1, 2]);
      sub.cancel();
    });
  });

  test('does not refetch for the initial online state', () {
    fakeAsync((async) {
      final h = Harness();
      final sub = h.listen(h.watch(() async => ++h.fetches));
      async.flushMicrotasks();

      expect(h.fetches, 1);
      sub.cancel();
    });
  });

  test('does not start the timer when listened to in the background', () {
    fakeAsync((async) {
      final h = Harness();
      h.lifecycle._foreground = false;
      final sub = h.listen(
        h.watch(() async => ++h.fetches, pollInterval: poll),
      );
      async.flushMicrotasks();
      async.elapse(poll * 3);

      expect(h.fetches, 1);
      sub.cancel();
    });
  });

  test('runs one fetch at a time and queues a single follow-up', () {
    fakeAsync((async) {
      final h = Harness();
      final completers = <Completer<int>>[];
      final sub = h.listen(
        h.watch(() {
          final completer = Completer<int>();
          completers.add(completer);
          return completer.future;
        }),
      );
      async.flushMicrotasks();
      expect(completers, hasLength(1));

      h.signal
        ..notify(DataScope.session)
        ..notify(DataScope.session);
      async.flushMicrotasks();
      expect(completers, hasLength(1));

      completers.first.complete(1);
      async.flushMicrotasks();
      expect(completers, hasLength(2));

      completers.last.complete(2);
      async.flushMicrotasks();
      expect(h.values, [1, 2]);
      sub.cancel();
    });
  });

  test('stops timers and ignores signals after the listener cancels', () {
    fakeAsync((async) {
      final h = Harness();
      final sub = h.listen(
        h.watch(() async => ++h.fetches, pollInterval: poll),
      );
      async.flushMicrotasks();
      sub.cancel();
      async.flushMicrotasks();

      h.signal.notify(DataScope.session);
      async.elapse(poll * 5);

      expect(h.fetches, 1);
      expect(async.pendingTimers, isEmpty);
    });
  });

  test('drops a result that arrives after the listener cancelled', () {
    fakeAsync((async) {
      final h = Harness();
      final completer = Completer<int>();
      final sub = h.listen(h.watch(() => completer.future));
      async.flushMicrotasks();

      sub.cancel();
      completer.complete(7);
      async.flushMicrotasks();

      expect(h.values, isEmpty);
    });
  });
}
