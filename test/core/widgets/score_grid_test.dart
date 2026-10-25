import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/widgets/score_grid.dart';

import '../helpers/pump_app.dart';

void main() {
  Future<List<int>> pumpGrid(WidgetTester tester, {int? value}) async {
    final picked = <int>[];
    await tester.pumpApp(ScoreGrid(value: value, onChanged: picked.add));
    return picked;
  }

  testWidgets('offers 1–10 with 5 locked', (tester) async {
    await pumpGrid(tester);
    for (final score in [1, 2, 3, 4, 6, 7, 8, 9, 10]) {
      expect(find.byKey(ValueKey('score-$score')), findsOneWidget);
    }
    expect(find.byKey(const ValueKey('score-5')), findsNothing);
    expect(find.byKey(const ValueKey('score-locked')), findsOneWidget);
    expect(find.byIcon(Icons.lock_rounded), findsOneWidget);
  });

  testWidgets('tapping an allowed score reports it', (tester) async {
    final picked = await pumpGrid(tester);
    await tester.tap(find.byKey(const ValueKey('score-7')));
    await tester.tap(find.byKey(const ValueKey('score-10')));
    expect(picked, [7, 10]);
  });

  testWidgets('tapping 5 never selects it and explains why', (tester) async {
    final picked = await pumpGrid(tester);
    await tester.tap(find.byKey(const ValueKey('score-locked')));
    await tester.pump();
    expect(picked, isEmpty);
    expect(find.textContaining('El 5 no se permite'), findsOneWidget);
  });

  testWidgets('keys are at least 44 px tall', (tester) async {
    await pumpGrid(tester);
    final size = tester.getSize(find.byKey(const ValueKey('score-1')));
    expect(size.height, greaterThanOrEqualTo(44));
    final locked = tester.getSize(find.byKey(const ValueKey('score-locked')));
    expect(locked.height, greaterThanOrEqualTo(44));
  });

  testWidgets('announces the selection and locked state', (tester) async {
    final handle = tester.ensureSemantics();
    await pumpGrid(tester, value: 8);
    expect(find.text('Elegiste 8'), findsOneWidget);
    expect(
      tester.getSemantics(find.byKey(const ValueKey('score-locked'))),
      matchesSemantics(
        label: '5, no disponible',
        isButton: true,
        hasEnabledState: true,
      ),
    );
    expect(
      tester.getSemantics(find.byKey(const ValueKey('score-8'))),
      matchesSemantics(
        label: 'Puntaje 8',
        isButton: true,
        hasEnabledState: true,
        isEnabled: true,
        hasSelectedState: true,
        isSelected: true,
        hasTapAction: true,
      ),
    );
    handle.dispose();
  });
}
