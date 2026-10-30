// Scenario e (isolation) — a coordinator only sees their own organization: explorer, deep links to
// another organization's table/organization, reports, and the data API under the same token. Then
// the per-role PostgREST reads the online-only app relies on (ADR 0019: RLS is the only access
// control, there are no sync rules): member, facilitator, coordinator and a user of another
// organization read the session-domain tables and never get a row outside their scope.
import { App, check, sleep } from '../lib.mjs';
import { sql, supabaseKeys } from '../flows.mjs';
import { tokenFor } from './schedule.mjs';

async function apiRows(email, path) {
  const { url, anon } = supabaseKeys();
  const login = await fetch(`${url}/auth/v1/token?grant_type=password`, {
    method: 'POST',
    headers: { apikey: anon, 'Content-Type': 'application/json' },
    body: JSON.stringify({ email, password: 'dev-password-123' }),
  });
  const { access_token: token } = await login.json();
  const response = await fetch(`${url}/rest/v1/${path}`, { headers: { apikey: anon, Authorization: `Bearer ${token}` } });
  return response.json();
}

export async function isolation(browser) {
  const andinaTable = sql("select id from round_tables where code = 'AND-01'");
  const andinaOrg = sql("select organization_id from round_tables where code = 'AND-01'");
  const coord = await App.open(browser, 'coordinadora');
  try {
    await coord.devSignIn('coord');
    await coord.click('Coordinador, Fundación Luz', { role: 'button' });
    await coord.waitFor('Estás como Coordinador, Fundación Luz', { timeout: 20_000 });
    await coord.click('Mesas', { role: 'button' });
    check('coordinator explorer lists their own tables (LUZ-…)', await coord.seen('LUZ-01 · Mesa Fe 01', 20_000));
    const explorer = await coord.text();
    check('…and no table of Empresa Andina or Colegio Horizonte', !/AND-0\d|HOR-0\d|Empresa Andina|Colegio Horizonte/.test(explorer));
    await coord.shot('e-coord-explorer');

    await coord.goto(`/#/admin/mesas/${andinaTable}`);
    check('deep link to another organization\'s table → "Sin permiso para esta mesa"', await coord.seen(/Sin permiso|No encontramos esta mesa/, 15_000) && !(await coord.has('AND-01 · Mesa Planta 01')), (await coord.text()).slice(0, 300));
    await coord.shot('e-coord-foreign-table');
    await coord.goto(`/#/admin/organizaciones/${andinaOrg}`);
    check('deep link to another organization → denied', await coord.seen(/Sin permiso/, 15_000) && !(await coord.has('Empresa Andina')), (await coord.text()).slice(0, 300));
    await coord.goto('/#/admin/informes');
    await coord.waitFor(/VALORES COMPLETADOS/, { timeout: 20_000 });
    check('reports are scoped to the coordinator\'s organization', !/Colegio Horizonte|Empresa Andina/.test(await coord.text()));
    await coord.goto('/#/admin/auditoria');
    await sleep(2000);
    check('audit log is scoped to the coordinator\'s organization', !/Empresa Andina|Colegio Horizonte/.test(await coord.text()));
  } finally {
    await coord.close();
  }

  const tables = await apiRows('coord@dev.local', 'round_tables?select=code');
  check('API: coordinator token reads only own tables (no AND-/HOR- codes)', Array.isArray(tables) && tables.length > 0 && tables.every((t) => t.code.startsWith('LUZ-')), JSON.stringify(tables).slice(0, 200));
  const foreignSessions = await apiRows('coord@dev.local', `sessions?select=id&round_table_id=eq.${andinaTable}`);
  check('API: sessions of another organization\'s table are invisible', Array.isArray(foreignSessions) && foreignSessions.length === 0);
  const memberView = await apiRows('ana@dev.local', 'round_tables?select=code');
  check('API: a member only sees their own table', Array.isArray(memberView) && memberView.length === 1 && memberView[0].code === 'LUZ-03', JSON.stringify(memberView));
  const anaOthers = await apiRows('ana@dev.local', 'member_assessments?select=person_id');
  check('API: a member reads only their table\'s data (RLS), never other organizations', Array.isArray(anaOthers));
  await postgrestReads();
}

