// Scenario a — dev sign-in as each seeded role: right home, navigation and context chip; context
// switching; sign-out; redirect guard for signed-out visitors and for roles without permission;
// email + password sign-up / sign-in / reset form (ADR 0018, local stack auto-confirms accounts).
import { App, check, sleep } from '../lib.mjs';
import { sql } from '../flows.mjs';

const ROLES = [
  { account: 'admin', chip: 'Estás como Administrador, Plataforma', tabs: ['Inicio', 'Calendario', 'Mesas', 'Informes', 'Auditoría', 'Currículo', 'Invitaciones', 'Ajustes'], absent: [] },
  { account: 'facil', chip: 'Estás como Facilitador, Mesa Esperanza 03', tabs: ['Inicio', 'Sesión', 'Calendario', 'Progreso', 'Invitaciones', 'Ajustes'], absent: ['Informes', 'Auditoría'] },
  { account: 'ana', chip: 'Estás como Miembro, Mesa Esperanza 03', tabs: ['Inicio', 'Sesión', 'Progreso', 'Ajustes'], absent: ['Informes', 'Auditoría', 'Invitaciones', 'Calendario'] },
  { account: 'luis', chip: 'Estás como Miembro, Mesa Esperanza 03', tabs: ['Inicio', 'Sesión', 'Progreso', 'Ajustes'], absent: ['Informes'] },
  { account: 'marta', chip: 'Estás como Miembro, Mesa Esperanza 03', tabs: ['Inicio', 'Sesión', 'Progreso', 'Ajustes'], absent: ['Informes'] },
];

async function signOut(app) {
  await app.click('Ajustes', { role: 'button' });
  await app.click('Cerrar sesión', { role: 'button' });
  await app.click('Cerrar sesión', { role: 'button', last: true });
  return app.seen('Entra a tu mesa', 15_000);
}

