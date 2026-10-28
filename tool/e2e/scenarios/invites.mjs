// Scenario b — invites: a facilitator and a coordinator create invitations, new dev accounts
// redeem them and land in the right context, and the error states (expired, revoked, used,
// unknown) are explained, and the role matrix (ADR 0016) denies what each role may not invite.
import { App, check, sleep } from '../lib.mjs';
import { releaseE2eSeats, sql, supabaseKeys } from '../flows.mjs';

const codeFor = (email) => sql(`select i.code from invites i join people p on p.id = i.person_id where p.email = '${email}' order by i.created_at desc limit 1`);

async function previewCode(app, code) {
  await app.goto('/#/invitacion');
  await app.fillNth(0, code);
}

/** Calls the invites Edge Function as a dev account and returns { status, code }. */
async function inviteAs(email, body) {
  const { url, anon } = supabaseKeys();
  const login = await fetch(`${url}/auth/v1/token?grant_type=password`, {
    method: 'POST',
    headers: { apikey: anon, 'Content-Type': 'application/json' },
    body: JSON.stringify({ email, password: 'dev-password-123' }),
  });
  const { access_token: token } = await login.json();
  const response = await fetch(`${url}/functions/v1/invites`, {
    method: 'POST',
    headers: { apikey: anon, Authorization: `Bearer ${token}`, 'Content-Type': 'application/json' },
    body: JSON.stringify(body),
  });
  const json = await response.json();
  return { status: response.status, code: json.error?.code };
}

async function roleMatrix(browser) {
  const person = { first_name: 'Denegada', last_name: 'Prueba', email: `denegada.${Date.now()}@e2e.local` };
  const luz = sql("select id from organizations where name = 'Fundación Luz'");
  const ownTable = sql("select id from round_tables where code = 'LUZ-03'");
  const otherTable = sql("select id from round_tables where code = 'LUZ-01'");

  const facilCoordinator = await inviteAs('facil@dev.local', { role_kind: 'coordinator', organization_id: luz, person });
  check('API: a facilitator inviting a coordinator → 403 invite_role_forbidden', facilCoordinator.status === 403 && facilCoordinator.code === 'invite_role_forbidden', JSON.stringify(facilCoordinator));
  const facilFacilitator = await inviteAs('facil@dev.local', { role_kind: 'facilitator', round_table_id: ownTable, person });
  check('API: a facilitator inviting a facilitator → 403 invite_role_forbidden', facilFacilitator.status === 403 && facilFacilitator.code === 'invite_role_forbidden', JSON.stringify(facilFacilitator));
  const facilOtherTable = await inviteAs('facil@dev.local', { role_kind: 'member', round_table_id: otherTable, person });
  check('API: a facilitator inviting into another table → 403 invite_table_forbidden', facilOtherTable.status === 403 && facilOtherTable.code === 'invite_table_forbidden', JSON.stringify(facilOtherTable));
  const coordCoordinator = await inviteAs('coord@dev.local', { role_kind: 'coordinator', organization_id: luz, person });
  check('API: a coordinator inviting a coordinator → 403 invite_role_forbidden', coordCoordinator.status === 403 && coordCoordinator.code === 'invite_role_forbidden', JSON.stringify(coordCoordinator));
  const memberInvite = await inviteAs('ana@dev.local', { role_kind: 'member', round_table_id: ownTable, person });
  check('API: a member inviting → 403', memberInvite.status === 403, JSON.stringify(memberInvite));
  check('server: no person was created by a denied invite', sql(`select count(*) from people where email = '${person.email}'`) === '0');

  const facil = await App.open(browser, 'facilitador-matriz');
  try {
    await facil.devSignIn('facil');
    await facil.click('Invitaciones', { role: 'button' });
    await facil.click(/Invitar/, { role: 'button' });
    check('facilitator form: coordinator and facilitator roles are locked', (await facil.seen('Solo Coordinador o Administrador', 15_000)) && (await facil.has('Solo la administración de la plataforma')), (await facil.text()).slice(0, 400));
    await facil.shot('b-06-facilitator-locked-roles');
  } finally {
    await facil.close();
  }

  const coord = await App.open(browser, 'coordinadora-matriz');
  try {
    await coord.devSignIn('coord');
    await coord.click('Coordinador, Fundación Luz', { role: 'button' });
    await coord.click('Invitaciones', { role: 'button' });
    await coord.click(/Invitar/, { role: 'button' });
    check('coordinator form: only the coordinator role is locked', (await coord.seen('Solo la administración de la plataforma', 15_000)) && !(await coord.has('Solo Coordinador o Administrador')), (await coord.text()).slice(0, 400));
    await coord.shot('b-07-coordinator-locked-roles');
  } finally {
    await coord.close();
  }
}

