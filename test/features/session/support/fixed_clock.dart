import 'package:gold_roundtables/core/services/clock/clock_service.dart';

class FixedClock implements ClockService {
  FixedClock(this.now);

  DateTime now;

  @override
  DateTime nowUtc() => now;
}
