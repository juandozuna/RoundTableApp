import 'package:injectable/injectable.dart';

import '../../services/clipboard_service.dart';

@injectable
class CopyTextUseCase {
  const CopyTextUseCase(this._clipboard);

  final ClipboardService _clipboard;

  Future<void> call(String text) => _clipboard.copy(text);
}
