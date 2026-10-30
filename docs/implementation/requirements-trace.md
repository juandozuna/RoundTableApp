# Requirements trace and gap audit

Audit of `main` (commit `b0c521c`) against the RoundTables vault (notes 01–07: RF-01…75, RNF-01…25,
PC-01…15, answered P-xx), `docs/adr`, `AGENTS.md` and the prototypes. Status is from reading code,
migrations, tests and e2e scenarios; nothing was run (no build, no test run, Docker stack untouched),
so "tested" means "a test exists", not "the test was just executed".

Status: **I** Implemented · **P** Partial · **N** Not implemented · **O** Out of scope (reason given).

Evidence shorthand: `M:` = `supabase/migrations/2026102510xx_*.sql` (`core`=0100, `sess`=0200,
`rules`=0300, `rls`=0400, `api`=0500, `kpi`=0600, `notif`=0700); `pgTAP:` = `supabase/tests/database/0x0_*`;
`e2e:` = `tool/e2e/scenarios/*.mjs`; `dart:` = `test/…`; `app_es.arb` = `lib/l10n/app_es.arb`.

## 1. Summary by area

| Area | Total | I | P | N | O |
|---|---|---|---|---|---|
| Platform & org admin (RF-01…08) | 8 | 7 | 1 | 0 | 0 |
| Orgs, roles, users (RF-09…18) | 10 | 9 | 1 | 0 | 0 |
| Locations, tables, calendar (RF-19…30) | 12 | 9 | 3 | 0 | 0 |
| Program (RF-31…36) | 6 | 5 | 0 | 1 | 0 |
| Session execution (RF-37…50) | 14 | 13 | 1 | 0 | 0 |
| Answers & progress (RF-51…59) | 9 | 4 | 5 | 0 | 0 |
| Queries & reports (RF-60…69) | 10 | 7 | 3 | 0 | 0 |
| Governance & support (RF-70…75) | 6 | 4 | 1 | 1 | 0 |
| RNF-01…25 | 25 | 15 | 8 | 2 | 0 |
| PC-01…15 + answered P-xx | 20 | 15 | 3 | 0 | 2 |
| ADR 0001…0015 | 15 | 11 | 4 | 0 | 0 |
| **Total** | **135** | **99** | **30** | **4** | **2** |

Counts: 75 RF rows, 25 RNF rows, 20 PC/P rows, 15 ADR rows. Gap list in §3: 1 blocker, 7 major, 9 minor.

## 2. Full trace

### 2.1 Functional requirements (RF)

