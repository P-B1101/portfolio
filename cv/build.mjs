// Builds the CV PDFs from cv/content/*.json.
//   node cv/build.mjs
// Needs Playwright with Chromium (npm i -g playwright). Writes cv/pdf/*.pdf.
import { readFileSync, writeFileSync, mkdirSync } from 'node:fs';
import { dirname, join } from 'node:path';
import { fileURLToPath, pathToFileURL } from 'node:url';
import { createRequire } from 'node:module';
import { execSync } from 'node:child_process';

const here = dirname(fileURLToPath(import.meta.url));
const require = createRequire(import.meta.url);
let chromium;
try { ({ chromium } = require('playwright')); }
catch { ({ chromium } = require(join(execSync('npm root -g').toString().trim(), 'playwright'))); }

const read = p => readFileSync(join(here, p), 'utf8');
const esc = s => String(s).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
const font = (name, file, weight = '100 900', stretch = '100%') =>
  `@font-face{font-family:"${name}";src:url(data:font/woff2;base64,${readFileSync(join(here, '..', 'assets', 'fonts', file)).toString('base64')}) format("woff2");font-weight:${weight};font-stretch:${stretch};}`;
const fonts = font('Archivo', 'archivo-latin.woff2', '100 900', '62% 125%') + font('JBM', 'jetbrains-mono-latin.woff2') + font('Vazirmatn', 'vazirmatn-arabic.woff2');

// inline an svg icon, forced to currentColor
const icon = name => {
  let s = read(`icons/${name}.svg`).replace(/<!--.*?-->/gs, '');
  s = s.replace(/<svg[^>]*?(viewBox="[^"]+")[^>]*>/s, (m, vb) => {
    const lucide = m.includes('stroke=');
    return `<svg class="ic" ${vb} ${lucide ? 'fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"' : 'fill="currentColor"'} aria-hidden="true">`;
  });
  return s.replace(/<title>.*?<\/title>/s, '');
};
const platIcon = { android: 'android', ios: 'apple', web: 'l-globe' };
const toolIcon = ['androidstudio', 'l-code-xml', 'git'];

const base = c => `
  ${fonts}
  @page { size: A4; margin: 0; }
  * { box-sizing: border-box; }
  html, body { margin: 0; }
  body { font-family: ${c.dir === 'rtl' ? '"Vazirmatn", "Archivo"' : '"Archivo"'}, Arial, sans-serif; -webkit-print-color-adjust: exact; print-color-adjust: exact; }
  .page { width: 210mm; height: 297mm; overflow: hidden; position: relative; }
  a { color: inherit; text-decoration: none; }
  .ltr { direction: ltr; unicode-bidi: isolate; }
  ul { margin: 0; padding: 0; list-style: none; }
  h1, h2, h3, p { margin: 0; }
`;
const range = (c, x) => `${esc(x.from)} – ${x.to ? esc(x.to) : esc(c.labels.present)}`;

