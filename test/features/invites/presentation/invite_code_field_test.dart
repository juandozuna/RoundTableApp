import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/features/invites/presentation/widgets/invite_code_form_field.dart';

import '../../../core/helpers/pump_app.dart';

void main() {
  testWidgets('typing fills the cells uppercase and completes at six', (
    tester,
  ) async {
    String? completed;
    await tester.pumpApp(
      FormBuilder(
        child: InviteCodeFormField(
          name: 'code',
          onComplete: (code) => completed = code,
        ),
      ),
    );

    await tester.enterText(find.byType(TextField), 'mes');
    await tester.pump();
    expect(find.text('M'), findsOneWidget);
    expect(find.text('E'), findsOneWidget);
    expect(find.text('S'), findsOneWidget);
    expect(completed, isNull);

    await tester.enterText(find.byType(TextField), 'mesa34');
    await tester.pump();
    expect(completed, 'MESA34');
  });

  testWidgets('rejects characters outside letters and digits and caps at six', (
    tester,
  ) async {
    await tester.pumpApp(
      FormBuilder(
        child: InviteCodeFormField(name: 'code', onComplete: (_) {}),
      ),
    );

    await tester.enterText(find.byType(TextField), 'ab-c d!12345');
    await tester.pump();

    final field = tester.widget<TextField>(find.byType(TextField));
    expect(field.controller!.text, 'ABCD12');
  });
}