| Id | Requirement (short) | St | Evidence / note |
|---|---|---|---|
| RF-01 | Church as global admin | I | `role_kind platform_admin` (M:foundation, core `role_assignments`), `app.is_platform_admin`; pgTAP 010 "platform admin sees every organization"; e2e sign-in/admin |
| RF-02 | Create/activate/pause/deactivate orgs | I | `api.organization_create/_update/_set_status` (M:api); pgTAP 030 "only platform admins create organizations"; e2e admin |
| RF-03 | Org data: name, type, status, contact, coverage | I | `organizations` (kind, country, region, contact_*) M:core:12; `organization_form_page.dart` |
| RF-04 | Create initial org admin account | I | Org form invites the first coordinator (`organization_form_cubit.dart` → `InvitePersonUseCase`); no separate "org admin" role per PC-03/04 |
| RF-05 | No cross-org visibility | I | RLS on every table (M:rls), sync rules streams scoped by membership; pgTAP 010 (org B coordinator cannot see org A tables/people/invites); e2e `isolation` |
| RF-06 | Aggregates by org/region/country | I | `kpi_breakdown` dimensions country/organization/location/round_table/facilitator/module/value (M:kpi:288); `reports_page.dart` |
| RF-07 | Master program of modules/values | I | Curriculum tables + seed placeholders; the church loads and edits the real content in the admin "Currículo" section (upload with preview, edit, audit) or with `scripts/import-curriculum.mjs` (ADR 0017, issue #4). pgTAP 110, e2e `curriculum`. Still no version history (G-09) |
| RF-08 | Admin action log | I | `audit_events` + `app.audit` in 21 api calls; `audit_page.dart`; e2e admin "audit log" |
| RF-09 | Org admin creates coordinators | I | `api.invite_create` role `coordinator` by the platform admin only; pgTAP 030 ("facilitator cannot invite coordinators"). Coordinators can no longer create coordinators (ADR 0016): `app.require_can_invite`, pgTAP 030 role-matrix cases, e2e `invites` denied cases |
| RF-10 | Assign coordinators to locations/areas | P | `role_assignments.location_id` exists but is never used for scope: coordinator RLS is org-wide (`app.coordinator_orgs`). P-16 unanswered. See G-16 |
| RF-11 | Coordinator creates/activates facilitators | I | `invite_create`, `table_create`/`table_set_facilitator` (M:api); e2e invites/admin |
| RF-12 | One principal facilitator per table | I | unique index `table_members_active_facilitator_key`; pgTAP 020 "a second active facilitator is rejected"; `facilitator_required` pgTAP 030 |
| RF-13 | Facilitator creates/invites members | I | `invite_create` allows `member` for own table only (M:api:673); pgTAP 030; e2e invites |
| RF-14 | Deactivate/retire users without deleting history | I | `person_update(status)`, `member_deactivate` (M:api:1483,1519); no deletes; history in `left_at/left_reason`; e2e admin |
| RF-15 | Reassign members between tables keeping history | I | `api.member_move` (new membership, old one inactive `moved_to_round_table_id`); pgTAP 030 "moving into a full table is rejected"; `move_member_use_case.dart` |
| RF-16 | Change facilitator keeping history | I | `api.table_set_facilitator` (`facilitator_changed`); e2e admin "change facilitator" |
| RF-17 | Multiple roles per user | I | `people` per org + `my_contexts()`; context switcher; pgTAP 010 "coordinator has two contexts"; e2e sign-in |
| RF-18 | Show only role-compatible functions | I | `AdminScope` gate (administrator/coordinator only), redirect guard; e2e sign-in "Sin permiso" for member on `/admin` |
| RF-19 | Locations per org | I | `locations` (M:core:62), `location_create/_update`; `location_form_page.dart`; e2e admin |
| RF-20 | Table ↔ location | I | `round_tables.location_id` + composite FK |
| RF-21 | Table name/code | I | `name`, `code` unique per org; pgTAP 030 "duplicate table codes are rejected" |
| RF-22 | Day, time, frequency | P | weekday/start_time/timezone/duration (M:core:144); no frequency field (always weekly; P-50 unanswered). Acceptable |
| RF-23 | Change schedule from an effective date | I | `table_schedule_versions` keeps every schedule with `effective_from`; `table_update` takes `schedule_effective_from` (today by default, the past is refused), a future date is applied by `app.apply_due_schedule` and never moves earlier sessions; audit `table.schedule_changed`; history in the table detail (M:`20261027200000_schedule_changes`; pgTAP:090; dart: `table_detail_cubit_test`, `admin_remote_data_source_test`). Issue #6 |
| RF-24 | ≤ 9 active members | I | `table_members_prepare` trigger (M:rules:102) counts facilitator (ADR 0014); pgTAP 020/030 (10th seat rejected); e2e admin "9-seat limit" |
| RF-25 | Alert if below minimum (3) | I | `kpi_tables.health_reasons` contains `few_people` below `kpi.health_settings.min_active_people` (3, facilitator included); reason chip + saved view "Menos de 3 personas"; `table_alert` notification to the org's coordinators and administrators; alerts card on the manager Home (G-06, issue #8). The deactivation warning stays |
| RF-26 | Calendar/list of upcoming sessions by location/facilitator | I | "Calendario" destination (`/calendario`, `lib/features/calendar/**`): coordinators and administrators list every table's pending session, filterable by location, facilitator and table; facilitators see their own table's list from the synced local tables (offline); timezone-correct per table (`TableWallClock`); markers for open, cancelled, extraordinary and rescheduled sessions (issue #6 data); dart: `test/features/calendar/**`; e2e calendar |
| RF-27 | Table states active/paused/completed/closed | I | enum `round_table_status`; `table_update` cancels pending session on pause/close and reschedules on reactivate (M:api:1316) |
| RF-28 | Record which value each table is on | I | Table form has a module + value picker (create: `start_value_id`; edit: `current_value_id`); server refuses moving back past completed history without `confirm_rewind`, leaves closed sessions untouched and audits `table.value_changed` (M:`table_program_value`); pgTAP 080, cubit tests, e2e admin. Closes G-03 (issue #5) |
| RF-29 | Create sessions from schedule | I | `app.schedule_next_session`, `ensure_pending_sessions` cron (M:rules:269, notif:261); pgTAP 030 "the first session is scheduled" |
| RF-30 | Reschedule / extraordinary session | I | `api.session_reschedule`, `api.session_cancel` (holiday / force majeure / other), `api.session_extra_create` behind `POST /admin/sessions/{id}/reschedule`, `…/cancel`, `POST /admin/tables/{id}/extra-session`; audit `session.rescheduled/cancelled/extraordinary_added`; one pending session per table is preserved; a cancelled session does not advance the value (decision for P-51/52); table detail actions + Home markers (pgTAP:090, e2e `schedule`, dart: `session_dialogs_test`, `home_page_test`). Issue #6; facilitators cannot do it (admin/coordinator of the org only) |
| RF-31 | Official program structure | I | `curriculum_modules`/`values` 5×48, sequence (M:core:102); structure validated on upload (5 modules, 10/10/10/10/8, 1–48); content is placeholder until the church uploads it (G-01) |
| RF-32 | Previous/current/next value per table | I | `sessions.value_id` + `follow_up_value_id`, `app.next_value_id`; pgTAP 020 "next session works value 5 with follow-up of value 4" |
| RF-33 | Reflection questions per value | I | `value_questions` (2–3 per value); member flow reflection step; e2e live-session |
| RF-34 | Instructions/title/metadata per value | I | `description`, `booklet_reference` columns synced to device (sync-rules `curriculum`), editable in "Currículo"; per-language text in `curriculum_translations` (ADR 0017) |
| RF-35 | Program standard or configurable | I | Standard for all (P-56 default; ADR scope) |
| RF-36 | Version history of program | N | No versioning tables or process. Deferred (06 puts deep customization out of MVP) — see G-09 |
| RF-37 | Only authorized facilitator starts session | I | `session_change` role checks; pgTAP 020 "a member cannot drive the session" |
| RF-38 | Real start/end timestamps | I | `sessions.started_at/ended_at`, constraints (M:sess:16) |
| RF-39 | Facilitator takes attendance | I | `mark_attendance_use_case.dart`, `mark_everyone_present`; `attendance_sheet.dart`; e2e live-session |
| RF-40 | Present/absent (+late/excused) | I | enum `attendance_status` incl. late, excused |
| RF-41 | Show previous follow-up value and current value | I | `LiveSession` + member flow; e2e live-session; pgTAP 020 |
| RF-42 | Open follow-up stage | I | stages via `set_session_stage_use_case.dart` / `session_change` |
| RF-43 | Member records new self-score of previous value | I | `member_assessments kind=follow_up`; e2e live-session |
| RF-44 | Open current-value capture stage | I | stage control (same) |
| RF-45 | Reflection answers from own device | I | `member_answers`; `submit_reflection_use_case.dart`; e2e |
| RF-46 | Initial self-score of current value | I | `member_assessments kind=initial` |
| RF-47 | Measurable commitment | I | `member_commitments.action_text/measure_text`; `submit_commitment_use_case.dart` |
| RF-48 | Close answer stage | I | `close_answers_use_case.dart`, `answers_closed_at`; e2e live-session |
| RF-49 | Formal session close | I | `close_session_use_case.dart`; trigger `sessions_after_finalize` advances table; e2e |
| RF-50 | Evidence of complete vs incomplete session | P | `status closed/cancelled` and attendance/answers counts exist; no explicit "incomplete" flag or interruption handling (P-72 unanswered) |
| RF-51 | ≥2 measurements per member and value | I | `initial` + `follow_up` unique per (session, person, kind); `mv_member_value_facts` pairs them |
| RF-52 | Justification of score | P | `member_assessments.justification` column exists; no justification input exists in `lib/features/session/**` (only the reveal/drill-down screens read `justification`, so it is always empty). Low impact (P-82 unanswered) |
| RF-53 | Committed improvement action | I | see RF-47 |
| RF-54 | Person identified as example of the value | P | Seed question `ejemplo` has `response_type='person'` but it is answered as free text; `responseType` is not used in session domain/presentation. Acceptable if text is ok (P-84 unanswered) |
| RF-55 | Score evolution per person/value/table/org | P | Aggregates yes (`kpi_weekly_series`, `kpi_member_detail`); members get only module counts (`HomeProgress`), no per-value history screen; facilitator has no UI (G-02) |
| RF-56 | Absence handling | I | `attendance` + late sync + follow-up skip when no previous commitment (`follow_up_not_available`, first session); pgTAP 020 |
| RF-57 | Follow-up without initial | I | Follow-up is bound to previous session's value; absent/no commitment tolerated (pgTAP 020 first-session case) |
| RF-58 | Edit only within authorized window | P | Edit allowed while session open / within `late_grace` after close (`app.late_grace`, pgTAP 030 `session_closed`); **no role-based post-close correction path** (P-31 unanswered). See G-12 |
| RF-59 | Record who captured/modified | P | `device_created_at/device_modified_at`, person_id on rows; audit for session state and reveals, not for answer edits (by design) |
| RF-60 | Facilitator views own table history | P | RLS + KPI functions allow it (`kpi.row_visible`, `facilitator_tables`), sync gives current data; **no UI**: `AdminScope` is null for facilitators. See G-02 |
| RF-61 | Coordinator sees tables in scope | I | RLS `coordinator_orgs`; explorer; pgTAP 010 ("sees all 7 Fundación Luz tables") |
| RF-62 | Org admin sees tables, users, metrics | I | Same via coordinator (no distinct org admin role) |
| RF-63 | Church sees aggregates across orgs | I | `kpi_summary` global scope; pgTAP 010 "platform admin KPI scope is global" |
| RF-64 | Attendance indicators by table/facilitator/location/org | I | `kpi_tables.attendance_pct`, `kpi_breakdown` |
| RF-65 | Curricular progress: module, value, % | I | `values_completed`, `current_value_label`, `home_progress`; `selection_kpi_panel.dart` |
| RF-66 | Average score evolution per value/cohort | I | `improvement_avg` (delta), `kpi_weekly_series`, dumbbell chart |
| RF-67 | Identify inactive/delayed/low-attendance tables | I | `health` = active/delayed/inactive/completed plus `health_reasons` (`low_attendance`: average of the last 3 closed sessions < 70 %; `few_people`), explorer views "Mesas retrasadas" / "Baja asistencia" / "Menos de 3 personas", `app.enqueue_table_alerts()` daily (G-06, issue #8) |
| RF-68 | Export basic reports | P | CSV export for reports and explorer (`csv_export_service_impl.dart`, `report_csv.dart`, `export_csv_use_case.dart`) and audit; **no PDF/Excel**, no scheduled export (P-100 unanswered); no test of the exports beyond `test/features/kpis` |
| RF-69 | Distinguish sensitive individual data vs aggregates | I | `answers_reveal` returns `sensitive:true` and is audited (`answers.revealed`); drill-down is a separate screen |
| RF-70 | Preserve history when users change/leave | I | No hard deletes; status+`left_at`; archival only sets `archived_at` (M:notif:215) and leaves server rows. Pending: archived rows disappear from devices (G-10) |
| RF-71 | Audit: joins, leaves, reassignments, session close, role change | I | `member.added/moved/deactivated`, `person.deactivated`, `table.facilitator_changed`, `role.granted/revoked`, `session.opened/closed/cancelled` (M:api:335), `invite.*`, `answers.revealed`. Not audited: sign-ins, answer edits |
| RF-72 | Parametrize basic catalogs without technical help | P | The curriculum and its content languages are now editable by platform admins without technical help (ADR 0017). Other catalogs (organization kinds, etc.) are still DB check lists |
| RF-73 | Validate critical rules before sensitive actions | I | DB triggers/CHECKs (score, seats, follow-up once, transitions) + Edge validation; pgTAP 020/030, `supabase/functions/_shared/*_test.ts` |
| RF-74 | Clear states for users/tables/sessions | I | enums `person_status`, `round_table_status`, `session_status/stage`; `status_pill` widgets |
| RF-75 | Access recovery / operational correction | P | Access = provider login + `invite_renew`/`revoke` (M:api:790,842); no screen/procedure to correct a wrongly captured score after close. See G-12 |

### 2.2 Non-functional requirements (RNF)

| Id | St | Evidence / note |
|---|---|---|
| RNF-01 `organization_id` on tenant tables | I | all business tables (M:core/sess); composite FKs `(id, organization_id)` |
| RNF-02 No cross-org read/write | I | RLS + sync rules; pgTAP 010/020 ("user of another organization cannot write"); e2e `isolation` (also via data API token) |
| RNF-03 Rules enforced by RLS | I | `alter table … enable row level security` + policies (M:rls); clients cannot write directly (pgTAP 010) |
| RNF-04 Church roles separate from org roles | I | `platform_admin` only in `role_assignments` with null org (ADR 0006) |
| RNF-05 Sensitive actions audited | P | See RF-71; sign-in/out and failed permission attempts not audited |
| RNF-06 Secure invite, access recovery, revocation | I | 6-char codes, expiry 14 d, revoke/renew, rate limit (M:rate_limits, pgTAP 040), `identity_linked_elsewhere`; e2e invites |
| RNF-07 Max members | I | See RF-24 |
| RNF-08 Preserve history | I | See RF-70 |
| RNF-09 No duplicate memberships/sessions | I | unique indexes (`table_members_active_person_key`, one pending session `sessions` partial unique, assessments unique keys) |
| RNF-10 Traceable program progression | I | `sessions_after_finalize` advances `current_value_id`; pgTAP 020 |
| RNF-11 Extremely simple UI | P | Guided stepper, large targets, plain Spanish; not usability-tested with real users (pilot item) |
| RNF-12 Few steps, clear language | P | Same; no measured task counts |
| RNF-13 Role differentiation | I | role chips, context switcher, role-specific nav (`app_navigation.dart`, `role_chip.dart`) |
| RNF-14 Fast, legible, error-tolerant in-session capture | I | Local-first writes, drafts persisted (`save_session_draft_use_case.dart`), score picker blocking 5 (`score_grid.dart`); e2e live-session |
| RNF-15 Minimize free text | P | Scores are guided; reflection/commitment inevitably free text; follow-up status is an enum |
| RNF-16 Fast open | P | Local DB read; no performance measurement recorded |
| RNF-17 No blocking in session ops | I | Offline-first writes; e2e `offline` |
| RNF-18 Hundreds of concurrent tables | P | Rollups/indexes designed for it (ADR 0010); **no load test**. See G-14 |
| RNF-19 Reports don't degrade transactions | I | Materialized views refreshed on dirty-flag/cron (M:kpi:177–210, notif cron) |
| RNF-20 Closed-session data not lost on client errors | I | PowerSync CRUD queue, idempotent `sync_apply`, `sync_upload_rejections` local table; pgTAP 020 idempotence; e2e `offline` |
| RNF-21 Automatic DB backups | N | Relies on Supabase plan backups; no doc, no restore drill. See G-07 |
| RNF-22 Rebuild table history | I | Roster history rows + sessions + audit |
| RNF-23 Logs for incident investigation | P | `AppLog` client logger; Edge Function console logs; no central retention/runbook |
| RNF-24 Quickly spot problem orgs/tables/sessions | I | `health` + `health_reasons` chips, explorer views, manager Home alerts card and `table_alert` push (G-06) |
| RNF-25 Monitoring of technical failures and usage errors | N | Only `FlutterError.onError` → log (`lib/app/bootstrap.dart:19`); no Sentry/Crashlytics/uptime. See G-07 |

### 2.3 Stakeholder decisions (PC-xx and answered P-xx)

| Id | Answer | St | Evidence / note |
|---|---|---|---|
| PC-01 | Operate + reliable data + national impact | I | All three present (sessions, KPIs, explorer) |
| PC-02 | One decision maker | O | Governance, no software impact |
| PC-03 | Roles: Facilitator (starts table, creates members only for own table), Member, Coordinator (creates tables and facilitators in own org), Administrator (church, all orgs, creates accounts everywhere) | P | Matches except: coordinators can also invite coordinators and members of any table in their org (`api.invite_create`, M:api:707); `role_kind` has no separate org admin (as intended). Facilitator limited to own table: pgTAP 030 |
| PC-04 | Org admin = coordinator question answered by PC-03 | I | No separate org-admin role |
| PC-05 | Each member own account/phone | I | Per-person identity binding via invite (ADR 0007) |
| PC-06 | Everyone has a phone | I | No facilitator-captures-for-others path (ADR 0003) |
| PC-07 | Capture only, no booklet content | I | No booklet content stored (only `booklet_reference`) |
| PC-08 | Score 1–10, 5 blocked | I | UI `score_grid.dart`, Edge validation (`validation.ts`), DB CHECK `member_assessments_score_check` + trigger; pgTAP 020 ("score 5 is rejected by the database itself"); e2e live-session "score 5 blocked" |
| PC-09 | Follow-up once, next session | I | `follow_up_value_id` = previous value; unique (session, person, kind); `duplicate_follow_up`, `follow_up_already_recorded`; pgTAP 020 |
| PC-10 | Facilitator, coordinator, org admin, church all see individual answers | I | Facilitator: RLS + sync stream `table_facilitator`; coordinator/admin: `kpi_member_detail` (scores) and `answers_reveal` (free text, audited, org-scoped); pgTAP 010 ("coordinator cannot read individual answers directly (answers-reveal only)"), pgTAP 030 reveal + audit; e2e admin "reveal answers (audited)" |
| PC-11 | KPIs: values completed + estimated score improvement | I | `kpi_summary` (`values_completed`, `improvement_avg`, `improvement_pairs`), `home_kpi_summary.dart`, charts |
| PC-12 | Partial offline | I | ADR 0003: session domain offline-first; admin/invites/KPIs online with `OfflineBanner` |
| PC-13 | Android + iOS (Flutter) | P | Flutter project has android/ios/web; builds not re-verified here; social login on device unverified (G-01) |
| PC-14 | Tables and schedules controlled centrally | I | Only platform admin/coordinator can create/update tables (`require_manages_org`) |
| PC-15 | Member data: name, last name, position, email, phone | I | `people` columns, `phone` E.164 check, invite form |
| P-03/P-06/P-07 | Real data instantly; ease of use + admin control; pilot org | I | Rollups on dirty-flag every ≤5 min (cron); pilot not yet run |
| P-13 | Support team exists | O | Operational |
| P-53 (open, ADR 0009) | Session reminders | I | `app.enqueue_session_reminders` (24 h lead, cron */15), `commitment_nudge`, `stage_opened`; local unsynced alert; **FCM sender is a no-op without `FCM_SERVICE_ACCOUNT_JSON`** and was never exercised with real tokens. See G-01 |
| P-101 (open) | Alerts for inactive/low attendance/no progress | P | Low attendance and < 3 people alert (RF-67); inactive/delayed tables are still only a view and a count (not pushed) — pending stakeholder answer |
| P-114 | Spanish only | I | ARB-based Spanish (ADR 0011) |

### 2.4 ADR decisions

| ADR | St | Evidence / note |
|---|---|---|
| 0001 single Flutter client (Android, iOS, web) | I | `android/ios/web`, `tool/setup_web.sh`; e2e on web build |
| 0002 Supabase backend | I | migrations, 6 Edge Functions |
| 0003 offline scope | I | session domain offline; exceptions show `OfflineBanner`; e2e `offline` |
| 0004 PowerSync + Drift | I | `powersync/sync-rules.yaml`, `lib/core/sync/**`, `session_drift_database`; `powersync/tools/simulate-buckets.mjs`, `scripts/powersync-sync-check.mjs`; dart: `test/core/sync`, `test/features/session/data` |
| 0005 late sync, attendance, 7-day window, score, follow-up | P | Late flag + auto-present + score + once: pgTAP 020, e2e `offline`. **7-day offline window**: enforced via `AccessStatus.needsOnlineSignIn`, tested with a fake clock; see `offline-window.md` (G-11; E2E with expired JWT still manual) |
| 0006 multi-tenancy and roles | I | RLS, contexts, pgTAP 010 |
| 0007 social login only, phone unverified, invite binding | P | Invite binding verified (pgTAP 030, e2e invites with dev accounts); Google/Apple/Facebook never exercised against real providers. See G-01 |
| 0008 Auth via supabase_flutter, Retrofit for Edge/PostgREST | I | `lib/features/*/data/client/*.dart`; core `network` |
| 0009 FCM, four notification types | P | Types exist (`notification_kind`); sender no-op w/o credentials; web push unverified |
| 0010 KPI rollups | I | materialized views, dirty-flag refresh, `synced_late` counts |
| 0011 i18n, UTC + table timezone | I | ARB only; `round_tables.timezone` validated; `next_slot` uses table tz |
| 0012 client architecture | P | Mostly followed; see §4 |
| 0013 session flow "Mesa en vivo" | I | `facilitator_board`, `member_flow`; prototype `session-flow-b-mesa-en-vivo.html`; e2e live-session. Pixel-fidelity vs prototype not audited |
| 0014 facilitator is participant | I | facilitator `table_members` row counts toward 9; e2e live-session "commitment by facilitator-as-participant"; "Dirigir la mesa"/"Mis respuestas" |
| 0016 role matrix and curriculum import | I | `app.require_can_invite`, import script and tests (`scripts/test`), see ADR 0017 for the admin path |
| 0017 curriculum admin and content languages | I | Migration `20261030000000`, `admin/curriculum.ts`, `lib/features/curriculum`, device resolution in session/home/history; pgTAP 110, deno `curriculum_test.ts`, Flutter tests, e2e `curriculum` |
| 0015 login "Puerta única" and admin "Explorador" | I | `sign_in`, `explorer` pages; prototypes `login-invites-l2…`, `admin-kpis-k2…`; e2e sign-in/admin |

## 3. Gap list (prioritized)

Severity: **blocker** = cannot go to pilot as is; **major** = a stated requirement/decision is missing or
unusable for a role; **minor** = polish or low impact.

| # | Sev | Gap | Suggested fix | Likely files |
|---|---|---|---|---|
| G-01 | blocker | **Production auth, push and content unverified.** Google/Apple/Facebook sign-in only works with dev accounts (`DEV_AUTH`); FCM sender is a no-op without credentials; web push untested; curriculum is **placeholder** (48 names, 2–3 template questions, `seed.sql:56`) and P-11/P-57 say the church approves content | Configure the three providers + redirect URLs in a real Supabase project and run one end-to-end sign-in per provider on web/Android/iOS; create the Firebase project and exercise `notifications` function with real tokens; load the church-approved curriculum through a migration (not seed) | `lib/features/auth/data/**`, `supabase/functions/notifications/**`, `_shared/fcm.ts`, `supabase/seed.sql` → new migration, README |
| G-02 | major | **Facilitator and member have no history/progress UI.** RF-60 (facilitator sees table history), RF-55, P-92 (member sees own history), 06 "tablero del facilitador". Backend allows it (`kpi.row_visible`, RLS) but `AdminScope` is null for facilitators/members, so `/admin/*` and reports are unreachable; Home shows only module counts | Add a facilitator "Mi mesa" history view (reuse `LoadMemberDetailUseCase`/`LoadReportUseCase` scoped to the led table) and a member "Mi progreso" view (local Drift data); widen the report route gate to facilitator for their table | `lib/features/kpis/**`, `lib/features/home/**`, `admin_scope_service_impl.dart`, `kpis_router.dart`, `app_es.arb` |
| G-03 | ~~major~~ closed | ~~Cannot set a table's program position (RF-28)~~ Resolved in issue #5: value picker on the table form, rewind confirmation, audit event | — | `table_form_page.dart`, `table_form_cubit.dart`, `20261027100000_table_program_value.sql` |
| G-04 | ~~major~~ closed | ~~No session rescheduling/cancellation/extra sessions and no effective-dated schedule change (RF-23, RF-30, P-51/52)~~ Resolved in issue #6: schedule history with `effective_from`, reschedule / cancel / extraordinary session API + table-detail UI, Home markers, audit events, notification dedupe by slot. Decision: a cancelled session does not advance the value | — | `20261027200000_schedule_changes.sql`, `supabase/functions/admin`, `table_detail_page.dart`, `home_page.dart` |
| G-05 | ~~major~~ closed | ~~No calendar / upcoming-sessions list by location or facilitator (RF-26, P-54)~~ Resolved in issue #7: "Calendario" destination for coordinators, administrators and facilitators. Managers read `admin_tables` (pending session) and future cancelled `sessions` online; the facilitator's list is read from the synced `sessions` / `round_tables` / `locations` / `table_members` tables, so it works offline. No new SQL. Only the pending session of each table exists (one-pending invariant), so the list is the next session per table, not a projection of further weekly slots | — | `lib/features/calendar/**`, `tool/e2e/scenarios/calendar.mjs` |
| G-06 | ~~major~~ closed | ~~Alerts are passive and incomplete (RF-25, RF-67, P-101, RNF-24)~~ Resolved in issue #8: `kpi.health_settings` (single row: 70 %, last 3 sessions, 3 people) is the one place for thresholds; `kpi_tables` gains `health_reasons` + `recent_attendance_pct` (reasons only for active tables, live seat count); `table_alert` outbox kind, `app.enqueue_table_alerts()` (cron `gr-table-alerts` daily 13:00 UTC, `POST /notifications/cron/table-alerts`) deduped per table, recipient and ISO week, to the org's coordinators and platform administrators; reason chips in the Explorador and table detail, saved view "Menos de 3 personas", "Baja asistencia" now follows the server reason, alerts card on the manager Home. Decisions: `health` keeps its 4 states (reasons are additive); delayed/inactive tables are not pushed (P-101 stays open for that) | — | `20261029000000_table_health_alerts.sql`, `100_table_health_alerts.test.sql`, `lib/features/home/**`, `lib/features/admin/**`, `tool/e2e/scenarios/health.mjs` |
| G-07 | major | **No monitoring or backup procedure** (RNF-21, RNF-23, RNF-25): only `FlutterError.onError` logging; nothing documents Supabase backup tier/restore or alerting | Add crash/error reporting (e.g. Sentry or Firebase Crashlytics) behind a service contract; write `docs/implementation/operations.md` (backups, restore drill, Edge Function log retention, uptime check) | `lib/app/bootstrap.dart`, `lib/core/services/logging/**`, new doc |
| G-08 | major | **Role-creation matrix deviates from PC-03 text**: coordinators may invite coordinators and any-table members; PC-03 says coordinator creates tables and facilitators, facilitator creates members of own table. P-24/25/27 unanswered | Confirm with stakeholder; if strict, restrict `invite_create` (`coordinator` → platform admin only; `member` → facilitator only, or coordinator for transfers) and add pgTAP cases | `api.sql:673–731`, `pgTAP 030`, `invite_person_page.dart` |
| G-09 | minor | **Curriculum has no versions** (RF-35/36): the editor and upload exist (ADR 0017, audited, history-safe) but there is no "restore previous version" or per-version activation | Add a `curriculum_version` snapshot table if rollbacks are needed | `curriculum_admin.sql`, docs |
| G-10 | minor | **Archival hides history from devices** after 56 days (sync rules filter `archived_at IS NULL`); facilitator/member lose old rows offline (RF-60, RF-55) though server keeps them | Document, or sync archived rows read-only on demand; ensure history views (G-02) read from `kpi_*` online | `powersync/sync-rules.yaml`, `notif.sql:215` |
| G-11 | minor | **7-day offline window (ADR 0005) not enforced or tested**: no check that a device stays usable 7 days without sync nor that stale tokens are handled | Add a test that an offline device with expired JWT can still write and sync later; document token/refresh policy | `lib/core/sync/**`, `tool/e2e/scenarios/offline.mjs` |
| G-12 | minor | **No post-close correction path** (RF-58, RF-75, P-31, P-106/107): a closed session is final beyond `late_grace`; wrong scores cannot be fixed | Needs stakeholder decision; then an audited `api.assessment_correct` for coordinator/admin with visible trace | new api, `member_detail_page.dart` |
| G-13 | minor | **RF-52/RF-54**: no separate score justification input in session UI; "ejemplo" question stays free text (`response_type='person'` unused) | Add optional justification field to the score step; render `person` questions with a roster picker | `lib/features/session/**member_flow/widgets`, `submit_follow_up_use_case.dart` |
| G-14 | minor | **No load/perf evidence** (RNF-16/18) | Seed ~300 tables / 5 000 people and time `kpi_*` RPCs and PowerSync bucket sizes | `supabase/tests`, `scripts/` |
| G-15 | minor | **RF-10 location scoping unused** (`role_assignments.location_id`), P-16 unanswered | Either remove the column from the UI contract or filter coordinator scope by location | `rls.sql`, `kpi.sql`, admin scope |
| G-16 | minor | **Exports CSV only** (RF-68, P-100 unanswered) | Confirm need for Excel/PDF; CSV is Excel-compatible if BOM/`;` are right (verify) | `csv_export_service_impl.dart` |
| G-17 | minor | **Accessibility not verified end to end**: 114 tooltip/semantics occurrences and a contrast test (`test/core/theme/contrast_test.dart`) exist, but no screen-reader pass, no large-text (`TextScaler`) handling or test (P-115 unanswered) | Manual TalkBack/VoiceOver pass; widget tests at textScale 1.5–2.0 on session screens | `lib/core/theme/**`, `test/features/session/presentation` |

## 4. AGENTS.md compliance findings

Method: greps over `lib/**` excluding `*.g.dart`, `*.freezed.dart`, `lib/l10n/gen` (638 hand-written Dart files).

| Rule | Result | Count / examples |
|---|---|---|
| §1/§7 no repository classes | Compliant | 0 `*Repository` types |
| §1 domain independent of Flutter/Drift/Dio/Supabase | Compliant | 0 forbidden imports in `domain/**` |
| §4 Cubit constructors take use cases only | Compliant (33 cubits). Constructor params are all use cases. Cubit files import non-use-case symbols only as constants/models: `InviteAttemptsService.lockDuration` (`code_entry_cubit.dart:68`), `AdminManagementService` and `SessionControlService` type imports (`person_detail_cubit.dart:6`, `session_cubit.dart:15`) | 3 stray imports of domain-service files to reach models/constants |
| §4 widgets don't call services/use cases | Compliant | 7 `getIt<…>` in presentation, all resolving a Cubit for `BlocProvider` (`command_palette.dart:40`, `admin_page_frame.dart:59`, `sign_out_sheet.dart:21`, `context_switcher.dart:25`, `notifications_host.dart:31`, `unsynced_data_banner.dart:20`, `context_chip_slot.dart:24`); 0 imports of `/data/` or infra packages |
| §6 one use case per file, `call(...)` | Compliant | 85 `*_use_case.dart`, 0 files with several classes, 0 use cases outside `use_cases/` |
| §5 state in separate Freezed `*_state.dart` | Not exhaustively checked | spot-checked admin/session/auth pages: present |
| §12 shared controls instead of raw Material | **Minor violations: 21 sites in 14 files** | `TextButton` 9 (`table_form_page.dart:183`, `scan_page.dart:135,143`, `reports_page.dart:231,241`, `drill_down_card.dart:165,171`, `audit_page.dart:173`, `organization_detail_page.dart:612`); `IconButton` 6 (`table_detail_page.dart:591,602,610,615`, `person_detail_page.dart:250`, `auth_flow_layout.dart:170`); `TextField` 5 (`command_palette.dart:239`, `explorer_page.dart:446`, `admin_search_field.dart:48`, `confirm_by_typing_dialog.dart:81`, `invite_code_form_field.dart:89`); `Scaffold` 1 (`auth_flow_layout.dart:43`). Worst: `table_detail_page.dart` (4), then `drill_down_card.dart`, `reports_page.dart`, `scan_page.dart`, `auth_flow_layout.dart` (2 each). `SnackBar`, `ElevatedButton`, `AppBar`, `Image.network` are not used outside `core/widgets` |
| §12 no raw `fontSize` | **3 sites** | `chart_palette.dart:36,39` (11 px), `core/widgets/app_avatar.dart:46` (derived, in shared widget) |
| §12 colors from theme | Minor: 52 `Colors.`/`Color(0x…)` uses in `lib/features` | `seat_view.dart` (7), `provider_button.dart` (7, brand colors, legitimate), `invite_code_form_field.dart` (5), `invite_share_page.dart` (4), `attendance_sheet.dart` (3) |
| §16 no hard-coded user-facing strings | Mostly compliant: no `Text('…')` literals found | Exceptions: `admin_countries.dart` (country names ×5+, user-visible dropdown), `dev_users.dart` labels (dev only), `component_gallery_page.dart` (dev gallery), `explorer_table.dart:70` builds `'Valor … · …'` in code (domain model), `table_form_page.dart:169` hint `'LUZ-07'`; server-side push copy is Spanish literal in SQL (`notif.sql:111–115`), not ARB |
| §13 private StatelessWidget subclasses merely to split trees | **19 private widget classes** | `invites_manager_page.dart` (3), `invite_share_page.dart` (2), `redeem_page.dart` (2), `invite_form_page.dart` (2), one each in `member_peers_strip.dart`, `closing_summary.dart`, `facilitator_session_view.dart`, `invite_code_form_field.dart`; invites feature is the main offender |
| §13/§18 file size | Large files | `facilitator_session_view.dart` 854 lines, `table_detail_page.dart` 688, `reports_page.dart` 683, `redeem_page.dart` 643, `organization_detail_page.dart` 622 |
| §16 inline identifiers | Not systematically checked; route/query keys are in `*Routes` classes (spot-checked) | – |
| §20 verification | Not re-run in this audit | `tool/check.sh` = `flutter analyze` + `flutter test`; 67 test files / ~463 test cases in `test/`, 4 pgTAP files (~110 assertions), Deno tests in `supabase/functions/_shared`, 7 e2e scenarios. Results not re-executed here |

## 5. Test and evidence coverage notes

- Strong: score/5 rule, follow-up once, late sync, auto-attendance, 9-seat limit, RLS isolation, invite flow, reveal audit (pgTAP 010–040 + e2e).
- Thin or missing: notification content/delivery (no pgTAP/e2e for `enqueue_*` or the function), health/alert states (`mv_table_status.health` has no pgTAP), CSV export content, `table_update` schedule/current-value branches (partially pgTAP 030), accessibility, performance, real social providers.
