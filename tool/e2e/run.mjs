// Runs the end-to-end scenarios against the local stack. See README.md.
//   node run.mjs [scenario ...]      e.g. node run.mjs live-session
import { launch, summarize } from './lib.mjs';
import { liveSession } from './scenarios/live-session.mjs';
import { offline } from './scenarios/offline.mjs';
import { admin } from './scenarios/admin.mjs';
import { signIn } from './scenarios/sign-in.mjs';
import { invites } from './scenarios/invites.mjs';
import { isolation } from './scenarios/isolation.mjs';
import { responsive } from './scenarios/responsive.mjs';
import { history } from './scenarios/history.mjs';
import { schedule } from './scenarios/schedule.mjs';
import { calendar } from './scenarios/calendar.mjs';

const all = { 'sign-in': signIn, invites, isolation, responsive, 'live-session': liveSession, offline, admin, history, schedule, calendar };
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