export async function invites(browser) {
  releaseE2eSeats();
  const n = String(Date.now()).slice(-6);
  const facil = await App.open(browser, 'facilitador');
  try {
    await facil.devSignIn('facil');
    await facil.click('Invitaciones', { role: 'button' });
    await facil.click(/Invitar/, { role: 'button' });
    await facil.fill('Nombre *', 'Invitada');
    await facil.fill('Apellido *', 'Prueba');
    await facil.fill('Correo *', `invitada.${n}@e2e.local`);
    await facil.fill('Teléfono *', '+18095551234');
    await facil.click('Miembro', { role: 'button' });
    await facil.click('Crear invitación', { role: 'button' });
    check('facilitator creates a member invitation for their own table', await facil.seen(/Invitación creada|Comparte/, 15_000), (await facil.text()).slice(0, 400));
    await facil.shot('b-01-facilitator-invite-created');
    const facilCode = codeFor(`invitada.${n}@e2e.local`);
    check('server: invite stored as pending member of Mesa Esperanza 03', /^[A-Z2-9]{6}$/.test(facilCode), facilCode);
  } finally {
    await facil.close();
  }

  // A coordinator invites a member to a table (default: Mesa Alba 02); a brand-new account redeems it.
  const coord = await App.open(browser, 'coordinadora');
  let code;
  try {
    await coord.devSignIn('coord');
    await coord.click('Coordinador, Fundación Luz', { role: 'button' });
    await coord.click('Invitaciones', { role: 'button' });
    await coord.click(/Invitar/, { role: 'button' });
    await coord.fill('Nombre *', 'Nueva');
    await coord.fill('Apellido *', 'Integrante');
    await coord.fill('Correo *', `integrante.${n}@e2e.local`);
    await coord.fill('Teléfono *', '+18095550199');
    await coord.click('Miembro', { role: 'button' });
    await coord.click('Crear invitación', { role: 'button' });
    check('coordinator creates a member invitation', await coord.seen('INVITACIÓN CREADA', 15_000));
    code = codeFor(`integrante.${n}@e2e.local`);
    check('server: coordinator invite has a 6-character code', /^[A-Z2-9]{6}$/.test(code), code);
    await coord.shot('b-02-coordinator-invite-created');
  } finally {
    await coord.close();
  }

  const newcomer = await App.open(browser, 'nueva-cuenta');
  try {
    await newcomer.click('Crear cuenta de prueba nueva', { role: 'button' });
    check('a new account without invitation is told it is not registered', await newcomer.seen('No encontramos tu cuenta', 20_000));
    await previewCode(newcomer, code);
    check('code preview shows organisation, table and role before joining', (await newcomer.seen('Esto es a lo que te unes', 15_000)) && (await newcomer.has('Fundación Luz')) && (await newcomer.has('Mesa Alba 02')));
    await newcomer.shot('b-03-invite-preview');
    await newcomer.click(/Unirme como Miembro/, { role: 'button' });
    await newcomer.waitFor('Confirma tu perfil', { timeout: 20_000 });
    await newcomer.shot('b-03b-confirm-profile');
    await newcomer.fill('Apellido *', 'Integrante');
    await newcomer.click('Confirmar y entrar', { role: 'button' });
    check('welcome screen confirms the context (Miembro · Mesa Alba 02)', await newcomer.seen('Contexto: Miembro · Mesa Alba 02', 20_000));
    await newcomer.shot('b-03c-welcome');
    await newcomer.click('Entrar a mi mesa', { role: 'button' });
    check('redeeming lands in the invited context (Miembro · Mesa Alba 02)', await newcomer.seen('Estás como Miembro, Mesa Alba 02', 25_000), (await newcomer.text()).slice(0, 300));
    await newcomer.shot('b-04-after-redeem');
    check('server: invite accepted and person linked to the new account', sql(`select i.status || ':' || (p.auth_user_id is not null) from invites i join people p on p.id = i.person_id where i.code = '${code}'`) === 'accepted:true');
    await newcomer.click('Ajustes', { role: 'button' });
    await newcomer.click('Cerrar sesión', { role: 'button' });
    await newcomer.click('Cerrar sesión', { role: 'button', last: true });
    await newcomer.seen('Entra a tu mesa');
  } finally {
    await newcomer.close();
  }

  // Error states of the code entry.
  const visitor = await App.open(browser, 'visitante');
  try {
    const cases = [
      ['VENC22', 'Esta invitación venció', 'expired'],
      ['REVK23', /revoc|ya no es válida|cancel/i, 'revoked'],
      ['ACEP24', /ya (fue|se) (usad|acept)|ya usada|ya se usó|ya fue/i, 'already used'],
      [code, /ya (fue|se) (usad|acept)|ya usada|ya se usó|ya fue/i, 'just redeemed'],
      ['ZZZZZ9', /no existe|no encontramos|no es válid|incorrecto/i, 'unknown'],
    ];
    for (const [value, expected, label] of cases) {
      await previewCode(visitor, value);
      const seen = await visitor.seen(expected, 12_000);
      check(`${label} code ${value}: explained in plain Spanish`, seen, (await visitor.text()).slice(0, 400));
      await visitor.shot(`b-05-code-${label.replace(/ /g, '-')}`);
    }
  } finally {
    await visitor.close();
  }

  await roleMatrix(browser);
}
