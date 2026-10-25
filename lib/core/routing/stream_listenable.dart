import 'dart:async';

import 'package:flutter/foundation.dart';

/// Notifies listeners on every stream event; feeds go_router's
/// `refreshListenable`.
class StreamListenable extends ChangeNotifier {
  StreamListenable(Stream<Object?> stream) {
    _subscription = stream.listen((_) => notifyListeners());
  }

  late final StreamSubscription<Object?> _subscription;

  @override
  void dispose() {
    unawaited(_subscription.cancel());
    super.dispose();
  }
}
