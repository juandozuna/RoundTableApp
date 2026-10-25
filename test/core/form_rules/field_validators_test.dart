import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/form_rules/form_rules.dart';
import 'package:gold_roundtables/core/models/score_rules.dart';

void main() {
  group('required', () {
    test('rejects null, empty and blank', () {
      expect(FieldValidators.required(null), FieldError.required);
      expect(FieldValidators.required(''), FieldError.required);
      expect(FieldValidators.required('   '), FieldError.required);
      expect(FieldValidators.required('Ana'), isNull);
    });
  });

  group('email', () {
    test('accepts valid addresses, normalized', () {
      expect(FieldValidators.email('ana@dev.local'), isNull);
      expect(FieldValidators.email('  Ana.Soto@Correo.COM '), isNull);
      expect(FieldTransformers.email('  Ana@Correo.COM '), 'ana@correo.com');
    });

    test('rejects malformed addresses', () {
      for (final bad in [
        'ana',
        'ana@',
        '@correo.com',
        'ana@correo',
        'a b@c.de',
      ]) {
        expect(
          FieldValidators.email(bad),
          FieldError.invalidEmail,
          reason: bad,
        );
      }
    });

    test('empty optional value passes', () {
      expect(FieldValidators.email(''), isNull);
    });
  });

  group('phone (E.164, international)', () {
    test('normalizes separators and 00 prefix', () {
      expect(
        FieldTransformers.phoneE164('+52 (55) 1234-5678'),
        '+525512345678',
      );
      expect(FieldTransformers.phoneE164('0057 300 123 4567'), '+573001234567');
    });

    test('accepts international numbers from several countries', () {
      for (final ok in [
        '+52 55 1234 5678',
        '+57 300 123 4567',
        '+1 809 555 0101',
        '+34 612 345 678',
        '+593 99 123 4567',
      ]) {
        expect(FieldValidators.phone(ok), isNull, reason: ok);
      }
    });

    test('rejects numbers without country code or with bad length', () {
      for (final bad in [
        '5512345678',
        '+0 55 1234 5678',
        '+52 12',
        '+1234567890123456',
      ]) {
        expect(
          FieldValidators.phone(bad),
          FieldError.invalidPhone,
          reason: bad,
        );
      }
    });

    test('formats stored E.164 per country for display', () {
      expect(PhoneDisplayFormatter.format('+525512345678'), '+52 55 1234 5678');
      expect(PhoneDisplayFormatter.format('+573001234567'), '+57 300 123 4567');
      expect(PhoneDisplayFormatter.format('+18095550101'), '+1 809 555 0101');
      expect(PhoneDisplayFormatter.format('+50688887777'), '+506 8888 7777');
      expect(PhoneDisplayFormatter.format('+999123456789'), '+999 123 456 789');
    });
  });

  group('person name', () {
    test('accepts accented and compound names', () {
      for (final ok in [
        'Ana Lucía Soto',
        "María O'Neil",
        'Jean-Luc',
        'José M.',
      ]) {
        expect(FieldValidators.personName(ok), isNull, reason: ok);
      }
      expect(FieldTransformers.personName('  Ana   Lucía '), 'Ana Lucía');
    });

    test('rejects digits, symbols and single letters', () {
      for (final bad in ['Ana3', 'a', '@na', 'Luis!']) {
        expect(
          FieldValidators.personName(bad),
          FieldError.invalidPersonName,
          reason: bad,
        );
      }
    });
  });

  group('score 1–10 without 5', () {
    test('accepts every allowed score', () {
      for (final score in [1, 2, 3, 4, 6, 7, 8, 9, 10]) {
        expect(FieldValidators.score(score), isNull, reason: '$score');
      }
    });

    test('rejects 5 with its own error', () {
      expect(FieldValidators.score(5), FieldError.scoreFiveNotAllowed);
    });

    test('rejects out-of-range values', () {
      expect(FieldValidators.score(0), FieldError.invalidScore);
      expect(FieldValidators.score(11), FieldError.invalidScore);
      expect(FieldValidators.score(-3), FieldError.invalidScore);
    });

    test('ScoreRules.allowed matches isAllowed', () {
      final allowed = [
        for (var s = -1; s <= 12; s++)
          if (ScoreRules.isAllowed(s)) s,
      ];
      expect(allowed, ScoreRules.allowed);
    });
  });

  group('short text', () {
    test('enforces minimum length after trimming', () {
      expect(FieldValidators.shortText(' ab '), FieldError.tooShort);
      expect(FieldValidators.shortText('abc'), isNull);
      expect(
        FieldValidators.shortText('abcd', minLength: 5),
        FieldError.tooShort,
      );
    });
  });

  group('invite code', () {
    test('uppercases and strips separators', () {
      expect(FieldTransformers.inviteCode(' ab-12 cd '), 'AB12CD');
      expect(FieldValidators.inviteCode('ab12cd'), isNull);
    });

    test('requires exactly 6 letters or digits', () {
      expect(FieldValidators.inviteCode('AB12C'), FieldError.invalidInviteCode);
      expect(
        FieldValidators.inviteCode('AB12CD7'),
        FieldError.invalidInviteCode,
      );
    });
  });
}
