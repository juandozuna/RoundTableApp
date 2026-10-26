import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/features/invites/data/services/invite_attempts_service_impl.dart';
import 'package:gold_roundtables/features/invites/domain/models/invite_problem.dart';
import 'package:gold_roundtables/features/invites/domain/services/clipboard_service.dart';
import 'package:gold_roundtables/features/invites/domain/use_cases/redeem/get_remaining_attempts_use_case.dart';
import 'package:gold_roundtables/features/invites/domain/use_cases/redeem/parse_invite_code_use_case.dart';
import 'package:gold_roundtables/features/invites/domain/use_cases/redeem/preview_invite_use_case.dart';
import 'package:gold_roundtables/features/invites/domain/use_cases/share/read_clipboard_text_use_case.dart';
import 'package:gold_roundtables/features/invites/presentation/pages/code_entry/cubit/code_entry_cubit.dart';
import 'package:gold_roundtables/features/invites/presentation/pages/code_entry/cubit/code_entry_state.dart';
import 'package:gold_roundtables/features/invites/presentation/pages/scan/cubit/scan_cubit.dart';
import 'package:gold_roundtables/features/invites/presentation/pages/scan/cubit/scan_state.dart';

import '../helpers/fakes.dart';

class FakeClipboard implements ClipboardService {
  String? text;

  @override
  Future<void> copy(String value) async => text = value;

  @override
  Future<String?> readText() async => text;
}

void main() {
  late FakeInviteService invites;
  late InviteAttemptsServiceImpl attempts;
  late FixedClock clock;
  late FakeClipboard clipboard;

  PreviewInviteUseCase preview() =>
      PreviewInviteUseCase(invites, attempts, clock);

  setUp(() {
    clock = FixedClock(DateTime.utc(2026, 10, 25, 12));
    attempts = InviteAttemptsServiceImpl(clock);
    invites = FakeInviteService();
    clipboard = FakeClipboard();
  });

  group('CodeEntryCubit', () {
    CodeEntryCubit build() =>
        CodeEntryCubit(preview(), GetRemainingAttemptsUseCase(attempts));

    test('a valid code is verified with its preview', () async {
      final cubit = build();
      await cubit.submit('MESA34');

      expect(cubit.state.status, CodeEntryStatus.verified);
      expect(cubit.state.verified?.code, 'MESA34');
      await cubit.close();
    });

    test('a typo reports the attempts that remain; the fifth locks', () async {
      invites.previewFailures['TYPO23'] = const InviteFailure(
        InviteProblem.notFound,
      );
      final cubit = build();

      await cubit.submit('TYPO23');
      expect(cubit.state.problem, InviteProblem.notFound);
      expect(cubit.state.remainingAttempts, 4);

      for (var i = 0; i < 4; i++) {
        await cubit.submit('TYPO23');
      }
      expect(cubit.state.isLocked, isTrue);
      expect(cubit.state.lockedUntil, isNotNull);

      final callsBefore = invites.calls.length;
      await cubit.submit('MESA34');
      expect(invites.calls.length, callsBefore, reason: 'locked: no request');
      await cubit.close();
    });

    test('an expired code goes to the full-screen explanation', () async {
      invites.previewFailures['VENC22'] = const InviteFailure(
        InviteProblem.expired,
      );
      final cubit = build();
      await cubit.submit('VENC22');

      expect(cubit.state.isUnusableInvite, isTrue);
      expect(cubit.state.code, 'VENC22');
      await cubit.close();
    });

    test('editing after an error clears it', () async {
      invites.previewFailures['TYPO23'] = const InviteFailure(
        InviteProblem.notFound,
      );
      final cubit = build();
      await cubit.submit('TYPO23');
      cubit.edited();

      expect(cubit.state.problem, isNull);
      await cubit.close();
    });
  });

  group('ScanCubit', () {
    ScanCubit build() => ScanCubit(
      const ParseInviteCodeUseCase(),
      preview(),
      ReadClipboardTextUseCase(clipboard),
    );

    test('a QR with an invitation link is verified', () async {
      final cubit = build();
      await cubit.submitText('http://127.0.0.1:3000/#/invitacion/MESA34');

      expect(cubit.state, isA<ScanVerified>());
      expect((cubit.state as ScanVerified).preview.code, 'MESA34');
      await cubit.close();
    });

    test('a QR from another app is not an invitation', () async {
      final cubit = build();
      await cubit.submitText('https://example.org/menu');

      expect(cubit.state, isA<ScanNotInvite>());
      expect(invites.calls, isEmpty);
      cubit.resume();
      expect(cubit.state, isA<ScanScanning>());
      await cubit.close();
    });

    test('an expired invite found by QR reports why', () async {
      invites.previewFailures['VENC22'] = const InviteFailure(
        InviteProblem.expired,
      );
      final cubit = build();
      await cubit.submitText('VENC22');

      expect((cubit.state as ScanFailed).problem, InviteProblem.expired);
      await cubit.close();
    });

    test('web paste reads the clipboard', () async {
      clipboard.text = 'https://app.example.org/invite/MESA34';
      final cubit = build();
      await cubit.pasteFromClipboard();
      expect(cubit.state, isA<ScanVerified>());

      clipboard.text = '  ';
      final empty = build();
      await empty.pasteFromClipboard();
      expect(empty.state, isA<ScanNotInvite>());
      await cubit.close();
      await empty.close();
    });
  });
}
