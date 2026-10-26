import '../../../../../../l10n/gen/app_localizations.dart';
import '../../../../domain/models/response_validation.dart';

/// Spanish copy for a field's validation error. Returns null when the field
/// has no error.
extension ResponseErrorText on ResponseErrors {
  String? messageFor(String key, AppLocalizations l10n) {
    final error = this[key];
    if (error == null) return null;
    if (key == ResponseField.followUpStatus.name) {
      return l10n.sessionMemberErrorStatus;
    }
    if (key == ResponseField.followUpScore.name ||
        key == ResponseField.reflectionScore.name) {
      return l10n.sessionMemberErrorScore;
    }
    if (key == ResponseField.commitmentWhat.name) {
      return error == ResponseError.tooShort
          ? l10n.sessionMemberErrorWhatShort
          : l10n.sessionMemberErrorWhat;
    }
    if (key == ResponseField.commitmentWhen.name) {
      return l10n.sessionMemberErrorWhen;
    }
    if (key == ResponseField.commitmentHow.name) {
      return l10n.sessionMemberErrorHow;
    }
    return error == ResponseError.tooShort
        ? l10n.sessionMemberErrorTooShort
        : l10n.sessionMemberErrorAnswer;
  }
}
