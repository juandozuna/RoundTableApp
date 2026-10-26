import 'package:gold_roundtables/core/services/id/id_generator.dart';

/// Deterministic ids for assertions: `id-1`, `id-2`, ...
class CounterIdGenerator implements IdGenerator {
  int _next = 1;

  @override
  String newId() => 'id-${_next++}';
}
