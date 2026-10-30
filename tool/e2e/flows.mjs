// Reusable multi-step flows of the live session, driven through the visible UI.
import { execFileSync } from 'node:child_process';
import { dirname, resolve } from 'node:path';
import { fileURLToPath } from 'node:url';
import { sleep } from './lib.mjs';

const repoRoot = resolve(dirname(fileURLToPath(import.meta.url)), '../..');

/** Puts Mesa Esperanza 03's demo session back to scheduled/lobby (scripts/dev-open-session.sh). */
export function resetDemoSession() {
  releaseE2eSeats(); // people invited by earlier scenarios would join the table's roll call
  execFileSync('bash', [resolve(repoRoot, 'scripts/dev-open-session.sh')], { stdio: 'pipe' });
}

/** Runs SQL in the local Supabase database container and returns the raw output. */
export function sql(statement) {
  return execFileSync(
    'docker',
    ['exec', '-i', 'supabase_db_gold-roundtables', 'psql', '-U', 'postgres', '-At', '-v', 'ON_ERROR_STOP=1', '-c', statement],
    { encoding: 'utf8' },
  ).trim();
}

/** Opens the live session screen from the shell ("Sesión" destination). */
export async function openSessionScreen(app) {
  await app.click('Sesión', { role: 'button' });
  await app.waitFor('Mesa Esperanza 03');
}

export async function memberFollowUp(app, { outcome = 'Lo cumplí', note = 'Cumplí casi todos los días', score = 8 } = {}) {
  await app.waitFor('¿Cómo te fue?', { timeout: 30_000 });
  await app.click(outcome, { role: 'radio' });
  if (note) await app.fill('Cuéntanos en una frase', note);
  await app.click(`Puntaje ${score}`, { role: 'button' });
  await app.click('Enviar seguimiento', { role: 'button' });
}

/**
 * The "ejemplo" question is a person question (RF-54): `whoPick` taps a person of the table,
 * otherwise `who` is typed in "Otra persona".
 */
export async function memberValue(app, { why, who, whoPick, situation, score = 7 }) {
  await app.waitFor('VALOR ACTUAL', { timeout: 30_000 });
  // The form is long (people chips): start from the top so the first field is not under the sticky header.
  const { height, width } = app.page.viewport();
  await app.page.mouse.move(width / 2, height / 2);
  await app.page.mouse.wheel({ deltaY: -5000 });
  await sleep(400);
  await app.fill('¿Por qué te diste', why);
  if (whoPick) await app.click(whoPick, { role: 'button' });
  else await app.fill('Otra persona', who);
  await app.fill('¿En qué situación', situation);
  await app.click(`Puntaje ${score}`, { role: 'button' });
  await app.click('Enviar y seguir al compromiso', { role: 'button' });
}

export async function memberCommitment(app, { what, when = 'Todos los días', how = 'Sí o no cada día' }) {
  await app.waitFor('Enviar mi compromiso', { timeout: 30_000 });
  await app.fill('Qué haré', what);
  await app.click(when, { role: 'button' });
  await app.click(how, { role: 'button' });
  await app.click('Enviar mi compromiso', { role: 'button' });
  await sleep(1500);
}

/** Removes the people the E2E scenarios invited (emails ending in @e2e.local) and what hangs off them. */
export function releaseE2eSeats() {
  sql(`begin;
    set local session_replication_role = replica;
    create temp table e2e_people on commit drop as select id from people where email like '%@e2e.local';
    delete from invites where person_id in (select id from e2e_people);
    delete from table_members where person_id in (select id from e2e_people);
    delete from role_assignments where person_id in (select id from e2e_people);
    update audit_events set actor_person_id = null where actor_person_id in (select id from e2e_people);
    delete from people where id in (select id from e2e_people);
    commit;`);
}

/** From the admin explorer (Mesas tab): searches and opens a table's detail. */
export async function openTableFromExplorer(app, search, rowText = search) {
  await app.fillNth(0, search); // the explorer keeps its previous search text, so no label to look for
  await sleep(1200);
  await app.click(rowText);
  await app.waitFor('Agregar miembro', { timeout: 20_000 });
}

/** The explorer and KPIs read rollups that pg_cron refreshes every 5 minutes; do it now. */
export function refreshKpis() {
  sql('select kpi.refresh_if_dirty()');
}

/** Local Supabase API URL and anon key (from the environment, else `supabase status`). */
export function supabaseKeys() {
  if (process.env.SUPABASE_URL && process.env.SUPABASE_ANON_KEY) {
    return { url: process.env.SUPABASE_URL, anon: process.env.SUPABASE_ANON_KEY };
  }
  const status = execFileSync('supabase', ['status', '-o', 'env'], { cwd: repoRoot, encoding: 'utf8' });
  const pick = (name) => status.match(new RegExp(`^${name}="(.*)"$`, 'm'))?.[1];
  return { url: pick('API_URL'), anon: pick('ANON_KEY') };
}
