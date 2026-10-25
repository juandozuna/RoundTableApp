/// Opens the platform share sheet.
abstract interface class ShareService {
  Future<void> shareText(String text, {String? subject});
}
