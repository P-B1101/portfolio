// The bits CSS can't do alone: the scroll-driven camera, pointer tilt, reveals.
(() => {
  const root = document.documentElement;
  const body = document.body;
  root.classList.remove('no-js');

  const still = matchMedia('(prefers-reduced-motion: reduce)').matches;
  const finePointer = matchMedia('(hover: hover) and (pointer: fine)').matches;
  const clamp = (v, a, b) => Math.min(Math.max(v, a), b);
  const lerp = (a, b, t) => a + (b - a) * t;

  const year = new Date().getFullYear();
  const fa = document.documentElement.lang === 'fa';
  const num = n => fa ? n.toLocaleString('fa-IR', { useGrouping: false }) : String(n);
  document.querySelectorAll('.yr').forEach(el => { el.textContent = num(year); });
  document.querySelectorAll('.since').forEach(el => { el.textContent = num(year - 2017); });
  if (fa) document.querySelectorAll('.num').forEach(el => { el.textContent = num(+el.textContent); });

  /* ---------------- the journey ---------------- */
  const journey = document.querySelector('.journey');
  const world = journey.querySelector('.world');
  const floor = journey.querySelector('.floor');
  const hud = journey.querySelector('.hud');
  const hudNow = journey.querySelector('.hud-now');
  const hint = journey.querySelector('.hint');
  const rail = journey.querySelector('.rail');
  const chapters = [...journey.querySelectorAll('.ch')];
  const n = chapters.length;

  if (!still) {
    root.classList.add('is-3d');

    let D, XO, STEP, top, xs = [];
    let cur = 0, mx = 0, my = 0, tmx = 0, tmy = 0, shownYear = null;

    // rail buttons, one per chapter
    const railBtns = chapters.map((ch, i) => {
      const li = document.createElement('li');
      const b = document.createElement('button');
      b.type = 'button';
      b.innerHTML = `<span>${ch.dataset.year}</span><i></i>`;
      b.addEventListener('click', () => scrollTo({ top: top + i * STEP, behavior: 'smooth' }));
      li.appendChild(b); rail.appendChild(li);
      return b;
    });

    // specks of dust along the corridor, for a sense of speed
    const dust = document.createElement('div');
    dust.className = 'dust';
    world.appendChild(dust);

    const layout = () => {
      const mobile = innerWidth <= 860;
      D = mobile ? 1500 : 1900;
      XO = mobile ? 0 : innerWidth * .07;
      STEP = innerHeight * 1.15;
      journey.style.height = (n - 1) * STEP + innerHeight + 'px';
      top = journey.getBoundingClientRect().top + scrollY;
      // right-to-left mirrors the corridor so the camera weaves the other way
      xs = chapters.map(ch => (+ch.dataset.x || 0) * XO * (fa ? -1 : 1));
      chapters.forEach((ch, i) => {
        ch.style.transform = `translate3d(calc(-50% + ${xs[i]}px), -50%, ${-i * D}px)`;
      });
      dust.innerHTML = '';
      const count = mobile ? 40 : 90;
      for (let k = 0; k < count; k++) {
        const s = document.createElement('i');
        const x = (Math.random() - .5) * innerWidth * 1.6;
        const y = (Math.random() - .5) * innerHeight * 1.2;
        const z = 600 - Math.random() * ((n - 1) * D + 1400);
        s.style.transform = `translate3d(${x}px, ${y}px, ${z}px)`;
        dust.appendChild(s);
      }
    };
    layout();
    addEventListener('resize', layout);

    // keyboard users: tabbing into a chapter flies the camera to it
    chapters.forEach((ch, i) => ch.addEventListener('focusin', () => {
      scrollTo({ top: top + i * STEP, behavior: 'smooth' });
    }));

    if (finePointer) {
      addEventListener('pointermove', e => {
        tmx = (e.clientX / innerWidth - .5) * 5;
        tmy = (e.clientY / innerHeight - .5) * -4;
      }, { passive: true });
    }

    const frame = () => {
      const p = clamp((scrollY - top) / ((n - 1) * STEP), 0, 1);
      const target = p * (n - 1);
      cur += (target - cur) * .085;
      if (Math.abs(target - cur) < 1e-4) cur = target;
      mx = lerp(mx, tmx, .06); my = lerp(my, tmy, .06);

      // ease each leg so the camera slows down and lingers at every chapter
      const k = Math.min(Math.floor(cur), n - 2);
      const t = cur - k;
      const e = t - Math.sin(2 * Math.PI * t) / (2 * Math.PI);
      const c = k + e;
      const camZ = c * D;
      const camX = lerp(xs[k], xs[k + 1], e);
      const bank = XO ? (xs[k + 1] - xs[k]) / XO * Math.sin(Math.PI * t) * -6 : 0;

      world.style.transform =
        `rotateX(${my.toFixed(3)}deg) rotateY(${(mx + bank).toFixed(3)}deg) translate3d(${(-camX).toFixed(1)}px, 0, ${camZ.toFixed(1)}px)`;
      floor.style.setProperty('--fy', (camZ * .45 % 160).toFixed(1) + 'px');
      hud.style.setProperty('--p', p.toFixed(4));
      hint.classList.toggle('gone', p > .01);

      chapters.forEach((ch, i) => {
        const d = c - i;
        if (d < -1.35 || d > .3) {
          if (ch.style.visibility !== 'hidden') ch.style.visibility = 'hidden';
          ch.classList.remove('focus');
          return;
        }
        ch.style.visibility = '';
        // chapters ahead stay faint until the camera gets close
        const o = d <= 0 ? clamp((d + 1.35) / .95, 0, 1) ** 2 : clamp(1 - d / .3, 0, 1);
        ch.style.opacity = o.toFixed(3);
        ch.classList.toggle('focus', Math.abs(d) < .32);
      });

      const idx = clamp(Math.round(c), 0, n - 1);
      const y = chapters[idx].dataset.year;
      if (y !== shownYear) {
        shownYear = y;
        hudNow.textContent = y;
        hudNow.classList.remove('flip'); void hudNow.offsetWidth; hudNow.classList.add('flip');
        railBtns.forEach((b, i) => b.classList.toggle('on', i === idx));
      }
      requestAnimationFrame(frame);
    };
    requestAnimationFrame(frame);
  }

  /* ---------------- reveals ---------------- */
  const io = new IntersectionObserver(entries => {
    entries.forEach(en => {
      if (!en.isIntersecting) return;
      en.target.classList.add('in');
      io.unobserve(en.target);
    });
  }, { rootMargin: '0px 0px -10% 0px' });
  document.querySelectorAll('.reveal').forEach(el => {
    const sibs = [...el.parentElement.children].filter(c => c.matches('.reveal'));
    el.style.setProperty('--rd', (sibs.indexOf(el) % 6) * .07 + 's');
    io.observe(el);
  });

  /* ---------------- email tilt ---------------- */
  const mail = document.querySelector('.mail');
  if (finePointer && !still) {
    mail.addEventListener('pointermove', e => {
      const r = mail.getBoundingClientRect();
      mail.style.setProperty('--my', (((e.clientX - r.left) / r.width - .5) * 16).toFixed(2) + 'deg');
      mail.style.setProperty('--mx', (-((e.clientY - r.top) / r.height - .5) * 16).toFixed(2) + 'deg');
    });
    mail.addEventListener('pointerleave', () => { mail.style.setProperty('--my', '0deg'); mail.style.setProperty('--mx', '0deg'); });
  }

  /* ---------------- header ---------------- */
  const nav = [...document.querySelectorAll('.nav a[href^="#"]')];
  const sections = nav.map(a => document.querySelector(a.getAttribute('href')));
  const bar = document.querySelector('.bar');
  let lastY = scrollY;
  addEventListener('scroll', () => {
    const mid = innerHeight * .4;
    sections.forEach((s, i) => {
      const b = s.getBoundingClientRect();
      nav[i].classList.toggle('on', b.top < mid && b.bottom > mid);
    });
    bar.classList.toggle('hide', scrollY > lastY && scrollY > 200);
    lastY = scrollY;
  }, { passive: true });

  /* ---------------- language switch ----------------
     Prefer remembering the choice and reloading; fall back to the ?lang= link. */
  const sw = document.querySelector('.lang-switch');
  if (sw) sw.addEventListener('click', e => {
    const target = fa ? 'en' : 'fa';
    if (new URLSearchParams(location.search).has('lang')) return;
    try { localStorage.setItem('lang', target); } catch (err) { return; }
    e.preventDefault();
    location.reload();
  });

  /* ---------------- CV menu: close on outside click or Escape ---------------- */
  const cvMenu = document.querySelector('.cv-menu');
  if (cvMenu) {
    document.addEventListener('click', e => { if (!cvMenu.contains(e.target)) cvMenu.open = false; });
    document.addEventListener('keydown', e => { if (e.key === 'Escape') cvMenu.open = false; });
  }

  /* ---------------- cursor ---------------- */
  if (finePointer && !still) {
    const cur = document.querySelector('.cursor');
    body.classList.add('has-cursor');
    addEventListener('pointermove', e => {
      cur.style.setProperty('--cx', e.clientX + 'px');
      cur.style.setProperty('--cy', e.clientY + 'px');
    }, { passive: true });
    document.querySelectorAll('a, button').forEach(el => {
      el.addEventListener('pointerenter', () => cur.style.setProperty('--cs', 2.4));
      el.addEventListener('pointerleave', () => cur.style.setProperty('--cs', 1));
    });
  }
})();
