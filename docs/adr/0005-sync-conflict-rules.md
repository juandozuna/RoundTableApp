# 0005 — Late sync, attendance and offline-window rules

## Decisions
- **Late sync:** answers captured on the device before the session close (device timestamp plus
  sync metadata) are accepted even if they arrive after the facilitator closed the session online.
  They are flagged `synced_late` so KPIs can report them transparently.
- **Attendance:** the facilitator marks attendance. Any member who submits answers for a session
  is set to present when the data syncs; a submission wins over "absent".
- **Offline window:** a device must keep working for up to 7 days without syncing, which covers one
  weekly cycle (last week's commitment is needed for the follow-up). This sets the local data
  window and the offline auth/token policy.
- **Score rule:** integer 1–10, 5 not allowed (PC-08); enforced in the UI, in the Edge Function and
  as a database CHECK.
- **Follow-up:** exactly once, in the next session (PC-09).

## Consequences
- Every session-domain row carries `device_created_at`, `client_id` (UUID) and server
  `received_at`.
- Upload processing is idempotent by UUID.
