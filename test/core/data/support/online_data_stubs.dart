import 'dart:async';

import 'package:gold_roundtables/core/data/data_change_signal.dart';
import 'package:gold_roundtables/core/data/remote_watch.dart';
import 'package:gold_roundtables/core/services/app_lifecycle/app_lifecycle_service.dart';
import 'package:gold_roundtables/features/settings/domain/models/content_language.dart';
import 'package:gold_roundtables/features/settings/domain/services/content_language_service.dart';

/// Always in the foreground; the readers under test do not poll.
class ForegroundLifecycle implements AppLifecycleService {
  final StreamController<bool> _changes = StreamController<bool>.broadcast(
    sync: true,
  );

  @override
  bool get isForeground => true;

  @override
  Stream<bool> watchForeground() => _changes.stream;

  void setForeground(bool value) => _changes.add(value);
}

/// A [RemoteWatch] with its [DataChangeSignal] in reach of the test.
class WatchHarness {
  WatchHarness() {
    watch = RemoteWatch(signal, lifecycle);
  }

  final DataChangeSignal signal = DataChangeSignal();
  final ForegroundLifecycle lifecycle = ForegroundLifecycle();
  late final RemoteWatch watch;
}

/// Serves a fixed content-language choice.
class StubContentLanguageService implements ContentLanguageService {
  StubContentLanguageService([this.selected = ContentLanguageChoice.baseCode]);

  String selected;
  bool unreadable = false;

  @override
  Stream<ContentLanguageChoice> watch() {
    if (unreadable) return Stream.error(StateError('offline'));
    return Stream.value(ContentLanguageChoice(selected: selected));
  }

  @override
  Future<void> select(String code) async => selected = code;
}
