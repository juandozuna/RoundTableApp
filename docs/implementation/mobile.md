# Mobile builds (Android / iOS)

Owner of `android/` and `ios/`. Everything here was verified on Flutter 3.41.1 (macOS).

## Prerequisites

```bash
flutter pub get
./tool/codegen.sh        # l10n + build_runner. If it hangs:
                         #   rm -rf .dart_tool/build && flutter gen-l10n && dart run build_runner build
```

## Dart defines

| Define | Local value (Android emulator) | Local value (iOS simulator) |
|---|---|---|
| `SUPABASE_URL` | `http://10.0.2.2:54321` | `http://127.0.0.1:54321` |
| `SUPABASE_ANON_KEY` | `supabase status -o env` → `ANON_KEY` | same |
| `DEV_AUTH` | `true` (local only; tree-shaken when absent) | same |
| `AUTH_METHODS` | comma list of `email`, `google`, `apple`, `facebook`; default `email` (ADR 0018) | same |
| `APP_ENV` | `local` \| `staging` \| `production` | same |

`10.0.2.2` is the emulator's alias for the host machine. A physical device needs the host's LAN IP
instead (and Supabase must listen on it). Dart's `dart:io` HTTP stack is not subject to Android's cleartext policy, so
`http://` works locally; production must still use HTTPS.

## Build / run

```bash
K=$(supabase status -o env | grep ANON_KEY | cut -d'"' -f2)

# Android
flutter run -d emulator-5554 \
  --dart-define=SUPABASE_URL=http://10.0.2.2:54321 --dart-define=SUPABASE_ANON_KEY=$K \
  --dart-define=DEV_AUTH=true --dart-define=APP_ENV=local
flutter build apk --debug   <same defines>

# iOS simulator
flutter run -d <simulator-id> \
  --dart-define=SUPABASE_URL=http://127.0.0.1:54321 --dart-define=SUPABASE_ANON_KEY=$K \
  --dart-define=DEV_AUTH=true --dart-define=APP_ENV=local
flutter build ios --debug --no-codesign   <same defines>
```

Emulators: `flutter emulators --launch Pixel_8`; simulators: `xcrun simctl list devices available`.

## Platform configuration (already in the repo)

| Area | Android | iOS |
|---|---|---|
| Identifier | `applicationId io.goldroundtables.app` | `io.goldroundtables.app` (team `8D3RNM335D`) |
| Minimum OS | `flutter.minSdkVersion` (Flutter default) | 15.0 (Podfile + project) |
| Camera (QR) | `CAMERA` permission, camera `uses-feature` optional | `NSCameraUsageDescription` (Spanish) |
| Notifications | `POST_NOTIFICATIONS` (Android 13+) | `UIBackgroundModes: remote-notification`; `aps-environment` in entitlements |
| Network | `INTERNET` | none needed (Dart HTTP stack) |
| OAuth return | intent filter `io.goldroundtables.app://login-callback` | `CFBundleURLTypes` scheme `io.goldroundtables.app` |
| Sign in with Apple | n/a | `ios/Runner/Runner.entitlements` (`com.apple.developer.applesignin`) |
| Export compliance | n/a | `ITSAppUsesNonExemptEncryption = false` |

Both platforms use the same identifier, `io.goldroundtables.app` (the OAuth redirect scheme is `io.goldroundtables.app://login-callback`). Register this id in the Firebase, Apple and Google consoles; it cannot be changed on Play after the first release.

`Runner.entitlements` is wired only to the **Release** and **Profile** configurations. Debug builds do not use it, so
simulators and personal (free) teams keep working. Release signing needs a paid team with the *Sign in with Apple* and
*Push Notifications* capabilities enabled on the App ID (and `aps-environment` is `production`; use `development` for
local push tests on a device).

## OAuth redirect setup

The app signs in with Supabase Auth (Google, Apple, Facebook); mobile returns through
`io.goldroundtables.app://login-callback`.

- Supabase: add that URL to *Authentication → URL Configuration → Redirect URLs* (already in
  `supabase/config.toml` `additional_redirect_urls` for local).
