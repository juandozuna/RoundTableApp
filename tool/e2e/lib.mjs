// Shared helpers for the end-to-end scripts: a tiny test runner and a driver for the Flutter web
// app. The app is rendered on a canvas, so the driver turns on Flutter's accessibility (semantics)
// tree and finds controls by their visible Spanish text.
import { mkdirSync } from 'node:fs';
import { join } from 'node:path';
import puppeteer from 'puppeteer-core';

export const BASE = process.env.E2E_BASE ?? 'http://127.0.0.1:3000';
export const SHOTS = process.env.E2E_SHOTS ?? '/tmp/e2e/shots';
export const CHROME =
  process.env.CHROME_PATH ?? '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome';
export const sleep = (ms) => new Promise((resolve) => setTimeout(resolve, ms));
mkdirSync(SHOTS, { recursive: true });

// ---------------------------------------------------------------------------------- runner

const results = [];
let current = null;

export async function scenario(name, fn) {
  console.log(`\n▶ ${name}`);
  const entry = { name, checks: [], failed: false };
  results.push(entry);
  current = entry;
  try {
    await fn();
  } catch (error) {
    entry.failed = true;
    entry.checks.push({ ok: false, label: `exception: ${error.message}` });
    console.log(`  ✗ exception: ${error.stack?.split('\n').slice(0, 4).join('\n    ')}`);
  }
}

export function check(label, condition, detail = '') {
  const ok = Boolean(condition);
  current?.checks.push({ ok, label });
  if (!ok && current) current.failed = true;
  console.log(`  ${ok ? '✓' : '✗'} ${label}${!ok && detail ? ` — ${detail}` : ''}`);
  return ok;
}

export function summarize() {
  console.log('\n──────── summary ────────');
  let failed = 0;
  for (const entry of results) {
    const passed = entry.checks.filter((c) => c.ok).length;
    console.log(`${entry.failed ? 'FAIL' : 'PASS'}  ${entry.name} (${passed}/${entry.checks.length})`);
    if (entry.failed) failed++;
  }
  return failed;
}

export async function launch() {
  return puppeteer.launch({
    executablePath: CHROME,
    headless: process.env.E2E_HEADED ? false : 'new',
    args: ['--no-sandbox', '--disable-dev-shm-usage'],
  });
}

// ---------------------------------------------------------------------------------- driver

const ACCOUNTS = {
  admin: 'Administrador',
  coord: 'Coordinador · Miembro',
  facil: 'Facilitador',
  ana: 'Miembro (Ana)',
  luis: 'Miembro (Luis)',
  marta: 'Miembro (Marta)',
};

export class App {
  constructor(context, page, name) {
    this.context = context;
    this.page = page;
    this.name = name;
    this.errors = [];
    page.on('pageerror', (error) => this.errors.push(String(error)));
    page.on('console', (msg) => {
      if (msg.type() === 'error') this.errors.push(msg.text());
    });
  }

  /** New isolated browser context (own storage, so own session) with one page. */
  static async open(browser, name, { width = 1280, height = 900, dark = true } = {}) {
    const context = await browser.createBrowserContext();
    const page = await context.newPage();
    await page.setViewport({ width, height });
    await page.emulateMediaFeatures([{ name: 'prefers-color-scheme', value: dark ? 'dark' : 'light' }]);
    const app = new App(context, page, name);
    await app.goto('/');
    return app;
  }

  async goto(path = '/') {
    await this.page.goto(`${BASE}${path}`, { waitUntil: 'load' });
    await this.page.waitForSelector('flt-semantics-placeholder', { timeout: 60_000 });
    await this.enableSemantics();
  }

  async enableSemantics() {
    await this.page.evaluate(() => document.querySelector('flt-semantics-placeholder')?.click());
    await this.page.waitForSelector('flt-semantics', { timeout: 30_000 });
  }

  async resize(width, height = 900) {
    await this.page.setViewport({ width, height });
    await sleep(800);
  }

