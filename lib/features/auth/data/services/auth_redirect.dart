import 'package:flutter/foundation.dart';

/// Where Supabase sends the person back to after a provider or emailed link.
abstract final class AuthRedirect {
  static const String mobile = 'io.goldroundtables.app://login-callback';

  /// Mobile returns through the deep link. Web comes back to the current app
  /// origin; the app uses hash routing, so [returnPath] goes after `/#`.
  static String to(String? returnPath) {
    if (!kIsWeb) return mobile;
    final path = returnPath ?? '/';
    return '${Uri.base.origin}/#$path';
  }
}
