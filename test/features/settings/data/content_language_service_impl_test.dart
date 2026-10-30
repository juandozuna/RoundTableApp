import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/data/data_change_signal.dart';
import 'package:gold_roundtables/core/data/data_scope.dart';
import 'package:gold_roundtables/core/data/records/records.dart';
import 'package:gold_roundtables/core/data/remote_watch.dart';
import 'package:gold_roundtables/core/network/postgrest/postgrest.dart';
import 'package:gold_roundtables/core/services/app_lifecycle/app_lifecycle_service.dart';
import 'package:gold_roundtables/core/services/device_language/device_language.dart';
import 'package:gold_roundtables/features/settings/data/datasources/content_language_local_data_source.dart';
import 'package:gold_roundtables/features/settings/data/datasources/content_language_remote_data_source.dart';
import 'package:gold_roundtables/features/settings/data/services/content_language_service_impl.dart';
import 'package:gold_roundtables/features/settings/domain/models/content_language.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';

class _MockReads extends Mock implements TableReadsClient {}

class _Foreground implements AppLifecycleService {
  @override
  bool get isForeground => true;

  @override
  Stream<bool> watchForeground() => const Stream.empty();
}

ContentLocaleRecord _locale(String code, String name, {bool base = false}) =>
    ContentLocaleRecord(
      id: 'id-$code',
      code: code,
      name: name,
      isDefault: base,
      status: 'active',
    );

void main() {
  late _MockReads reads;
  late ContentLanguageLocalDataSource local;
  late ContentLanguageServiceImpl service;

  setUp(() {
    SharedPreferencesAsyncPlatform.instance =
        InMemorySharedPreferencesAsync.empty();
    reads = _MockReads();
    when(() => reads.contentLocales(any())).thenAnswer(
      (_) async => [
        _locale('es', 'Español', base: true),
        _locale('en', 'English'),
      ],
    );
    local = ContentLanguageLocalDataSource(
      SharedPreferencesAsync(),
      const _DeviceLanguage('es'),
    );
    service = ContentLanguageServiceImpl(
      ContentLanguageRemoteDataSource(reads),
      local,
      RemoteWatch(DataChangeSignal(), _Foreground()),
      DataChangeSignal(),
    );
  });

  test('asks the server for active languages, Spanish first', () async {
    await service.watch().first;

    final query =
        verify(() => reads.contentLocales(captureAny())).captured.single
            as Map<String, dynamic>;
    expect(query[PostgrestColumns.status], 'eq.active');
    expect(query[PostgrestParams.order], 'is_default.desc,code.asc');
  });

  test('shows Spanish when nothing was chosen', () async {
    final choice = await service.watch().first;

    expect(choice.selected, ContentLanguageChoice.baseCode);
    expect(choice.available.map((l) => l.code), ['es', 'en']);
    expect(choice.available.first.isBase, isTrue);
    expect(choice.canChoose, isTrue);
  });

  test('a stored language the curriculum does not offer falls back', () async {
    await local.saveSelected('fr');

    expect((await service.watch().first).selected, 'es');
  });

  test('selecting a language is kept on the device and re-emitted', () async {
    final signal = DataChangeSignal();
    service = ContentLanguageServiceImpl(
      ContentLanguageRemoteDataSource(reads),
      local,
      RemoteWatch(signal, _Foreground()),
      signal,
    );
    final choices = <String>[];
    final subscription = service.watch().listen(
      (choice) => choices.add(choice.selected),
    );
    await pumpEventQueue();

    await service.select('en');
    await pumpEventQueue();

    expect(choices, ['es', 'en']);
    expect(await local.readSelected(), 'en');
    await subscription.cancel();
  });

  test('a failed list keeps the stored choice, with no languages', () async {
    await local.saveSelected('en');
    when(() => reads.contentLocales(any())).thenThrow(StateError('offline'));

    final choice = await service.watch().first;

    expect(choice.selected, 'en');
    expect(choice.available, isEmpty);
    expect(choice.canChoose, isFalse);
  });

  test('a failed refresh keeps the languages loaded earlier', () async {
    final signal = DataChangeSignal();
    service = ContentLanguageServiceImpl(
      ContentLanguageRemoteDataSource(reads),
      local,
      RemoteWatch(signal, _Foreground()),
      signal,
    );
    final choices = <ContentLanguageChoice>[];
    final subscription = service.watch().listen(choices.add);
    await pumpEventQueue();
    await local.saveSelected('en');
    when(() => reads.contentLocales(any())).thenThrow(StateError('offline'));

    signal.notify(DataScope.contentLanguage);
    await pumpEventQueue();

    expect(choices.last.selected, 'en');
    expect(choices.last.available.map((l) => l.code), ['es', 'en']);
    await subscription.cancel();
  });
}

class _DeviceLanguage implements DeviceLanguage {
  const _DeviceLanguage(this.code);

  @override
  final String code;
}