/* ---------------- professional: text only ---------------- */
const professional = c => `<!doctype html><html lang="${c.lang}" dir="${c.dir}"><head><meta charset="utf-8"><title>${esc(c.name)} CV</title><style>
${base(c)}
.page { padding: 18mm 20mm; color: #111; font-size: 9.6pt; line-height: 1.5; }
header { border-bottom: 1.2pt solid #111; padding-bottom: 5mm; margin-bottom: 6mm; }
h1 { font-size: 24pt; font-weight: 800; letter-spacing: ${c.dir === 'rtl' ? '0' : '-.02em'}; line-height: 1.1; }
.role { font-size: 12pt; margin-top: 1mm; color: #333; }
.contact { display: flex; flex-wrap: wrap; gap: 1mm 5mm; margin-top: 3mm; font-size: 8.8pt; color: #333; }
section { margin-bottom: 5.5mm; }
h2 { font-size: 9pt; font-weight: 700; letter-spacing: ${c.dir === 'rtl' ? '0' : '.12em'}; text-transform: uppercase; color: #111; border-bottom: .5pt solid #bbb; padding-bottom: 1mm; margin-bottom: 2.5mm; }
.row { display: flex; justify-content: space-between; gap: 6mm; align-items: baseline; }
.job { margin-bottom: 3mm; }
.job h3 { font-size: 10.5pt; font-weight: 700; }
.job .t { color: #333; }
.date { color: #555; white-space: nowrap; font-size: 9pt; }
.job li, .proj li { position: relative; padding-inline-start: 4mm; }
.job li::before { content: "–"; position: absolute; inset-inline-start: 0; }
.proj li { padding-inline-start: 0; margin-bottom: 1.2mm; }
.proj b { font-weight: 700; }
.proj .meta { color: #555; }
.cols { display: grid; grid-template-columns: 1fr 1fr; gap: 0 10mm; }
/* Farsi skill names are longer, so they get one column */
.skills { columns: ${c.dir === 'rtl' ? 1 : 2}; column-gap: 10mm; }
.skills li { break-inside: avoid; }
</style></head><body><div class="page">
<header>
  <h1>${esc(c.name)}</h1>
  <p class="role">${esc(c.role)}</p>
  <div class="contact">
    <span class="ltr">${esc(c.contact.email)}</span><span class="ltr">${esc(c.contact.linkedin)}</span><span class="ltr">${esc(c.contact.github)}</span><span class="ltr">${esc(c.contact.website)}</span>
  </div>
</header>
<section><h2>${esc(c.labels.summary)}</h2><p>${esc(c.summary)}</p></section>
<section><h2>${esc(c.labels.experience)}</h2>
${c.experience.map(j => `<div class="job"><div class="row"><h3>${esc(j.company)} <span class="t">· ${esc(j.title)}</span></h3><span class="date">${range(c, j)}</span></div>
${j.notes ? `<ul>${j.notes.map(n => `<li>${esc(n)}</li>`).join('')}</ul>` : ''}</div>`).join('')}
</section>
<section class="proj"><h2>${esc(c.labels.projects)}</h2><ul>
${c.projects.map(p => `<li><div class="row"><span><b>${esc(p.name)}</b> · ${esc(p.desc)}</span><span class="meta">${p.platforms.map(x => esc(c.labels.platforms[x])).join(c.lang === 'fa' ? '، ' : ', ')}${p.internal ? ` (${esc(c.labels.internal)})` : ''} · ${esc(p.year)}</span></div></li>`).join('')}
</ul></section>
<div class="cols">
<section><h2>${esc(c.labels.skills)}</h2><ul class="skills">${c.skills.map(s => `<li>${esc(s.name)}</li>`).join('')}</ul></section>
<div>
<section><h2>${esc(c.labels.tools)}</h2><p>${c.tools.map(esc).join(' · ')}</p></section>
<section><h2>${esc(c.labels.education)}</h2><div class="row"><span><b>${esc(c.education.field)}</b><br>${esc(c.education.school)}</span><span class="date">${esc(c.education.from)} – ${esc(c.education.to)}</span></div></section>
</div>
</div>
</div></body></html>`;

