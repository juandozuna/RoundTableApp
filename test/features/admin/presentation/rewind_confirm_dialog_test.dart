import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/features/admin/presentation/pages/table_form/widgets/rewind_confirm_dialog.dart';

import '../../../core/helpers/pump_app.dart';

void main() {
  testWidgets('confirming returns true', (tester) async {
    bool? result;
    await tester.pumpApp(
      Builder(
        builder: (context) => TextButton(
          onPressed: () async =>
              result = await RewindConfirmDialog.show(context),
          child: const Text('open'),
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Sí, retroceder'));
    await tester.pumpAndSettle();
    expect(result, isTrue);
  });

  testWidgets('cancelling returns false and explains history is kept', (
    tester,
  ) async {
    bool? result;
    await tester.pumpApp(
      Builder(
        builder: (context) => TextButton(
          onPressed: () async =>
              result = await RewindConfirmDialog.show(context),
          child: const Text('open'),
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    expect(find.textContaining('se conservan'), findsOneWidget);
    await tester.tap(find.text('Cancelar'));
    await tester.pumpAndSettle();
    expect(result, isFalse);
  });
}
