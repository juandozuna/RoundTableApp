import 'package:injectable/injectable.dart';

import '../../../../../core/services/external_links/external_link_service.dart';

@injectable
class OpenWhatsAppUseCase {
  const OpenWhatsAppUseCase(this._links);

  final ExternalLinkService _links;

  /// Opens WhatsApp with [text]. With [phoneE164] the message goes straight
  /// to that person's chat; without it WhatsApp asks who to send it to.
  /// Returns `false` when WhatsApp cannot be opened.
  Future<bool> call(String text, {String? phoneE164}) {
    final digits = phoneE164?.replaceAll(RegExp(r'\D'), '') ?? '';
    final uri = digits.isEmpty
        ? Uri.https('wa.me', '/', {'text': text})
        : Uri.https('wa.me', '/$digits', {'text': text});
    return _links.open(uri);
  }
}
