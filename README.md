# B1101 Portfolio

My personal site, live at [b1101-portfolio.web.app](https://b1101-portfolio.web.app/).

Plain HTML, CSS and a little JavaScript. No build step.

- `index.html` – the page
- `css/style.css` – all styles and animations
- `js/main.js` – the scroll-driven 3D camera, pointer tilt, reveals

Run it locally with any static server, e.g. `python3 -m http.server`, then open http://localhost:8000.

Deploy with `firebase deploy --only hosting`.

## CV PDFs

`cv/pdf/` holds the downloadable CVs (professional and designed, English and Farsi).
They're generated from `cv/content/en.json` and `cv/content/fa.json`:

```
node cv/build.mjs
```

This needs Playwright with Chromium (`npm i -g playwright && npx playwright install chromium`).
