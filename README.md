# B1101 Portfolio

My personal site, live at [pedram-malakshah.ir](https://pedram-malakshah.ir/).

Plain HTML, CSS and a little JavaScript. No build step.

- `index.html` – the page
- `css/style.css` – all styles and animations
- `js/main.js` – the scroll-driven 3D camera, pointer tilt, reveals
- `assets/fonts/` – self-hosted Archivo, JetBrains Mono and Vazirmatn (also embedded in the CVs)
- `js/i18n.js` – the Farsi text; English lives in `index.html`. Add `data-i18n="key"` to an element and a matching key here to translate it.

The language comes from `?lang=fa` / `?lang=en`, then the visitor's last choice, then their browser language. Farsi switches the whole page to right-to-left.

Run it locally with any static server, e.g. `python3 -m http.server`, then open http://localhost:8000.

## Update, version and deploy

`deploy.ps1` does it all in one go on Windows. It pulls `main`, bumps the version, commits, tags, pushes, and uploads the site to Cloudflare Pages with wrangler.

```
.\deploy.ps1                  # 2.0.0 -> 2.0.1
.\deploy.ps1 -Bump minor      # 2.0.0 -> 2.1.0
.\deploy.ps1 -Bump major      # 2.0.0 -> 3.0.0
.\deploy.ps1 -Version 3.0.0   # set an exact version
.\deploy.ps1 -BuildCv         # rebuild the CV PDFs first
.\deploy.ps1 -NoBump          # redeploy the current version
.\deploy.ps1 -NoDeploy        # version and push only
```

The first time, log in and create the Pages project:

```
wrangler login
wrangler pages project create b1101-portfolio --production-branch main
```

Only the site files go up (`index.html`, `css`, `js`, `img`, `assets`, `cv/pdf`). The version is in `VERSION` and shows in the footer. `tools/version.mjs` also updates the `?v=` keys on the CSS, JS, font and CV links, so returning visitors get the new files instead of cached ones.

Firebase still works too: `firebase deploy --only hosting`.

## CV PDFs

`cv/pdf/` holds the downloadable CVs (professional and designed, English and Farsi).
They're generated from `cv/content/en.json` and `cv/content/fa.json`:

```
node cv/build.mjs
```

This needs Playwright with Chromium (`npm i -g playwright && npx playwright install chromium`).
