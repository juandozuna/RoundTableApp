// Scenario e (responsive) — key screens at 390 (phone), 820 (tablet) and 1280 (desktop) in light and
// dark. Screenshots go to the shots folder; the checks cover navigation placement and that no
// content is laid out beyond the viewport width.
import { App, check, sleep } from '../lib.mjs';
import { resetDemoSession } from '../flows.mjs';

const WIDTHS = [390, 820, 1280];

async function overflowing(app, width) {
  const nodes = await app.nodes();
  return nodes.filter((n) => n.text && n.w < width * 3 && n.x + n.w > width + 2 && n.w > 4).map((n) => n.text.slice(0, 40));
}

async function navPlacement(app, width, height, tabName) {
  const tab = await app.find(new RegExp(`^${tabName}(\\s*\\n?Pestaña.*)?$`), { role: ['button', 'tab'] });
  if (!tab) return 'missing';
  return tab.y > height - 120 ? 'bottom' : tab.x < 260 ? 'side' : 'top';
}

export async function responsive(browser) {
  resetDemoSession();
  for (const dark of [true, false]) {
    const theme = dark ? 'dark' : 'light';
    const admin = await App.open(browser, `admin-${theme}`, { width: 1280, height: 900, dark });
    const member = await App.open(browser, `ana-${theme}`, { width: 1280, height: 900, dark });
    const signedOut = await App.open(browser, `visitante-${theme}`, { width: 1280, height: 900, dark });
    try {
      await admin.devSignIn('admin');
      await admin.waitFor('Estás como Administrador', { timeout: 20_000 });
      await member.devSignIn('ana');
      await member.waitFor('Estás como Miembro', { timeout: 20_000 });
      for (const width of WIDTHS) {
        const height = width === 390 ? 844 : 900;
        for (const app of [admin, member, signedOut]) {
          await app.page.setViewport({ width, height });
        }
        await sleep(1500);
        // Sign-in (signed out)
        await signedOut.waitFor('Continuar con Google');
        await signedOut.shot(`r-signin-${width}-${theme}`);
        check(`${theme} ${width}: sign-in has no content beyond the viewport`, (await overflowing(signedOut, width)).length === 0, (await overflowing(signedOut, width)).join(' | '));
        // Admin home + explorer
        await admin.goto('/');
        await admin.waitFor('Estás como Administrador', { timeout: 20_000 });
        await admin.shot(`r-admin-home-${width}-${theme}`);
        const placement = await navPlacement(admin, width, height, 'Mesas');
        check(`${theme} ${width}: navigation is ${width < 600 ? 'a bottom bar' : width < 1000 ? 'bottom/side' : 'a side rail'} (${placement})`, width < 600 ? placement === 'bottom' : width >= 1000 ? placement === 'side' : placement !== 'missing');
        await admin.click(/^Mesas(\s*\n?Pestaña.*)?$/, { role: ['button', 'tab'] });
        await admin.waitFor(/^Mesas \d+$/, { timeout: 20_000 });
        await admin.shot(`r-admin-explorer-${width}-${theme}`);
        // Member home + session lobby
        await member.goto('/');
        await member.waitFor('Estás como Miembro', { timeout: 20_000 });
        await member.shot(`r-member-home-${width}-${theme}`);
        check(`${theme} ${width}: member home has no content beyond the viewport`, (await overflowing(member, width)).length === 0, (await overflowing(member, width)).join(' | '));
        await member.click(/^Sesión(\s*\n?Pestaña.*)?$/, { role: ['button', 'tab'] });
        await member.waitFor('Esperando a tu facilitador', { timeout: 20_000 });
        await member.shot(`r-member-session-${width}-${theme}`);
        check(`${theme} ${width}: session lobby has no content beyond the viewport`, (await overflowing(member, width)).length === 0, (await overflowing(member, width)).join(' | '));
      }
    } finally {
      await admin.close();
      await member.close();
      await signedOut.close();
    }
  }
}
