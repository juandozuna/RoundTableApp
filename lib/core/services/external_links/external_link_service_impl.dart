import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

import 'external_link_service.dart';

@LazySingleton(as: ExternalLinkService)
class ExternalLinkServiceImpl implements ExternalLinkService {
  @override
  Future<bool> open(Uri uri) =>
      launchUrl(uri, mode: LaunchMode.externalApplication);
}
