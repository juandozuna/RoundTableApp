import 'package:injectable/injectable.dart';

import 'connectivity_service.dart';

@injectable
class WatchConnectivityUseCase {
  const WatchConnectivityUseCase(this._connectivity);

  final ConnectivityService _connectivity;

  Stream<bool> call() => _connectivity.watchOnline();
}
