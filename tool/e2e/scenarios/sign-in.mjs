// Scenario a — dev sign-in as each seeded role: right home, navigation and context chip; context
// switching; sign-out; redirect guard for signed-out visitors and for roles without permission.
import { App, check, sleep } from '../lib.mjs';

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
    check('no phone / SMS sign-in is offered', !/teléfono|SMS/i.test((await visitor.text()).replace(/Solo Google, Apple o Facebook[^\n]*/, '')));
    await visitor.shot('a-00-sign-in');
    await visitor.goto('/#/admin');
    check('deep link /admin while signed out → sign-in screen', await visitor.seen('Continuar con Google', 10_000) && !(await visitor.has('Explorador')));
    await visitor.goto('/#/sesion');
    check('deep link /sesion while signed out → sign-in screen', await visitor.seen('Continuar con Google', 10_000));
  } finally {
    await visitor.close();
  }

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
