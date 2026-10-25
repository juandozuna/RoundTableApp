import '../../l10n/gen/app_localizations.dart';
import 'api_exception.dart';

extension ApiErrorMessages on ApiException {
  /// Plain-language Spanish message for the failure category. Features map
  /// specific [code]s (e.g. `invite_expired`) to their own copy first.
  String userMessage(AppLocalizations l10n) => switch (kind) {
    ApiErrorKind.network => l10n.errorNetwork,
    ApiErrorKind.timeout => l10n.errorTimeout,
    ApiErrorKind.unauthorized => l10n.errorUnauthorized,
    ApiErrorKind.forbidden => l10n.errorForbidden,
    ApiErrorKind.notFound => l10n.errorNotFound,
    ApiErrorKind.conflict => l10n.errorConflict,
    ApiErrorKind.validation => l10n.errorValidation,
    ApiErrorKind.server => l10n.errorServer,
    ApiErrorKind.cancelled || ApiErrorKind.unknown => l10n.errorGeneric,
  };
}
