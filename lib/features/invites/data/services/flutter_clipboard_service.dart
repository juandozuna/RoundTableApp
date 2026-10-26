import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import '../../domain/services/clipboard_service.dart';

@LazySingleton(as: ClipboardService)
class FlutterClipboardService implements ClipboardService {
  @override
  Future<void> copy(String text) =>
      Clipboard.setData(ClipboardData(text: text));

  @override
  Future<String?> readText() async =>
      (await Clipboard.getData(Clipboard.kTextPlain))?.text;
}
