# B1101 Portfolio

My personal site, live at [b1101-portfolio.web.app](https://b1101-portfolio.web.app/).

Plain HTML, CSS and a little JavaScript. No build step.

- `index.html` – the page
- `css/style.css` – all styles and animations
- `js/main.js` – the scroll-driven 3D camera, pointer tilt, reveals
- `assets/fonts/` – self-hosted Archivo, JetBrains Mono and Vazirmatn (also embedded in the CVs)
- `js/i18n.js` – the Farsi text; English lives in `index.html`. Add `data-i18n="key"` to an element and a matching key here to translate it.

The language comes from `?lang=fa` / `?lang=en`, then the visitor's last choice, then their browser language. Farsi switches the whole page to right-to-left.

Run it locally with any static server, e.g. `python3 -m http.server`, then open http://localhost:8000.

Deploy with `firebase deploy --only hosting`.

## Versions

The current version is in `VERSION` and shows in the footer. To release a new one:

```
node tools/version.mjs 2.0.1
git commit -am "v2.0.1" && git tag v2.0.1 && git push --follow-tags
```

The script also updates the `?v=` keys on the CSS, JS, font and CV links, so returning visitors get the new files instead of cached ones.

## CV PDFs

`cv/pdf/` holds the downloadable CVs (professional and designed, English and Farsi).
They're generated from `cv/content/en.json` and `cv/content/fa.json`:

```
node cv/build.mjs
```

This needs Playwright with Chromium (`npm i -g playwright && npx playwright install chromium`).
