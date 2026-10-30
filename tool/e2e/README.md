# End-to-end tests (headless Chrome)

Drives the **real web build** against the **real local stack** (Supabase + PowerSync + the app in
nginx) with `puppeteer-core`. Nothing is mocked: sign-in uses the dev accounts, the live session
replicates through PowerSync, and uploads go through the `sync-upload` Edge Function.

Flutter renders on a canvas, so the driver (`lib.mjs`) switches on Flutter's accessibility tree and
finds controls by their visible Spanish text. Screenshots of key states land in `/tmp/e2e/shots`
(`E2E_SHOTS` to change). Chrome is `/Applications/Google Chrome.app/…` (`CHROME_PATH` to change).

## Run

```bash
bash scripts/dev-up.sh --local-web      # stack + web build with DEV_AUTH=true and every AUTH_METHODS (repo root)
bash scripts/smoke.sh                   # optional: stack sanity check

cd tool/e2e
npm install                             # once; node_modules is git-ignored
node run.mjs                            # every scenario, in order
node run.mjs live-session offline       # only some
E2E_HEADED=1 node run.mjs sign-in       # watch the browser
```

Needs: Docker, Supabase CLI (the scenarios read keys with `supabase status` and talk to the
database through `docker exec … psql`), Node ≥ 18, Google Chrome. For a clean slate run
`bash scripts/dev-reset.sh --yes` first; scenarios also reset the demo session themselves
(`scripts/dev-open-session.sh`) and use unique names, so most can be repeated without a reset.
Run `scripts/dev-reset.sh --yes` again afterwards to remove what they created.

## Scenarios (`scenarios/`)

| Name | Covers |
|---|---|
| `sign-in` | Dev sign-in as admin, facilitator and three members: home, navigation tabs, context chip; coordinator role picker and context switching; sign-out; redirect guard for signed-out visitors and "Sin permiso" for a member on `/admin`; email + password form: validation, sign-up (signed in at once), wrong password, sign-in, reset request (ADR 0018) |
| `invites` | Facilitator and coordinator create invitations; a brand-new account previews and redeems one and lands in the invited context; expired, revoked, used and unknown codes; role matrix (ADR 0016): denied API cases (`invite_role_forbidden`, `invite_table_forbidden`) and locked role options in the form per inviter |
| `live-session` | Two browsers (facilitator + member): open session, attendance, follow-up, reflection, score 5 blocked, a `person` question answered by picking a table member (RF-54) or typing another name, commitment by the member **and** the facilitator-as-participant, draft survives a reload, close answers, close session, summaries, server rows, KPIs afterwards |
| `offline` | Member goes offline mid-session and answers everything; facilitator closes the session; member reconnects with uploads held back (the downloaded server state must not overwrite unsynced rows), then uploads → rows flagged `synced_late` and "Sincronizado tarde" |
| `admin` | Explorer, views, filters, saved view (persisted), create table / organization / location, change facilitator, program value picker with rewind confirmation (RF-28), 9-seat limit, reveal answers (audited), reports + drill-down, audit log |
| `schedule` | Schedule exceptions (RF-23, RF-30): roles on the API (facilitator / member / other organization denied), past dates and unknown reasons refused, a coordinator reschedules a session (regular slot remembered, audited), a future-dated schedule change is kept as history without moving earlier sessions, an extraordinary session takes the pending slot (one pending session), table detail card / history / dialogs, cancelling a session from the UI (value does not advance, same value next), facilitator and member Home markers |
| `calendar` | Upcoming-sessions calendar (RF-26): a coordinator sees every table's next session on the table's own clock (19:00 table time) with rescheduled / extraordinary / cancelled markers, filters by location and table, opens a table from a card and returns; a facilitator sees only their table's list, also offline; a member has no Calendario |
| `health` | Table health alerts (RF-25, RF-67): `table_alert` rows queued once per table/recipient/week (coordinator of the org + administrators, nobody else), the coordinator's Home alerts card, the reason chip in the Explorador and table detail, and the "Menos de 3 personas" saved view |
| `isolation` | A coordinator never sees another organization (explorer, deep links, reports, audit) and neither does the data API under the same token |
| `history` | Member sees "Mi progreso" from the local tables (also offline, with the 8-week window note); facilitator sees the table history and opens a member timeline and goes back; a session closed before the answers stage is marked `incomplete` by the server (audited, follow-up still held once) and shows "Incompleta" in the table history and the member's progress (also offline) and in the admin reports tile |
| `responsive` | Sign-in, admin and member screens at 390 / 820 / 1280 px in light and dark: navigation placement, nothing laid out beyond the viewport, screenshots |

Exit code is non-zero when any check fails.

## Writing more

`lib.mjs` — `App.open(browser, name, {width, height, dark})` gives an isolated browser context;
`app.click(text, {role})`, `app.fill(label, value)`, `app.seen(text)`, `app.waitFor(text)`,
`app.setOffline(true)`, `app.blockRequests(urlFragment)`, `app.shot(name)`, `app.dump()` (prints the
accessibility tree, the quickest way to find a label). `flows.mjs` — the session flows plus
`sql()` (psql in the Supabase DB container) and `resetDemoSession()`.
