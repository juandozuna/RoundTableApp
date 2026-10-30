import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/config/app_config.dart';

void main() {
  const shared = FirebaseConfig(
    apiKey: 'key',
    messagingSenderId: '123',
    projectId: 'project',
    webAppId: '1:123:web:w',
    androidAppId: '1:123:android:a',
    iosAppId: '1:123:ios:i',
  );

  test('every platform resolves its own app id', () {
    expect(
      shared.appIdFor(isWeb: true, platform: TargetPlatform.android),
      '1:123:web:w',
    );
    expect(
      shared.appIdFor(isWeb: false, platform: TargetPlatform.android),
      '1:123:android:a',
    );
    expect(
      shared.appIdFor(isWeb: false, platform: TargetPlatform.iOS),
      '1:123:ios:i',
    );
    expect(
      shared.appIdFor(isWeb: false, platform: TargetPlatform.macOS),
      isEmpty,
    );
  });

  test('legacy FIREBASE_APP_ID only serves web', () {
    const legacy = FirebaseConfig(
      apiKey: 'key',
      appId: '1:123:web:legacy',
      messagingSenderId: '123',
      projectId: 'project',
    );
    expect(
      legacy.isCompleteFor(isWeb: true, platform: TargetPlatform.android),
      isTrue,
    );
    expect(
      legacy.appIdFor(isWeb: true, platform: TargetPlatform.android),
      '1:123:web:legacy',
    );
    expect(
      legacy.isCompleteFor(isWeb: false, platform: TargetPlatform.android),
      isFalse,
    );
  });

  test('a platform without its app id is incomplete', () {
    const noIos = FirebaseConfig(
      apiKey: 'key',
      messagingSenderId: '123',
      projectId: 'project',
      androidAppId: '1:123:android:a',
    );
    expect(
      noIos.isCompleteFor(isWeb: false, platform: TargetPlatform.android),
      isTrue,
    );
    expect(
      noIos.isCompleteFor(isWeb: false, platform: TargetPlatform.iOS),
      isFalse,
    );
  });

  test('the default config is incomplete everywhere', () {
    const empty = FirebaseConfig();
    for (final platform in TargetPlatform.values) {
      expect(empty.isCompleteFor(isWeb: false, platform: platform), isFalse);
      expect(empty.isCompleteFor(isWeb: true, platform: platform), isFalse);
    }
  });
}
