import 'package:injectable/injectable.dart';

import '../../services/clipboard_service.dart';

@injectable
class ReadClipboardTextUseCase {
  const ReadClipboardTextUseCase(this._clipboard);

  final ClipboardService _clipboard;

  Future<String?> call() => _clipboard.readText();
}
