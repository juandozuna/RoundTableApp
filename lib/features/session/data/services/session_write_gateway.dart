import 'package:injectable/injectable.dart';

import '../../../../core/data/data_change_signal.dart';
import '../../../../core/data/data_scope.dart';
import '../../../../core/network/api_exception.dart';
import '../../../../core/services/connectivity/connectivity_service.dart';
import '../../../../core/services/logging/app_log.dart';
import '../../domain/models/session_write_failure.dart';
import '../datasources/session_remote_data_source.dart';
import '../models/session_write_operation.dart';

/// Delivers session writes to the server right away. Offline, or when the
/// server cannot be reached, the write fails with [SessionWriteFailure] and
/// nothing is kept: the person retries.
///
/// After the server accepted a write it tells the live watches
/// (`DataChangeSignal`) so they refetch at once instead of on the next poll.
/// A future outbox would queue here instead of throwing.
@lazySingleton
class SessionWriteGateway {
  SessionWriteGateway(this._remote, this._connectivity, this._signal);

  final SessionRemoteDataSource _remote;
  final ConnectivityService _connectivity;
  final DataChangeSignal _signal;

  static const Set<DataScope> _defaultScopes = {DataScope.session};

  /// Runs one server call (a facilitator control), then notifies [scopes].
  Future<T> run<T>(
    Future<T> Function() call, {
    Set<DataScope> scopes = _defaultScopes,
  }) async {
    final result = await _deliver(call);
    _notify(scopes);
    return result;
  }

  /// Sends [operations] to `sync-upload` in batches of at most
  /// [SessionRemoteDataSource.maxBatch]. Throws
  /// [SessionWriteFailure.rejected] when the server refused any of them.
  Future<void> upload(
    List<SessionWriteOperation> operations, {
    Set<DataScope> scopes = _defaultScopes,
  }) async {
    if (operations.isEmpty) return;
    final messages = <String>[];
    var anyRejected = false;
    await _deliver(() async {
      for (
        var start = 0;
        start < operations.length;
        start += SessionRemoteDataSource.maxBatch
      ) {
        final end = (start + SessionRemoteDataSource.maxBatch).clamp(
          0,
          operations.length,
        );
        final chunk = operations.sublist(start, end);
        final response = await _remote.uploadBatch([
          for (final operation in chunk) operation.toJson(),
        ]);
        for (var i = 0; i < response.results.length && i < chunk.length; i++) {
          final result = response.results[i];
          if (!result.isRejected) continue;
          anyRejected = true;
          AppLog.warning(
            'session',
            'Server rejected ${chunk[i].table}/${chunk[i].id}: ${result.code}',
          );
          final message = result.message;
          if (message != null && message.isNotEmpty) messages.add(message);
        }
        _notify(scopes);
      }
    });
    if (anyRejected) {
      throw SessionWriteFailure.rejected(messages.toSet().toList());
    }
  }

  Future<T> _deliver<T>(Future<T> Function() call) async {
    if (!await _connectivity.isOnline()) {
      throw const SessionWriteFailure.offline();
    }
    try {
      return await call();
    } on ApiException catch (error) {
      if (_isUnreachable(error)) throw const SessionWriteFailure.offline();
      rethrow;
    }
  }

  void _notify(Set<DataScope> scopes) => scopes.forEach(_signal.notify);

  static bool _isUnreachable(ApiException error) =>
      error.kind == ApiErrorKind.network || error.kind == ApiErrorKind.timeout;
}
