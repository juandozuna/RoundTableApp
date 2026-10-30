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
  const anaPerson = sql("select id from people where email = 'ana@dev.local'");
  const peersAssessments = Number(sql(`select count(*) from member_assessments where person_id <> '${anaPerson}'`));
  const anaOwnAssessments = Number(sql(`select count(*) from member_assessments where person_id = '${anaPerson}'`));
  check('fixture: other people have scores too, so an empty read below would mean something', peersAssessments > 0 && anaOwnAssessments > 0);
  const anaOthers = await apiRows('ana@dev.local', 'member_assessments?select=person_id');
  check('API: a member reads exactly their own scores (RLS), never other people\'s', Array.isArray(anaOthers) && anaOthers.length === anaOwnAssessments && anaOthers.every((row) => row.person_id === anaPerson), JSON.stringify(anaOthers).slice(0, 200));
  const anaAskingForPeers = await apiRows('ana@dev.local', `member_assessments?select=person_id&person_id=neq.${anaPerson}`);
  check('API: asking for other people\'s scores explicitly returns nothing', Array.isArray(anaAskingForPeers) && anaAskingForPeers.length === 0, JSON.stringify(anaAskingForPeers).slice(0, 200));
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

/** PostgREST's row cap (`max_rows`) is 1000 on the local stack; `PAGE` asks for no more. */
const MAX_ROWS = 1000;
const ids = (rows, key) => [...new Set(rows.map((row) => row[key]))];
// Vacuously true for no rows: always pair it with `exactly` or a row count so an empty read cannot pass.
const only = (rows, key, allowed) => ids(rows, key).every((value) => allowed.includes(value));
const count = (query) => Number(sql(query));
/** What the database holds for a scope, capped like the API read. */
const expected = (query) => Math.min(count(query), MAX_ROWS);
/** A successful read that returned exactly the [wanted] rows, all inside [allowed] on [key]. */
const exactly = (result, key, allowed, wanted) =>
  result.status === 200 && result.rows.length === wanted && only(result.rows, key, allowed);

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

  const individual = ['member_answers', 'member_commitments', 'member_assessments'];
  const peersData = Object.fromEntries(individual.map((table) => [table, count(`select count(*) from ${table}`)]));
  check('fixture: every individual-answer table has rows, so the scoped reads below are not vacuous', individual.every((table) => peersData[table] > 0));
  const ownCount = (table, person) => count(`select count(*) from ${table} where person_id = '${person}'`);

  // ── Member (ana, Mesa Esperanza 03) ──────────────────────────────────────────────────────────
  const ana = await tokenFor('ana@dev.local');
  const anaPerson = personOf('ana@dev.local');
  const anaSessions = await readAs(ana, 'sessions?select=id,round_table_id,organization_id');
  check('member: reads exactly the sessions of their own table', exactly(anaSessions, 'round_table_id', [luz03], expected(`select count(*) from sessions where round_table_id = '${luz03}'`)), JSON.stringify(anaSessions.body).slice(0, 200));
  const anaAttendance = await readAs(ana, 'session_attendance?select=round_table_id,organization_id');
  check('member: attendance rows are exactly their table\'s', exactly(anaAttendance, 'round_table_id', [luz03], expected(`select count(*) from session_attendance where round_table_id = '${luz03}'`)));
  for (const table of individual) {
    const own = await readAs(ana, `${table}?select=person_id,round_table_id`);
    check(`member: ${table} returns exactly their own rows (never a peer's)`, (table === 'member_commitments' || ownCount(table, anaPerson) > 0) && exactly(own, 'person_id', [anaPerson], expected(`select count(*) from ${table} where person_id = '${anaPerson}'`)), JSON.stringify(own.body).slice(0, 200));
  }
  const anaPeople = await readAs(ana, 'people?select=id,organization_id');
  check('member: people returns only their own row (peers appear only as names in table_members)', anaPeople.rows.length === 1 && anaPeople.rows[0].id === anaPerson, JSON.stringify(anaPeople.body).slice(0, 200));
  const anaRoster = await readAs(ana, 'table_members?select=round_table_id,organization_id,first_name');
  check('member: roster is exactly their table', anaRoster.rows.length > 1 && exactly(anaRoster, 'round_table_id', [luz03], expected(`select count(*) from table_members where round_table_id = '${luz03}'`)) && only(anaRoster.rows, 'organization_id', [luzOrg]));

  // ── Facilitator (Mesa Esperanza 03) ──────────────────────────────────────────────────────────
  const facil = await tokenFor('facil@dev.local');
  const facilSessions = await readAs(facil, 'sessions?select=round_table_id');
  check('facilitator: sessions are exactly their table\'s', exactly(facilSessions, 'round_table_id', [luz03], expected(`select count(*) from sessions where round_table_id = '${luz03}'`)));
  for (const table of individual) {
    const rows = await readAs(facil, `${table}?select=person_id,round_table_id`);
    const atTable = expected(`select count(*) from ${table} where round_table_id = '${luz03}'`);
    check(`facilitator: ${table} are exactly their table's (${atTable}), none of the ${peersData[table]} overall`, atTable > 0 && exactly(rows, 'round_table_id', [luz03], atTable), JSON.stringify(rows.body).slice(0, 200));
  }
  const facilAnswers = await readAs(facil, 'member_answers?select=person_id,round_table_id');
  check('facilitator: sees the answers of their whole table (every author, every row)',
    facilAnswers.rows.length === answersAtLuz03 && ids(facilAnswers.rows, 'person_id').length === answerAuthorsAtLuz03,
    `rows=${facilAnswers.rows.length}/${answersAtLuz03} authors=${ids(facilAnswers.rows, 'person_id').length}/${answerAuthorsAtLuz03}`);
  const facilPeople = await readAs(facil, 'people?select=id,organization_id');
  check('facilitator: people are exactly their table\'s members', facilPeople.rows.length > 1 && only(facilPeople.rows, 'organization_id', [luzOrg])
    && facilPeople.rows.length === count(`select count(distinct person_id) from table_members where round_table_id = '${luz03}'`));
  const facilAttendance = await readAs(facil, 'session_attendance?select=round_table_id');
  check('facilitator: attendance is exactly their table\'s', exactly(facilAttendance, 'round_table_id', [luz03], expected(`select count(*) from session_attendance where round_table_id = '${luz03}'`)));

  // ── Coordinator (Fundación Luz): the whole organization, but never individual answers ────────
  const coord = await tokenFor('coord@dev.local');
  const coordPerson = personOf('coord@dev.local');
  const orgScope = {
    sessions: `select count(*) from sessions where organization_id = '${luzOrg}'`,
    session_attendance: `select count(*) from session_attendance where organization_id = '${luzOrg}'`,
    table_members: `select count(*) from table_members where organization_id = '${luzOrg}'`,
    people: `select count(*) from people where organization_id = '${luzOrg}'`,
  };
  for (const [table, query] of Object.entries(orgScope)) {
    const rows = await readAs(coord, `${table}?select=organization_id`);
    check(`coordinator: ${table} are exactly their organization's`, exactly(rows, 'organization_id', [luzOrg], expected(query)) && rows.rows.length > 0, `${table}: ${rows.rows.length} rows ${JSON.stringify(ids(rows.rows, 'organization_id'))}`);
  }
  for (const table of individual) {
    const rows = await readAs(coord, `${table}?select=person_id`);
    check(`coordinator: ${table} holds nobody else's individual answers (PC-10), though the organization has ${peersData[table]}`, exactly(rows, 'person_id', [coordPerson], ownCount(table, coordPerson)), JSON.stringify(rows.body).slice(0, 200));
  }

  // ── A user of another organization (Colegio Horizonte's coordinator) ─────────────────────────
  const other = await tokenFor('coord.horizonte@seed.local');
  const otherPerson = personOf('coord.horizonte@seed.local');
  for (const table of Object.keys(orgScope)) {
    const rows = await readAs(other, `${table}?select=organization_id`);
    const mine = expected(`select count(*) from ${table} where organization_id = '${horizonteOrg}'`);
    check(`other organization: ${table} are exactly theirs and nothing of Fundación Luz or Empresa Andina`, mine > 0 && exactly(rows, 'organization_id', [horizonteOrg], mine) && !ids(rows.rows, 'organization_id').some((org) => org === luzOrg || org === andinaOrg),
      `${table}: ${JSON.stringify(ids(rows.rows, 'organization_id'))}`);
  }
  for (const table of individual) {
    const rows = await readAs(other, `${table}?select=person_id`);
    check(`other organization: ${table} returns no row of another organization`, exactly(rows, 'person_id', [otherPerson], ownCount(table, otherPerson)), JSON.stringify(rows.body).slice(0, 200));
  }
  const luzSessionsForOther = await readAs(other, `sessions?select=id&round_table_id=eq.${luz03}`);
  check('other organization: asking for Mesa Esperanza 03 by id still returns nothing (a 200 with no rows)', luzSessionsForOther.status === 200 && luzSessionsForOther.rows.length === 0);

  // ── Nobody signed in: the anon role has no privilege on any of them ──────────────────────────
  const publicTables = ['sessions', 'session_attendance', 'member_answers', 'member_commitments', 'member_assessments', 'people', 'table_members', 'curriculum_modules', 'content_locales'];
  for (const table of publicTables) {
    const rows = await readAs(null, `${table}?select=id`);
    check(`anonymous: ${table} is refused (401/403) and returns no rows`, [401, 403].includes(rows.status) && rows.rows.length === 0, `status=${rows.status} ${JSON.stringify(rows.body).slice(0, 120)}`);
  }
}
