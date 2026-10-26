// Scenario — progress and history: a member sees their own history from the synced local tables
// (also offline), the facilitator sees the table history and opens a member's timeline.
// Run after `live-session` (or on the seeded demo data); the checks do not depend on how many
// closed sessions fall inside the 8-week window the devices sync.
import { App, check, sleep } from '../lib.mjs';
import { resetDemoSession } from '../flows.mjs';

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

    // Offline: the history keeps showing what the device holds.
    await ana.setOffline(true);
    check('offline banner appears and the history stays', (await ana.seen('Sin conexión', 15_000)) && (await ana.has('últimas 8 semanas')));
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
  } finally {
    await ana.close();
    await facil.close();
  }
}
