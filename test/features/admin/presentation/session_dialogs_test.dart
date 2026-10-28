import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/features/admin/domain/models/admin_table.dart';
import 'package:gold_roundtables/features/admin/domain/models/session_cancel_reason.dart';
import 'package:gold_roundtables/features/admin/presentation/pages/table_detail/widgets/cancel_session_dialog.dart';
import 'package:gold_roundtables/features/admin/presentation/pages/table_detail/widgets/session_schedule_dialog.dart';

import '../../../core/helpers/pump_app.dart';

void main() {
  group('AdminTable pending session', () {
    const base = AdminTable(
      id: 't1',
      organizationId: 'o1',
      organizationName: 'Luz',
      name: 'Fe',
      code: 'LUZ-01',
      timezone: 'America/Santo_Domingo',
    );

    test('reads the table-local wall clock without converting it', () {
      final table = base.copyWith(
        pendingSessionId: 's1',
        pendingSessionStatus: 'scheduled',
        pendingSessionLocal: '2026-11-03T19:30',
      );
      expect(table.pendingLocal, DateTime(2026, 11, 3, 19, 30));
      expect(table.pendingIsEditable, isTrue);
      expect(table.pendingIsExtraordinary, isFalse);
    });

    test('flags extraordinary and rescheduled sessions', () {
      final table = base.copyWith(
        pendingSessionId: 's1',
        pendingSessionStatus: 'scheduled',
        pendingSessionKind: 'extraordinary',
        pendingSessionOriginalAt: DateTime.utc(2026, 11, 4, 23),
      );
      expect(table.pendingIsExtraordinary, isTrue);
      expect(table.pendingIsRescheduled, isTrue);
    });

    test('an open session cannot be edited', () {
      final table = base.copyWith(
        pendingSessionId: 's1',
        pendingSessionStatus: 'open',
      );
      expect(table.pendingIsEditable, isFalse);
      expect(base.pendingIsEditable, isFalse);
    });
  });

  group('SessionScheduleDialog', () {
    Future<void> open(WidgetTester tester) async {
      await tester.pumpApp(
        Builder(
          builder: (context) => TextButton(
            onPressed: () => SessionScheduleDialog.show(
              context,
              title: 'Reprogramar la sesión',
              message: 'Mensaje',
              confirmLabel: 'Reprogramar',
            ),
            child: const Text('open'),
          ),
        ),
      );
      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();
    }

    testWidgets('requires a date before confirming', (tester) async {
      await open(tester);
      await tester.tap(find.text('Reprogramar'));
      await tester.pumpAndSettle();
      expect(find.text('Reprogramar la sesión'), findsOneWidget);
    });

    testWidgets('returns the prefilled slot and the reason', (tester) async {
      SessionSlotChoice? result;
      final initial = DateTime(2030, 1, 15, 19, 30);
      await tester.pumpApp(
        Builder(
          builder: (context) => TextButton(
            onPressed: () async => result = await SessionScheduleDialog.show(
              context,
              title: 'Reprogramar la sesión',
              message: 'Mensaje',
              confirmLabel: 'Reprogramar',
              initial: initial,
            ),
            child: const Text('open'),
          ),
        ),
      );
      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();
      expect(find.text('15/01/2030 19:30'), findsOneWidget);
      await tester.enterText(find.byType(TextField).last, 'Retiro');
      await tester.tap(find.text('Reprogramar'));
      await tester.pumpAndSettle();
      expect(result?.when, initial);
      expect(result?.reason, 'Retiro');
    });
  });

  group('CancelSessionDialog', () {
    testWidgets('says the value does not advance and needs a reason', (
      tester,
    ) async {
      SessionCancelChoice? result;
      await tester.pumpApp(
        Builder(
          builder: (context) => TextButton(
            onPressed: () async => result = await CancelSessionDialog.show(
              context,
              sessionDate: '03/11/2026 19:30',
            ),
            child: const Text('open'),
          ),
        ),
      );
      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();
      expect(find.textContaining('03/11/2026 19:30'), findsOneWidget);
      expect(find.textContaining('mismo valor'), findsOneWidget);

      await tester.tap(find.text('Cancelar sesión'));
      await tester.pumpAndSettle();
      expect(result, isNull);
      expect(find.textContaining('mismo valor'), findsOneWidget);

      await tester.tap(find.byType(DropdownButton<SessionCancelReason>));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Feriado').last);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Cancelar sesión'));
      await tester.pumpAndSettle();
      expect(result?.reason, SessionCancelReason.holiday);
      expect(result?.note, isNull);
    });
  });
}
