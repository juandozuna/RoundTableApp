import 'dart:async';

import 'package:injectable/injectable.dart';

import 'session_context.dart';
import 'session_context_service.dart';

/// Default, non-persistent context holder. The auth/context feature replaces
/// it with a persisted implementation (see flutter-conventions.md).
@LazySingleton(as: SessionContextService)
class InMemorySessionContextService implements SessionContextService {
  final StreamController<SessionContext?> _changes =
      StreamController<SessionContext?>.broadcast();
  SessionContext? _current;

  @override
  SessionContext? get current => _current;

  @override
  Stream<SessionContext?> watch() {
    StreamSubscription<SessionContext?>? subscription;
    late final StreamController<SessionContext?> controller;
    controller = StreamController<SessionContext?>(
      onListen: () {
        controller.add(_current);
        subscription = _changes.stream.listen(controller.add);
      },
      onCancel: () => subscription?.cancel(),
    );
    return controller.stream;
  }

  @override
  Future<void> select(SessionContext context) async {
    _current = context;
    _changes.add(context);
  }

  @override
  Future<void> clear() async {
    _current = null;
    _changes.add(null);
  }
}
