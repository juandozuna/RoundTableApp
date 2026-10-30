// Scenario — schedule exceptions (RF-23, RF-30, issue #6): an effective-dated schedule change keeps
// its history, a single session is rescheduled, an extraordinary one is added and one is cancelled
// (the value does not advance). Administration through the real API as each role, the coordinator's
// table detail and the facilitator's and a member's Home through the UI.
import { App, check, sleep } from '../lib.mjs';
import { openTableFromExplorer, resetDemoSession, sql, supabaseKeys } from '../flows.mjs';

const TABLE = "(select id from round_tables where code = 'LUZ-03')";

export async function tokenFor(email) {
  const { url, anon } = supabaseKeys();
  const login = await fetch(`${url}/auth/v1/token?grant_type=password`, {
    method: 'POST',
    headers: { apikey: anon, 'Content-Type': 'application/json' },
    body: JSON.stringify({ email, password: 'dev-password-123' }),
  });
  return (await login.json()).access_token;
}

/** Calls the admin Edge Function as a dev account; returns { status, code, json }. */
export async function adminAs(email, method, path, body) {
  const { url, anon } = supabaseKeys();
  const response = await fetch(`${url}/functions/v1/admin/${path}`, {
    method,
    headers: { apikey: anon, Authorization: `Bearer ${await tokenFor(email)}`, 'Content-Type': 'application/json' },
    body: JSON.stringify(body),
  });
  const json = await response.json();
  return { status: response.status, code: json.error?.code, json };
}

/** `YYYY-MM-DDTHH:MM` wall clock in Santo Domingo (UTC-4, no DST), `days` from now. */
export function localInDays(days, hhmm) {
  const day = new Date(Date.now() + days * 86_400_000 - 4 * 3_600_000);
  return `${day.toISOString().slice(0, 10)}T${hhmm}`;
}

const pending = (columns) => sql(`select ${columns} from sessions where round_table_id = ${TABLE} and status in ('scheduled','open')`);
const pendingCount = () => Number(sql(`select count(*) from sessions where round_table_id = ${TABLE} and status in ('scheduled','open')`));
const audit = (event) => Number(sql(`select count(*) from audit_events where event_type = '${event}' and (entity_id = ${TABLE} or entity_id in (select id from sessions where round_table_id = ${TABLE}))`));

/** Puts the demo table back in its default shape (extra sessions, schedule history). */
function restore() {
  resetDemoSession();
}