export async function signIn(browser) {
  // Signed-out visitors are sent to the sign-in screen from any deep link.
  const visitor = await App.open(browser, 'visitante');
  try {
    check('signed-out visitor sees the sign-in screen with Google/Apple/Facebook', (await visitor.seen('Continuar con Google')) && (await visitor.has('Continuar con Apple')) && (await visitor.has('Continuar con Facebook')));
    check('email + password form is offered next to the providers', (await visitor.has('Correo *')) && (await visitor.has('Contraseña *')) && (await visitor.has('¿Olvidaste tu contraseña?')));
    check('no phone / SMS sign-in is offered', !/teléfono|SMS/i.test((await visitor.text()).replace(/No se usa SMS[^\n]*/, '')));
    await visitor.shot('a-00-sign-in');
    await visitor.goto('/#/admin');
    check('deep link /admin while signed out → sign-in screen', await visitor.seen('Continuar con Google', 10_000) && !(await visitor.has('Explorador')));
    await visitor.goto('/#/sesion');
    check('deep link /sesion while signed out → sign-in screen', await visitor.seen('Continuar con Google', 10_000));
  } finally {
    await visitor.close();
  }

  await emailAccount(browser);

  for (const role of ROLES) {
    const app = await App.open(browser, role.account);
    try {
      await app.devSignIn(role.account);
      await app.waitFor(role.chip, { timeout: 20_000 });
      const navigation = await app.text();
      check(`${role.account}: context chip "${role.chip.replace('Estás como ', '')}"`, true);
      check(`${role.account}: navigation = ${role.tabs.join(', ')}`,
        role.tabs.every((tab) => new RegExp(`^${tab}\\s*\\n?Pestaña \\d de ${role.tabs.length}`, 'm').test(navigation)), navigation.slice(0, 400));
      check(`${role.account}: no ${role.absent.join('/') || 'extra'} tabs`, role.absent.every((tab) => !new RegExp(`^${tab}\\s*\\n?Pestaña`, 'm').test(navigation)));
      await app.shot(`a-01-home-${role.account}`);
      check(`${role.account}: sign-out returns to the sign-in screen`, await signOut(app));
      await app.goto('/#/ajustes');
      check(`${role.account}: after sign-out a protected deep link redirects to sign-in`, await app.seen('Continuar con Google', 10_000));
    } finally {
      await app.close();
    }
  }

  // Coordinator who is also a member: picks a role on first access and can switch from the chip.
  const coord = await App.open(browser, 'coord');
  try {
    await coord.devSignIn('coord');
    check('coordinator with two roles is asked which one to use', await coord.seen('¿Con qué rol entras hoy?', 15_000));
    await coord.click('Coordinador, Fundación Luz', { role: 'button' });
    check('coordinator home with the coordinator chip', await coord.seen('Estás como Coordinador, Fundación Luz', 15_000));
    check('coordinator navigation has reports and audit', (await coord.has('Informes')) && (await coord.has('Auditoría')));
    await coord.shot('a-02-coordinator');
    await coord.click(/^Estás como/);
    await coord.click('Miembro, Mesa Fe 01', { role: 'menuitem' });
    check('switching the context to Miembro · Mesa Fe 01 updates the chip and navigation', await coord.seen('Estás como Miembro, Mesa Fe 01', 15_000) && !(await coord.has('Auditoría')));
    await coord.shot('a-03-coordinator-as-member');
    // The choice is remembered after a reload.
    await coord.goto('/');
    check('chosen context is remembered after a reload', await coord.seen('Estás como Miembro, Mesa Fe 01', 15_000));
  } finally {
    await coord.close();
  }

  // A member opening an admin deep link gets a clear "no permission" screen, not the admin UI.
  const member = await App.open(browser, 'ana');
  try {
    await member.devSignIn('ana');
    await member.waitFor('Estás como Miembro', { timeout: 20_000 });
    await member.goto('/#/admin');
    check('member opening /admin sees "Sin permiso" and no explorer', (await member.seen('Sin permiso', 10_000)) && !(await member.has('Explorador')));
    await member.shot('a-04-member-forbidden');
    await member.click(/Ir al explorador|Ir al inicio/, { role: 'button' });
    await sleep(1500);
    check('the way out of "Sin permiso" leads to a screen the member can use', await member.seen(/Estás como Miembro/, 10_000) && !(await member.has('Sin permiso')), (await member.text()).slice(0, 300));
  } finally {
    await member.close();
  }
}

