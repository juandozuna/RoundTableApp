/*
 * Web push service worker (ADR 0009). Shows background notifications through
 * Firebase Cloud Messaging and opens the right screen when one is tapped.
 *
 * Firebase options are not compiled in: deploy a `firebase-config.js` next to
 * this file that assigns `self.FIREBASE_CONFIG = { apiKey, appId,
 * messagingSenderId, projectId }` (see `firebase-config.sample.js`). Without
 * it this worker only handles taps and the app runs without push.
 */

// Keep in step with `supportedFirebaseJsSdkVersion` of firebase_core_web.
const FIREBASE_JS_VERSION = '13.1.0';

// Mirrors HomeRoutes.session in lib/features/home/home_routes.dart. The app
// uses hash URLs (flutter-conventions.md §7), so the route follows `#`.
function routeFor(data) {
  const type = data && data.type;
  const opensSession = type === 'session_reminder' || type === 'stage_opened';
  if (opensSession && data.round_table_id && data.session_id) {
    return `#/mesas/${data.round_table_id}/sesion/${data.session_id}`;
  }
  return '#/';
}

// Registered before Firebase's own handler so that ours decides where to go.
self.addEventListener('notificationclick', (event) => {
  const payload = event.notification && event.notification.data;
  const data = (payload && payload.FCM_MSG && payload.FCM_MSG.data) || payload;
  event.stopImmediatePropagation();
  event.notification.close();
  const target = self.registration.scope + routeFor(data);

  event.waitUntil(
    self.clients
      .matchAll({ type: 'window', includeUncontrolled: true })
      .then((windows) => {
        const existing = windows.find((client) =>
          client.url.startsWith(self.registration.scope),
        );
        if (existing) {
          return existing.navigate(target).then((client) => client && client.focus());
        }
        return self.clients.openWindow(target);
      }),
  );
});

try {
  importScripts('firebase-config.js');
} catch (_) {
  // No Firebase configuration deployed: push is off for this build.
}

if (self.FIREBASE_CONFIG) {
  importScripts(
    `https://www.gstatic.com/firebasejs/${FIREBASE_JS_VERSION}/firebase-app-compat.js`,
    `https://www.gstatic.com/firebasejs/${FIREBASE_JS_VERSION}/firebase-messaging-compat.js`,
  );
  firebase.initializeApp(self.FIREBASE_CONFIG);
  // The `notification` part of every push is displayed by the SDK itself;
  // creating the instance is what registers the background handler.
  firebase.messaging();
}
