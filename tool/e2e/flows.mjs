// Reusable multi-step flows of the live session, driven through the visible UI.
import { execFileSync } from 'node:child_process';
import { dirname, resolve } from 'node:path';
import { fileURLToPath } from 'node:url';
import { sleep } from './lib.mjs';

const repoRoot = resolve(dirname(fileURLToPath(import.meta.url)), '../..');

/** Puts Mesa Esperanza 03's demo session back to scheduled/lobby (scripts/dev-open-session.sh). */
export function resetDemoSession() {
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

export async function memberValue(app, { why, who, situation, score = 7 }) {
  await app.waitFor('VALOR ACTUAL', { timeout: 30_000 });
  await app.fill('¿Por qué te diste', why);
  await app.fill('¿Quién es para ti', who);
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
