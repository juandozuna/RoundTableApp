import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/features/admin/domain/models/record_status.dart';
import 'package:gold_roundtables/features/curriculum/domain/models/curriculum_edit.dart';
import 'package:gold_roundtables/features/curriculum/domain/models/curriculum_plan.dart';
import 'package:gold_roundtables/features/curriculum/presentation/pages/curriculum/widgets/curriculum_edit_dialog.dart';
import 'package:gold_roundtables/features/curriculum/presentation/pages/curriculum/widgets/curriculum_text_dialogs.dart';
import 'package:gold_roundtables/features/curriculum/presentation/pages/curriculum_upload/widgets/curriculum_diff_view.dart';

import '../../../core/helpers/pump_app.dart';

void main() {
  testWidgets('the diff lists counts, field changes and refusals', (
    tester,
  ) async {
    await tester.pumpApp(
      const SingleChildScrollView(
        child: CurriculumDiffView(
          plan: CurriculumPlan(
            changes: [
              CurriculumChange(
                entity: CurriculumEntity.value,
                key: '1',
                label: 'Integridad',
                action: CurriculumChangeAction.update,
                fields: {
                  'name': FieldChange(from: 'Integridad', to: 'Honestidad'),
                },
              ),
              CurriculumChange(
                entity: CurriculumEntity.question,
                key: '2/por_que',
                label: '¿Por qué?',
                action: CurriculumChangeAction.deactivate,
                answered: true,
              ),
            ],
            refused: [
              CurriculumRefusal(
                key: '3/x',
                label: 'x',
                message: 'Ya tiene respuestas.',
              ),
            ],
          ),
        ),
      ),
    );
    expect(find.text('1 con cambios'), findsOneWidget);
    expect(find.text('1 se desactivan'), findsOneWidget);
    expect(find.text('Valor 1 · Integridad'), findsOneWidget);
    expect(find.text('Nombre: Integridad → Honestidad'), findsOneWidget);
    expect(
      find.text('Tiene respuestas: se desactiva, no se borra.'),
      findsOneWidget,
    );
    expect(find.text('No se puede aplicar este archivo'), findsOneWidget);
    expect(find.text('x: Ya tiene respuestas.'), findsOneWidget);
  });

  testWidgets('an empty diff says nothing changes', (tester) async {
    await tester.pumpApp(const CurriculumDiffView(plan: CurriculumPlan()));
    expect(find.textContaining('No hay cambios'), findsOneWidget);
  });

  Future<CurriculumEdit?> openEdit(
    WidgetTester tester,
    CurriculumEditTarget target,
  ) async {
    CurriculumEdit? result;
    await tester.pumpApp(
      Builder(
        builder: (context) => TextButton(
          onPressed: () async =>
              result = await CurriculumEditDialog.show(context, target),
          child: const Text('open'),
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    return result;
  }

  testWidgets(
    'editing a translation shows the Spanish text and sends the locale',
    (tester) async {
      CurriculumEdit? result;
      await tester.pumpApp(
        Builder(
          builder: (context) => TextButton(
            onPressed: () async => result = await CurriculumEditDialog.show(
              context,
              const CurriculumEditTarget(
                entity: CurriculumEntity.value,
                id: 'v1',
                title: 'Editar valor 1',
                baseName: 'Integridad',
                locale: 'en',
              ),
            ),
            child: const Text('open'),
          ),
        ),
      );
      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();
      expect(find.text('Texto en español'.toUpperCase()), findsOneWidget);
      expect(find.text('Integridad'), findsOneWidget);
      expect(find.textContaining('Referencia del cuadernillo'), findsNothing);
      await tester.enterText(find.byType(TextField).first, 'Integrity');
      await tester.tap(find.text('Guardar'));
      await tester.pumpAndSettle();
      expect(result?.locale, 'en');
      expect(result?.name, 'Integrity');
      expect(result?.bookletReference, isNull);
    },
  );

  testWidgets('an answered question keeps its answer type locked', (
    tester,
  ) async {
    await openEdit(
      tester,
      const CurriculumEditTarget(
        entity: CurriculumEntity.question,
        id: 'q1',
        title: 'Editar pregunta por_que',
        baseName: '¿Por qué?',
        name: '¿Por qué?',
        typeLocked: true,
        status: RecordStatus.active,
      ),
    );
    expect(
      find.text(
        'La pregunta ya tiene respuestas: no se puede cambiar su tipo.',
      ),
      findsOneWidget,
    );
  });

  testWidgets('add language collects name and code', (tester) async {
    NewLanguage? result;
    await tester.pumpApp(
      Builder(
        builder: (context) => TextButton(
          onPressed: () async =>
              result = await CurriculumTextDialogs.addLanguage(context),
          child: const Text('open'),
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    final fields = find.byType(TextField);
    await tester.enterText(fields.at(0), 'English');
    await tester.enterText(fields.at(1), 'EN');
    await tester.tap(find.text('Agregar'));
    await tester.pumpAndSettle();
    expect(result, (code: 'en', name: 'English'));
  });
}