const PAGE = 'limit=1000';
const personOf = (email) => sql(`select id from people where email = '${email}'`);

/** Reads a PostgREST path with the user's token (or the bare anon key when `token` is null). */
async function readAs(token, path) {
  const { url, anon } = supabaseKeys();
  const response = await fetch(`${url}/rest/v1/${path}${path.includes('?') ? '&' : '?'}${PAGE}`, {
    headers: { apikey: anon, Authorization: `Bearer ${token ?? anon}` },
  });
  const body = await response.json().catch(() => null);
  return { status: response.status, rows: Array.isArray(body) ? body : [], body };
}

const ids = (rows, key) => [...new Set(rows.map((row) => row[key]))];
const only = (rows, key, allowed) => ids(rows, key).every((value) => allowed.includes(value));
const count = (query) => Number(sql(query));

/**
 * Per-role PostgREST reads of the session-domain tables. Expectations come from the database itself
 * (superuser `sql`), so they hold on any seed: what a role is allowed to see is stated here, the
 * rows are not hard-coded.
 */
export async function postgrestReads() {
  const luzOrg = sql("select organization_id from round_tables where code = 'LUZ-03'");
  const luz03 = sql("select id from round_tables where code = 'LUZ-03'");
  const horizonteOrg = sql("select organization_id from round_tables where code = 'HOR-01'");
  const andinaOrg = sql("select organization_id from round_tables where code = 'AND-01'");
  const answersAtLuz03 = count(`select count(*) from member_answers where round_table_id = '${luz03}'`);
  const answerAuthorsAtLuz03 = count(`select count(distinct person_id) from member_answers where round_table_id = '${luz03}'`);
  check('fixture: the demo table has answers from several people', answersAtLuz03 > 0 && answerAuthorsAtLuz03 > 1);

  // ── Member (ana, Mesa Esperanza 03) ──────────────────────────────────────────────────────────
  const ana = await tokenFor('ana@dev.local');
  const anaPerson = personOf('ana@dev.local');
  const anaSessions = await readAs(ana, 'sessions?select=id,round_table_id,organization_id');
  check('member: reads the sessions of their own table only', anaSessions.rows.length > 0 && only(anaSessions.rows, 'round_table_id', [luz03]), JSON.stringify(anaSessions.body).slice(0, 200));
  const anaAttendance = await readAs(ana, 'session_attendance?select=round_table_id,organization_id');
  check('member: attendance rows stay inside their table', anaAttendance.rows.length > 0 && only(anaAttendance.rows, 'round_table_id', [luz03]));
  for (const table of ['member_answers', 'member_commitments', 'member_assessments']) {
    const own = await readAs(ana, `${table}?select=person_id,round_table_id`);
    check(`member: ${table} returns only their own rows (never a peer's)`, own.status === 200 && only(own.rows, 'person_id', [anaPerson]), JSON.stringify(own.body).slice(0, 200));
  }
  const anaPeople = await readAs(ana, 'people?select=id,organization_id');
  check('member: people returns only their own row (peers appear only as names in table_members)', anaPeople.rows.length === 1 && anaPeople.rows[0].id === anaPerson, JSON.stringify(anaPeople.body).slice(0, 200));
  const anaRoster = await readAs(ana, 'table_members?select=round_table_id,organization_id,first_name');
  check('member: roster is their table only', anaRoster.rows.length > 1 && only(anaRoster.rows, 'round_table_id', [luz03]) && only(anaRoster.rows, 'organization_id', [luzOrg]));

  // ── Facilitator (Mesa Esperanza 03) ──────────────────────────────────────────────────────────
  const facil = await tokenFor('facil@dev.local');
  const facilSessions = await readAs(facil, 'sessions?select=round_table_id');
  check('facilitator: sessions are their table only', facilSessions.rows.length > 0 && only(facilSessions.rows, 'round_table_id', [luz03]));
  for (const table of ['member_answers', 'member_commitments', 'member_assessments']) {
    const rows = await readAs(facil, `${table}?select=person_id,round_table_id`);
    check(`facilitator: ${table} stays inside their table`, rows.status === 200 && only(rows.rows, 'round_table_id', [luz03]), JSON.stringify(rows.body).slice(0, 200));
  }
  const facilAnswers = await readAs(facil, 'member_answers?select=person_id,round_table_id');
  check('facilitator: sees the answers of their whole table (every author, every row)',
    facilAnswers.rows.length === answersAtLuz03 && ids(facilAnswers.rows, 'person_id').length === answerAuthorsAtLuz03,
    `rows=${facilAnswers.rows.length}/${answersAtLuz03} authors=${ids(facilAnswers.rows, 'person_id').length}/${answerAuthorsAtLuz03}`);
  const facilPeople = await readAs(facil, 'people?select=id,organization_id');
  check('facilitator: people are their organization\'s, and only the table\'s members', facilPeople.rows.length > 1 && only(facilPeople.rows, 'organization_id', [luzOrg])
    && facilPeople.rows.length <= count(`select count(distinct person_id) from table_members where round_table_id = '${luz03}'`));
  const facilAttendance = await readAs(facil, 'session_attendance?select=round_table_id');
  check('facilitator: attendance is their table only', facilAttendance.rows.length > 0 && only(facilAttendance.rows, 'round_table_id', [luz03]));

  // ── Coordinator (Fundación Luz): the whole organization, but never individual answers ────────
  const coord = await tokenFor('coord@dev.local');
  const coordPerson = personOf('coord@dev.local');
  for (const table of ['sessions', 'session_attendance', 'table_members', 'people']) {
    const rows = await readAs(coord, `${table}?select=organization_id`);
    check(`coordinator: ${table} are all in their organization`, rows.rows.length > 0 && only(rows.rows, 'organization_id', [luzOrg]), `${table}: ${JSON.stringify(ids(rows.rows, 'organization_id'))}`);
  }
  for (const table of ['member_answers', 'member_commitments', 'member_assessments']) {
    const rows = await readAs(coord, `${table}?select=person_id`);
    check(`coordinator: ${table} holds nobody else's individual answers (PC-10)`, rows.status === 200 && only(rows.rows, 'person_id', [coordPerson]), JSON.stringify(rows.body).slice(0, 200));
  }

  // ── A user of another organization (Colegio Horizonte's coordinator) ─────────────────────────
  const other = await tokenFor('coord.horizonte@seed.local');
  for (const table of ['sessions', 'session_attendance', 'table_members', 'people']) {
    const rows = await readAs(other, `${table}?select=organization_id`);
    check(`other organization: ${table} contain nothing of Fundación Luz or Empresa Andina`, rows.status === 200 && !ids(rows.rows, 'organization_id').some((org) => org === luzOrg || org === andinaOrg) && only(rows.rows, 'organization_id', [horizonteOrg]),
      `${table}: ${JSON.stringify(ids(rows.rows, 'organization_id'))}`);
  }
  for (const table of ['member_answers', 'member_commitments', 'member_assessments']) {
    const rows = await readAs(other, `${table}?select=person_id`);
    check(`other organization: ${table} returns no row of another organization`, rows.status === 200 && only(rows.rows, 'person_id', [personOf('coord.horizonte@seed.local')]), JSON.stringify(rows.body).slice(0, 200));
  }
  const luzSessionsForOther = await readAs(other, `sessions?select=id&round_table_id=eq.${luz03}`);
  check('other organization: asking for Mesa Esperanza 03 by id still returns nothing', luzSessionsForOther.rows.length === 0);

  // ── Nobody signed in ─────────────────────────────────────────────────────────────────────────
  for (const table of ['sessions', 'member_answers', 'people', 'table_members']) {
    const rows = await readAs(null, `${table}?select=id`);
    check(`anonymous: ${table} returns no rows`, rows.rows.length === 0, `status=${rows.status}`);
  }
}
