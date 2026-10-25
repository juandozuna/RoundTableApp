# 0009 — Firebase Cloud Messaging for notifications

## Decision
FCM is the push transport on Android, iOS and web; Edge Functions and pg_cron send messages.
v1 notification types:
1. Session reminder before each scheduled session (P-53).
2. Mid-week reminder of the member's commitment.
3. Unsynced-data alert: a local notification when a device has held unsynced session data for
   more than 24 hours.
4. Stage opened (online only): when the facilitator opens a stage, members' phones are notified.

## Consequences
- Device tokens are stored per user and device and removed on sign-out.
- Firebase is used only for messaging; identity stays in Supabase Auth.
- Notification transport stays out of presentation and domain (AGENTS.md rule 17).