/* ---------------- designed: colour + icons ---------------- */
const photo = 'data:image/jpeg;base64,' + readFileSync(join(here, '..', 'img', 'pedram.jpg')).toString('base64');
const designed = c => `<!doctype html><html lang="${c.lang}" dir="${c.dir}"><head><meta charset="utf-8"><title>${esc(c.name)} CV</title><style>
${base(c)}
:root { --ink: #171717; --paper: #f5f2eb; --amber: #ffb900; --dim: #a9a397; --mute: #6f6b63; --line: #e2ddd2; }
.page { display: grid; grid-template-columns: 68mm 1fr; background: var(--paper); color: var(--ink); font-size: 9.2pt; line-height: 1.45; }
.ic { width: 1em; height: 1em; flex: none; }
.mono { font-family: "JBM", monospace; }
aside { background: var(--ink); color: var(--paper); padding: 14mm 8mm 10mm; display: flex; flex-direction: column; gap: 7mm; position: relative; overflow: hidden; }
aside::after { content: "P"; position: absolute; bottom: -18mm; inset-inline-end: -8mm; font-size: 90mm; font-weight: 900; line-height: 1; color: transparent; -webkit-text-stroke: .6pt rgba(255,185,0,.22); font-family: "Archivo"; }
.ph { width: 40mm; height: 40mm; border-radius: 50%; border: 1.6mm solid var(--amber); background: url(${photo}) 54% 0% / 150%; filter: grayscale(1) contrast(1.05); margin-inline: auto; box-shadow: 2mm 2mm 0 rgba(255,185,0,.25); }
aside h2 { font-size: 8pt; font-weight: 700; color: var(--amber); letter-spacing: ${c.dir === 'rtl' ? '0' : '.14em'}; text-transform: uppercase; margin-bottom: 2.5mm; display: flex; align-items: center; gap: 2mm; }
aside h2::after { content: ""; flex: 1; height: .5pt; background: rgba(255,185,0,.35); }
.ct li { display: flex; align-items: center; gap: 2.5mm; margin-bottom: 2mm; font-size: 7.6pt; word-break: break-all; }
.ct .ic { width: 4.2mm; height: 4.2mm; padding: .9mm; box-sizing: content-box; border-radius: 50%; background: var(--amber); color: var(--ink); }
.sk li { display: flex; justify-content: space-between; align-items: center; gap: 2mm; margin-bottom: 1.6mm; font-size: 8.2pt; }
.dots { display: flex; gap: 1mm; direction: ltr; }
.dots i { width: 2mm; height: 2mm; border-radius: 50%; border: .5pt solid var(--amber); }
.dots i.on { background: var(--amber); }
.tl li { display: flex; align-items: center; gap: 2.5mm; margin-bottom: 1.8mm; font-size: 8.2pt; }
.tl .ic { width: 4mm; height: 4mm; color: var(--amber); }
main { padding: 14mm 12mm 10mm; display: flex; flex-direction: column; gap: 6mm; }
.hd h1 { font-size: 27pt; line-height: 1; font-weight: 850; font-stretch: ${c.dir === 'rtl' ? '100%' : '118%'}; letter-spacing: ${c.dir === 'rtl' ? '0' : '-.03em'}; }
.tag { display: inline-flex; align-items: center; gap: 2mm; margin-top: 3mm; background: var(--amber); color: var(--ink); padding: 1.2mm 3.5mm; border-radius: 99px; font-weight: 700; font-size: 9pt; }
.tag .ic { width: 3.6mm; height: 3.6mm; }
.sum { font-size: 9.6pt; color: #333; margin-top: 4mm; }
main h2 { display: flex; align-items: center; gap: 2.5mm; font-size: 12pt; font-weight: 800; margin-bottom: 3.5mm; }
main h2 .ic { width: 6.2mm; height: 6.2mm; padding: 1.3mm; box-sizing: content-box; background: var(--ink); color: var(--amber); border-radius: 2mm; }
.xp { position: relative; padding-inline-start: 6mm; }
.xp::before { content: ""; position: absolute; top: 1.5mm; bottom: 1.5mm; inset-inline-start: 1.1mm; width: .8pt; background: var(--ink); }
.xp li { position: relative; margin-bottom: 3mm; }
.xp li::before { content: ""; position: absolute; top: 1.2mm; inset-inline-start: -6mm; width: 2.4mm; height: 2.4mm; border-radius: 50%; background: var(--paper); border: .8pt solid var(--ink); }
.xp li.now::before { background: var(--amber); box-shadow: 0 0 0 1mm rgba(255,185,0,.3); }
.xp .row { display: flex; justify-content: space-between; align-items: baseline; gap: 4mm; }
.xp h3 { font-size: 10.5pt; font-weight: 800; }
.xp .t { color: var(--mute); font-weight: 500; }
.xp .d { font-size: 7.6pt; color: var(--mute); white-space: nowrap; }
.xp li.now .d { color: var(--ink); background: var(--amber); padding: .3mm 2mm; border-radius: 99px; }
.xp p { color: #444; margin-top: .6mm; }
.pj { display: grid; grid-template-columns: 1fr 1fr; gap: 2.8mm; }
.pj li { background: #fff; border: .6pt solid var(--line); border-radius: 3mm; padding: 3mm 3.5mm; position: relative; }
.pj li:nth-child(1) { background: var(--ink); color: var(--paper); border-color: var(--ink); }
.pj li:nth-child(1) .pd { color: var(--dim); }
.pj b { font-size: 9.8pt; font-weight: 800; display: block; }
.pd { color: var(--mute); font-size: 8pt; display: block; margin-top: .5mm; min-height: 2.4em; }
.pf { display: flex; align-items: center; gap: 1.6mm; margin-top: 2mm; font-size: 7.4pt; }
.pf .ic { width: 3.6mm; height: 3.6mm; }
.pf .yr { margin-inline-start: auto; font-weight: 700; background: var(--amber); color: var(--ink); padding: .2mm 2mm; border-radius: 99px; }
.pf .int { color: var(--mute); border: .5pt dashed var(--mute); border-radius: 99px; padding: 0 1.6mm; }
.ed { display: flex; align-items: center; justify-content: space-between; gap: 4mm; background: #fff; border: .6pt solid var(--line); border-radius: 3mm; padding: 3mm 4mm; }
.ed b { font-weight: 800; font-size: 10pt; display: block; }
.ed span { color: var(--mute); }
.more { margin-top: auto; display: flex; align-items: center; gap: 2mm; font-size: 8pt; color: var(--mute); }
.more a { color: var(--ink); font-weight: 700; border-bottom: .8pt solid var(--amber); }
</style></head><body><div class="page">
<aside>
  <div class="ph"></div>
  <section><h2>${esc(c.labels.contact)}</h2><ul class="ct ltr">
    <li>${icon('l-mail')}<a href="mailto:${esc(c.contact.email)}">${esc(c.contact.email)}</a></li>
    <li>${icon('linkedin')}<a href="https://${esc(c.contact.linkedin)}">${esc(c.contact.linkedin.replace('linkedin.com/in/', 'in/'))}</a></li>
    <li>${icon('github')}<a href="https://${esc(c.contact.github)}">${esc(c.contact.github)}</a></li>
    <li>${icon('l-globe')}<a href="https://${esc(c.contact.website)}">${esc(c.contact.website)}</a></li>
  </ul></section>
  <section><h2>${esc(c.labels.skills)}</h2><ul class="sk">
    ${c.skills.map(s => `<li><span>${esc(s.name)}</span><span class="dots">${[1, 2, 3].map(i => `<i class="${i <= s.level ? 'on' : ''}"></i>`).join('')}</span></li>`).join('')}
  </ul></section>
  <section><h2>${esc(c.labels.tools)}</h2><ul class="tl">
    ${c.tools.map((t, i) => `<li>${icon(toolIcon[i])}<span>${esc(t)}</span></li>`).join('')}
  </ul></section>
</aside>
<main>
  <div class="hd">
    <h1>${esc(c.name)}</h1>
    <span class="tag">${icon('flutter')}${esc(c.role)}</span>
    <p class="sum">${esc(c.summary)}</p>
  </div>
  <section><h2>${icon('l-briefcase')}${esc(c.labels.experience)}</h2><ul class="xp">
    ${c.experience.map(j => `<li class="${j.to ? '' : 'now'}"><div class="row"><h3>${esc(j.company)} <span class="t">· ${esc(j.title)}</span></h3><span class="d">${range(c, j)}</span></div>${(j.notes || []).map(n => `<p>${esc(n)}</p>`).join('')}</li>`).join('')}
  </ul></section>
  <section><h2>${icon('l-smartphone')}${esc(c.labels.projects)}</h2><ul class="pj">
    ${c.projects.map(p => `<li><b>${esc(p.name)}</b><span class="pd">${esc(p.desc)}</span><span class="pf">${p.platforms.map(x => icon(platIcon[x])).join('')}${p.internal ? `<span class="int">${esc(c.labels.internal)}</span>` : ''}<span class="yr">${esc(p.year)}</span></span></li>`).join('')}
  </ul></section>
  <section><h2>${icon('l-graduation-cap')}${esc(c.labels.education)}</h2>
    <div class="ed"><div><b>${esc(c.education.field)}</b><span>${esc(c.education.school)}</span></div><span class="mono">${esc(c.education.from)} – ${esc(c.education.to)}</span></div>
  </section>
  <p class="more">${esc(c.labels.more)} <a class="ltr" href="https://${esc(c.contact.website)}">${esc(c.contact.website)}</a></p>
</main>
</div></body></html>`;

const outDir = join(here, 'pdf');
mkdirSync(outDir, { recursive: true });
const browser = await chromium.launch();
const page = await browser.newPage();
for (const lang of ['en', 'fa']) {
  const c = JSON.parse(read(`content/${lang}.json`));
  for (const [style, tpl] of [['professional', professional], ['designed', designed]]) {
    const html = tpl(c);
    const htmlPath = join(outDir, `.${style}-${lang}.html`);
    writeFileSync(htmlPath, html);
    await page.goto(pathToFileURL(htmlPath).href);
    await page.evaluate(() => document.fonts.ready);
    const over = await page.evaluate(() => { const p = document.querySelector('.page'); return p.scrollHeight - p.clientHeight; });
    if (over > 1) console.warn(`! ${style}-${lang} overflows the page by ${over}px`);
    const file = join(outDir, `pedram-cv-${style}-${lang}.pdf`);
    await page.pdf({ path: file, format: 'A4', printBackground: true, preferCSSPageSize: true });
    console.log('wrote', file);
  }
}
await browser.close();