// Email + password: validation, wrong password, sign-up (signed in right away), sign-out, sign-in again
// and the password-reset request. The new account has no person row, so the access gate says so.
async function emailAccount(browser) {
  const email = `correo.${Date.now()}@e2e.local`;
  const password = 'clave-segura-123';
  const newPassword = 'clave-nueva-456';
  const app = await App.open(browser, 'correo');
  try {
    await app.seen('Entra a tu mesa', 20_000);
    await app.click('Entrar', { role: 'button' });
    check('empty email form is validated, not sent', await app.seen('Este campo es obligatorio.', 5000));

    await app.click('¿Primera vez? Crear cuenta', { role: 'button' });
    check('create-account mode asks to repeat the password', await app.seen('Repite la contraseña *', 8000));
    await app.fill('Correo *', email);
    await app.fill('Contraseña nueva *', 'corta');
    await app.fill('Repite la contraseña *', 'otra');
    await app.click('Crear cuenta', { role: 'button', last: true });
    check('short password is rejected before reaching the server', await app.seen('al menos 8 caracteres', 5000));
    check('mismatching confirmation is rejected', await app.has('Las contraseñas no coinciden.'));
    await app.shot('a-05-create-account-validation');

    await app.fill('Contraseña nueva *', password);
    await app.fill('Repite la contraseña *', password);
    await app.click('Crear cuenta', { role: 'button', last: true });
    check('a new account is signed in right away (no person yet → "No encontramos tu cuenta")', await app.seen('No encontramos tu cuenta', 25_000));
    check('server: the auth user exists', sql(`select count(*) from auth.users where email = '${email}'`) === '1');
    await app.shot('a-06-email-account-created');
    await app.click('Cerrar sesión', { role: 'button' });
    await app.click('Cerrar sesión', { role: 'button', last: true });
    check('sign-out returns to the sign-in screen', await app.seen('Entra a tu mesa', 15_000));

    await app.fill('Correo *', email);
    await app.fill('Contraseña *', 'incorrecta-123');
    await app.click('Entrar', { role: 'button' });
    check('wrong password says so in plain words', await app.seen('Correo o contraseña incorrectos.', 15_000));
    await app.fill('Contraseña *', password);
    await app.click('Entrar', { role: 'button' });
    check('right password signs in again', await app.seen('No encontramos tu cuenta', 25_000));
    await app.click('Cerrar sesión', { role: 'button' });
    await app.click('Cerrar sesión', { role: 'button', last: true });
    await app.seen('Entra a tu mesa', 15_000);

    await app.click('¿Olvidaste tu contraseña?', { role: 'button' });
    check('reset mode asks only for the email and has a way back', (await app.seen('Recupera tu contraseña', 8000)) && !(await app.has('Contraseña *')));
    await app.fill('Correo *', email);
    await app.click('Enviar enlace', { role: 'button' });
    check('the reset request is confirmed on the sign-in screen', await app.seen('Revisa tu correo', 20_000));
    await app.shot('a-07-reset-sent');

    // The emailed link signs the person in (PKCE, same browser) and opens the new-password page.
    const code = await recoveryCode(email);
    check('the reset email carries a recovery link', Boolean(code));
    await app.goto(`/?code=${code}#/nueva-contrasena`);
    check('the recovery link opens "Elige tu contraseña nueva"', await app.seen('Elige tu contraseña nueva', 25_000), (await app.text()).slice(0, 300));
    await app.fill('Contraseña nueva *', 'corta');
    await app.fill('Repite la contraseña *', 'corta');
    await app.click('Guardar contraseña', { role: 'button' });
    check('a short new password is rejected', await app.seen('al menos 8 caracteres', 5000));
    await app.fill('Contraseña nueva *', newPassword);
    await app.fill('Repite la contraseña *', newPassword);
    await app.click('Guardar contraseña', { role: 'button' });
    check('the new password is saved', await app.seen('Contraseña actualizada', 20_000));
    await app.shot('a-08-password-updated');
    await app.click('Continuar', { role: 'button' });
    check('continuing leaves the page for the access gate', await app.seen('No encontramos tu cuenta', 25_000));
    await app.click('Cerrar sesión', { role: 'button' });
    await app.click('Cerrar sesión', { role: 'button', last: true });
    await app.seen('Entra a tu mesa', 15_000);
    await app.fill('Correo *', email);
    await app.fill('Contraseña *', newPassword);
    await app.click('Entrar', { role: 'button' });
    check('the new password signs in', await app.seen('No encontramos tu cuenta', 25_000));
  } finally {
    await app.close();
  }
}

/** Opens the latest recovery email's link against the local Auth server and returns the PKCE `code` it redirects with. */
async function recoveryCode(email) {
  const mail = process.env.MAILPIT_URL ?? 'http://127.0.0.1:54324';
  for (let attempt = 0; attempt < 10; attempt++) {
    const list = await (await fetch(`${mail}/api/v1/search?query=${encodeURIComponent(`to:${email}`)}`)).json();
    const id = list.messages?.[0]?.ID;
    if (id) {
      const message = await (await fetch(`${mail}/api/v1/message/${id}`)).json();
      const link = /\(\s*(http[^ )]+\/auth\/v1\/verify[^ )]+)\s*\)/.exec(message.Text ?? '')?.[1];
      if (!link) return null;
      const response = await fetch(link, { redirect: 'manual' });
      const location = response.headers.get('location') ?? '';
      return new URL(location).searchParams.get('code');
    }
    await sleep(500);
  }
  return null;
}
