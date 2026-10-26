# API contract — Gold Roundtables backend

Authoritative contract between the Supabase backend (`supabase/`, `powersync/`) and the Flutter
client. If code and this document disagree, the SQL in `supabase/migrations/` wins and this file
is the bug — report it.

- [1. Environments, keys and dev users](#1-environments-keys-and-dev-users)
- [2. Auth, headers and errors](#2-auth-headers-and-errors)
- [3. Data model and domain rules](#3-data-model-and-domain-rules)
- [4. Offline sync (PowerSync)](#4-offline-sync-powersync)
- [5. Edge Functions](#5-edge-functions)
- [6. PostgREST reads (RLS) and RPCs](#6-postgrest-reads-rls-and-rpcs)
- [7. KPIs](#7-kpis)
- [8. Notifications](#8-notifications)
- [9. Deviations from the suggested model](#9-deviations-from-the-suggested-model)
- [10. Running and verifying locally](#10-running-and-verifying-locally)
- [Appendix A. Table reference](#appendix-a-table-reference)

Access paths (ADR 0008):

| Concern | Path |
|---|---|
| Sign-in / sign-out / refresh | `supabase_flutter` Auth only |
| Offline session reads | PowerSync → Drift (no HTTP) |
| Offline session writes | PowerSync `uploadData` → Retrofit → `POST /functions/v1/sync-upload` |
| Online facilitator controls | Retrofit → `/functions/v1/sessions/...` (offline: same change via sync-upload) |
| Admin writes, invites, reveal, device tokens | Retrofit → Edge Functions |
| Online reads (admin lists, KPIs, audit) | Retrofit → PostgREST `/rest/v1/<table or view>` and `/rest/v1/rpc/<fn>` under RLS |

---

## 1. Environments, keys and dev users

Local stack (`supabase start`, project id `gold-roundtables`):

| Service | URL |
|---|---|
| API gateway (`SUPABASE_URL`) | `http://127.0.0.1:54321` |
| Edge Functions | `http://127.0.0.1:54321/functions/v1/<name>` |
| PostgREST | `http://127.0.0.1:54321/rest/v1` |
| Auth JWKS (ES256) | `http://127.0.0.1:54321/auth/v1/.well-known/jwks.json` |
| Postgres | `postgresql://postgres:postgres@127.0.0.1:54322/postgres` |
| Studio | `http://127.0.0.1:54323` |
| PowerSync (Docker phase) | `http://127.0.0.1:8080` |

Keys: `supabase status -o env` prints `ANON_KEY` (legacy JWT, use as `SUPABASE_ANON_KEY` and
`apikey` header) and `SERVICE_ROLE_KEY` (server only — never in the app). The local defaults are
public CLI demo keys; production keys come from the environment.

Flutter `--dart-define`s (PLAN.md): `SUPABASE_URL`, `SUPABASE_ANON_KEY`, `POWERSYNC_URL`,
`DEV_AUTH`, `APP_ENV`.

Edge Function environment ([`supabase/functions/.env.example`](../../supabase/functions/.env.example)):

| Variable | Purpose |
|---|---|
| `SUPABASE_URL`, `SUPABASE_SERVICE_ROLE_KEY` | injected by the platform/CLI |
| `APP_PUBLIC_URL` | base of invite links: `<APP_PUBLIC_URL>/invite/<CODE>` (default `http://127.0.0.1:3000`) |
| `ALLOWED_ORIGINS` | CORS origins, comma separated (default `*`) |
| `CRON_SECRET` | `x-cron-secret` for `/notifications/dispatch` and `/notifications/cron/*` |
| `FCM_SERVICE_ACCOUNT_JSON` | Firebase service account (one line). Empty → no-op sender with a logged warning |

Auth providers (`supabase/config.toml`, disabled until credentials exist):
`SUPABASE_AUTH_EXTERNAL_GOOGLE_CLIENT_ID/SECRET`, `SUPABASE_AUTH_EXTERNAL_APPLE_CLIENT_ID/SECRET`,
`SUPABASE_AUTH_EXTERNAL_FACEBOOK_CLIENT_ID/SECRET`. Redirect URLs allowed:
`http://127.0.0.1:3000`, `http://localhost:3000`, `io.goldroundtables.app://login-callback`.

### Dev users (seed, password `dev-password-123`, email+password sign-in only when `DEV_AUTH=true`)

| Email | Who | Contexts |
|---|---|---|
| `admin@dev.local` | Marisol Peña, church staff | Administrador · Plataforma |
| `coord@dev.local` | Julia Ferrer | Coordinador · Fundación Luz; Miembro · Mesa Fe 01 |
| `facil@dev.local` | Sofía Herrera | Facilitador · Mesa Esperanza 03 (also a participant, ADR 0014) |
| `ana@dev.local` | Ana Lucía Méndez | Miembro · Mesa Esperanza 03 |
| `luis@dev.local` | Luis Ferrer | Miembro · Mesa Esperanza 03 |
| `marta@dev.local` | Marta Quiroz | Miembro · Mesa Esperanza 03 |
| `coord.horizonte@seed.local`, `coord.andina@seed.local` | coordinators of the other orgs | for cross-tenant testing |

Every other seeded person also has an account `<first>.<last>.<n>@seed.local` (same password).

Seed content: 5 modules / 48 values (placeholder names; Módulo 1 · Valor 3 Honestidad, Valor 4
Responsabilidad), 2–3 questions per value; 3 organizations (Fundación Luz · República Dominicana,
Colegio Horizonte · Colombia, Empresa Andina · Colombia), 6 locations, 17 tables in every health
state, ~115 closed sessions with attendance/answers/scores/commitments and late-synced rows.
**Mesa Esperanza 03** (`LUZ-03`) has 3 closed sessions (values 1–3) and a pending session for
**today, one hour after `db reset`** (value 4 Responsabilidad, follow-up of value 3 Honestidad),
8/9 seats used (Rodrigo Paz's invite pending, Isabela Núñez's expired).

Seeded invite codes: `MESA34` pending member (Esperanza 03) · `VENC22` expired · `REVK23` revoked ·
`ACEP24` accepted (ana) · `CRDN26` pending coordinator (Fundación Luz) · `FACL27` pending facilitator
(Mesa Nueva 07).

Seed ids are deterministic: `md5('gold-roundtables:' || label)::uuid`, e.g. `table:luz-03`,
`session:luz-03:4`, `person:ana`, `user:ana`, `org:luz`, `value:4`, `question:4:por_que`.

---

## 2. Auth, headers and errors

Every request: `apikey: <anon key>` and, for signed-in calls, `Authorization: Bearer <access token>`
(Supabase session access token, any provider). On `401` refresh once through `AuthService` and
retry (ADR 0008). Edge Functions verify the token themselves (`auth.getUser`); gateway JWT
verification is off so CORS preflights and the anonymous invite preview work.

JWT claims used: `sub` (= `auth.users.id`, the identity), `role` (`authenticated`). No custom
claims: roles and scopes are looked up per request from `role_assignments` and `table_members`, so
a role change applies immediately. Local user tokens are **ES256** (JWKS above), `aud`
`authenticated`, `exp` 1 hour.

Identity model: a sign-in (auth user) binds to **one person per organization** (`people.auth_user_id`).
`GET /functions/v1/admin/me` or `POST /rest/v1/rpc/my_contexts` lists the contexts for the context
switcher.

### Error envelope (Edge Functions)

```json
{ "error": { "code": "table_full", "message": "La mesa ya tiene 9 personas (incluido el facilitador). No se puede agregar otra.", "fields": { "person.phone": "Teléfono no válido…" } } }
```

`code` is stable English; `message` is Spanish and safe to show; `fields` appears on
`validation_failed` (keys are dotted JSON paths). PostgREST errors (KPI RPCs) use PostgREST's shape
`{ "code": "P0001", "message": "<code>", "details": "<Spanish>" }` — read `message` as the code.

| HTTP | Codes |
|---|---|
| 400 | `invalid_json` |
| 401 | `unauthenticated` |
| 403 | `forbidden`, `not_table_participant` |
| 404 | `not_found`, `route_not_found`, `session_not_found`, `invite_not_found` |
| 405 | `method_not_allowed` |
| 409 | `table_full`, `table_has_facilitator`, `table_not_active`, `already_member`, `membership_inactive`, `cannot_move_facilitator`, `cannot_remove_facilitator`, `person_inactive`, `person_already_linked`, `duplicate_id`, `duplicate_assessment`, `duplicate_follow_up`, `duplicate_answer`, `duplicate_commitment`, `duplicate_attendance`, `duplicate_table_code`, `duplicate_organization`, `duplicate_location`, `duplicate_token`, `conflict`, `session_closed`, `session_cancelled`, `session_finalized`, `session_pending_exists`, `invalid_session_transition`, `follow_up_already_recorded`, `value_change_blocked`, `organization_inactive`, `last_platform_admin`, `invite_already_used`, `invite_pending_exists`, `person_linked_elsewhere`, `identity_linked_elsewhere`, `no_person`, `operation_not_allowed` |
| 410 | `invite_expired`, `invite_revoked` |
| 422 | `validation_failed`, `invalid_reference`, `immutable_field`, `invalid_timezone`, `unsupported_table`, `score_out_of_range`, `score_five_not_allowed`, `question_mismatch`, `follow_up_not_available`, `follow_up_session_mismatch`, `facilitator_required` |
| 429 | `rate_limited` (anonymous invite preview; `Retry-After` header and `retry_after_seconds`) |
| 500 | `internal_error` |

The full list with default Spanish messages lives in
[`supabase/functions/_shared/errors.ts`](../../supabase/functions/_shared/errors.ts).

---

## 3. Data model and domain rules

All ids are UUIDs (devices generate them for session-domain rows; PowerSync carries them as
`TEXT`). Timestamps are UTC `timestamptz` (ISO-8601 strings on the wire). Nothing is hard-deleted:
statuses, `left_at`, `revoked_at` and `archived_at` keep history. Every tenant table has
`organization_id`; child rows reference parents with composite `(id, organization_id)` foreign keys,
so a row can never point into another organization.

### Enums

| Enum | Values |
|---|---|
| `organization_status` | active, paused, inactive |
| `person_status` | invited, active, inactive |
| `record_status` | active, inactive |
| `role_kind` | platform_admin, coordinator |
| `round_table_status` | active, paused, completed, closed |
| `table_member_role` | facilitator, member |
| `session_status` | scheduled, open, closed, cancelled |
| `session_stage` | lobby, attendance, follow_up, value, commitment, closed |
| `attendance_status` | present, absent, late, excused |
| `attendance_source` | facilitator, auto_submission |
| `assessment_kind` | initial, follow_up |
| `commitment_follow_up_status` | kept, partial, not_kept |
| `invite_role_kind` | coordinator, facilitator, member |
| `invite_status` | pending, accepted, expired, revoked |
| `device_platform` | android, ios, web |
| `notification_kind` | session_reminder, commitment_nudge, stage_opened |
| `notification_status` | pending, sent, skipped, failed |

`organizations.kind`: foundation | school | company | church | community | other.

### Tables (column details in [Appendix A](#appendix-a-table-reference))

Synced to devices (PowerSync, filtered per user — §4): `curriculum_modules`, `curriculum_values`,
`value_questions`, `organizations`, `locations`, `people`, `role_assignments`, `round_tables`,
`table_members`, `sessions`, `session_attendance`, `member_assessments`, `member_answers`,
`member_commitments`.

Online only: `invites`, `audit_events`, `device_tokens`, `notification_outbox` (service only), KPI
rollups (private `kpi` schema, read via RPCs).

### Roles and scopes (ADR 0006)

| Role | Stored in | Scope |
|---|---|---|
| Platform admin | `role_assignments(role='platform_admin', organization_id NULL)` on a staff person (`people.organization_id NULL`) | everything |
| Coordinator | `role_assignments(role='coordinator', organization_id)` | the **whole organization**. `location_id` is informational in v1: it is stored (and must belong to the same organization, else `validation_failed`) but does **not** narrow RLS, sync rules, KPIs or admin functions; enforcing it would touch every policy and PowerSync bucket and is deferred |
| Facilitator | `table_members(role='facilitator', status='active')` | the table |
| Member | `table_members(role='member', status='active')` | the table; own answers only |

### Business rules (enforced in Postgres; Edge Functions repeat the cheap checks)

- **Score**: integer 1–10, **5 is rejected** (`score_five_not_allowed`), others outside 1–10 →
  `score_out_of_range`.
- **Seats**: at most **9 active `table_members` per table including the facilitator** (`table_full`).
  Pending invites hold a seat (inviting creates the active `table_members` row). Seat counts shown to
  users (`admin_tables.active_people/seats_free`, `kpi_tables.active_people/seats_free`) are counted
  live from `table_members`, never from the KPI rollups. Minimum 3 is a health signal, not enforced.
- **One active facilitator per table**; one active membership per person per table. Changing
  facilitator or moving members ends the old row (`left_at`, `left_reason`) and creates a new one.
- **Sessions are created by the server**: every active table always has exactly one pending session
  (`scheduled` or `open`) at the next weekly slot (`weekday` ISO 1=Monday, `start_time`, IANA
  `timezone`). Devices get its id before the meeting, so members can capture offline. Clients never
  create sessions.
- **Program progression**: `round_tables.current_value_id` is the value of the pending session.
  Closing a session advances the table to the next value (global `sequence` 1..48) and schedules the
  next session, whose `follow_up_value_id` is the value just closed. A cancelled session does not
  advance the value. After value 48 the table becomes `completed`.
- **Session state machine**: `scheduled → open` (any stage lobby…commitment) → stages move freely in
  either direction while open → `closed` (stage `closed`, terminal). `scheduled → closed` is allowed
  (offline facilitator's open+close arriving together). `scheduled → cancelled` only before opening.
  `closed`/`cancelled` are final (`session_finalized`). Status `closed` ⇔ stage `closed`.
- **Follow-up exactly once, in the next session**: one `initial` and one `follow_up` assessment per
  (session, person). An `initial` scores the session's `value_id`; a `follow_up` scores the session's
  `follow_up_value_id` (the server sets `value_id`). The first session of a table has no follow-up
  (`follow_up_not_available`). A second follow-up → `duplicate_follow_up`.
- **Commitment follow-up**: in the next session the person PATCHes their previous commitment row with
  `follow_up_session_id` (= the next session), `follow_up_status`, `follow_up_note`,
  `follow_up_device_at`. It can be edited in that session, never moved to another
  (`follow_up_already_recorded`).
- **Answers**: `question_id` must belong to the session's value (`question_mismatch`).
- **Participation**: a person may write only for sessions of a table they belonged to at that time
  (`not_table_participant`).
- **Late sync (ADR 0005)**: rows captured on the device before the session's `ended_at` (+15 min clock
  grace) are accepted even after the close and flagged `synced_late = true`; captured later →
  `session_closed`. When a close arrives after other uploads, rows the server received after the
  close time are flagged too. Device timestamps in the future are clamped to server time.
- **Auto-attendance**: any submission (score, answer, commitment, commitment follow-up) marks the
  person `present` with `source = auto_submission`; a submission wins over `absent`/`excused`, even if
  the facilitator re-marks absent later.
- **Invites**: 6-character codes from `ABCDEFGHJKLMNPQRSTUVWXYZ23456789` (no 0/O/1/I), globally unique,
  case-insensitive; default expiry 14 days (1–60).

Server-owned columns (ignored if a client sends them): `organization_id`, `round_table_id`,
`value_id`, `received_at`, `synced_late`, `follow_up_received_at`, `follow_up_synced_late`,
`archived_at`, `created_at`, `updated_at`, `source`, `recorded_by_person_id`, `facilitator_person_id`,
`scheduled_at`, `follow_up_value_id`.

---

## 4. Offline sync (PowerSync)

Rules: [`powersync/sync-rules.yaml`](../../powersync/sync-rules.yaml) — Sync Streams (edition 3),
all `auto_subscribe`. Requires PowerSync Service ≥ 1.20 and Flutter `powersync` ≥ 1.16. Details and
service wiring: [`powersync/README.md`](../../powersync/README.md).

| Stream | Rows on the device |
|---|---|
| `curriculum` | all modules, values, questions |
| `my_identity` | own `people` rows, own `table_members` rows (history) |
| `my_rows` | own `role_assignments`, assessments, answers, commitments, attendance |
| `table_shared` | for each active table of the user: `round_tables`, roster `table_members` (names only), `sessions`, `session_attendance`, its `organizations` row and `locations` |
| `table_facilitator` | for each table the user facilitates: everyone's assessments, answers, commitments |

Column subsets on the device: `people(id, organization_id, first_name, last_name, position, email,
phone, status)`; `table_members(id, organization_id, round_table_id, person_id, role, joined_at,
left_at, left_reason, status, first_name, last_name)`; `round_tables(id, organization_id,
location_id, name, code, weekday, start_time, timezone, duration_minutes, status,
current_value_id)`; `organizations(id, name, kind, country_code, country_name, region, status)`;
`locations(id, organization_id, name, city, region, status)`; `role_assignments(id, person_id, role,
organization_id, location_id, status)`; curriculum tables without timestamps; session-domain tables
with all columns. Booleans arrive as `INTEGER` 0/1.

Window: rows of sessions closed more than 8 weeks ago leave the device (`archived_at`), except each
table's latest closed session.

Useful local queries for the app:
- pending session of a table: `sessions WHERE round_table_id = ? AND status IN ('scheduled','open')`;
- previous commitment for the follow-up: own `member_commitments WHERE round_table_id = ? AND
  value_id = <pending session>.follow_up_value_id`;
- "no tienes compromiso previo": no such row (person was absent last week).

### sync-upload

`POST /functions/v1/sync-upload` — the PowerSync `uploadData` target.

Request (max 500 ops; PowerSync `CrudEntry` JSON is accepted as is):

```json
{
  "batch": [
    { "op": "PUT",   "type": "member_assessments", "id": "<uuid>",
      "opData": { "session_id": "<uuid>", "person_id": "<uuid>", "kind": "initial", "score": 7,
                  "justification": "…", "device_created_at": "2026-10-26T00:10:00Z" } },
    { "op": "PATCH", "type": "member_answers", "id": "<uuid>",
      "opData": { "answer_text": "…", "device_modified_at": "2026-10-26T00:12:00Z" } }
  ]
}
```

(`table` may be used instead of `type`, `data` instead of `opData`; `operations`/`crud` instead of
`batch`.)

Response `200` (always, unless the whole request is invalid/unauthenticated):

```json
{ "applied": 1, "rejected": 1,
  "results": [
    { "id": "…", "table": "member_assessments", "op": "PUT", "status": "applied" },
    { "id": "…", "table": "member_answers", "op": "PATCH", "status": "rejected",
      "code": "session_closed", "message": "La sesión ya se cerró; no se pueden registrar respuestas nuevas." }
  ] }
```

Results are in request order. Each op is applied independently (own subtransaction) and
idempotently by `id` (re-sending a PUT updates the same row).

Allowed operations:

| Table | Ops | Who | Writable fields |
|---|---|---|---|
| `sessions` | PATCH | active facilitator of the table | `status`, `stage`, `started_at`, `ended_at`, `answers_closed_at`, `cancelled_reason`, `device_modified_at` |
| `session_attendance` | PUT, PATCH | active facilitator of the table | `session_id`, `person_id`, `status`, `device_created_at`, `device_modified_at` |
| `member_assessments` | PUT, PATCH | the person themself | `session_id`, `person_id`, `kind`, `score`, `justification`, `device_*` |
| `member_answers` | PUT, PATCH | the person themself | `session_id`, `person_id`, `question_id`, `answer_text`, `device_*` |
| `member_commitments` | PUT, PATCH | the person themself | `session_id`, `person_id`, `action_text`, `measure_text`, `follow_up_session_id`, `follow_up_status`, `follow_up_note`, `follow_up_device_at`, `device_*` |

Anything else → `unsupported_table`; DELETE → `operation_not_allowed`.

Client rules:
1. Generate the UUID on the device; write locally in a transaction; set `device_created_at` on insert
   and `device_modified_at` on every update (the late-sync rule uses them; a PATCH without
   `device_modified_at` is judged at server time).
2. Do not delete session rows; edit them. Never invent a session row.
3. Attendance and answers/commitments merge on their natural key: a PUT with a new id for an existing
   (session, person[, question]) updates the existing server row (the local duplicate disappears on
   the next sync). Assessments do **not** merge: a second row is `duplicate_assessment` /
   `duplicate_follow_up`.
4. Rejected ops are permanent: call `transaction.complete()` anyway; the server copy syncs down and
   replaces the local row. Surface the Spanish `message` where it helps (e.g. "Sincronizado tarde",
   "La sesión ya se cerró"). Retry only on network errors, 401 (after refresh) and 5xx.
5. Pending state comes from PowerSync's upload queue / sync status, never from a column.
6. `synced_late` on the synced-down row drives the "Sincronizado tarde" pill; the same rule is
   available client-side in [`_shared/late_sync.ts`](../../supabase/functions/_shared/late_sync.ts).

---

## 5. Edge Functions

Base: `{SUPABASE_URL}/functions/v1`. JSON in, JSON out. All routes need a user token except
`GET /invites/preview` (anonymous) and the cron routes (`x-cron-secret`). Every write is audited in
`audit_events` (§6).

### sessions (facilitator, online)

| Method & path | Body | Notes |
|---|---|---|
| `POST /sessions/{session_id}/open` | `{ "stage"?: "lobby"\|"attendance", "started_at"?: ISO }` | status → open |
| `POST /sessions/{session_id}/stage` | `{ "stage": "lobby"\|"attendance"\|"follow_up"\|"value"\|"commitment" }` | members get a `stage_opened` push for attendance/follow_up/value/commitment |
| `POST /sessions/{session_id}/close-answers` | `{ "answers_closed_at"?: ISO }` | "Cerrar respuestas" marker |
| `POST /sessions/{session_id}/close` | `{ "ended_at"?: ISO }` | terminal; advances the program, schedules the next session |
| `POST /sessions/{session_id}/cancel` | `{ "reason"?: string }` | only while scheduled; facilitator or coordinator/admin |

Response `200 { "session": { …sessions row…, "previous_status", "previous_stage", "stage_changed" } }`.
Errors: `forbidden` (not the facilitator), `invalid_session_transition`, `session_finalized`,
`validation_failed`.

### invites

| Method & path | Who | Body / query | Response |
|---|---|---|---|
| `POST /invites` | coordinator/admin (any role kind); facilitator (`member` of own table) | `{ "role_kind": "coordinator"\|"facilitator"\|"member", "organization_id"` (coordinator) `\| "round_table_id"` (facilitator/member)`, "person": {first_name, last_name, position?, email?, phone?(E.164)} \| "person_id", "expires_in_days"?: 1..60 }` | `201 { invite }` |
| `GET /invites?organization_id=&round_table_id=&status=` | coordinator/admin; facilitator with `round_table_id` | — | `200 { invites: [invite] }` (newest first; without filters: platform admin only) |
| `POST /invites/{id}/revoke` | same as create | — | `200 { invite }` — frees the reserved seat/role if the person never signed in |
| `POST /invites/{id}/renew` | same as create | `{ "expires_in_days"? }` | `200 { invite }` — new code, new expiry |
| `GET /invites/preview?code=MESA34` | **anonymous** | — | `200 { invite: { code, status, role_kind, organization_name, round_table_name, person_first_name, invited_by_name, expires_at } }`. Rate limited per client address (20/min) and globally (300/min): `429 rate_limited` (`api.rate_limit_hit`, table `app.rate_limit_hits`). The address is `cf-connecting-ip`, else `x-real-ip`, else the **last** `x-forwarded-for` entry (the first is client-controlled) |
| `POST /invites/redeem` | any signed-in user | `{ "code": "MESA34", "profile"?: { first_name?, last_name?, position?, phone? } }` | `200 { already_redeemed, person, invite, contexts }`. Rate limited (`429 rate_limited`, `Retry-After`): 30/min per address, 15 per 10 min per account, 10/min per code, 300/min overall |

`invite` object: `{ id, code, role_kind, status, organization_id, organization_name, round_table_id,
round_table_name, round_table_code, person: {id, organization_id, first_name, last_name, position,
email, phone, status, linked}, invited_by_person_id, invited_by_name, expires_at, accepted_at,
revoked_at, created_at, invite_url }`. `status` is effective (`pending` past `expires_at` reads
`expired`).

Creating an invite also creates the person (status `invited`) and reserves what the invite grants:
a seat (`table_members`) for facilitator/member, a `role_assignments` row for coordinator.

Errors: preview/redeem `invite_not_found` (404), `invite_expired` / `invite_revoked` (410),
`invite_already_used` (409), `person_linked_elsewhere` (the invited person is bound to another
account), `identity_linked_elsewhere` (this account already has another person in that
organization), `organization_inactive`, `person_inactive`; create `table_full`,
`table_has_facilitator`, `person_already_linked`, `invite_pending_exists`, `forbidden`.
Re-redeeming with the same account is idempotent (`already_redeemed: true`). Codes are normalized
(case, spaces, dashes). Apple "hide my email" works: binding uses the auth user id, the relay email
is stored only if the person had none.

Enumeration: a code is a bearer secret of 32^6 ≈ 1.07·10⁹ values. Preview and redeem answer
`invite_not_found` vs `invite_expired|revoked|already_used` because the welcome screens need to tell
people what to do (ask for a new code, sign in instead); that only confirms that a *dead* code once
existed and reveals nothing about people. Only a live code returns data (first name, organization,
table, inviter) — the rate limits above cap guessing at 300 tries/min overall (≈0.04 expected hits
per day against ~100 live codes) and per address/account/code. Do not add finer-grained error
codes to these endpoints.

### admin (online-only)

| Method & path | Who | Body | Response |
|---|---|---|---|
| `GET /admin/me` | any | — | `{ auth_user_id, is_platform_admin, people: [person], contexts: [context] }` |
| `PATCH /admin/me` | any linked user | `{ first_name?, last_name?, position?, phone? }` (applies to all their person rows) | `{ people, contexts }` |
| `POST /admin/organizations` | platform admin | `{ name, kind?, country_code (ISO-2), country_name, region?, contact_name?, contact_email?, contact_phone? }` | `201 { organization }` |
| `PATCH /admin/organizations/{id}` | platform admin | same fields, optional | `{ organization }` |
| `POST /admin/organizations/{id}/status` | platform admin | `{ status: active\|paused\|inactive }` | `{ organization }` |
| `POST /admin/organizations/{id}/coordinators` | platform admin, coordinator of the org | `{ person } \| { person_id }` | `201 { invite }` (coordinator invite) |
| `POST /admin/locations` | coordinator/admin | `{ organization_id, name, city?, region?, address? }` | `201 { location }` |
| `PATCH /admin/locations/{id}` | coordinator/admin | `{ name?, city?, region?, address?, status? }` | `{ location }` |
| `POST /admin/tables` | coordinator/admin | `{ organization_id, location_id, name, code, weekday 1..7, start_time "HH:MM", timezone (IANA), duration_minutes? 10..120, start_value_id?, first_session_after? ISO, facilitator: { person_id } \| { person: {...} } }` | `201 { table }` |
| `PATCH /admin/tables/{id}` | coordinator/admin | `{ name?, code?, location_id?, weekday?, start_time?, timezone?, duration_minutes?, status?, current_value_id? }` | `{ table }` |
| `POST /admin/tables/{id}/facilitator` | coordinator/admin | `{ person_id } \| { person }, keep_previous_as_member?: bool` | `{ table }` (+ `facilitator_invite` when the new facilitator has no account) |
| `POST /admin/tables/{id}/members` | coordinator/admin | `{ person_id }` (existing person of the org; new people go through `POST /invites`) | `201 { member }` |
| `POST /admin/members/{table_member_id}/move` | coordinator/admin | `{ to_round_table_id }` | `{ member }` (the new membership) |
| `POST /admin/members/{table_member_id}/deactivate` | coordinator/admin; facilitator for members of own table | — | `{ member }` |
| `PATCH /admin/people/{id}` | coordinator/admin | `{ first_name?, last_name?, position?, email?, phone?, status?: active\|inactive }` | `{ person }` — `inactive` ends memberships, roles and pending invites |
| `POST /admin/roles` | coordinator/admin (coordinator); platform admin (platform_admin, staff people only) | `{ person_id, role, location_id? }` (`location_id` only for `coordinator`, same organization; informational, §3) | `201 { role_assignment }` |
| `POST /admin/roles/{id}/revoke` | same | — | `{ role_assignment }` (`last_platform_admin` protects the last admin) |

`table` object: the `round_tables` row plus `location_name`, `active_people`,
`facilitator: { table_member_id, person_id, first_name, last_name, linked } | null`,
`pending_session: { id, status, scheduled_at, value_id, follow_up_value_id } | null`, and on create /
facilitator change `facilitator_invite: invite | null`.

Table rules: code is uppercased (`LUZ-03`), unique per organization (`duplicate_table_code`);
missing facilitator → `validation_failed` with `fields.facilitator` (API) / `facilitator_required`
(SQL). Changing the schedule moves the pending (not yet opened) session to the new slot;
changing `current_value_id` re-points the pending session if it has no answers yet
(`value_change_blocked` otherwise); pausing/closing cancels the pending session; reactivating
schedules one. Moving a member: target must have a seat (`table_full`), facilitators cannot be
moved (`cannot_move_facilitator`). Paused/inactive organizations reject admin writes
(`organization_inactive`).

### answers-reveal

`POST /functions/v1/answers-reveal` — coordinator/admin of the organization or facilitator of the
table. Body `{ round_table_id, session_id?, person_id?, value_id? }`. Writes an `answers.revealed`
audit event. Response:

```json
{ "round_table_id": "…", "sensitive": true, "revealed_at": "…",
  "people": [ { "person_id": "…", "first_name": "Ana Lucía", "last_name": "Méndez",
    "assessments": [ { "id", "session_id", "value_id", "value_name", "kind", "score", "justification", "synced_late", "device_created_at" } ],
    "answers":     [ { "id", "session_id", "value_id", "question_id", "question_text", "answer_text", "synced_late" } ],
    "commitments": [ { "id", "session_id", "value_id", "action_text", "measure_text", "follow_up_status", "follow_up_note", "follow_up_session_id", "synced_late" } ] } ] }
```

Coordinators and platform admins have **no direct RLS read** on assessments, answers and
commitments; this endpoint (and the score-only `kpi_member_detail`) is their only path.

### notifications

| Method & path | Auth | Body | Response |
|---|---|---|---|
| `POST /notifications/device-tokens` | user | `{ token, platform: android\|ios\|web }` | `201 { device_token }` (re-registering moves the token to the current user) |
| `DELETE /notifications/device-tokens` | user | `{ token }` | `{ removed }` — call on sign-out |
| `POST /notifications/dispatch` | `x-cron-secret` or service key | — | `{ sender, claimed, sent, skipped, failed, tokens_removed }` |
| `POST /notifications/cron/session-reminders` | cron | — | `{ enqueued, dispatch }` |
| `POST /notifications/cron/commitment-nudges` | cron | — | `{ enqueued, dispatch }` |

Push payload `data` (all strings): `type` (`session_reminder` \| `commitment_nudge` \|
`stage_opened`), `session_id`, `round_table_id`, plus `scheduled_at` / `commitment_id` / `stage`.
The "unsynced data > 24 h" alert is a local notification (ADR 0009 #3), not a server push.

---

## 6. PostgREST reads (RLS) and RPCs

`GET {SUPABASE_URL}/rest/v1/<table>?select=…` with the user token. `anon` can read nothing;
`authenticated` can read (never write) every table under these policies:

| Table / view | Visible to |
|---|---|
| `curriculum_*`, `value_questions` | every signed-in user |
| `organizations`, `locations` | platform admin; anyone with a person in the organization |
| `people` (contact data) | platform admin; org coordinators; the person; facilitators of a table the person belongs to |
| `role_assignments` | platform admin; org coordinators; the person |
| `round_tables`, `sessions` | platform admin; org coordinators; active participants of the table |
| `table_members` | platform admin; org coordinators; participants of the table; the person |
| `session_attendance` | platform admin; org coordinators; participants of the table; the person |
| `member_assessments`, `member_answers`, `member_commitments` | **facilitator of the table; the person** |
| `invites` | platform admin; org coordinators; facilitator for invites to their table |
| `audit_events` | platform admin; org coordinators (their organization) |
| `device_tokens` | own rows |

Views (security invoker — the caller's RLS applies):

| View | Columns |
|---|---|
| `admin_tables` | `id, organization_id, organization_name, location_id, location_name, name, code, weekday, start_time, timezone, duration_minutes, status, current_value_id, current_value_sequence, current_value_name, facilitator_person_id, facilitator_name, active_people, max_people (9), pending_session_id, pending_session_status, pending_session_at, created_at, updated_at, seats_free, pending_invites` (`active_people`, `seats_free` and `pending_invites` are live counts) |
| `admin_people` | `id, organization_id, first_name, last_name, position, email, phone, status, linked, roles [{id, role, organization_id}], tables [{table_member_id, round_table_id, round_table_name, role}], created_at, updated_at` |
| `admin_invites` | `id, organization_id, person_id, first_name, last_name, email, phone, code, role_kind, round_table_id, round_table_name, status (effective), invited_by_person_id, expires_at, accepted_at, revoked_at, created_at` |
| `audit_log` | `id, organization_id, organization_name, actor_person_id, actor_name, event_type, entity_type, entity_id, payload, created_at` |

Audit `event_type` values: `organization.created|updated|status_changed`, `location.created|updated`,
`table.created|updated|facilitator_changed`, `member.added|moved|deactivated`,
`invite.created|revoked|renewed|accepted`, `person.updated|deactivated` (`person.updated` with
`payload.self = true` is a self-service profile edit), `role.granted|revoked`,
`session.opened|closed|cancelled`, `answers.revealed`. `audit_events` is append-only: update, delete and
truncate raise `42501` for every role. The `member.moved` payload carries `invites_moved` (a pending
member invite follows the person to the new table).

Privileges: `api.*` is executable by `service_role` only (Edge Functions); the `app` and `kpi` helper
functions are not executable by `anon`/`authenticated` except the six scope helpers RLS evaluates
(`app.my_person_ids`, `is_platform_admin`, `coordinator_orgs`, `facilitator_tables`, `member_tables`,
`my_orgs`). New `app`/`kpi` functions need the same explicit `revoke execute … from public`.

RPC: `POST /rest/v1/rpc/my_contexts` `{}` → `[ { kind: platform_admin|coordinator|facilitator|member,
person_id, organization_id, organization_name?, round_table_id?, round_table_name?, round_table_code?,
label } ]` (label e.g. `"Coordinador · Fundación Luz"`, `"Miembro · Mesa Esperanza 03"`).

---

## 7. KPIs

Rollups (ADR 0010) are materialized views in the private `kpi` schema; `computed_at` tells the
freshness. KPI reads never touch transactional tables (except live seat counts, below). Freshness:

- Every write that can change a rollup (organizations, round_tables, table_members, sessions,
  session_attendance, member_assessments, member_answers, member_commitments — any path: Edge Function,
  sync-upload, admin, SQL) marks the rollups dirty through a statement-level trigger.
- Every `kpi_*` RPC first calls `kpi.ensure_fresh()`: if dirty and the last refresh is older than 2 s,
  or the last refresh is older than 5 min (health depends on `now()`), the caller refreshes the
  rollups (advisory-lock guarded; concurrent readers use the previous snapshot instead of queuing).
  So a KPI read right after a session closes / a table, member or invite changes includes it
  (read-your-writes), apart from the 2 s debounce.
- pg_cron is the safety net: `kpi.refresh_if_dirty()` every 30 s, `public.refresh_kpis()` hourly.
- Cost (seed: 130 sessions, 1 260 assessments, local Docker Postgres): a full refresh of the four
  rollups takes **≈ 22 ms** (21–26 ms over repeated runs); a read that finds fresh rollups pays
  ≈ 0.5 ms for the check. Refreshes are bounded to one per 2 s however many users read.
- Because the RPCs may refresh, they are **volatile**: call them with `POST` (as the app does), never `GET`.
- Seat counts are not rollup data: `kpi_tables.active_people` is counted live from `table_members`
  (`seats_free` and `max_people = 9` are added), like `admin_tables`. `kpi_summary.people_active` and the
  `tables` health counts come from the rollup (fresh per the rules above).

Call with `POST /rest/v1/rpc/<name>` and a JSON body of named parameters (all optional
unless noted):

Common filters: `p_from` (date), `p_to` (date), `p_country` (ISO-2), `p_organization_id`,
`p_location_id`, `p_round_table_id`, `p_facilitator_person_id`, `p_module_id`, `p_value_id`.

Scope (applied inside every RPC): platform admin → all; coordinator → own organizations;
facilitator → own tables; member → nothing (empty results).

Definitions: **valores completados** = distinct (table, value) with a closed session;
`member_values_completed` = initial scores in closed sessions; **mejora estimada** =
follow-up − initial per person and value (`improvement_avg` over `improvement_pairs`);
**asistencia** = (present + late) / participants at session time; **sincronizado tarde** =
rows flagged `synced_late`; **health**: `completed`; `inactive` (paused/closed, or no closed session in
28 days); `delayed` (pending session overdue > 1 day, or last session > 9 days ago); `active`.

| RPC | Extra params | Returns |
|---|---|---|
| `kpi_summary` | filters | object (below) |
| `kpi_breakdown` | `p_dimension` (required): `country` \| `organization` \| `location` \| `round_table` \| `facilitator` \| `module` \| `value`; filters | rows `{ key, label, sessions_closed, values_completed, member_values_completed, attendance_pct, initial_avg, follow_up_avg, improvement_avg, improvement_pairs, synced_late_rows, tables_total, tables_active, tables_delayed, tables_inactive }` (table counts null for module/value) |
| `kpi_weekly_series` | filters | rows `{ week_start, sessions_closed, values_completed, attendance_pct, initial_avg, improvement_avg, synced_late_rows }` ordered by week |
| `kpi_tables` | `p_country, p_organization_id, p_location_id, p_round_table_id, p_facilitator_person_id, p_health` | grid rows `{ round_table_id, code, name, organization_id, organization_name, country_code, location_id, location_name, facilitator_person_id, facilitator_name, status, health, active_people (live), values_completed, current_value_id, current_value_label, attendance_pct, improvement_avg, synced_late_rows, last_session_at, pending_session_at, max_people (9), seats_free (live) }` |
| `kpi_member_detail` | `p_round_table_id` (required) | member drill-down (sensitive, scores only) `{ person_id, first_name, last_name, role, membership_status, sessions_expected, sessions_present, attendance_pct, values_completed, improvement_avg, synced_late_sessions, scores: [{ value_id, value_label, sequence, initial_score, follow_up_score, delta, synced_late }] }`; members → `P0001 forbidden` |

`kpi_summary` example (admin, seed):

```json
{ "sessions_closed": 115, "values_completed": 115, "member_values_completed": 739,
  "attendance_pct": 86.1, "initial_avg": 4.75, "follow_up_avg": 5.34,
  "improvement_avg": 0.70, "improvement_pairs": 522,
  "synced_late_rows": 180, "synced_late_sessions": 21,
  "tables": { "total": 18, "active": 12, "delayed": 3, "inactive": 3, "completed": 0 },
  "people_active": 115, "program_progress_pct": 13.3, "computed_at": "2026-10-25T23:50:00Z" }
```

Drill-down path: `kpi_breakdown(country)` → `kpi_breakdown(organization, p_country)` →
`kpi_tables(p_organization_id)` → `kpi_member_detail(p_round_table_id)` → answers behind
`answers-reveal` ("Mostrar respuestas", logged). CSV export is client-side from these rows.

---

## 8. Notifications

`public.notification_outbox` decides who gets what (idempotent `dedupe_key`), the `notifications`
function delivers through a `PushSender` (FCM HTTP v1; no-op without credentials). pg_cron jobs:

| Job | Schedule | Action |
|---|---|---|
| `gr-session-reminders` | every 15 min | reminders for sessions in the next 24 h, then dispatch via pg_net (if configured) |
| `gr-commitment-nudges` | hourly | mid-week nudge 3 days after a closed session while the follow-up is pending |
| `gr-kpi-refresh-dirty` / `gr-kpi-refresh-hourly` | every 30 s / hourly | `kpi.refresh_if_dirty()` / `public.refresh_kpis()` (safety net; KPI reads refresh too, §7) |
| `gr-invites-expire` | hourly | pending → expired |
| `gr-pending-sessions` | hourly | every active table has its pending session |
| `gr-archive-sessions` | daily 03:30 UTC | sync-window archiving |

pg_net dispatch needs Vault secrets `functions_base_url` (e.g. `http://host.docker.internal:54321/functions/v1`)
and `cron_secret` (= the function's `CRON_SECRET`); without them `app.dispatch_notifications_http()` is a
silent no-op and the outbox waits for an external `POST /notifications/dispatch`. `supabase/seed.sql`
creates both secrets for the local stack, so locally the whole path cron → pg_net → `notifications`
→ no-op sender (`sender: "noop"`, messages marked `skipped`, a warning logged) runs without FCM.
`stage_opened` is sent immediately by the `sessions` function.

Scheduling rules (pgTAP `060_notification_schedule`):
- **Session reminder**: sessions in status `scheduled` of `active` tables starting within the next 24 h
  (absolute time, so independent of timezone); one per participant (facilitator included) and slot —
  the dedupe key contains `scheduled_at`, so a rescheduled session reminds again while a re-run does
  not duplicate. The body shows the time in the **table's** timezone (`DD/MM HH24:MI`). Slots are
  computed in the table's IANA timezone, so DST changes keep the local wall-clock time.
- **Commitment nudge**: commitments with no follow-up yet, 3–4 days after the session closed (hourly
  job, one per commitment).
- `stage_opened`: members only (not the facilitator), only while the session is `open`.

---

## 9. Deviations from the suggested model

- **People are per organization** (`unique (organization_id, auth_user_id)`), not one global profile:
  pre-registration is organization data, and one human can be bound in several organizations.
  Platform staff have `organization_id NULL`.
- **Facilitator is not a role assignment**; it is `table_members.role = 'facilitator'` (ADR 0014: the
  facilitator row counts toward the 9 seats).
- `table_members` carries denormalized `first_name`, `last_name`, `auth_user_id` (trigger-maintained)
  so sync rules and rosters need no joins and members never receive peers' contact data.
- Session-domain child rows carry `organization_id` and `round_table_id` (set from the session,
  checked by composite FK) for RLS and per-table sync.
- **Sessions are server-generated** (one pending per table); added `stage = commitment`,
  `answers_closed_at`, `facilitator_person_id`, `cancelled_reason`, `device_modified_at`,
  `archived_at`. Status `cancelled` added.
- Attendance and assessments also carry `device_created_at`, `device_modified_at`, `received_at`,
  `synced_late` (attendance too, ADR 0005). Commitments track the follow-up's own
  `follow_up_device_at`, `follow_up_received_at`, `follow_up_synced_late`.
- `round_table_status` uses `active | paused | completed | closed` (RF-27); health
  (active/delayed/inactive) is computed in KPIs.
- `organizations` has `country_code` + `country_name`; `notification_outbox` added.
- Writes go through `api.*` SQL functions (one transaction each) called by Edge Functions as
  service_role; clients have no write privileges at all.

---

## 10. Running and verifying locally

```bash
supabase start                      # applies migrations + seed on first start
supabase db reset                   # re-apply migrations + seed
supabase test db                    # pgTAP: RLS scope, invariants, sync, invites/admin, rate limits,
                                    # KPI freshness, notification scheduling, hardening (167 tests)
docker run --rm -v "$PWD/supabase/functions":/app -w /app denoland/deno:2.1.4 \
  deno test --allow-env _shared/    # pure logic: validation, state machine, late sync, batches, client address
cp supabase/functions/.env.example supabase/functions/.env
supabase functions serve --env-file supabase/functions/.env &
bash supabase/tests/functions/smoke.sh   # curl flows with the dev users (run after a reset)
bash powersync/tools/validate.sh         # sync rules: compile + per-user simulation
bash scripts/dev-up.sh && bash scripts/smoke.sh   # whole stack incl. PowerSync (see README)
(cd tool/e2e && npm i && node run.mjs)            # browser end-to-end scenarios (tool/e2e/README.md)
supabase stop
```

Social sign-in cannot run locally without provider credentials; the smoke test creates a fresh
auth user through the GoTrue Admin API (`app_metadata.provider = "google"`) to stand in for a new
provider identity — redemption depends only on the verified auth user id.

---

## Appendix A. Table reference

Generated from the local database (`information_schema`). Defaults shown as in Postgres.

#### `curriculum_modules` — synced (PowerSync)

| column | type | null | default |
|---|---|---|---|
| `id` | uuid |  | gen_random_uuid() |
| `number` | smallint |  |  |
| `name` | text |  |  |
| `description` | text | yes |  |
| `value_count` | smallint |  |  |
| `status` | record_status |  | 'active'::record_status |
| `created_at` | timestamp with time zone |  | now() |
| `updated_at` | timestamp with time zone |  | now() |

#### `curriculum_values` — synced (PowerSync)

| column | type | null | default |
|---|---|---|---|
| `id` | uuid |  | gen_random_uuid() |
| `module_id` | uuid |  |  |
| `number_in_module` | smallint |  |  |
| `sequence` | smallint |  |  |
| `name` | text |  |  |
| `description` | text | yes |  |
| `booklet_reference` | text | yes |  |
| `status` | record_status |  | 'active'::record_status |
| `created_at` | timestamp with time zone |  | now() |
| `updated_at` | timestamp with time zone |  | now() |

#### `locations` — synced (PowerSync)

| column | type | null | default |
|---|---|---|---|
| `id` | uuid |  | gen_random_uuid() |
| `organization_id` | uuid |  |  |
| `name` | text |  |  |
| `city` | text | yes |  |
| `region` | text | yes |  |
| `address` | text | yes |  |
| `status` | record_status |  | 'active'::record_status |
| `created_at` | timestamp with time zone |  | now() |
| `updated_at` | timestamp with time zone |  | now() |

#### `member_answers` — synced (PowerSync)

| column | type | null | default |
|---|---|---|---|
| `id` | uuid |  | gen_random_uuid() |
| `organization_id` | uuid |  |  |
| `round_table_id` | uuid |  |  |
| `session_id` | uuid |  |  |
| `person_id` | uuid |  |  |
| `value_id` | uuid |  |  |
| `question_id` | uuid |  |  |
| `answer_text` | text |  |  |
| `device_created_at` | timestamp with time zone |  | now() |
| `device_modified_at` | timestamp with time zone | yes |  |
| `received_at` | timestamp with time zone |  | now() |
| `synced_late` | boolean |  | false |
| `archived_at` | timestamp with time zone | yes |  |
| `created_at` | timestamp with time zone |  | now() |
| `updated_at` | timestamp with time zone |  | now() |

#### `member_assessments` — synced (PowerSync)

| column | type | null | default |
|---|---|---|---|
| `id` | uuid |  | gen_random_uuid() |
| `organization_id` | uuid |  |  |
| `round_table_id` | uuid |  |  |
| `session_id` | uuid |  |  |
| `person_id` | uuid |  |  |
| `value_id` | uuid |  |  |
| `kind` | assessment_kind |  |  |
| `score` | smallint |  |  |
| `justification` | text | yes |  |
| `device_created_at` | timestamp with time zone |  | now() |
| `device_modified_at` | timestamp with time zone | yes |  |
| `received_at` | timestamp with time zone |  | now() |
| `synced_late` | boolean |  | false |
| `archived_at` | timestamp with time zone | yes |  |
| `created_at` | timestamp with time zone |  | now() |
| `updated_at` | timestamp with time zone |  | now() |

#### `member_commitments` — synced (PowerSync)

| column | type | null | default |
|---|---|---|---|
| `id` | uuid |  | gen_random_uuid() |
| `organization_id` | uuid |  |  |
| `round_table_id` | uuid |  |  |
| `session_id` | uuid |  |  |
| `person_id` | uuid |  |  |
| `value_id` | uuid |  |  |
| `action_text` | text |  |  |
| `measure_text` | text | yes |  |
| `follow_up_session_id` | uuid | yes |  |
| `follow_up_status` | commitment_follow_up_status | yes |  |
| `follow_up_note` | text | yes |  |
| `follow_up_device_at` | timestamp with time zone | yes |  |
| `follow_up_received_at` | timestamp with time zone | yes |  |
| `follow_up_synced_late` | boolean |  | false |
| `device_created_at` | timestamp with time zone |  | now() |
| `device_modified_at` | timestamp with time zone | yes |  |
| `received_at` | timestamp with time zone |  | now() |
| `synced_late` | boolean |  | false |
| `archived_at` | timestamp with time zone | yes |  |
| `created_at` | timestamp with time zone |  | now() |
| `updated_at` | timestamp with time zone |  | now() |

#### `organizations` — synced (PowerSync)

| column | type | null | default |
|---|---|---|---|
| `id` | uuid |  | gen_random_uuid() |
| `name` | text |  |  |
| `kind` | text |  | 'other' |
| `country_code` | character |  |  |
| `country_name` | text |  |  |
| `region` | text | yes |  |
| `contact_name` | text | yes |  |
| `contact_email` | text | yes |  |
| `contact_phone` | text | yes |  |
| `status` | organization_status |  | 'active'::organization_status |
| `created_at` | timestamp with time zone |  | now() |
| `updated_at` | timestamp with time zone |  | now() |

#### `people` — synced (PowerSync)

| column | type | null | default |
|---|---|---|---|
| `id` | uuid |  | gen_random_uuid() |
| `organization_id` | uuid | yes |  |
| `auth_user_id` | uuid | yes |  |
| `first_name` | text |  |  |
| `last_name` | text |  |  |
| `position` | text | yes |  |
| `email` | text | yes |  |
| `phone` | text | yes |  |
| `status` | person_status |  | 'invited'::person_status |
| `created_at` | timestamp with time zone |  | now() |
| `updated_at` | timestamp with time zone |  | now() |

#### `role_assignments` — synced (PowerSync)

| column | type | null | default |
|---|---|---|---|
| `id` | uuid |  | gen_random_uuid() |
| `person_id` | uuid |  |  |
| `role` | role_kind |  |  |
| `organization_id` | uuid | yes |  |
| `location_id` | uuid | yes |  |
| `status` | record_status |  | 'active'::record_status |
| `granted_by_person_id` | uuid | yes |  |
| `revoked_at` | timestamp with time zone | yes |  |
| `created_at` | timestamp with time zone |  | now() |
| `updated_at` | timestamp with time zone |  | now() |

#### `round_tables` — synced (PowerSync)

| column | type | null | default |
|---|---|---|---|
| `id` | uuid |  | gen_random_uuid() |
| `organization_id` | uuid |  |  |
| `location_id` | uuid |  |  |
| `name` | text |  |  |
| `code` | text |  |  |
| `weekday` | smallint |  |  |
| `start_time` | time without time zone |  |  |
| `timezone` | text |  |  |
| `duration_minutes` | smallint |  | 30 |
| `status` | round_table_status |  | 'active'::round_table_status |
| `current_value_id` | uuid | yes |  |
| `created_at` | timestamp with time zone |  | now() |
| `updated_at` | timestamp with time zone |  | now() |

#### `session_attendance` — synced (PowerSync)

| column | type | null | default |
|---|---|---|---|
| `id` | uuid |  | gen_random_uuid() |
| `organization_id` | uuid |  |  |
| `round_table_id` | uuid |  |  |
| `session_id` | uuid |  |  |
| `person_id` | uuid |  |  |
| `status` | attendance_status |  |  |
| `source` | attendance_source |  | 'facilitator'::attendance_source |
| `recorded_by_person_id` | uuid | yes |  |
| `device_created_at` | timestamp with time zone |  | now() |
| `device_modified_at` | timestamp with time zone | yes |  |
| `received_at` | timestamp with time zone |  | now() |
| `synced_late` | boolean |  | false |
| `archived_at` | timestamp with time zone | yes |  |
| `created_at` | timestamp with time zone |  | now() |
| `updated_at` | timestamp with time zone |  | now() |

#### `sessions` — synced (PowerSync)

| column | type | null | default |
|---|---|---|---|
| `id` | uuid |  | gen_random_uuid() |
| `organization_id` | uuid |  |  |
| `round_table_id` | uuid |  |  |
| `value_id` | uuid |  |  |
| `follow_up_value_id` | uuid | yes |  |
| `status` | session_status |  | 'scheduled'::session_status |
| `stage` | session_stage |  | 'lobby'::session_stage |
| `scheduled_at` | timestamp with time zone |  |  |
| `started_at` | timestamp with time zone | yes |  |
| `ended_at` | timestamp with time zone | yes |  |
| `answers_closed_at` | timestamp with time zone | yes |  |
| `cancelled_reason` | text | yes |  |
| `facilitator_person_id` | uuid | yes |  |
| `device_modified_at` | timestamp with time zone | yes |  |
| `archived_at` | timestamp with time zone | yes |  |
| `created_at` | timestamp with time zone |  | now() |
| `updated_at` | timestamp with time zone |  | now() |

#### `table_members` — synced (PowerSync)

| column | type | null | default |
|---|---|---|---|
| `id` | uuid |  | gen_random_uuid() |
| `organization_id` | uuid |  |  |
| `round_table_id` | uuid |  |  |
| `person_id` | uuid |  |  |
| `role` | table_member_role |  | 'member'::table_member_role |
| `joined_at` | timestamp with time zone |  | now() |
| `left_at` | timestamp with time zone | yes |  |
| `left_reason` | text | yes |  |
| `moved_to_round_table_id` | uuid | yes |  |
| `status` | record_status |  | 'active'::record_status |
| `first_name` | text |  | '' |
| `last_name` | text |  | '' |
| `auth_user_id` | uuid | yes |  |
| `created_at` | timestamp with time zone |  | now() |
| `updated_at` | timestamp with time zone |  | now() |

#### `value_questions` — synced (PowerSync)

| column | type | null | default |
|---|---|---|---|
| `id` | uuid |  | gen_random_uuid() |
| `value_id` | uuid |  |  |
| `question_code` | text |  |  |
| `question_text` | text |  |  |
| `sort_order` | smallint |  | 1 |
| `response_type` | text |  | 'text' |
| `status` | record_status |  | 'active'::record_status |
| `created_at` | timestamp with time zone |  | now() |
| `updated_at` | timestamp with time zone |  | now() |

#### `audit_events` — online only

| column | type | null | default |
|---|---|---|---|
| `id` | uuid |  | gen_random_uuid() |
| `organization_id` | uuid | yes |  |
| `actor_auth_user_id` | uuid | yes |  |
| `actor_person_id` | uuid | yes |  |
| `event_type` | text |  |  |
| `entity_type` | text |  |  |
| `entity_id` | uuid | yes |  |
| `payload` | jsonb |  | '{}'::jsonb |
| `created_at` | timestamp with time zone |  | now() |

#### `device_tokens` — online only

| column | type | null | default |
|---|---|---|---|
| `id` | uuid |  | gen_random_uuid() |
| `auth_user_id` | uuid |  |  |
| `token` | text |  |  |
| `platform` | device_platform |  |  |
| `last_seen_at` | timestamp with time zone |  | now() |
| `created_at` | timestamp with time zone |  | now() |
| `updated_at` | timestamp with time zone |  | now() |

#### `invites` — online only

| column | type | null | default |
|---|---|---|---|
| `id` | uuid |  | gen_random_uuid() |
| `organization_id` | uuid |  |  |
| `person_id` | uuid |  |  |
| `code` | character |  |  |
| `role_kind` | invite_role_kind |  |  |
| `round_table_id` | uuid | yes |  |
| `invited_by_person_id` | uuid | yes |  |
| `status` | invite_status |  | 'pending'::invite_status |
| `expires_at` | timestamp with time zone |  | (now() + '14 days'::interval) |
| `accepted_at` | timestamp with time zone | yes |  |
| `accepted_auth_user_id` | uuid | yes |  |
| `revoked_at` | timestamp with time zone | yes |  |
| `revoked_by_person_id` | uuid | yes |  |
| `created_at` | timestamp with time zone |  | now() |
| `updated_at` | timestamp with time zone |  | now() |

#### `notification_outbox` — online only

| column | type | null | default |
|---|---|---|---|
| `id` | uuid |  | gen_random_uuid() |
| `kind` | notification_kind |  |  |
| `auth_user_id` | uuid |  |  |
| `person_id` | uuid | yes |  |
| `organization_id` | uuid | yes |  |
| `title` | text |  |  |
| `body` | text |  |  |
| `data` | jsonb |  | '{}'::jsonb |
| `dedupe_key` | text |  |  |
| `status` | notification_status |  | 'pending'::notification_status |
| `attempts` | smallint |  | 0 |
| `last_error` | text | yes |  |
| `send_after` | timestamp with time zone |  | now() |
| `sent_at` | timestamp with time zone | yes |  |
| `created_at` | timestamp with time zone |  | now() |
| `updated_at` | timestamp with time zone |  | now() |

