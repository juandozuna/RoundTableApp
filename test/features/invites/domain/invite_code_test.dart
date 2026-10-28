import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/models/user_role.dart';
import 'package:gold_roundtables/features/invites/domain/models/invite_code.dart';
import 'package:gold_roundtables/features/invites/domain/models/invite_permissions.dart';
import 'package:gold_roundtables/features/invites/domain/models/invite_role_kind.dart';

import '../helpers/fakes.dart';

void main() {
  group('InviteCode', () {
    test('normalizes case, spaces and dashes like the server', () {
      expect(InviteCode.normalize('mes-a 34'), 'MESA34');
    });

    test('accepts only the 32-symbol alphabet (no 0, O, 1, I)', () {
      expect(InviteCode.isValid('MESA34'), isTrue);
      expect(InviteCode.isValid('MESA3'), isFalse);
      expect(InviteCode.isValid('MESA03'), isFalse);
      expect(InviteCode.isValid('MESAI4'), isFalse);
    });

    test('reads a code from a bare code, a link or a QR payload', () {
      expect(InviteCode.parse(' mesa34 '), 'MESA34');
      expect(InviteCode.parse('MES-A34'), 'MESA34');
      expect(
        InviteCode.parse('http://127.0.0.1:3000/#/invitacion/MESA34'),
        'MESA34',
      );
      expect(
        InviteCode.parse('https://app.example.org/invite/MESA34'),
        'MESA34',
      );
      expect(
        InviteCode.parse('https://app.example.org/join?code=mesa34'),
        'MESA34',
      );
    });

    test('rejects anything that is not an invitation', () {
      expect(InviteCode.parse(''), isNull);
      expect(InviteCode.parse('hola'), isNull);
      expect(InviteCode.parse('https://example.org/menu'), isNull);
      expect(InviteCode.parse('WIFI:S:casa;T:WPA;P:secreto;;'), isNull);
    });
  });

  group('InvitePermissions', () {
    test('role matrix: admin any role, coordinator never coordinators', () {
      expect(
        InvitePermissions.grantableBy(UserRole.administrator),
        hasLength(3),
      );
      expect(InvitePermissions.grantableBy(UserRole.coordinator), [
        InviteRoleKind.member,
        InviteRoleKind.facilitator,
      ]);
      expect(InvitePermissions.grantableBy(UserRole.facilitator), [
        InviteRoleKind.member,
      ]);
      expect(InvitePermissions.canInvite(UserRole.member), isFalse);
    });

    test('managing an invite follows the same matrix', () {
      expect(
        InvitePermissions.canManage(
          UserRole.coordinator,
          InviteRoleKind.coordinator,
        ),
        isFalse,
      );
      expect(
        InvitePermissions.canManage(
          UserRole.administrator,
          InviteRoleKind.coordinator,
        ),
        isTrue,
      );
      expect(
        InvitePermissions.canManage(
          UserRole.facilitator,
          InviteRoleKind.facilitator,
        ),
        isFalse,
      );
    });

    test(
      'only staff pick the organization; facilitators have a fixed table',
      () {
        expect(
          InvitePermissions.choosesOrganization(UserRole.administrator),
          isTrue,
        );
        expect(
          InvitePermissions.choosesOrganization(UserRole.coordinator),
          isFalse,
        );
        expect(InvitePermissions.choosesTable(UserRole.facilitator), isFalse);
        expect(InvitePermissions.choosesTable(UserRole.coordinator), isTrue);
      },
    );
  });

  group('Invite', () {
    test('builds the deep link from the origin the server reports', () {
      final invite = makeInvite('1', code: 'MESA34');
      expect(invite.shareLink, 'http://127.0.0.1:3000/#/invitacion/MESA34');
    });

    test('has no link when the server sent none', () {
      expect(makeInvite('1').copyWith(inviteUrl: null).shareLink, isNull);
    });
  });
}
