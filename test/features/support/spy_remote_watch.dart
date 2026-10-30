import 'package:gold_roundtables/core/data/data_scope.dart';
import 'package:gold_roundtables/core/data/remote_watch.dart';

/// A [RemoteWatch] that remembers the poll interval of every watch it made.
class SpyRemoteWatch extends RemoteWatch {
  SpyRemoteWatch(super.signal, super.lifecycle);

  final List<Duration?> pollIntervals = [];

  @override
  Stream<T> call<T>(
    Future<T> Function() fetch, {
    Set<DataScope>? scopes,
    Duration? pollInterval,
    bool Function(T previous, T next)? equals,
  }) {
    pollIntervals.add(pollInterval);
    return super.call(
      fetch,
      scopes: scopes,
      pollInterval: pollInterval,
      equals: equals,
    );
  }
}
