import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/services/connectivity/connectivity_service.dart';
import 'package:gold_roundtables/core/sync/data/connectivity_sync_status_service.dart';
import 'package:gold_roundtables/core/sync/domain/sync_snapshot.dart';

class FakeConnectivity implements ConnectivityService {
  FakeConnectivity(this.stream);

  final Stream<bool> stream;

  @override
  Future<bool> isOnline() async => true;

  @override
  Stream<bool> watchOnline() => stream;
}

void main() {
  test('reports connected while online, with nothing pending', () async {
    final service = ConnectivitySyncStatusService(
      FakeConnectivity(Stream.value(true)),
    );

    final snapshot = await service.watch().first;

    expect(snapshot.connection, SyncConnection.connected);
    expect(snapshot.pendingCount, 0);
    expect(snapshot.pendingSince, isNull);
    expect(snapshot.hasStalePending, isFalse);
    expect(snapshot.hasError, isFalse);
    expect(snapshot.uploading, isFalse);
  });

  test('follows connectivity changes', () async {
    final controller = StreamController<bool>();
    final service = ConnectivitySyncStatusService(
      FakeConnectivity(controller.stream),
    );
    final connections = <SyncConnection>[];
    final sub = service.watch().listen((s) => connections.add(s.connection));

    controller
      ..add(true)
      ..add(false)
      ..add(true);
    await Future<void>.delayed(Duration.zero);

    expect(connections, [
      SyncConnection.connected,
      SyncConnection.offline,
      SyncConnection.connected,
    ]);
    await sub.cancel();
    await controller.close();
  });

  test('keeps the aggregate state synced even when offline', () async {
    final service = ConnectivitySyncStatusService(
      FakeConnectivity(Stream.value(false)),
    );

    final snapshot = await service.watch().first;

    expect(snapshot.connection, SyncConnection.offline);
    expect(snapshot.pendingCount, 0);
  });
}
