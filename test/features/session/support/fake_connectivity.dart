import 'package:gold_roundtables/core/services/connectivity/connectivity_service.dart';

class FakeConnectivity implements ConnectivityService {
  bool online = true;

  @override
  Future<bool> isOnline() async => online;

  @override
  Stream<bool> watchOnline() => Stream.value(online);
}
