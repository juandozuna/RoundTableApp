import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
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
}
