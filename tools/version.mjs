// Bump the site version: node tools/version.mjs 2.0.1
// Updates VERSION, the footer label and every ?v= cache key so returning visitors get the new files.
import { readFileSync, writeFileSync } from 'node:fs';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';

const root = join(dirname(fileURLToPath(import.meta.url)), '..');
const next = process.argv[2];
if (!/^\d+\.\d+\.\d+$/.test(next || '')) {
  console.error('usage: node tools/version.mjs <major.minor.patch>');
  process.exit(1);
}

const prev = readFileSync(join(root, 'VERSION'), 'utf8').trim();
writeFileSync(join(root, 'VERSION'), next + '\n');
for (const file of ['index.html', 'js/i18n.js', 'assets/fonts/fonts.css']) {
  const path = join(root, file);
  const text = readFileSync(path, 'utf8')
    .replace(/\?v=\d+\.\d+\.\d+/g, `?v=${next}`)
    .replace(/(class="ver"[^>]*>)v\d+\.\d+\.\d+/, `$1v${next}`);
  writeFileSync(path, text);
}
console.log(`${prev} -> ${next}`);