  async setDark(dark) {
    await this.page.emulateMediaFeatures([{ name: 'prefers-color-scheme', value: dark ? 'dark' : 'light' }]);
    await sleep(800);
  }

  /** All visible semantic nodes: [{role, text, x, y, w, h, checked, disabled}]. */
  async nodes() {
    return this.page.evaluate(() =>
      [...document.querySelectorAll('flt-semantics, flt-semantics-container')]
        .filter((e) => e.tagName === 'FLT-SEMANTICS')
        .map((e) => {
          const r = e.getBoundingClientRect();
          const clone = e.cloneNode(true);
          clone.querySelectorAll('flt-semantics').forEach((child) => child.remove());
          const own = e.querySelector(':scope > input, :scope > textarea');
          const text = clone.textContent.trim() || e.getAttribute('aria-label') || own?.getAttribute('aria-label') || '';
          const input = e.querySelector(':scope > input, :scope > textarea');
          return {
            role: e.getAttribute('role') ?? '',
            text,
            x: r.x, y: r.y, w: r.width, h: r.height,
            checked: e.getAttribute('aria-checked'),
            selected: e.getAttribute('aria-selected'),
            disabled: e.getAttribute('aria-disabled') === 'true',
            value: input ? input.value : null,
            hasInput: Boolean(input),
          };
        })
        .filter((n) => n.w > 0 && n.h > 0),
    );
  }

  async text() {
    return (await this.nodes()).map((n) => n.text).join('\n');
  }

  /** Debug helper: prints the semantic tree. */
  async dump() {
    const rows = (await this.nodes()).filter((n) => n.text || n.hasInput);
    console.log(rows.map((n) => `${n.role || '-'}|${n.text.replace(/\n/g, ' ⏎ ')}${n.value != null ? `|value=${n.value}` : ''}`).join('\n'));
  }

  async has(matcher) {
    return (await this.find(matcher)) !== undefined;
  }

  /** `last`: take the match that comes last in the DOM (the top-most one, e.g. in a dialog). */
  async find(matcher, { role, nth = 0, last = false } = {}) {
    const test = toTest(matcher);
    const found = (await this.nodes()).filter((n) => (!role || n.role === role) && test(n.text));
    if (last) return found.filter((n) => rank(n, matcher) === Math.min(...found.map((m) => rank(m, matcher)))).at(-1);
    // Prefer the tightest match (exact first line), then smallest area.
    found.sort((a, b) => rank(a, matcher) - rank(b, matcher) || a.w * a.h - b.w * b.h);
    return found[nth];
  }

  async waitFor(matcher, { timeout = 20_000, role } = {}) {
    const deadline = Date.now() + timeout;
    while (Date.now() < deadline) {
      const node = await this.find(matcher, { role });
      if (node) return node;
      await sleep(250);
    }
    throw new Error(`[${this.name}] timed out waiting for ${String(matcher)}\n--- visible ---\n${(await this.text()).slice(0, 1500)}`);
  }

  async waitGone(matcher, { timeout = 20_000 } = {}) {
    const deadline = Date.now() + timeout;
    while (Date.now() < deadline) {
      if (!(await this.has(matcher))) return;
      await sleep(250);
    }
    throw new Error(`[${this.name}] ${String(matcher)} is still visible`);
  }

  /** Waits for the text, reporting instead of throwing (for check()). */
  async seen(matcher, timeout = 8000) {
    try {
      await this.waitFor(matcher, { timeout });
      return true;
    } catch {
      return false;
    }
  }

  async click(matcher, { role, nth = 0, last = false, timeout = 15_000, settle = 600 } = {}) {
    await this.waitFor(matcher, { role, timeout });
    const target = await this.scrollIntoView(matcher, { role, nth, last });
    await this.page.mouse.click(target.x + target.w / 2, target.y + target.h / 2);
    await sleep(settle);
  }

