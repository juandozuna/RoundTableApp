/// Opens links outside the app (browser, WhatsApp, mail).
abstract interface class ExternalLinkService {
  /// Returns `false` when no app can handle [uri].
  Future<bool> open(Uri uri);
}
