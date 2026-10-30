import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/config/app_config.dart';
import 'package:gold_roundtables/core/services/firebase/firebase_bootstrap_impl.dart';

void main() {
  const config = FirebaseConfig(
    apiKey: 'key',
    messagingSenderId: '123',
    projectId: 'project',
    storageBucket: 'project.firebasestorage.app',
    webAppId: '1:123:web:w',
    androidAppId: '1:123:android:a',
    iosAppId: '1:123:ios:i',
    iosBundleId: 'io.goldroundtables.app',
  );

  test('builds web options with the web app id', () {
    final options = firebaseOptionsFor(
      config,
      isWeb: true,
      platform: TargetPlatform.android,
    )!;
    expect(options.appId, '1:123:web:w');
    expect(options.projectId, 'project');
    expect(options.storageBucket, 'project.firebasestorage.app');
    expect(options.iosBundleId, isNull);
  });

  test('builds Android options with the Android app id', () {
    final options = firebaseOptionsFor(
      config,
      isWeb: false,
      platform: TargetPlatform.android,
    )!;
    expect(options.appId, '1:123:android:a');
    expect(options.iosBundleId, isNull);
  });

  test('builds iOS options with the app id and bundle id', () {
    final options = firebaseOptionsFor(
      config,
      isWeb: false,
      platform: TargetPlatform.iOS,
    )!;
    expect(options.appId, '1:123:ios:i');
    expect(options.iosBundleId, 'io.goldroundtables.app');
  });

  test('returns null (push disabled) when the defines are absent', () {
    for (final platform in TargetPlatform.values) {
      expect(
        firebaseOptionsFor(
          const FirebaseConfig(),
          isWeb: false,
          platform: platform,
        ),
        isNull,
      );
    }
    expect(
      firebaseOptionsFor(
        const FirebaseConfig(),
        isWeb: true,
        platform: TargetPlatform.android,
      ),
      isNull,
    );
  });
}
