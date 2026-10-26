abstract interface class ClipboardService {
  Future<void> copy(String text);

  Future<String?> readText();
}
