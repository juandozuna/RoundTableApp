// Scenario — calendar of upcoming sessions (RF-26, issue #7): a coordinator sees every table's next
// session on the table's own clock with the extraordinary / rescheduled / cancelled markers and
// filters by location and table; a facilitator sees only their table, also offline; a member has
// no Calendario.
import { App, check } from '../lib.mjs';
import { resetDemoSession, sql } from '../flows.mjs';
import { adminAs, localInDays } from './schedule.mjs';

const ORG = "(select id from organizations where name = 'Fundación Luz')";
const TABLE = "(select id from round_tables where code = 'LUZ-03')";
const pendingFor = (where) => Number(sql(`select count(*) from sessions s join round_tables t on t.id = s.round_table_id where s.status in ('scheduled','open') and t.status = 'active' and t.organization_id = ${ORG} ${where}`));

/** `1 sesión` / `N sesiones`, as the page shows it. */
const countLabel = (n) => (n === 1 ? '1 sesión' : `${n} sesiones`);

export async function calendar(browser) {
  resetDemoSession();
  const sessionId = sql(`select id from sessions where round_table_id = ${TABLE} and status in ('scheduled','open')`);
  const tableId = sql(`select id from round_tables where code = 'LUZ-03'`);
  const timezone = sql(`select timezone from round_tables where id = ${TABLE}`);
  const location = sql(`select l.name from round_tables t join locations l on l.id = t.location_id where t.id = ${TABLE}`);

  // Reschedule Esperanza to 19:00 on its own clock: the card must show 19:00 whatever zone this
  // machine is in.
  const moved = await adminAs('coord@dev.local', 'POST', `sessions/${sessionId}/reschedule`, { scheduled_local: localInDays(3, '19:00') });
  check('API: the pending session is rescheduled to 19:00 table time', moved.status === 200, JSON.stringify(moved.json));
  const total = pendingFor('');

  const coord = await App.open(browser, 'coord-calendario-lista');
  try {
    await coord.devSignIn('coord');
    await coord.click('Coordinador, Fundación Luz', { role: 'button' });
    await coord.waitFor('Estás como Coordinador, Fundación Luz', { timeout: 20_000 });
    await coord.click('Calendario', { role: 'button' });
    check('coordinator: the calendar lists every table with a pending session', await coord.seen(countLabel(total), 20_000), (await coord.text()).slice(0, 500));
    check('coordinator: Mesa Esperanza 03 shows 19:00 on its own clock, its zone, place and facilitator',
      await coord.has('Mesa Esperanza 03') && await coord.has('19:00') && await coord.has(`Hora de la mesa · ${timezone}`) && await coord.has(location),
      (await coord.text()).slice(0, 600));
    check('coordinator: the rescheduled session is marked with its previous slot', await coord.has(/Reprogramada · antes \d{2}\/\d{2} \d{2}:\d{2}/));
    check('coordinator: the three filters are there', await coord.has('Ubicación') && await coord.has('Facilitador') && await coord.has('Mesa'));
    await coord.shot('g-01-calendar-coordinator');

    // Filter by location: the count follows the server rows of that location.
    const inLocation = pendingFor(`and t.location_id = (select location_id from round_tables where code = 'LUZ-03')`);
    await coord.chooseFromMenu('Ubicación', location);
    check('coordinator: filtering by location narrows the list', await coord.seen(countLabel(inLocation), 8000), (await coord.text()).slice(0, 400));
    await coord.shot('g-02-calendar-filtered');
    await coord.click('Limpiar filtros', { role: 'button' });
    check('coordinator: clearing the filters brings every session back', await coord.seen(countLabel(total), 8000));

    // Table filter down to one card.
    await coord.chooseFromMenu('Mesa', 'Mesa Esperanza 03');
    check('coordinator: filtering by table shows only that table', await coord.seen('1 sesión', 8000));
    await coord.click('Limpiar filtros', { role: 'button' });

    // Extraordinary and cancelled markers.
    const extra = await adminAs('coord@dev.local', 'POST', `tables/${tableId}/extra-session`, { scheduled_local: localInDays(2, '10:00'), reason: 'Retiro especial' });
    check('API: an extraordinary session is added', extra.status === 201, JSON.stringify(extra.json));
    const extraId = sql(`select id from sessions where round_table_id = ${TABLE} and status in ('scheduled','open')`);
    const cancelled = await adminAs('coord@dev.local', 'POST', `sessions/${extraId}/cancel`, { reason: 'holiday' });
    check('API: the extraordinary session is cancelled', cancelled.status === 200, JSON.stringify(cancelled.json));
    await coord.goto('/');
    await coord.click('Calendario', { role: 'button' });
    check('coordinator: a cancelled meeting is listed as Cancelada, with the next regular one',
      await coord.seen('Cancelada', 20_000) && await coord.has('Mesa Esperanza 03'), (await coord.text()).slice(0, 600));
    await coord.shot('g-03-calendar-cancelled');

    // Tapping a card opens the table; back returns to the calendar.
    await coord.click('Abrir la mesa Mesa Esperanza 03', { role: 'button', nth: 0 });
    check('coordinator: a card opens the table detail', await coord.seen(/LUZ-03 · Mesa Esperanza 03/, 15_000));
    await coord.click('Volver', { role: 'button' });
    check('coordinator: back returns to the calendar', await coord.seen('Próximas sesiones', 10_000));
  } finally {
    await coord.close();
  }

  // ── Facilitator: only their own table, and still there offline ───────────────────────────────────
  const facil = await App.open(browser, 'facil-calendario-lista');
  try {
    await facil.devSignIn('facil');
    await facil.click('Calendario', { role: 'button' });
    check('facilitator: sees their own table\'s upcoming sessions', await facil.seen('Mesa Esperanza 03', 30_000) && await facil.seen('Cancelada', 10_000), (await facil.text()).slice(0, 500));
    check('facilitator: no filters and no other table', !(await facil.has('Ubicación')) && !(await facil.has('Mesa Fe 01')));
    await facil.shot('g-04-calendar-facilitator');
    await facil.setOffline(true);
    // No page reload offline: leave the calendar and come back, so a fresh cubit reads the device.
    await facil.click('Inicio', { role: 'button' });
    await facil.click('Calendario', { role: 'button' });
    check('facilitator: the list is still there offline, from the local data', await facil.seen('Mesa Esperanza 03', 20_000) && await facil.seen('Sin conexión', 10_000), (await facil.text()).slice(0, 500));
    await facil.shot('g-05-calendar-facilitator-offline');
    await facil.setOffline(false);
  } finally {
    await facil.close();
  }

  // ── Member: no Calendario ────────────────────────────────────────────────────────────────────────
  const ana = await App.open(browser, 'ana-calendario-lista');
  try {
    await ana.devSignIn('ana');
    check('member: there is no Calendario destination', !(await ana.has('Calendario')), (await ana.text()).slice(0, 300));
  } finally {
    await ana.close();
    resetDemoSession();
  }
}
