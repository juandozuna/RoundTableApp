// Scenario d — a member goes offline mid-session, answers everything, the facilitator closes the
// session, and the member comes back online: their rows upload through PowerSync and are flagged
// "Sincronizado tarde". While the upload is held back, the downloaded server state (session closed)
// must not overwrite the member's unsynced local rows.
import { App, check, sleep } from '../lib.mjs';
import { memberCommitment, memberFollowUp, memberValue, openSessionScreen, resetDemoSession, sql } from '../flows.mjs';

const SESSION = "md5('gold-roundtables:session:luz-03:4')::uuid";
const LUIS = "md5('gold-roundtables:person:luis')::uuid";

const luisRows = (table) => Number(sql(`select count(*) from ${table} where session_id = ${SESSION} and person_id = ${LUIS}`));
const lateRows = () =>
  Number(sql(`select count(*) from (
    select synced_late from member_assessments where session_id = ${SESSION} and person_id = ${LUIS}
    union all select synced_late from member_answers where session_id = ${SESSION} and person_id = ${LUIS}
    union all select synced_late from member_commitments where session_id = ${SESSION} and person_id = ${LUIS}) x where synced_late`));

async function untilTrue(fn, timeout = 60_000) {
  const deadline = Date.now() + timeout;
  while (Date.now() < deadline) {
    if (fn()) return true;
    await sleep(1000);
  }
  return false;
}

export async function offline(browser) {
  resetDemoSession();
  const facil = await App.open(browser, 'facilitador');
  const luis = await App.open(browser, 'luis');
  try {
    await facil.devSignIn('facil');
    await luis.devSignIn('luis');
    await facil.waitFor('Abrir sesión', { role: 'button' });
    await openSessionScreen(facil);
    await openSessionScreen(luis);
    await facil.click('Abrir sesión', { role: 'button' });
    await facil.click('Marcar a todos Presente', { role: 'button' });
    await facil.click('Abrir seguimiento', { role: 'button' });
    check('member is live on the follow-up stage', await luis.seen('TU COMPROMISO DE LA SEMANA PASADA', 15_000));

    await luis.setOffline(true);
    check('member sees the offline banner and self-paced mode', (await luis.seen('Sin conexión · todo se guarda en este teléfono', 10_000)) && (await luis.has('A tu ritmo')));
    await luis.shot('d-01-member-offline');

    await memberFollowUp(luis, { score: 9, note: 'Offline: lo cumplí' });
    await memberValue(luis, { why: 'Sin red también cumplo', who: 'Mi tío', situation: 'Viaje sin señal', score: 6 });
    await memberCommitment(luis, { what: 'Llamar a mi tío cada domingo', when: 'Lunes y jueves', how: 'Cuántas veces lo hice' });
    await luis.shot('d-02-member-answered-offline');
    check('answers are held on the phone, none on the server yet', luisRows('member_assessments') === 0 && luisRows('member_answers') === 0 && luisRows('member_commitments') === 0);

    // Facilitator closes the session while Luis is still offline.
    await facil.click('Abrir valor actual', { role: 'button' });
    await facil.click('Abrir ahora', { role: 'button', last: true });
    await facil.click('Cerrar respuestas', { role: 'button' });
    await facil.click('Cerrar de todos modos', { role: 'button' });
    await facil.click('Cerrar sesión', { role: 'button' });
    await facil.click('Cerrar sesión', { role: 'button', last: true });
    check('server: session closed while the member was offline', await untilTrue(() => sql(`select status from sessions where id = ${SESSION}`) === 'closed', 15_000));
    check('server: still no rows from the offline member', luisRows('member_assessments') === 0 && luisRows('member_commitments') === 0);

    // Back online, but hold the upload so the download (closed session) lands first.
    const release = await luis.blockRequests('sync-upload');
    await luis.setOffline(false);
    await sleep(8000);
    await luis.shot('d-03-member-online-upload-held');
    const held = await luis.text();
    check('server copy did not overwrite the unsynced local rows (answers still on the phone)',
      held.includes('Llamar a mi tío cada domingo') && held.includes('Sin red también cumplo'), held.slice(0, 600));
    check('server: rows still absent while the upload is held', luisRows('member_assessments') === 0);

    await release();
    const synced = await untilTrue(() => luisRows('member_assessments') === 2 && luisRows('member_answers') === 3 && luisRows('member_commitments') === 1, 90_000);
    check('rows upload after the upload is released (2 scores, 3 answers, 1 commitment)', synced);
    check('server: every uploaded row is flagged synced_late', lateRows() === 6, `late=${lateRows()}`);
    check('server: stored values are the offline ones', sql(`select score from member_assessments where session_id = ${SESSION} and person_id = ${LUIS} and kind = 'follow_up'`) === '9'
      && sql(`select action_text from member_commitments where session_id = ${SESSION} and person_id = ${LUIS}`).startsWith('Llamar a mi tío cada domingo'));
    check('member sees "Sincronizado tarde"', await luis.seen(/Sincronizado tarde|Sincronizó tarde/i, 30_000), (await luis.text()).slice(0, 500));
    await luis.shot('d-04-member-synced-late');
    await luis.dump();
  } finally {
    await facil.close();
    await luis.close();
  }
}
