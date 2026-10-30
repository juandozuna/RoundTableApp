import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/sync/domain/sync_snapshot.dart';
import 'package:gold_roundtables/core/widgets/sync_status_pill.dart';

import '../helpers/pump_app.dart';

void main() {
  testWidgets('offline with nothing pending says changes cannot be sent', (
    tester,
  ) async {
    await tester.pumpApp(
      const SyncStatusPill(
        snapshot: SyncSnapshot(connection: SyncConnection.offline),
      ),
    );

    expect(find.text('Sin conexión'), findsOneWidget);
    expect(
      find.text(
        'Los cambios no se pueden enviar hasta que vuelva la conexión.',
      ),
      findsOneWidget,
    );
    expect(find.byIcon(Icons.cloud_off_rounded), findsOneWidget);
  });

  testWidgets('online with nothing pending reads as synced', (tester) async {
    await tester.pumpApp(
      const SyncStatusPill(
        snapshot: SyncSnapshot(connection: SyncConnection.connected),
      ),
    );

    expect(find.text('Sincronizado'), findsOneWidget);
    expect(find.text('Nada pendiente'), findsOneWidget);
  });

  testWidgets('pending changes keep the pending state even offline', (
    tester,
  ) async {
    await tester.pumpApp(
      const SyncStatusPill(
        snapshot: SyncSnapshot(
          connection: SyncConnection.offline,
          pendingCount: 3,
        ),
      ),
    );

    expect(find.text('Pendiente'), findsOneWidget);
    expect(find.text('3 cambios pendientes'), findsOneWidget);
  });
}
