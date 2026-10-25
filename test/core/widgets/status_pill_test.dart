import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/models/sync_state.dart';
import 'package:gold_roundtables/core/theme/app_palette.dart';
import 'package:gold_roundtables/core/theme/status_tone.dart';
import 'package:gold_roundtables/core/widgets/status_border.dart';
import 'package:gold_roundtables/core/widgets/status_pill.dart';
import 'package:gold_roundtables/core/widgets/sync_pill.dart';

import '../helpers/pump_app.dart';

void main() {
  test('every tone pairs with a line style and a distinct icon', () {
    expect(StatusTone.offline.lineStyle, StatusLineStyle.dashed);
    expect(StatusTone.pending.lineStyle, StatusLineStyle.dotted);
    expect(StatusTone.error.lineStyle, StatusLineStyle.double);
    expect(StatusTone.ok.lineStyle, StatusLineStyle.solid);
    final icons = StatusTone.values.map(StatusPill.defaultIcon).toSet();
    expect(icons.length, StatusTone.values.length);
  });

  testWidgets('renders label, icon and a tone-styled border', (tester) async {
    await tester.pumpApp(
      const StatusPill(tone: StatusTone.offline, label: 'Sin conexión'),
    );
    expect(find.text('Sin conexión'), findsOneWidget);
    expect(find.byIcon(Icons.cloud_off_rounded), findsOneWidget);

    final painter = tester
        .widgetList<CustomPaint>(find.byType(CustomPaint))
        .map((paint) => paint.foregroundPainter)
        .whereType<StatusBorderPainter>()
        .single;
    expect(painter.style, StatusLineStyle.dashed);
    expect(painter.color, AppPalette.light.off);
  });

  testWidgets('exposes the label to screen readers', (tester) async {
    final handle = tester.ensureSemantics();
    await tester.pumpApp(
      const StatusPill(tone: StatusTone.ok, label: 'Presente'),
    );
    expect(find.bySemanticsLabel('Presente'), findsOneWidget);
    handle.dispose();
  });

  testWidgets('SyncPill shows Spanish labels for every state', (tester) async {
    await tester.pumpApp(
      const Column(
        children: [
          SyncPill.compact(state: SyncState.pending),
          SyncPill.compact(state: SyncState.syncing),
          SyncPill.compact(state: SyncState.synced),
          SyncPill(state: SyncState.syncedLate, detail: '1 cambio pendiente'),
        ],
      ),
    );
    for (final label in [
      'Pendiente',
      'Sincronizando',
      'Sincronizado',
      'Sincronizado tarde',
      '1 cambio pendiente',
    ]) {
      expect(find.text(label), findsOneWidget, reason: label);
    }
  });
}
