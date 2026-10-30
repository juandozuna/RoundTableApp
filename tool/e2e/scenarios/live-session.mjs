// Scenario c — the live session with two browsers (facilitator + member) read through PostgREST
// (polled): stages follow live, attendance, follow-up, reflection, score (5 blocked), commitment by
// the member and by the facilitator-as-participant, closing answers and the session, summaries.
import { App, check, sleep } from '../lib.mjs';
import { memberCommitment, memberFollowUp, memberValue, openSessionScreen, refreshKpis, resetDemoSession, sql } from '../flows.mjs';

const SESSION = "md5('gold-roundtables:session:luz-03:4')::uuid";

/** "Valores" column of Mesa Esperanza 03 in the admin explorer (completed values). */
async function completedValuesInExplorer(admin) {
  await admin.fillNth(0, 'Esperanza');
  await sleep(1500);
  const row = await admin.waitFor('LUZ-03 · Mesa Esperanza 03');
  return Number(row.text.split('\n').map((l) => l.trim()).filter(Boolean).at(-3));
}

export async function liveSession(browser) {
  resetDemoSession();
  refreshKpis();
  const admin = await App.open(browser, 'admin');
  await admin.devSignIn('admin');
  await admin.click('Mesas', { role: 'button' });
  await admin.waitFor(/^Mesas \d+$/, { timeout: 20_000 });
  const valuesBefore = await completedValuesInExplorer(admin);
  check('KPIs before the session: Mesa Esperanza 03 has 3 completed values', valuesBefore === 3, `rows: ${valuesBefore}`);
  const facil = await App.open(browser, 'facilitador');
  const ana = await App.open(browser, 'ana');
  try {
    await facil.devSignIn('facil');
    await ana.devSignIn('ana');
    await facil.waitFor('Abrir sesión', { role: 'button' });
    await openSessionScreen(facil);
    await openSessionScreen(ana);
    check('member waits for the facilitator before the session opens', await ana.seen('Esperando a tu facilitador'));
    await facil.shot('c-01-facilitator-lobby');

    await facil.click('Abrir sesión', { role: 'button' });
    check('member follows the stage live (Lista)', await ana.seen('Tu facilitador está pasando lista', 15_000));

    await facil.click('Ana Lucía Méndez', { role: 'button' });
    await facil.click('Presente', { role: 'button' });
    check('attendance marked by the facilitator reaches the member', await ana.seen('Perfecto. El seguimiento se abre en un momento.', 15_000));
    await facil.click('Marcar a todos Presente', { role: 'button' });
    await facil.click('Abrir seguimiento', { role: 'button' });
    check('member sees the follow-up stage with last week\'s commitment', await ana.seen('TU COMPROMISO DE LA SEMANA PASADA', 15_000));
    await ana.shot('c-02-member-followup');

    // A draft survives closing the app: type, reload, come back.
    await ana.click('Lo cumplí', { role: 'radio' });
    await ana.fill('Cuéntanos en una frase', 'Borrador sin enviar');
    await sleep(1200); // drafts are written shortly after the last keystroke
    await ana.goto('/');
    await ana.waitFor('Estás como Miembro', { timeout: 30_000 });
    await openSessionScreen(ana);
    await ana.waitFor('TU COMPROMISO DE LA SEMANA PASADA', { timeout: 30_000 });
    const restored = await ana.fieldValue('Cuéntanos en una frase');
    check('unsent answer survives closing and reopening the app', restored === 'Borrador sin enviar', `value=${restored}`);
    await ana.shot('c-02b-draft-restored');

    // Score 5 is blocked; submitting without a valid score keeps the form open.
    await ana.click('Lo cumplí', { role: 'radio' });
    check('score 5 is presented as unavailable', await ana.has('5, no disponible'));
    await ana.click('5, no disponible', { role: 'button' });
    await ana.click('Enviar seguimiento', { role: 'button' });
    check('submitting with score 5 is rejected', await ana.has('Enviar seguimiento') && !(await ana.has('Enviado.')));
    await memberFollowUp(ana, { score: 8 });
    check('member follow-up is saved', await ana.seen('Enviado.', 15_000));
    check('facilitator sees Ana as answered', await facil.seen('Ana Lucía Méndez, Respondió', 20_000));

    // The facilitator also answers as a participant (ADR 0014).
    await facil.click('Responder yo', { role: 'button' });
    await memberFollowUp(facil, { outcome: 'Cumplí una parte', note: 'Fue difícil', score: 6 });
    await facil.click('Ir a la mesa', { role: 'button' });
    check('facilitator-as-participant follow-up saved', await facil.seen('Facilitador, Sofía Herrera, Respondió', 20_000));
    await facil.click('Abrir valor actual', { role: 'button' });
    if (await facil.seen('Abrir ahora', 3000)) await facil.click('Abrir ahora', { role: 'button' });
    check('member moves to the value stage', await ana.seen('VALOR ACTUAL', 15_000));
    await memberValue(ana, { why: 'Porque cumplo lo que prometo', whoPick: 'Luis Ferrer', situation: 'Un plazo en el trabajo', score: 7 });
    await ana.shot('c-03-member-commitment');
    await memberCommitment(ana, { what: 'Llamar a mi abuela 2 veces' });
    check('member commitment saved', await ana.seen('Enviado', 15_000));

    await facil.click('Responder yo', { role: 'button' });
    await memberValue(facil, { why: 'Es base de la confianza', who: 'Mi padre', situation: 'Una reunión de la mesa', score: 9 });
    await memberCommitment(facil, { what: 'Terminar mi tarea 30 minutos diarios' });
    check('facilitator-as-participant commitment saved', await facil.seen('Enviado', 15_000));
    await facil.click('Ir a la mesa', { role: 'button' });
    await facil.shot('c-04-facilitator-value-stage');
    await facil.click('Cerrar respuestas', { role: 'button' });
    await facil.click('Cerrar de todos modos', { role: 'button' });
    await sleep(2500);
    check('member sees the answers are closed', await ana.seen('Tu facilitador cerró las respuestas', 15_000));
    await facil.shot('c-05-after-close-answers');
    await facil.click('Cerrar sesión', { role: 'button' });
    await facil.click('Cerrar sesión', { role: 'button', last: true });
    await sleep(3500);
    check('facilitator sees the closed-session summary', (await facil.seen('Sesión cerrada · 6 de 21 respuestas recibidas', 15_000)) && (await facil.has('Presentes (incluye facilitador)')));
    check('member sees the thank-you summary with their answers', (await ana.seen('SESIÓN CERRADA', 15_000)) && (await ana.has('Gracias, Ana Lucía')) && (await ana.has('Llamar a mi abuela 2 veces')));
    check('member summary names the person picked as the example (RF-54)', await ana.has('Luis Ferrer'));
    await facil.shot('c-06-facilitator-summary');
    await ana.shot('c-06-member-summary');

    const rows = (table) => Number(sql(`select count(*) from ${table} where session_id = ${SESSION}`));
    check('server: session closed', sql(`select status from sessions where id = ${SESSION}`) === 'closed');
    check('server: 8 attendance rows, 4 assessments (follow-up + initial per person), 6 answers, 2 commitments',
      rows('session_attendance') === 8 && rows('member_assessments') === 4 && rows('member_answers') === 6 && rows('member_commitments') === 2,
      ['session_attendance', 'member_assessments', 'member_answers', 'member_commitments'].map((t) => `${t}=${rows(t)}`).join(' '));
    check('server: complete session (closed from the answers stage)', sql(`select completion || '/' || coalesce(incomplete_reason, '-') from sessions where id = ${SESSION}`) === 'complete/-');
    check('server: Ana\'s picked person is stored with the name; the facilitator\'s typed name has no person',
      sql(`select string_agg(p.first_name || ':' || coalesce(a.answer_person_id::text, '-'), ',' order by p.first_name) from member_answers a join people p on p.id = a.person_id join value_questions q on q.id = a.question_id where a.session_id = ${SESSION} and q.response_type = 'person'`)
        === `Ana Lucía:${sql("select md5('gold-roundtables:person:luis')::uuid")},Sofía:-`);
    check('server: no score of 5 stored', Number(sql('select count(*) from member_assessments where score = 5')) === 0);
    check('server: nothing flagged late (everything synced while the session was open)', Number(sql(`select count(*) from member_assessments where session_id = ${SESSION} and synced_late`)) === 0);

    // KPIs afterwards reflect the closed session (the explorer reads rollups that cron refreshes every 5 min).
    refreshKpis();
    await admin.goto('/');
    await admin.click('Mesas', { role: 'button' });
    await admin.waitFor(/^Mesas \d+$/, { timeout: 20_000 });
    const valuesAfter = await completedValuesInExplorer(admin);
    check('KPIs after closing: Mesa Esperanza 03 shows 4 completed values', valuesAfter === 4, `rows: ${valuesAfter}`);
    await admin.shot('c-07-admin-kpis-after-close');
  } finally {
    await admin.close();
    await facil.close();
    await ana.close();
  }
}
