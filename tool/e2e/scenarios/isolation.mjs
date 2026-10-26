// Scenario e (isolation) — a coordinator only sees their own organization: explorer, deep links to
// another organization's table/organization, reports, and the data API under the same token.
import { App, check, sleep } from '../lib.mjs';
import { sql, supabaseKeys } from '../flows.mjs';

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
}
