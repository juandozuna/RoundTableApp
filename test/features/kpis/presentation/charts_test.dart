import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/features/kpis/presentation/widgets/chart_card.dart';
import 'package:gold_roundtables/features/kpis/presentation/widgets/charts/bar_chart.dart';
import 'package:gold_roundtables/features/kpis/presentation/widgets/charts/chart_painter.dart';
import 'package:gold_roundtables/features/kpis/presentation/widgets/charts/chart_palette.dart';
import 'package:gold_roundtables/features/kpis/presentation/widgets/charts/dumbbell_chart.dart';
import 'package:gold_roundtables/features/kpis/presentation/widgets/charts/horizontal_bars_chart.dart';
import 'package:gold_roundtables/features/kpis/presentation/widgets/charts/interactive_chart.dart';
import 'package:gold_roundtables/features/kpis/presentation/widgets/charts/line_chart.dart';
import 'package:gold_roundtables/features/kpis/presentation/widgets/charts/stacked_bars_chart.dart';

import '../../../core/helpers/pump_app.dart';

const _palette = ChartPalette(
  ink: Colors.black,
  muted: Colors.grey,
  line: Colors.grey,
  background: Colors.white,
  accent: Colors.purple,
  highlight: Colors.pink,
  ok: Colors.green,
  pending: Colors.orange,
  offline: Colors.blueGrey,
  labelStyle: TextStyle(),
  strongLabelStyle: TextStyle(),
);

void main() {
  const size = Size(400, 200);

  test('niceMax rounds up to tidy axis values', () {
    expect(ChartPainter.niceMax(0), 1);
    expect(ChartPainter.niceMax(7), 10);
    expect(ChartPainter.niceMax(12), 20);
    expect(ChartPainter.niceMax(21), 25);
    expect(ChartPainter.niceMax(180), 200);
  });

  test('bar chart has one hit area per bar, left to right', () {
    final painter = BarChartPainter(
      palette: _palette,
      highlighted: null,
      data: const [
        BarDatum(label: 'a', value: 3, tooltip: 'tres'),
        BarDatum(label: 'b', value: 6, tooltip: 'seis'),
      ],
    );
    final hits = painter.hitsFor(size);
    expect(hits.map((h) => h.tooltip), ['tres', 'seis']);
    expect(hits[0].rect.left, lessThan(hits[1].rect.left));
  });

  test('line chart skips weeks without data', () {
    final painter = LineChartPainter(
      palette: _palette,
      highlighted: null,
      threshold: 70,
      thresholdLabel: 'umbral',
      data: const [
        LineDatum(label: 'a', value: 80, tooltip: 'ochenta'),
        LineDatum(label: 'b', value: null, tooltip: 'nada'),
        LineDatum(label: 'c', value: 60, tooltip: 'sesenta'),
      ],
    );
    expect(painter.hitsFor(size).map((h) => h.tooltip), ['ochenta', 'sesenta']);
  });

  test('dumbbell reports initial and follow-up marks separately', () {
    final painter = DumbbellChartPainter(
      palette: _palette,
      highlighted: null,
      leftPadding: 100,
      data: const [
        DumbbellDatum(
          label: 'M1',
          initial: 4,
          followUp: 6,
          initialTooltip: 'ini',
          followUpTooltip: 'seg',
          deltaLabel: '+2',
        ),
        DumbbellDatum(
          label: 'M2',
          initial: 5.5,
          followUp: null,
          initialTooltip: 'ini2',
          followUpTooltip: '',
          deltaLabel: '—',
        ),
      ],
    );
    final hits = painter.hitsFor(size);
    expect(hits.map((h) => h.tooltip), ['ini', 'seg', 'ini2']);
    // The follow-up mark sits to the right of the initial one.
    expect(hits[1].rect.center.dx, greaterThan(hits[0].rect.center.dx));
  });

  test('stacked bars skip empty segments and keep the order', () {
    final painter = StackedBarsPainter(
      palette: _palette,
      highlighted: null,
      leftPadding: 100,
      data: const [
        StackedDatum(
          label: 'Luz',
          active: 4,
          delayed: 0,
          inactive: 1,
          activeTooltip: 'activas',
          delayedTooltip: 'retrasadas',
          inactiveTooltip: 'inactivas',
        ),
      ],
    );
    expect(painter.hitsFor(size).map((h) => h.tooltip), [
      'activas',
      'inactivas',
    ]);
  });

  test('horizontal bars scale to the largest value', () {
    final painter = HorizontalBarsPainter(
      palette: _palette,
      highlighted: null,
      leftPadding: 80,
      data: const [
        HorizontalBarDatum(label: 'a', value: 10, tooltip: 'diez'),
        HorizontalBarDatum(label: 'b', value: 5, tooltip: 'cinco'),
      ],
    );
    final hits = painter.hitsFor(size);
    expect(hits[0].rect.width, closeTo(hits[1].rect.width * 2, 0.5));
  });

  testWidgets('hovering a bar shows its tooltip', (tester) async {
    await tester.pumpApp(
      InteractiveChart(
        height: 200,
        semanticLabel: 'Valores por semana',
        builder: (palette, highlighted) => BarChartPainter(
          palette: palette,
          highlighted: highlighted,
          data: const [
            BarDatum(label: 'a', value: 3, tooltip: 'Semana A: 3 valores'),
            BarDatum(label: 'b', value: 6, tooltip: 'Semana B: 6 valores'),
          ],
        ),
      ),
    );
    expect(find.text('Semana A: 3 valores'), findsNothing);
    final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
    addTearDown(gesture.removePointer);
    final chart = find.byType(InteractiveChart);
    final area = tester.getRect(chart);
    await gesture.moveTo(Offset(area.left + 60, area.top + 100));
    await tester.pump();
    expect(find.text('Semana A: 3 valores'), findsOneWidget);
    await gesture.moveTo(Offset(area.left + area.width - 30, area.top + 100));
    await tester.pump();
    expect(find.text('Semana B: 6 valores'), findsOneWidget);
    expect(find.text('Semana A: 3 valores'), findsNothing);
  });

  testWidgets('chart card switches between graph and table and exports', (
    tester,
  ) async {
    var showTable = false;
    var exported = 0;
    await tester.pumpApp(
      StatefulBuilder(
        builder: (context, setState) => ChartCard(
          title: 'Asistencia',
          subtitle: 'Promedio 86 %',
          chart: const Text('GRAFICO'),
          table: const Text('TABLA'),
          showTable: showTable,
          onToggle: (value) => setState(() => showTable = value),
          onExport: () => exported++,
        ),
      ),
    );
    expect(find.text('GRAFICO'), findsOneWidget);
    await tester.tap(find.text('Tabla'));
    await tester.pump();
    expect(find.text('TABLA'), findsOneWidget);
    expect(find.text('GRAFICO'), findsNothing);
    await tester.tap(find.byTooltip('Exportar CSV de Asistencia'));
    expect(exported, 1);
  });
}