- **Google**: create Web + Android (package + SHA-1/SHA-256 of the debug and release keys) + iOS OAuth clients; put the
  Web client id/secret in the Supabase Google provider.
- **Apple**: App ID with *Sign in with Apple*, a Services ID for the web flow, and the key (`.p8`) in the Supabase Apple
  provider. Supabase's callback is `https://<project>.supabase.co/auth/v1/callback`.
- **Facebook**: app id/secret in Supabase; register the Supabase callback above as a valid OAuth redirect URI.
- Android release needs the app links to resolve in a browser; the custom scheme needs no `assetlinks.json`.

## Firebase / FCM (optional)

The app starts and works without Firebase: `FirebaseBootstrap` disables push (a logged no-op) when the defines for the
running platform are incomplete.

**Approach: `FirebaseOptions` from `--dart-define`s on every platform** (`AppConfig.firebase`,
`firebaseOptionsFor` in `firebase_bootstrap_impl.dart`). We chose it over `google-services.json` /
`GoogleService-Info.plist` plus the Gradle google-services plugin because CI and local builds need no secret or
git-ignored files, the same mechanism configures web, Android and iOS, and the Gradle/Xcode projects stay untouched
(no plugin to apply, no plist to add to the Runner target). The values identify the Firebase project and are not secret.
Each platform has its own app id; mixing them up makes token registration fail.

Project `roundtable-v1`:

| Define | Value | Used on |
|---|---|---|
| `FIREBASE_API_KEY` | `AIzaSyCa6RIC5Unhh5Gnmf1MKxOkOhMKEcbmCm8` (client key) | all |
| `FIREBASE_MESSAGING_SENDER_ID` | `1050044136194` | all |
| `FIREBASE_PROJECT_ID` | `roundtable-v1` | all |
| `FIREBASE_STORAGE_BUCKET` | `roundtable-v1.firebasestorage.app` (optional) | all |
| `FIREBASE_WEB_APP_ID` | `1:1050044136194:web:39e80c80d6424fe84f201b` | web |
| `FIREBASE_ANDROID_APP_ID` | `1:1050044136194:android:a1c43d284267f7074f201b` | Android |
| `FIREBASE_IOS_APP_ID` | *(copy from Firebase console, see below)* | iOS |
| `FIREBASE_IOS_BUNDLE_ID` | `io.goldroundtables.app` | iOS |
| `FIREBASE_VAPID_KEY` | `BJf0HeickOk5AqhHZLwk786WFUHO-WWyUr0gAjeeZmZLYhUg09FtSVIafzpnIJXshn9H5JAEUPZD2soyZiFPPNk` (public) | web |

`FIREBASE_APP_ID` (the old single define) is still read, as the web app id only; prefer `FIREBASE_WEB_APP_ID`.

**Android** — defines: shared + `FIREBASE_ANDROID_APP_ID`. No `google-services.json`, no Gradle plugin. An existing
local `android/app/google-services.json` is git-ignored and unused. The manifest declares `POST_NOTIFICATIONS`
(Android 13+; requested at runtime by `requestPermission`) and the default FCM channel
`gold_roundtables_default` ("Avisos de la mesa"), created in `MainActivity` and referenced through
`com.google.firebase.messaging.default_notification_channel_id`.

```
flutter build apk --debug \
  --dart-define=FIREBASE_API_KEY=... --dart-define=FIREBASE_MESSAGING_SENDER_ID=1050044136194 \
  --dart-define=FIREBASE_PROJECT_ID=roundtable-v1 --dart-define=FIREBASE_ANDROID_APP_ID=1:1050044136194:android:a1c43d284267f7074f201b
```

**iOS** — defines: shared + `FIREBASE_IOS_APP_ID` + `FIREBASE_IOS_BUNDLE_ID`. The Runner already has
`UIBackgroundModes: remote-notification` and the `aps-environment` entitlement (Release/Profile only; debug builds
are unsigned for push). Needs a real device and a paid Apple Developer team with the *Push Notifications* capability
on the App ID. `FirebaseAppDelegateProxy` stays enabled (default) so APNs tokens reach FCM.

