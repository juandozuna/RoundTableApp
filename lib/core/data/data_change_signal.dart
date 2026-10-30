import 'dart:async';

import 'package:injectable/injectable.dart';

import 'data_scope.dart';

/// App-wide bus telling live watches that their data changed. Writers call
/// [notify] after a successful write; `RemoteWatch` listens and refetches.
/// Changes made by other devices arrive through polling, not through this.
@lazySingleton
class DataChangeSignal {
  final StreamController<DataScope> _changes =
      StreamController<DataScope>.broadcast();

  Stream<DataScope> get changes => _changes.stream;

  void notify(DataScope scope) {
    if (_changes.isClosed) return;
    _changes.add(scope);
  }

  @disposeMethod
  Future<void> dispose() => _changes.close();
}
