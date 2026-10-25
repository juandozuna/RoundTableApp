import 'package:injectable/injectable.dart';
import 'package:share_plus/share_plus.dart';

import 'share_service.dart';

@LazySingleton(as: ShareService)
class ShareServiceImpl implements ShareService {
  @override
  Future<void> shareText(String text, {String? subject}) async {
    await SharePlus.instance.share(ShareParams(text: text, subject: subject));
  }
}