**Web** — defines: shared + `FIREBASE_WEB_APP_ID` + `FIREBASE_VAPID_KEY`. The service worker
`web/firebase-messaging-sw.js` cannot read dart-defines, so run `scripts/generate-firebase-sw.sh` with the same
`FIREBASE_*` environment *before* `flutter build web`; it writes the git-ignored `web/firebase-config.js`, which
Flutter copies into `build/web`. (Or pass `build/web` as its argument after the build.) With incomplete variables
it removes any stale file and the worker only handles notification taps. The web build script must call it, e.g.
`scripts/generate-firebase-sw.sh && flutter build web --dart-define=...`.

**Remaining user actions**

1. **iOS app id**: Firebase console → Project settings → *Your apps* → iOS app → copy the App ID
   (`1:1050044136194:ios:...`) and set `FIREBASE_IOS_APP_ID` for iOS builds.
2. **APNs key**: Apple Developer → Keys → create a key with *Apple Push Notifications service (APNs)*; download the
   `.p8`; Firebase console → Project settings → *Cloud Messaging* → *Apple app configuration* → upload it with the Key
   ID and Team ID (`8D3RNM335D`). Without it iOS (and iOS FCM tokens) cannot deliver.
3. **Server credentials**: Firebase console → Project settings → *Service accounts* → *Generate new private key*;
   put the JSON on one line in the `FCM_SERVICE_ACCOUNT_JSON` secret of the `notifications` Edge Function (see
   `.env.example` / `supabase/functions`).
4. Provide the `FIREBASE_*` values to the build/deploy environments for each platform (CI secrets or variables).

## Release checklist

**Android / Play**
1. Generate an upload keystore: `keytool -genkeypair -v -keystore ~/gold-upload.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload`.
2. Create `android/key.properties` (git-ignored) with `storeFile` (path relative to `android/`), `storePassword`,
   `keyAlias`, `keyPassword`. `build.gradle.kts` uses it for `release`; without it release falls back to the debug key.
3. `flutter build appbundle --release` with production defines (HTTPS `SUPABASE_URL`,
   `APP_ENV=production`, **no** `DEV_AUTH`). Bump `version:` in `pubspec.yaml` (`name+build`).
4. Play Console: enrol in Play App Signing, upload the AAB to Internal testing first, complete Data safety + the
   camera/notification declarations, register release SHA-1/SHA-256 with Google OAuth and Firebase.

**iOS / TestFlight**
1. Apple Developer team on the Runner target (currently `8D3RNM335D`); App ID with Sign in with Apple + Push
   Notifications; confirm the bundle id is the one registered in App Store Connect.
2. Create the app record in App Store Connect; privacy nutrition labels (identifiers, contact info, usage data).
3. `flutter build ipa --release <production defines>` (or Xcode *Product → Archive*), then upload with Transporter /
   `xcrun altool`; add testers in TestFlight.
4. Verify on a device: Apple/Google/Facebook sign-in returns to the app, QR scan prompts for camera, push token
   registers.

## Verified results

| Check | Result |
|---|---|
| `./tool/codegen.sh` | OK (1947 outputs) |
| `flutter build apk --debug` | OK |
| `flutter build apk --release` (debug-key fallback) | OK, 88.9 MB |
| `flutter build ios --debug --no-codesign` | OK |
| `flutter build ios --release --no-codesign` (entitlements wired) | OK |
| Android emulator (Pixel_8) against local stack | starts; dev sign-in as *Administrador* works; settings show the connection state (online) |
| iOS simulator (iPhone 15, iOS 17.2) against local stack | starts with no GetIt errors and renders the sign-in page |

Screenshots: `screenshots/mobile-android-sign-in.png`, `screenshots/mobile-android-dev-admin.png`,
`screenshots/mobile-ios-sign-in.png`.

## Known limitations

- iOS dev sign-in was not exercised interactively (no UI-automation tooling such as `idb` available here); only launch
  and sign-in page rendering were confirmed on the simulator.
- Social OAuth (Google/Apple/Facebook), FCM delivery, Apple capabilities and store signing need real provider
  credentials/accounts and were **not** tested.
- Camera/QR scanning was not exercised (no camera feed on the emulator/simulator).
- Android/iOS application ids differ in spelling (see above).
