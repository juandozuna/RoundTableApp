// Scenario — progress and history: a member sees their own history (read online through
// PostgREST, ADR 0019), the facilitator sees the table history and opens a member's timeline.
// Run after `live-session` (or on the seeded demo data); the checks do not depend on how many
// closed sessions fall inside the 8-week window the devices sync.
import { App, check, sleep } from '../lib.mjs';
import { refreshKpis, resetDemoSession, sql } from '../flows.mjs';

/** The lists sit below the charts and are built lazily: scroll the page down so they exist. */
async function scrollDown(app) {
  const { height, width } = app.page.viewport();
  await app.page.mouse.move(width / 2, height / 2);
  for (let i = 0; i < 6; i++) {
    await app.page.mouse.wheel({ deltaY: 900 });
    await sleep(250);
  }
}

const TAB = /^Progreso(\s*\n?Pestaña.*)?$/;

export async function history(browser) {
  resetDemoSession();
  const ana = await App.open(browser, 'ana-historial');
  const facil = await App.open(browser, 'facilitador-historial');
  try {
    await ana.devSignIn('ana');
    await ana.waitFor('Estás como Miembro', { timeout: 30_000 });
    await ana.click(TAB, { role: ['button', 'tab'] });
    check('member opens "Mi progreso"', await ana.seen('Mi progreso', 20_000));
    check('the 8-week window is explained', await ana.seen('últimas 8 semanas', 10_000));
    check('member sees history or the gentle empty state', (await ana.has('Por valor')) || (await ana.has('Sesiones')) || (await ana.has('Todavía no hay historial')) || (await ana.has('Aquí verás tu progreso')));
    check('member sees only their own screen, not the table roster', !(await ana.has('Integrantes')));
    await ana.shot('h-01-member-progress');

    // Online only (ADR 0019): going offline shows the offline state; nothing is promised from a device copy.
    await ana.setOffline(true);
    check('offline banner appears', await ana.seen('Sin conexión', 15_000));
    await ana.shot('h-02-member-progress-offline');
    await ana.setOffline(false);

    await facil.devSignIn('facil');
    await facil.waitFor('Estás como Facilitador', { timeout: 30_000 });
    await facil.click(TAB, { role: ['button', 'tab'] });
    check('facilitator opens the table history', await facil.seen('Progreso de la mesa', 20_000));
    check('facilitator sees the members of the table', await facil.seen('Integrantes', 10_000));
    await facil.shot('h-03-facilitator-progress');

    await facil.click('Ana Lucía Méndez', { role: 'button' });
    check('facilitator opens one member\'s timeline', await facil.seen('Recorrido de Ana Lucía Méndez', 15_000));
    await facil.shot('h-04-member-timeline');
    await facil.click('Volver', { role: 'button' });
    check('back returns to the table history', await facil.seen('Progreso de la mesa', 10_000));
    await sleep(300);

    // Incomplete session (RF-50): the facilitator's close happens before the answers stage, as the
    // sessions function applies it (same SQL as the Edge Function), so the server marks it.
    const SESSION = "md5('gold-roundtables:session:luz-03:4')::uuid";
    const FACIL = "md5('gold-roundtables:user:facil')::uuid";
    check('no session is marked incomplete before', !(await facil.has('Incompleta')) && !(await ana.has('Incompleta')));
    sql(`select api.session_change(${FACIL}, ${SESSION}, '{"status":"open","stage":"attendance"}'::jsonb)`);
    sql(`select api.session_change(${FACIL}, ${SESSION}, '{"status":"closed"}'::jsonb)`);
    check('server: closed early → incomplete / closed_early',
      sql(`select completion || '/' || incomplete_reason from sessions where id = ${SESSION}`) === 'incomplete/closed_early');
    check('server: the close is audited with its completion',
      sql(`select payload->>'completion' from audit_events where entity_id = ${SESSION} and event_type = 'session.closed' order by created_at desc limit 1`) === 'incomplete');
    check('server: the next session still follows up this value once',
      sql(`select count(*) from sessions n join sessions c on c.id = ${SESSION} where n.round_table_id = c.round_table_id and n.status = 'scheduled' and n.follow_up_value_id = c.value_id`) === '1');
    await scrollDown(facil);
    check('facilitator sees the session marked "Incompleta" in the table history', await facil.seen('Incompleta', 20_000));
    await facil.shot('h-05-incomplete-table-history');
    await scrollDown(ana);
    check('member sees it marked "Incompleta" in their progress', await ana.seen('Incompleta', 20_000));
    await ana.shot('h-05-incomplete-member-progress');

    // KPIs: the reports headline counts incomplete sessions.
    refreshKpis();
    const admin = await App.open(browser, 'admin-historial');
    try {
      await admin.devSignIn('admin');
      await admin.click('Informes', { role: 'button' });
      await admin.waitFor(/VALORES COMPLETADOS/, { timeout: 20_000 });
      check('reports show the incomplete-sessions KPI', await admin.seen(/Sesiones incompletas: [1-9]/, 10_000));
      await admin.shot('h-06-reports-incomplete');
    } finally {
      await admin.close();
    }
    resetDemoSession();
  } finally {
    await ana.close();
    await facil.close();
  }
}
