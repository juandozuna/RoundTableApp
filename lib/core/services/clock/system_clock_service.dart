import 'package:injectable/injectable.dart';

import 'clock_service.dart';

@LazySingleton(as: ClockService)
class SystemClockService implements ClockService {
  @override
  DateTime nowUtc() => DateTime.now().toUtc();
}
