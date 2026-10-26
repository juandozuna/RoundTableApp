import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/network/api_exception.dart';
import 'package:gold_roundtables/features/admin/presentation/admin_error_messages.dart';
import 'package:gold_roundtables/features/admin/presentation/admin_format.dart';
import 'package:gold_roundtables/features/admin/presentation/widgets/attendance_meter.dart';
import 'package:gold_roundtables/features/admin/presentation/widgets/confirm_by_typing_dialog.dart';
import 'package:gold_roundtables/l10n/gen/app_localizations.dart';

import '../../../core/helpers/pump_app.dart';

void main() {
  group('AttendanceMeter', () {
    testWidgets('flags attendance under 70 % with an icon, not only colour', (
      tester,
    ) async {
      await tester.pumpApp(const AttendanceMeter(percent: 66));
      expect(find.text('66%'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_drop_down_rounded), findsOneWidget);
    });

    testWidgets('healthy attendance has no flag', (tester) async {
      await tester.pumpApp(const AttendanceMeter(percent: 92));
      expect(find.text('92%'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_drop_down_rounded), findsNothing);
    });

    testWidgets('no data shows a dash', (tester) async {
      await tester.pumpApp(const AttendanceMeter(percent: null));
      expect(find.text('—'), findsOneWidget);
    });
  });

  group('ConfirmByTypingDialog', () {
    Future<void> open(WidgetTester tester, void Function(bool) onResult) async {
      await tester.pumpApp(
        Builder(
          builder: (context) => TextButton(
            onPressed: () async => onResult(
              await ConfirmByTypingDialog.show(
                context,
                name: 'Fundación Luz',
                title: 'Desactivar',
                warningTitle: 'Difícil de revertir',
                warningDetail: 'Nadie podrá entrar',
                confirmLabel: 'Desactivar organización',
              ),
            ),
            child: const Text('abrir'),
          ),
        ),
      );
      await tester.tap(find.text('abrir'));
      await tester.pumpAndSettle();
    }

    testWidgets('confirm stays disabled until the name is typed', (
      tester,
    ) async {
      bool? result;
      await open(tester, (value) => result = value);
      Finder confirm() =>
          find.widgetWithText(InkWell, 'Desactivar organización');
      await tester.tap(find.text('Desactivar organización'));
      await tester.pumpAndSettle();
      expect(result, isNull, reason: 'disabled button does nothing');

      await tester.enterText(find.byType(TextField), 'fundacion luz');
      await tester.pump();
      await tester.tap(find.text('Desactivar organización'));
      await tester.pumpAndSettle();
      expect(result, isTrue);
      expect(confirm, isNotNull);
    });

    testWidgets('cancel returns false', (tester) async {
      bool? result;
      await open(tester, (value) => result = value);
      await tester.tap(find.text('Cancelar'));
      await tester.pumpAndSettle();
      expect(result, isFalse);
    });
  });

  group('formatting', () {
    test('improvement uses a real minus sign', () {
      expect(AdminFormat.improvement(0.7), '+0.7');
      expect(AdminFormat.improvement(-0.4), '−0.4');
      expect(AdminFormat.improvement(null), '—');
    });

    test('percent rounds', () {
      expect(AdminFormat.percent(86.5), '87%');
    });
  });

  testWidgets('typed API errors read as plain Spanish', (tester) async {
    late AppLocalizations l10n;
    await tester.pumpApp(
      Builder(
        builder: (context) {
          l10n = AppLocalizations.of(context);
          return const SizedBox();
        },
      ),
    );
    const full = ApiException(kind: ApiErrorKind.conflict, code: 'table_full');
    expect(full.adminMessage(l10n), contains('9 personas'));
    const dup = ApiException(
      kind: ApiErrorKind.conflict,
      code: 'duplicate_table_code',
    );
    expect(dup.adminFieldName, 'code');
    const unknown = ApiException(
      kind: ApiErrorKind.conflict,
      code: 'something_new',
      message: 'Mensaje del servidor',
    );
    expect(unknown.adminMessage(l10n), 'Mensaje del servidor');
    const offline = ApiException(kind: ApiErrorKind.network);
    expect(offline.adminMessage(l10n), l10n.errorNetwork);
  });
}
