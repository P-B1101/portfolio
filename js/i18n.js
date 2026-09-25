// Farsi copy. English lives in index.html; this swaps it in when the language is fa.
// Mark an element with data-i18n="key" (innerHTML), data-i18n-attr="attr:key;attr:key",
// data-i18n-href="key" or data-i18n-year="key" (the chapter's year label).
(() => {
  const L = (a, b) => `<a href="${a}" target="_blank" rel="noopener">${b}</a>`;
  const FA = {
    'title': 'پدرام محمدعلی پور · توسعه دهنده فلاتر',
    'description': 'پدرام محمدعلی پور، توسعه دهنده فلاتر. داستان تا امروز، از ۱۳۹۱ تا اکنون.',
    'top': 'بازگشت به ابتدا',
    'nav.story': '<i>۰۱</i>داستان',
    'nav.stack': '<i>۰۲</i>مهارت‌ها',
    'nav.contact': '<i>۰۳</i>تماس',
    'lang': 'EN',
    'lang.href': '?lang=en',
    'cv': 'رزومه <span aria-hidden="true">↓</span>',
    'cv.pro': '<b>رسمی</b><small>فقط متن، یک صفحه</small>',
    'cv.fancy': '<b>طراحی شده</b><small>رنگی، با آیکون</small>',
    'cv.pro.href': 'cv/pdf/pedram-cv-professional-fa.pdf',
    'cv.fancy.href': 'cv/pdf/pedram-cv-designed-fa.pdf',
    'story': 'داستان تا امروز',

    'y0': 'سلام',
    'intro.kicker': '<span class="dot"></span>توسعه دهنده فلاتر',
    'intro.name': '<span class="line"><span class="word">پدرام</span></span><span class="line small"><span class="word">محمدعلی پور</span></span>',
    'intro.lede': 'این یک رزومه نیست. مسیری است از مدرک سخت‌افزار تا انتشار اپلیکیشن، سال به سال. <em>اسکرول کنید و همراهش سفر کنید.</em>',
    'photo': 'پرتره پدرام',

    'y1': '۱۳۹۱', 'c1.ghost': '۱۳۹۱',
    'c1.kicker': 'فصل ۰۱ · ۱۳۹۱',
    'c1.h2': 'همه چیز از سخت‌افزار شروع شد.',
    'c1.p': 'در دانشگاه علوم و فنون مازندران، مهندسی کامپیوتر گرایش سخت‌افزار می‌خوانم. پنج سال یادگیری چیزی که زیر نرم‌افزار قرار دارد.',
    'c1.tags': '<li>دانشگاه علوم و فنون مازندران</li><li>مهندسی سخت‌افزار</li>',

    'y2': '۱۳۹۶', 'c2.ghost': '۱۳۹۶',
    'c2.kicker': 'فصل ۰۲ · ۱۳۹۶',
    'c2.h2': 'اردیبهشت: پایان دانشگاه.<br>شهریور: اولین کار.',
    'c2.p': 'به عنوان توسعه دهنده اندروید با جاوا به پاراتک می‌پیوندم. نزدیک پنج سال آنجا می‌مانم و در این مسیر عنوانم می‌شود توسعه دهنده اندروید و فلاتر.',
    'c2.tags': '<li>پاراتک</li><li>جاوا</li><li>اندروید</li>',

    'y3': '۱۳۹۷', 'c3.ghost': '۱۳۹۷',
    'c3.kicker': 'فصل ۰۳ · ۱۳۹۷',
    'c3.h2': 'هم آموز منتشر شد.',
    'c3.p': 'اپلیکیشن خودآموز در زمینه مالی و آموزشی، منتشر شده برای اندروید و iOS.',
    'c3.links': L('https://hamamooz.com/android/Hamamoozv3.apk', 'اندروید') + L('https://anardoni.com/ios/app/xeJrXlAlW', 'آی او اس'),
    'c3.app': 'هم آموز',

    'y4': '۱۴۰۰', 'c4.ghost': '۱۴۰۰',
    'c4.kicker': 'فصل ۰۴ · ۱۴۰۰',
    'c4.h2': 'هبیتومیک.',
    'c4.p': 'طرح‌ریز روزانه شخصی. روی گوگل پلی و اپ استور در دسترس است.',
    'c4.links': L('https://play.google.com/store/apps/details?id=com.habitomic.android', 'اندروید') + L('https://apps.apple.com/ca/app/habitomic/id1609261995', 'آی او اس'),
    'mock.today': 'امروز',
    'mock.day': 'روز من',

    'y5': '۱۴۰۱', 'c5.ghost': '۱۴۰۱',
    'c5.kicker': 'فصل ۰۵ · ۱۴۰۱',
    'c5.h2': 'و بعد، یک بانک.',
    'c5.p': 'اردیبهشت به توسعه و نوآوری شهر می‌روم. همراه شهر پلاس، اپلیکیشن همراه بانک شهر، و سامانه بک آفیس پشت آن را می‌سازیم.',
    'c5.links': L('https://cafebazaar.ir/app/com.citydi.hplus', 'اندروید') + L('https://app.appleapps.ir/id/1062990/', 'آی او اس') + '<span class="private mono">بک آفیس: داخلی</span>',
    'c5.app': 'همراه شهر',

    'y6': '۱۴۰۱', 'c6.ghost': 'وب',
    'c6.kicker': 'فصل ۰۶ · ۱۴۰۱',
    'c6.h2': 'فلاتر، این بار در مرورگر.',
    'c6.p': 'همان سال، صفحه‌ای دیگر: آی-کلسیفایر، اپلیکیشن وب برای طبقه‌بندی گاوها. فلاتر وب بخشی از کارم می‌شود.',
    'c6.links': L('https://app.iclassifier.ca/', 'وب'),

    'y7': '۱۴۰۲', 'c7.ghost': '۱۴۰۲',
    'c7.kicker': 'فصل ۰۷ · ۱۴۰۲',
    'c7.h2': 'حساب وکالتی، و تیمی تازه.',
    'c7.p': 'فروردین، سامانه حساب وکالتی بانک شهر. مرداد به عنوان توسعه دهنده فلاتر به هلدینگ نگاه می‌پیوندم.',
    'c7.tags': '<li>حساب وکالتی بانک شهر</li><li>هلدینگ نگاه</li><li>فلاتر وب</li>',

    'y8': '۱۴۰۳', 'c8.ghost': '۱۴۰۳',
    'c8.kicker': 'فصل ۰۸ · ۱۴۰۳ ← اکنون',
    'c8.h2': 'داتین.',
    'c8.p': 'اردیبهشت ۱۴۰۳ به عنوان توسعه دهنده فلاتر به داتین می‌پیوندم، و امروز هم همان‌جا هستم.',
    'c8.tags': '<li class="live">اکنون</li><li>داتین</li><li>فلاتر</li>',
    'coin': 'اکنون',

    'y9': 'اکنون',
    'outro.kicker': 'تا اینجا',
    'outro.years': 'سال تجربه',
    'outro.companies': 'شرکت',
    'outro.products': 'محصول',
    'outro.lede': 'هر اپلیکیشن را خارق‌العاده بساز. هنوز روی آن کار می‌کنم.',

    'hint': 'اسکرول',
    'stack.title': '<span class="mono">۰۲</span>مهارت‌ها',
    'skills': ['فلاتر', 'دارت', 'معماری تمیز (Clean)', 'الگوی بلاک و flutter_bloc', 'تزریق وابستگی (DI)', 'پرووایدر',
      'برنامه نویسی شی گرا', 'فلاتر وب', 'رستفول ای پی آی', 'جاوا', 'توسعه اندروید نیتیو', 'توسعه تست محور'],
    'tools': 'نرم‌افزارهای روزانه: <span>Android Studio</span> <span>VS Code</span> <span>Git</span>',

    'contact.kicker': '۰۳ · تماس',
    'contact.h2': 'فصل بعد؟<br>برایم بنویس.',
    'cvcard.pro': '<span class="mono">pdf · a4</span><b>رزومه رسمی</b><small>فقط متن، ساده و خوانا</small><i aria-hidden="true">↓</i>',
    'cvcard.fancy': '<span class="mono">pdf · a4</span><b>رزومه طراحی شده</b><small>رنگ، آیکون، عکس</small><i aria-hidden="true">↓</i>',
    'linkedin': 'لینکدین <i>↗</i>',
    'github': 'گیت هاب <i>↗</i>',
    'foot.name': '© <span class="yr"></span> پدرام محمدعلی پور',
    'foot.top': 'بازگشت به ابتدا ↑'
  };

  const lang = document.documentElement.lang === 'fa' ? 'fa' : 'en';
  try { localStorage.setItem('lang', lang); } catch (e) {}
  window.LANG = lang;
  if (lang !== 'fa') return;

  document.title = FA.title;
  document.querySelector('meta[name="description"]')?.setAttribute('content', FA.description);
  document.querySelectorAll('[data-i18n]').forEach(el => {
    const v = FA[el.dataset.i18n];
    if (typeof v === 'string') el.innerHTML = v;
  });
  document.querySelectorAll('[data-i18n-attr]').forEach(el => {
    el.dataset.i18nAttr.split(';').forEach(pair => {
      const [attr, key] = pair.split(':');
      if (FA[key]) el.setAttribute(attr, FA[key]);
    });
  });
  document.querySelectorAll('[data-i18n-href]').forEach(el => {
    const v = FA[el.dataset.i18nHref];
    if (v) el.setAttribute('href', v);
  });
  document.querySelectorAll('[data-i18n-year]').forEach(el => {
    const v = FA[el.dataset.i18nYear];
    if (v) el.dataset.year = v;
  });
  document.querySelectorAll('[data-i18n-list]').forEach(list => {
    const items = FA[list.dataset.i18nList] || [];
    [...list.children].forEach((li, i) => {
      const span = li.querySelector('span');
      if (span && items[i]) span.textContent = items[i];
    });
  });
  const hudNow = document.querySelector('.hud-now');
  if (hudNow) hudNow.textContent = FA.y0;
  const sw = document.querySelector('.lang-switch');
  if (sw) { sw.lang = 'en'; sw.hreflang = 'en'; }
})();
