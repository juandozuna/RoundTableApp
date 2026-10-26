# Live session feature (`lib/features/session`)

How the offline-first live session is put together, how to run it locally, and what is still
unverified. Architecture rules: [AGENTS.md](../../AGENTS.md). Prototype:
[session-flow-b-mesa-en-vivo.html](../design/prototypes/session-flow-b-mesa-en-vivo.html).

## Shape

```
Widget → Cubit → Use case → Service contract → Service impl → SessionLocalDataSource (Drift over PowerSync)
                                                            → SessionRemoteDataSource (Retrofit → Edge Functions)
```

- **Schema.** `SessionSyncSchema` (data/local) declares every table the sync rules replicate
  (`curriculum_*`, `value_questions`, `organizations`, `locations`, `people`, `role_assignments`,
  `round_tables`, `table_members`, `sessions`, `session_attendance`, `member_*`). Other features must
  read these through their own Drift view and never redeclare them (duplicate names throw).
  `data/local/tables/session_tables.dart` holds the Drift views; a test compares them with the schema.
- **Reads.** `LiveSessionService.watch` re-assembles a `LiveSession` (domain) from local rows whenever
  a session table or PowerSync's upload queue changes. Per-row sync state comes from `ps_crud`
  (pending / syncing while a batch uploads / synced / `synced_late` from the server flag).
  "Which session" is `TodaySessionSelector` (open one, next one inside its 12 h window, or the one
  that just closed as the summary).
- **Writes.** UUIDs on the device, `device_created_at` on insert, `device_modified_at` on edit, one
  Drift transaction per step, natural keys edited instead of duplicated (attendance, answers,
  commitment, assessments). Facilitator controls go through the `sessions` function when online and
  fall back to the same change saved locally (PATCH on `sessions`) when offline or unreachable.
- **Upload.** `SessionSyncUploader` posts batches (≤ 500 ops) to `sync-upload`. Per-operation
  rejections and 4xx become `SyncUploadRejected`; the PowerSync connector records them in the
  local-only `sync_upload_rejections` table (core) and completes the transaction, so the server copy
  syncs back and the person sees why (`LiveSession.rejectedMessages`). Network, 401 and 5xx are
  retried.
- **Flow rules.** `MemberFlow` (domain, pure) decides the screen: live = the synced stage drives it;
  self-paced when offline; the facilitator is always stage-driven for their own answers (ADR 0014).
- **Cubits.** `SessionCubit` (watch + connectivity + sync + facilitator controls, optimistic override
  until the synced row catches up), `MemberFlowCubit` (drafts and saving), `FacilitatorBoardCubit`
  (tab, viewed stage, attendance).

## Routes

`/sesion` (user's active table) and `/mesas/:tableId/sesion`, full-screen, plus a "Sesión" shell
destination for facilitators and members. The home feature should link to
`SessionRoutes.liveFor(tableId)`.

## Drafts

What a person typed and did not send (follow-up note and score, reflection answers and score,
commitment) is kept on the device by `SessionDraftService` (shared preferences, one entry per session
and person) and restored when the screen opens again. `MemberFlowCubit` writes it 600 ms after the
last keystroke and leaves out the steps that were already saved. Text controls are the shared
`AppTextFormField` (which also shows the Cubit-driven validation error).

## Sync configuration

Replication and uploads are always PowerSync's. Without `POWERSYNC_URL` the build has no sync
service: `SyncConnection.unavailable` is reported, the home screen shows "sync not configured" and
the live session runs self-paced from whatever is on the device (nothing replicates or uploads).
There is no development stand-in. Run the stack with `bash scripts/dev-up.sh` (README).

## Verified

- Unit/widget/real-database tests in `test/features/session`.
- Browser end-to-end (`tool/e2e`, scenarios `live-session` and `offline`) with the real PowerSync
  service: stages follow live between two browsers, rows upload and replicate, offline capture is
  flagged "Sincronizado tarde" after the close, and a download never overwrites rows still waiting to
  upload.
- Against the local stack (seeded users): open/stage/close-answers/close through the Edge Function,
  `sync-upload` batches from the Flutter uploader (accepted, idempotent re-send, `duplicate_follow_up`,
  `score_five_not_allowed`), auto-attendance, offline capture then "Sincronizado tarde" after the
  facilitator closed, driven in headless Chrome against the web build.

## Not verified

- Android/iOS builds, push (`stage_opened`) delivery, the local ">24 h unsynced" notification.
