import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/form_rules/app_field_kind.dart';
import 'package:gold_roundtables/core/widgets/form_fields/app_text_form_field.dart';

import '../helpers/pump_app.dart';

void main() {
  testWidgets('shows an error decided outside the form', (tester) async {
    await tester.pumpApp(
      const AppTextFormField(
        name: 'answer',
        label: 'Respuesta',
        errorText: 'Escribe una respuesta',
      ),
    );
    expect(find.text('Escribe una respuesta'), findsOneWidget);
  });

  testWidgets('follows an external controller both ways', (tester) async {
    final controller = TextEditingController(text: 'Hola');
    addTearDown(controller.dispose);
    String? changed;
    await tester.pumpApp(
      AppTextFormField(
        name: 'answer',
        label: 'Respuesta',
        controller: controller,
        onChanged: (value) => changed = value,
      ),
    );
    expect(find.text('Hola'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'Hola mundo');
    expect(changed, 'Hola mundo');
    expect(controller.text, 'Hola mundo');

    controller.text = 'Reemplazado';
    await tester.pump();
    expect(find.text('Reemplazado'), findsOneWidget);
  });

  testWidgets('hint-only search box has no label, submits and autofocuses', (
    tester,
  ) async {
    String? submitted;
    await tester.pumpApp(
      AppTextFormField(
        name: 'q',
        kind: AppFieldKind.search,
        hint: 'Buscar',
        prefixIcon: Icons.search_rounded,
        dense: true,
        autofocus: true,
        onSubmitted: (value) => submitted = value,
      ),
    );
    final field = tester.widget<TextField>(find.byType(TextField));
    expect(field.decoration!.labelText, isNull);
    expect(field.decoration!.hintText, 'Buscar');
    expect(field.decoration!.isDense, isTrue);
    expect(field.autofocus, isTrue);
    expect(field.textCapitalization, TextCapitalization.none);
    expect(find.byIcon(Icons.search_rounded), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'luz');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    expect(submitted, 'luz');
  });
}
