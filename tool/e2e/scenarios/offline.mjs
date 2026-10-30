// Scenario d — online-only behavior (ADR 0019). A member loses the connection mid-session: the app
// shows the offline state, refuses the write with a plain message, keeps what the member typed and
// queues nothing (the server stays empty even after reconnecting). After reconnecting the same
// write succeeds, nothing is flagged late, and the facilitator's screen and the server show it.
import { App, check, sleep } from '../lib.mjs';
import { memberCommitment, memberValue, openSessionScreen, resetDemoSession, sql } from '../flows.mjs';

const SESSION = "md5('gold-roundtables:session:luz-03:4')::uuid";
const LUIS = "md5('gold-roundtables:person:luis')::uuid";

// Texts the app must show (lib/l10n/app_es.arb): the offline banner ("Sin conexión · …") and the
// refusal of a write, which reuses the network error `errorNetwork`.
const OFFLINE_STATE = /Sin conexión/;
const WRITE_REFUSED = /No hay conexión con el servidor|Revisa tu internet/;
// No accents: puppeteer's typing drops them in Flutter's text field on this setup.
const NOTE = 'Offline: lo cumpli casi todo';

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

async function untilAsync(fn, timeout) {
  const deadline = Date.now() + timeout;
  while (Date.now() < deadline) {
    if (await fn()) return true;
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

    // ── Offline: the state is explicit and the write is refused ────────────────────────────────
    await luis.setOffline(true);
    check('member sees the offline state', await luis.seen(OFFLINE_STATE, 15_000));
    await luis.shot('d-01-member-offline');

    await luis.waitFor('¿Cómo te fue?', { timeout: 30_000 });
    await luis.click('Lo cumplí', { role: 'radio' });
    await luis.fill('Cuéntanos en una frase', NOTE);
    await luis.click('Puntaje 9', { role: 'button' });
    await luis.click('Enviar seguimiento', { role: 'button' });
    check('the write is refused with a plain message', await luis.seen(WRITE_REFUSED, 15_000), (await luis.text()).slice(0, 500));
    check('the typed text is still in the form', (await luis.fieldValue('Cuéntanos en una frase')) === NOTE);
    check('server: nothing was written', luisRows('member_assessments') === 0 && luisRows('member_answers') === 0);
    await luis.shot('d-02-write-refused');

    // ── Reconnect: nothing was queued, so the server stays empty until the member sends again ──
    await luis.setOffline(false);
    await sleep(12_000); // two polls and any retry a hidden queue would have made
    check('nothing was queued: still no rows after reconnecting', luisRows('member_assessments') === 0 && luisRows('member_answers') === 0 && luisRows('member_commitments') === 0);
    check('the offline state goes away on its own', await untilAsync(async () => !(await luis.has(OFFLINE_STATE)), 20_000));
    check('the draft survived the outage', (await luis.fieldValue('Cuéntanos en una frase')) === NOTE);

    await luis.click('Enviar seguimiento', { role: 'button' });
    check('the same write succeeds online (follow-up score stored)',
      await untilTrue(() => sql(`select score from member_assessments where session_id = ${SESSION} and person_id = ${LUIS} and kind = 'follow_up'`) === '9', 30_000));
    check('other screens show it: the facilitator sees Luis answered', await facil.seen(/Luis[^\n]*, Respondió/, 30_000), (await facil.text()).slice(0, 500));
    await facil.shot('d-03-facilitator-sees-luis');

    // ── The rest of the member flow online, never flagged late ─────────────────────────────────
    await facil.click('Abrir valor actual', { role: 'button' });
    await facil.click('Abrir ahora', { role: 'button', last: true });
    await memberValue(luis, { why: 'Sin red también cumplo', who: 'Mi tío', situation: 'Viaje sin señal', score: 6 });
    await memberCommitment(luis, { what: 'Llamar a mi tío cada domingo', when: 'Lunes y jueves', how: 'Cuántas veces lo hice' });
    check('server: 2 scores, 3 answers and 1 commitment, written online',
      await untilTrue(() => luisRows('member_assessments') === 2 && luisRows('member_answers') === 3 && luisRows('member_commitments') === 1, 30_000));
    check('server: online rows are not flagged synced_late', lateRows() === 0, `late=${lateRows()}`);
    check('server: stored values are the ones typed',
      sql(`select action_text from member_commitments where session_id = ${SESSION} and person_id = ${LUIS}`).startsWith('Llamar a mi tío cada domingo'));
    await luis.shot('d-04-member-sent-online');
    await luis.dump();
  } finally {
    await facil.close();
    await luis.close();
  }
}
