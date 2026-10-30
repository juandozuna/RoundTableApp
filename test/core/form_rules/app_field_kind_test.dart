import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/form_rules/form_rules.dart';
import 'package:gold_roundtables/l10n/gen/app_localizations_es.dart';

void main() {
  final l10n = AppLocalizationsEs();

  test('required check runs before the kind validator', () {
    expect(
      AppFieldKind.email.validate('', required: true),
      FieldError.required,
    );
    expect(AppFieldKind.email.validate(''), isNull);
  });

  test('validator returns localized Spanish messages', () {
    final validate = AppFieldKind.phone.validator(l10n, required: true);
    expect(validate(''), l10n.validationRequired);
    expect(validate('5512345678'), l10n.validationPhone);
    expect(validate('+52 55 1234 5678'), isNull);

    final short = AppFieldKind.shortText.validator(l10n, minLength: 10);
    expect(short('corto'), 'Escribe al menos 10 caracteres.');
  });

  test('transform yields the stored value', () {
    expect(AppFieldKind.phone.transform('+52 55-1234 5678'), '+525512345678');
    expect(AppFieldKind.inviteCode.transform('ab 12cd'), 'AB12CD');
    expect(AppFieldKind.email.transform(' A@B.CO '), 'a@b.co');
  });

  test('invite code formatter uppercases and caps length', () {
    final formatter = AppFieldKind.inviteCode.inputFormatters.single;
    final result = formatter.formatEditUpdate(
      TextEditingValue.empty,
      const TextEditingValue(text: 'ab-12cd99'),
    );
    expect(result.text, 'AB12CD');
  });

  test('keyboard types match the kind', () {
    expect(AppFieldKind.email.keyboardType, TextInputType.emailAddress);
    expect(AppFieldKind.phone.keyboardType, TextInputType.phone);
  });

  test('search kind is a free filter: never invalid, trimmed, no capitals', () {
    expect(AppFieldKind.search.validate('  '), isNull);
    expect(AppFieldKind.search.transform('  luz '), 'luz');
    expect(AppFieldKind.search.textCapitalization, TextCapitalization.none);
  });

  group('passwords', () {
    test('a new password needs at least 8 characters', () {
      final validate = AppFieldKind.newPassword.validator(l10n, required: true);
      expect(validate(''), l10n.validationRequired);
      expect(
        validate('corta12'),
        'La contraseña debe tener al menos 8 caracteres.',
      );
      expect(validate('suficiente'), isNull);
    });

    test('a current password is only required, never length-checked', () {
      final validate = AppFieldKind.currentPassword.validator(
        l10n,
        required: true,
      );
      expect(validate(''), l10n.validationRequired);
      expect(validate('x'), isNull);
    });

    test('the confirmation must repeat the password', () {
      final validate = AppFieldKind.confirmPassword.validator(
        l10n,
        required: true,
        matchValue: () => 'secreto-123',
      );
      expect(validate('secreto-124'), l10n.validationPasswordMismatch);
      expect(validate('secreto-123'), isNull);
    });

    test('passwords keep spaces and are hidden by default', () {
      expect(AppFieldKind.newPassword.transform('  a b  '), '  a b  ');
      expect(
        AppFieldKind.newPassword.validate('        ', required: true),
        isNull,
      );
      expect(AppFieldKind.currentPassword.isSecret, isTrue);
      expect(AppFieldKind.email.isSecret, isFalse);
    });
  });
}