  /** Wheel-scrolls the page until the node sits inside the safe band of the viewport. */
  async scrollIntoView(matcher, { role, nth = 0, last = false } = {}) {
    const { height, width } = this.page.viewport();
    for (let attempt = 0; attempt < 12; attempt++) {
      const node = await this.find(matcher, { role, nth, last });
      if (!node) break;
      const centre = node.y + node.h / 2;
      if (centre >= 70 && centre <= height - 110) return node;
      await this.page.mouse.move(width / 2, height / 2);
      await this.page.mouse.wheel({ deltaY: centre > height / 2 ? Math.max(120, centre - height / 2) : -300 });
      await sleep(350);
    }
    return this.find(matcher, { role, nth, last });
  }

  /** Types into the n-th text field on screen (0 = first). */
  async fillNth(index, value) {
    const fields = (await this.nodes()).filter((n) => n.hasInput);
    const field = fields[index];
    if (!field) throw new Error(`[${this.name}] no text field #${index} (found ${fields.length})`);
    await this.typeInto(field, value);
  }

  /** Focuses a text field by its label and types. */
  async fill(label, value) {
    const test = toTest(label);
    const nodes = await this.nodes();
    const field = nodes.find((n) => n.hasInput && test(n.text));
    if (!field) throw new Error(`[${this.name}] no field ${label}`);
    await this.typeInto(field, value);
  }

  async typeInto(field, value) {
    await this.page.mouse.click(field.x + field.w / 2, field.y + field.h / 2);
    await sleep(300);
    const modifier = process.platform === 'darwin' ? 'Meta' : 'Control';
    await this.page.keyboard.down(modifier);
    await this.page.keyboard.press('KeyA');
    await this.page.keyboard.up(modifier);
    await this.page.keyboard.press('Backspace');
    await this.page.keyboard.type(value, { delay: 12 });
    await sleep(250);
  }

  async press(key) {
    await this.page.keyboard.press(key);
    await sleep(300);
  }

  async shot(name) {
    const path = join(SHOTS, `${name}.png`);
    await this.page.screenshot({ path });
    return path;
  }

  /**
   * Cuts (or restores) the browser's network for this context: the page and the PowerSync worker.
   * CDP's emulation is per target, and the sync stream lives in a worker, so both are covered.
   */
  async setOffline(offline) {
    this.offline = offline;
    this._cdp ??= new Map();
    const apply = async (key, create) => {
      try {
        let client = this._cdp.get(key);
        if (!client) {
          client = await create();
          await client.send('Network.enable');
          this._cdp.set(key, client);
        }
        await client.send('Network.emulateNetworkConditions', {
          offline,
          latency: 0,
          downloadThroughput: -1,
          uploadThroughput: -1,
        });
      } catch {
        this._cdp.delete(key); // target went away
      }
    };
    await apply('page', () => this.page.createCDPSession());
    for (const target of this.context.targets()) {
      if (!['worker', 'shared_worker', 'service_worker'].includes(target.type())) continue;
      await apply(target, async () => {
        const worker = await target.worker();
        return worker ? worker.client : target.createCDPSession();
      });
    }
    await sleep(800);
  }

  /** Aborts requests whose URL contains `fragment` while the returned function has not been called. */
  async blockRequests(fragment) {
    await this.page.setRequestInterception(true);
    let blocked = true;
    const handler = (request) => {
      if (blocked && request.url().includes(fragment)) request.abort('failed');
      else request.continue();
    };
    this.page.on('request', handler);
    return async () => {
      blocked = false;
      this.page.off('request', handler);
      await this.page.setRequestInterception(false);
    };
  }

  async devSignIn(account) {
    await this.waitFor(ACCOUNTS[account], { role: 'button', timeout: 30_000 });
    await this.click(ACCOUNTS[account], { role: 'button' });
  }

  async close() {
    await this.context.close();
  }
}

function toTest(matcher) {
  if (matcher instanceof RegExp) return (text) => matcher.test(text);
  return (text) => text.includes(matcher);
}

function rank(node, matcher) {
  if (matcher instanceof RegExp) return 0;
  const first = node.text.split('\n')[0].trim();
  if (first === matcher) return 0;
  if (node.text.trim() === matcher) return 0;
  return first.startsWith(matcher) ? 1 : 2;
}
