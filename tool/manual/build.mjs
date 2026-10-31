#!/usr/bin/env node
// Builds the user manual PDF (site/manual/gold-roundtables-manual.pdf) from tool/manual/manual.html.
//
//   node tool/manual/build.mjs
//
// Each <figure data-shot="key"> gets the screenshot site/img/manual/<file> named in shots.json
// (key → file); figures without a screenshot are dropped with a warning. The table of contents is
// generated from the h2/h3 headings. Renders with headless Chrome through tool/e2e's puppeteer-core
// (run `npm ci` in tool/e2e once). CHROME_PATH overrides the Chrome binary.
import { readFileSync, writeFileSync, mkdirSync, existsSync, rmSync } from 'node:fs';
import { createRequire } from 'node:module';
import { dirname, join } from 'node:path';
import { fileURLToPath, pathToFileURL } from 'node:url';

const here = dirname(fileURLToPath(import.meta.url));
const root = join(here, '..', '..');
const imgDir = join(root, 'site', 'img', 'manual');
const outDir = join(root, 'site', 'manual');
const outPdf = join(outDir, 'gold-roundtables-manual.pdf');
const chrome = process.env.CHROME_PATH ?? '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome';

const shots = JSON.parse(readFileSync(join(here, 'shots.json'), 'utf8'));
let html = readFileSync(join(here, 'manual.html'), 'utf8');

const missing = [];
html = html.replace(/<figure data-shot="([^"]+)"([^>]*)>([\s\S]*?)<\/figure>/g, (_, key, attrs, inner) => {
  const entry = shots[key];
  const file = typeof entry === 'string' ? entry : entry?.file;
  if (!file || !existsSync(join(imgDir, file))) {
    missing.push(key);
    return '';
  }
  const phone = typeof entry === 'object' && entry.phone ? ' class="phone"' : '';
  const src = pathToFileURL(join(imgDir, file)).href;
  return `<figure${phone}${attrs}><img src="${src}" alt="">${inner}</figure>`;
});

// Table of contents from h2 (chapters) and h3 (sections).
const headings = [...html.matchAll(/<h([23])(?: id="([^"]*)")?(?: class="([^"]*)")?>([\s\S]*?)<\/h\1>/g)]
  .filter(([, , , cls]) => !cls?.includes('no-toc'));
let slug = 0;
let toc = '<ol>';
let open = false;
for (const [full, level, id, , text] of headings) {
  const anchor = id || `s${++slug}`;
  if (!id) html = html.replace(full, full.replace(`<h${level}`, `<h${level} id="${anchor}"`));
  const label = text.replace(/<[^>]+>/g, '');
  if (level === '2') {
    if (open) toc += '</ol></li>';
    toc += `<li><a href="#${anchor}">${label}</a><ol>`;
    open = true;
  } else {
    toc += `<li><a href="#${anchor}">${label}</a></li>`;
  }
}
toc += open ? '</ol></li></ol>' : '</ol>';
html = html.replace('<nav id="toc"></nav>', `<nav id="toc">${toc}</nav>`);

const tmp = join(here, '.manual.build.html');
writeFileSync(tmp, html);
mkdirSync(outDir, { recursive: true });

const require = createRequire(join(root, 'tool', 'e2e', 'package.json'));
const puppeteer = require('puppeteer-core');
const browser = await puppeteer.launch({ executablePath: chrome, headless: 'new', args: ['--allow-file-access-from-files'] });
try {
  const page = await browser.newPage();
  await page.goto(pathToFileURL(tmp).href, { waitUntil: 'networkidle0' });
  await page.pdf({
    path: outPdf,
    format: 'A4',
    printBackground: true,
    preferCSSPageSize: true,
    displayHeaderFooter: true,
    headerTemplate: '<span></span>',
    footerTemplate:
      '<div style="font-size:7.5pt;color:#7c72b8;width:100%;padding:0 16mm;display:flex;justify-content:space-between;font-family:-apple-system,Roboto,Arial">' +
      '<span>Gold Roundtables · Manual de uso</span><span><span class="pageNumber"></span> / <span class="totalPages"></span></span></div>',
  });
} finally {
  await browser.close();
  rmSync(tmp, { force: true });
}

if (missing.length) console.warn(`Figures without a screenshot (dropped): ${missing.join(', ')}`);
console.log(`Wrote ${outPdf}`);
