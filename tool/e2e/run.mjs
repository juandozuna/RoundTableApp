// Runs the end-to-end scenarios against the local stack. See README.md.
//   node run.mjs [scenario ...]      e.g. node run.mjs live-session
import { launch, summarize } from './lib.mjs';
import { liveSession } from './scenarios/live-session.mjs';
import { offline } from './scenarios/offline.mjs';
import { admin } from './scenarios/admin.mjs';
import { signIn } from './scenarios/sign-in.mjs';
import { invites } from './scenarios/invites.mjs';

const all = { 'sign-in': signIn, invites, 'live-session': liveSession, offline, admin };
const selected = process.argv.length > 2 ? process.argv.slice(2) : Object.keys(all);
const browser = await launch();
try {
  for (const name of selected) {
    if (!all[name]) throw new Error(`Unknown scenario ${name}. Known: ${Object.keys(all).join(', ')}`);
    const { scenario } = await import('./lib.mjs');
    await scenario(name, () => all[name](browser));
  }
} finally {
  await browser.close();
}
process.exit(summarize() === 0 ? 0 : 1);
