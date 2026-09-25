// Small bits CSS can't do alone: pointer tilt, scroll reveals, the phone clock.
(() => {
  const root = document.documentElement;
  root.classList.remove('no-js');
  const body = document.body;
  const still = matchMedia('(prefers-reduced-motion: reduce)').matches;
  const finePointer = matchMedia('(hover: hover) and (pointer: fine)').matches;

  // intro
  body.classList.add('intro');
  requestAnimationFrame(() => body.classList.add('ready'));

  // year + phone clock
  document.querySelectorAll('.yr').forEach(el => { el.textContent = new Date().getFullYear(); });
  const clock = document.querySelector('.clock');
  const tick = () => {
    const d = new Date();
    clock.textContent = String(d.getHours()).padStart(2, '0') + ':' + String(d.getMinutes()).padStart(2, '0');
  };
  tick(); setInterval(tick, 20000);

  // phone follows the pointer (desktop) or the scroll (touch)
  const rig = document.querySelector('.rig');
  const glare = document.querySelector('.glare');
  const setTilt = (x, y) => {
    rig.style.setProperty('--ry', (-22 + x * 34).toFixed(2) + 'deg');
    rig.style.setProperty('--rx', (8 - y * 18).toFixed(2) + 'deg');
    glare.style.setProperty('--gl', (x * 40).toFixed(1) + 'deg');
  };
  if (!still) {
    if (finePointer) {
      addEventListener('pointermove', e => {
        setTilt(e.clientX / innerWidth - .5, e.clientY / innerHeight - .5);
      }, { passive: true });
    } else {
      addEventListener('scroll', () => {
        const p = Math.min(scrollY / innerHeight, 1);
        setTilt(p * .9, -p * .4);
      }, { passive: true });
    }
  }

  // tilt on any .tilt element (portrait) and the email
  const tiltable = (el, target, prop, amt) => {
    if (!finePointer || still) return;
    el.addEventListener('pointermove', e => {
      const r = el.getBoundingClientRect();
      const x = (e.clientX - r.left) / r.width - .5;
      const y = (e.clientY - r.top) / r.height - .5;
      target.style.setProperty(prop[0], (x * amt).toFixed(2) + 'deg');
      target.style.setProperty(prop[1], (-y * amt).toFixed(2) + 'deg');
    });
    el.addEventListener('pointerleave', () => {
      target.style.setProperty(prop[0], '0deg');
      target.style.setProperty(prop[1], '0deg');
    });
  };
  document.querySelectorAll('.tilt').forEach(el => tiltable(el, el.querySelector('.frame'), ['--ty', '--tx'], 18));
  const mail = document.querySelector('.mail');
  tiltable(mail, mail, ['--my', '--mx'], 16);

  // reveals, staggered within each parent
  const io = new IntersectionObserver(entries => {
    entries.forEach(en => {
      if (!en.isIntersecting) return;
      en.target.classList.add('in');
      io.unobserve(en.target);
    });
  }, { rootMargin: '0px 0px -12% 0px' });
  document.querySelectorAll('.reveal, .fold').forEach(el => {
    const sibs = [...el.parentElement.children].filter(c => c.matches('.reveal, .fold'));
    el.style.setProperty('--rd', (sibs.indexOf(el) % 6) * 0.08 + 's');
    io.observe(el);
  });

  // timeline line draws as you scroll through it
  const tl = document.querySelector('.timeline');
  const nav = [...document.querySelectorAll('.nav a')];
  const sections = nav.map(a => document.querySelector(a.getAttribute('href')));
  const bar = document.querySelector('.bar');
  let lastY = scrollY;
  const onScroll = () => {
    const r = tl.getBoundingClientRect();
    const p = Math.min(Math.max((innerHeight * .75 - r.top) / r.height, 0), 1);
    tl.style.setProperty('--prog', p.toFixed(3));

    const mid = innerHeight * .4;
    sections.forEach((s, i) => {
      const b = s.getBoundingClientRect();
      nav[i].classList.toggle('on', b.top < mid && b.bottom > mid);
    });

    const y = scrollY;
    bar.classList.toggle('hide', y > lastY && y > 400);
    lastY = y;
  };
  addEventListener('scroll', onScroll, { passive: true });
  onScroll();

  // cursor
  if (finePointer && !still) {
    const cur = document.querySelector('.cursor');
    body.classList.add('has-cursor');
    addEventListener('pointermove', e => {
      cur.style.setProperty('--cx', e.clientX + 'px');
      cur.style.setProperty('--cy', e.clientY + 'px');
    }, { passive: true });
    document.querySelectorAll('a, .project').forEach(el => {
      el.addEventListener('pointerenter', () => cur.style.setProperty('--cs', el.matches('.project') ? 3.2 : 2.4));
      el.addEventListener('pointerleave', () => cur.style.setProperty('--cs', 1));
    });
  }
})();