export async function schedule(browser) {
  restore();
  // The audit trail is append-only, so count what this run adds.
  const auditBase = {};
  const added = (event) => audit(event) - (auditBase[event] ??= audit(event));
  for (const event of ['session.rescheduled', 'session.extraordinary_added', 'session.cancelled']) added(event);
  const sessionId = pending('id');
  const valueBefore = sql(`select current_value_id from round_tables where id = ${TABLE}`);
  const tableId = sql(`select id from round_tables where code = 'LUZ-03'`);

  // ── Roles: only the organization's admin / coordinator may change the calendar ──────────────────
  const slot = localInDays(8, '19:00');
  const asFacilitator = await adminAs('facil@dev.local', 'POST', `sessions/${sessionId}/reschedule`, { scheduled_local: slot });
  check('API: a facilitator cannot reschedule → 403 forbidden', asFacilitator.status === 403 && asFacilitator.code === 'forbidden', JSON.stringify(asFacilitator.json));
  const asMember = await adminAs('ana@dev.local', 'POST', `sessions/${sessionId}/cancel`, { reason: 'holiday' });
  check('API: a member cannot cancel → 403 forbidden', asMember.status === 403 && asMember.code === 'forbidden', JSON.stringify(asMember.json));
  const asOtherOrg = await adminAs('coord.horizonte@seed.local', 'POST', `tables/${tableId}/extra-session`, { scheduled_local: slot });
  check('API: a coordinator of another organization cannot add a session → 403 forbidden', asOtherOrg.status === 403 && asOtherOrg.code === 'forbidden', JSON.stringify(asOtherOrg.json));
  check('server: denied requests changed nothing', pending('kind') === 'regular' && added('session.rescheduled') === 0);

  // ── Validation ───────────────────────────────────────────────────────────────────────────────────
  const past = await adminAs('coord@dev.local', 'POST', `sessions/${sessionId}/reschedule`, { scheduled_local: localInDays(-2, '19:00') });
  check('API: a past date → 422 schedule_in_past', past.status === 422 && past.code === 'schedule_in_past', JSON.stringify(past.json));
  const badReason = await adminAs('coord@dev.local', 'POST', `sessions/${sessionId}/cancel`, { reason: 'vacation' });
  check('API: an unknown cancel reason → 422 validation_failed', badReason.status === 422, JSON.stringify(badReason.json));

  // ── Reschedule one session ───────────────────────────────────────────────────────────────────────
  const regularSlot = pending('scheduled_at');
  const moved = await adminAs('coord@dev.local', 'POST', `sessions/${sessionId}/reschedule`, { scheduled_local: slot, reason: 'Retiro de la iglesia' });
  check('API: a coordinator reschedules the pending session', moved.status === 200, JSON.stringify(moved.json));
  check('server: the session moved, remembers the regular slot and is still the only pending one',
    pending('scheduled_at') !== regularSlot && pending('original_scheduled_at') === regularSlot && pendingCount() === 1);
  check('server: rescheduling is audited', added('session.rescheduled') === 1);

  // ── Effective-dated schedule change keeps its history ────────────────────────────────────────────
  const effective = new Date(Date.now() + 30 * 86_400_000).toISOString().slice(0, 10);
  const versionsBefore = Number(sql(`select count(*) from table_schedule_versions where round_table_id = ${TABLE}`));
  const weekdayBefore = sql(`select weekday from round_tables where id = ${TABLE}`);
  const changed = await adminAs('coord@dev.local', 'PATCH', `tables/${tableId}`, { weekday: 4, start_time: '18:30', schedule_effective_from: effective });
  check('API: a future-dated schedule change is accepted', changed.status === 200, JSON.stringify(changed.json));
  check('server: the new schedule is kept as history, not applied yet, and the pending session did not move',
    Number(sql(`select count(*) from table_schedule_versions where round_table_id = ${TABLE}`)) === versionsBefore + 1
      && sql(`select weekday from round_tables where id = ${TABLE}`) === weekdayBefore
      && pending('original_scheduled_at') === regularSlot);
  const stale = await adminAs('coord@dev.local', 'PATCH', `tables/${tableId}`, { start_time: '08:00', schedule_effective_from: '2020-01-01' });
  check('API: an effective date in the past → 422 schedule_effective_in_past', stale.status === 422 && stale.code === 'schedule_effective_in_past', JSON.stringify(stale.json));

  // ── Coordinator: table detail shows the calendar, the history and the reschedule dialog ─────────
  const coord = await App.open(browser, 'coord-calendario');
  try {
    await coord.devSignIn('coord');
    await coord.click('Coordinador, Fundación Luz', { role: 'button' });
    await coord.waitFor('Estás como Coordinador, Fundación Luz', { timeout: 20_000 });
    await coord.click('Mesas', { role: 'button' });
    await openTableFromExplorer(coord, 'Esperanza');
    check('table detail: the pending session card shows its date and the three actions', await coord.seen(/\d{2}\/\d{2}\/\d{4} \d{2}:\d{2}/, 10_000) && await coord.has('Cancelar sesión') && await coord.has('Sesión extraordinaria'));
    check('table detail: the session is marked as rescheduled and shows the previous slot', await coord.has('Reprogramada') && await coord.has('Antes:'), (await coord.text()).slice(0, 600));
    check('table detail: the schedule history lists the upcoming version', await coord.has(/Desde \d{2}\/\d{2}\/\d{4}/) && await coord.has('Programado'));
    await coord.shot('s-01-table-detail-calendar');
    await coord.click('Reprogramar', { role: 'button' });
    check('the reschedule dialog asks for date and time', await coord.seen('Reprogramar la sesión', 8000) && await coord.has('Fecha y hora'));
    await coord.shot('s-02-reschedule-dialog');
    await coord.click('Reprogramar', { role: 'button', last: true });
    check('confirming the unchanged date is refused with a plain message', await coord.seen('Elige una fecha distinta a la actual.', 10_000));
    check('server: the refused reschedule changed nothing', pending('scheduled_at') !== regularSlot && added('session.rescheduled') === 1);

    // ── Extraordinary session (API), then both homes ──────────────────────────────────────────────
    const late = await adminAs('coord@dev.local', 'POST', `tables/${tableId}/extra-session`, { scheduled_local: localInDays(20, '10:00') });
    check('API: an extra session after the next one → 422 extra_session_not_before_next', late.status === 422 && late.code === 'extra_session_not_before_next', JSON.stringify(late.json));
    const extra = await adminAs('coord@dev.local', 'POST', `tables/${tableId}/extra-session`, { scheduled_local: localInDays(2, '10:00'), reason: 'Retiro especial' });
    check('API: a coordinator adds an extraordinary session', extra.status === 201, JSON.stringify(extra.json));
    check('server: it takes the pending slot, the invariant holds and nothing is audited twice',
      pending('kind') === 'extraordinary' && pendingCount() === 1 && added('session.extraordinary_added') === 1);
    const second = await adminAs('coord@dev.local', 'POST', `tables/${tableId}/extra-session`, { scheduled_local: localInDays(1, '10:00') });
    check('API: a second extraordinary session → 409 extra_session_exists', second.status === 409 && second.code === 'extra_session_exists', JSON.stringify(second.json));

    const facil = await App.open(browser, 'facil-calendario');
    const ana = await App.open(browser, 'ana-calendario');
    try {
      await facil.devSignIn('facil');
      await ana.devSignIn('ana');
      check('facilitator Home marks the extraordinary session', await facil.seen('Sesión extraordinaria', 45_000), (await facil.text()).slice(0, 500));
      check('member Home marks the extraordinary session', await ana.seen('Sesión extraordinaria', 45_000), (await ana.text()).slice(0, 500));
      await facil.shot('s-03-home-facilitator-extra');
      await ana.shot('s-04-home-member-extra');

      // ── Cancel the pending session from the table detail: the value does not advance ────────────
      await coord.goto('/');
      await coord.click('Mesas', { role: 'button' });
      await openTableFromExplorer(coord, 'Esperanza');
      check('table detail: the extraordinary session is badged', await coord.seen(/extraordinaria/i, 10_000));
      const cancelledId = pending('id');
      await coord.click('Cancelar sesión', { role: 'button' });
      check('the cancel dialog says the value does not advance', await coord.seen('Cancelar esta sesión', 8000) && await coord.has('mismo valor'));
      await coord.shot('s-05-cancel-dialog');
      await coord.click('Motivo *', { role: 'button' });
      await coord.click('Feriado', { role: 'menuitem' });
      await coord.click('Cancelar sesión', { role: 'button', last: true });
      check('a toast confirms the cancellation', await coord.seen('Sesión cancelada. La próxima trabajará el mismo valor.', 15_000));
      await sleep(1000);
      check('server: the session is cancelled as a holiday', sql(`select status || ':' || cancelled_reason from sessions where id = '${cancelledId}'`) === 'cancelled:holiday');
      check('server: the table keeps its value and still has exactly one pending session', sql(`select current_value_id from round_tables where id = ${TABLE}`) === valueBefore && pendingCount() === 1 && pending('id') !== cancelledId);
      check('server: the next session works the same value', pending('value_id') === valueBefore);
      check('server: the cancellation is audited with the reason and no value advance',
        sql(`select payload->>'reason' || ':' || (payload->>'value_advances') from audit_events where event_type = 'session.cancelled' and entity_id = '${cancelledId}' order by created_at desc limit 1`) === 'holiday:false');
      await coord.shot('s-06-after-cancel');

      check('member Home explains the cancelled session', await ana.seen('Se canceló la sesión del', 45_000), (await ana.text()).slice(0, 500));
      await ana.shot('s-07-home-member-cancelled');
    } finally {
      await facil.close();
      await ana.close();
    }
  } finally {
    await coord.close();
    restore();
  }
}
