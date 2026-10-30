import '../constants/app_constants.dart';
import '../models/score_rules.dart';
import 'field_error.dart';
import 'field_transformers.dart';

/// Pure validators. Each returns `null` when the value is valid. Optional
/// fields pass when empty; combine with [required] for mandatory fields.
abstract final class FieldValidators {
  static final RegExp _email = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]{2,}$');
  static final RegExp _e164 = RegExp(r'^\+[1-9]\d{7,14}$');
  static final RegExp _personName = RegExp(
    r"^\p{L}[\p{L}\p{M}' .\-]*\p{L}\.?$",
    unicode: true,
  );
  static final RegExp _inviteCode = RegExp(
    '^[A-Z0-9]{${AppLimits.inviteCodeLength}}\$',
  );

  static FieldError? required(String? raw) =>
      FieldTransformers.trimmed(raw).isEmpty ? FieldError.required : null;

  /// Passwords keep their spaces, so "required" does not trim them.
  static FieldError? requiredSecret(String? raw) =>
      (raw ?? '').isEmpty ? FieldError.required : null;

  static FieldError? email(String? raw) {
    final value = FieldTransformers.email(raw);
    if (value.isEmpty) return null;
    return _email.hasMatch(value) ? null : FieldError.invalidEmail;
  }

  static FieldError? phone(String? raw) {
    final value = FieldTransformers.phoneE164(raw);
    if (value.isEmpty) return null;
    return _e164.hasMatch(value) ? null : FieldError.invalidPhone;
  }

  static FieldError? personName(String? raw) {
    final value = FieldTransformers.personName(raw);
    if (value.isEmpty) return null;
    return _personName.hasMatch(value) ? null : FieldError.invalidPersonName;
  }

  static FieldError? shortText(
    String? raw, {
    int minLength = AppLimits.shortTextMinLength,
  }) {
    final value = FieldTransformers.trimmed(raw);
    if (value.isEmpty) return null;
    return value.length < minLength ? FieldError.tooShort : null;
  }

  static FieldError? inviteCode(String? raw) {
    final value = FieldTransformers.inviteCode(raw);
    if (value.isEmpty) return null;
    return _inviteCode.hasMatch(value) ? null : FieldError.invalidInviteCode;
  }

  /// A new password: at least [AppLimits.passwordMinLength] characters.
  /// Not trimmed; spaces are part of a password.
  static FieldError? newPassword(String? raw) {
    final value = raw ?? '';
    if (value.isEmpty) return null;
    return value.length < AppLimits.passwordMinLength
        ? FieldError.passwordTooShort
        : null;
  }

  /// The confirmation must repeat [original] exactly.
  static FieldError? matches(String? raw, String? original) {
    if ((raw ?? '').isEmpty) return null;
    return raw == original ? null : FieldError.passwordMismatch;
  }

  /// Validates a picked score; `null` means "not picked yet".
  static FieldError? score(int? value) {
    if (value == null) return null;
    if (value == ScoreRules.forbidden) return FieldError.scoreFiveNotAllowed;
    return ScoreRules.isAllowed(value) ? null : FieldError.invalidScore;
  }
}
