import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/models/user_role.dart';
import 'package:gold_roundtables/features/invites/data/models/invite_envelope.dart';
import 'package:gold_roundtables/features/invites/data/models/invite_list_envelope.dart';
import 'package:gold_roundtables/features/invites/data/models/invite_preview_envelope.dart';
import 'package:gold_roundtables/features/invites/domain/models/invite_role_kind.dart';
import 'package:gold_roundtables/features/invites/domain/models/invite_status.dart';
import 'package:gold_roundtables/features/invites/domain/models/invite_target_table.dart';
import 'package:gold_roundtables/features/invites/domain/models/new_invite.dart';
import 'package:gold_roundtables/features/invites/domain/models/person_draft.dart';
import 'package:gold_roundtables/features/invites/domain/models/redeem_profile.dart';
import 'package:gold_roundtables/features/invites/domain/models/redeem_result.dart';

// Payloads copied from api-contract.md §5 (invites).
const inviteJson = {
  'id': 'inv-1',
  'code': 'MESA34',
  'role_kind': 'member',
  'status': 'pending',
  'organization_id': 'org-luz',
  'organization_name': 'Fundación Luz',
  'round_table_id': 't-1',
  'round_table_name': 'Mesa Esperanza 03',
  'round_table_code': 'LUZ-03',
  'person': {
    'id': 'p-1',
    'organization_id': 'org-luz',
    'first_name': 'Rodrigo',
    'last_name': 'Paz',
    'position': null,
    'email': 'rodrigo@ejemplo.org',
    'phone': '+18095550101',
    'status': 'invited',
    'linked': false,
  },
  'invited_by_person_id': 'p-fac',
  'invited_by_name': 'Sofía Herrera',
  'expires_at': '2026-11-08T12:00:00+00:00',
  'accepted_at': null,
  'revoked_at': null,
  'created_at': '2026-10-25T12:00:00+00:00',
  'invite_url': 'http://127.0.0.1:3000/invite/MESA34',
};

void main() {
  test('parses an invite', () {
    final invite = InviteEnvelope.fromJson({'invite': inviteJson}).invite;

    expect(invite.roleKind, InviteRoleKind.member);
    expect(invite.status, InviteStatus.pending);
    expect(invite.person.fullName, 'Rodrigo Paz');
    expect(invite.person.linked, isFalse);
    expect(invite.scopeName, 'Mesa Esperanza 03');
    expect(invite.expiresAt.isUtc, isTrue);
  });

  test('parses the list, including every effective status', () {
    final list = InviteListEnvelope.fromJson({
      'invites': [
        for (final status in ['pending', 'accepted', 'expired', 'revoked'])
          {...inviteJson, 'status': status},
      ],
    });
    expect(list.invites.map((i) => i.status), InviteStatus.values);
  });

  test('parses the anonymous preview', () {
    final preview = InvitePreviewEnvelope.fromJson({
      'invite': {
        'code': 'MESA34',
        'status': 'pending',
        'role_kind': 'member',
        'organization_name': 'Fundación Luz',
        'round_table_name': 'Mesa Esperanza 03',
        'person_first_name': 'Rodrigo',
        'invited_by_name': 'Sofía Herrera',
        'expires_at': '2026-11-08T12:00:00+00:00',
      },
    }).invite;

    expect(preview.scopeName, 'Mesa Esperanza 03');
    expect(preview.personFirstName, 'Rodrigo');
    expect(preview.invitedByName, 'Sofía Herrera');
  });

  test('a coordinator preview has no table', () {
    final preview = InvitePreviewEnvelope.fromJson({
      'invite': {
        'code': 'CRDN26',
        'status': 'pending',
        'role_kind': 'coordinator',
        'organization_name': 'Fundación Luz',
        'round_table_name': null,
        'person_first_name': 'Esteban',
        'invited_by_name': null,
        'expires_at': null,
      },
    }).invite;
    expect(preview.scopeName, 'Fundación Luz');
  });

  test('parses the redeem result and finds the joined context', () {
    final result = RedeemResult.fromJson({
      'already_redeemed': false,
      'person': inviteJson['person'],
      'invite': {...inviteJson, 'status': 'accepted'},
      'contexts': [
        {
          'kind': 'coordinator',
          'person_id': 'other',
          'organization_id': 'org-x',
          'label': 'Coordinador · X',
        },
        {
          'kind': 'member',
          'person_id': 'p-1',
          'organization_id': 'org-luz',
          'round_table_id': 't-1',
          'round_table_name': 'Mesa Esperanza 03',
          'label': 'Miembro · Mesa Esperanza 03',
        },
      ],
    });

    expect(result.alreadyRedeemed, isFalse);
    expect(result.joinedContext?.kind, UserRole.member);
    expect(result.joinedContext?.label, 'Miembro · Mesa Esperanza 03');
  });

  test('serializes the create body with snake_case and no nulls', () {
    final body = const NewInvite(
      roleKind: InviteRoleKind.member,
      roundTableId: 't-1',
      person: PersonDraft(
        firstName: 'Rodrigo',
        lastName: 'Paz',
        email: 'rodrigo@ejemplo.org',
        phone: '+18095550101',
      ),
      expiresInDays: 14,
    ).toJson();

    expect(body, {
      'role_kind': 'member',
      'round_table_id': 't-1',
      'person': {
        'first_name': 'Rodrigo',
        'last_name': 'Paz',
        'email': 'rodrigo@ejemplo.org',
        'phone': '+18095550101',
      },
      'expires_in_days': 14,
    });
  });

  test('serializes only the profile fields that were confirmed', () {
    expect(
      const RedeemProfile(firstName: 'Valeria', lastName: 'Cordero').toJson(),
      {'first_name': 'Valeria', 'last_name': 'Cordero'},
    );
  });

  test('table seats count the facilitator and pending invites', () {
    final table = InviteTargetTable.fromJson({
      'id': 't-1',
      'organization_id': 'org-luz',
      'name': 'Mesa Esperanza 03',
      'active_people': 9,
      'max_people': 9,
      'facilitator_person_id': 'p-fac',
      'extra_column': 'ignored',
    });
    expect(table.isFull, isTrue);
    expect(table.freeSeats, 0);
    expect(table.hasFacilitator, isTrue);
  });
}
