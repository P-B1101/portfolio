// Farsi copy. English lives in index.html; this swaps it in when the language is fa.
// Mark an element with data-i18n="key" (innerHTML), data-i18n-attr="attr:key;attr:key",
// data-i18n-href="key" or data-i18n-year="key" (the chapter's year label).
(() => {
  const L = (a, b) => `<a href="${a}" target="_blank" rel="noopener">${b}</a>`;
  const FA = {
    'title': 'پدرام محمدعلی‌پور · مهندس نرم‌افزار فلاتر',
    'description': 'پدرام محمدعلی‌پور، مهندس نرم‌افزار فلاتر. داستان مسیر من، از ۱۳۹۱ تا امروز.',
    'top': 'بازگشت به ابتدا',

    'nav.story': '<i>۰۱</i>داستان',
    'nav.stack': '<i>۰۲</i>مهارت‌ها',
    'nav.contact': '<i>۰۳</i>تماس',

    'lang': 'EN',
    'lang.href': '?lang=en',

    'cv': 'رزومه <span aria-hidden="true">↓</span>',
    'cv.pro': '<b>نسخه رسمی</b><small>ساده، متنی، یک صفحه</small>',
    'cv.fancy': '<b>نسخه طراحی‌شده</b><small>رنگی، همراه با آیکون</small>',
    'cv.pro.href': 'cv/pdf/pedram-cv-professional-fa.pdf?v=2.0.1',
    'cv.fancy.href': 'cv/pdf/pedram-cv-designed-fa.pdf?v=2.0.1',

    'story': 'داستان تا امروز',

    // Intro
    'y0': 'سلام',
    'intro.kicker': '<span class="dot"></span>مهندس نرم‌افزار فلاتر',
    'intro.name': '<span class="line"><span class="word">پدرام</span></span><span class="line small"><span class="word">محمدعلی‌پور</span></span>',
    'intro.lede': 'این یک رزومه نیست؛ روایت مسیری است که از سخت‌افزار شروع شد و به ساخت و انتشار اپلیکیشن رسید. سال به سال. <em>اسکرول کنید و در این مسیر همراه من باشید.</em>',
    'photo': 'پرتره پدرام',

    // 2012
    'y1': '۱۳۹۱',
    'c1.ghost': '۱۳۹۱',
    'c1.kicker': 'فصل ۰۱ · ۱۳۹۱',
    'c1.h2': 'همه‌چیز از سخت‌افزار شروع شد.',
    'c1.p': 'برای تحصیل در رشته مهندسی کامپیوتر، گرایش سخت‌افزار، وارد دانشگاه علوم و فنون مازندران شدم. پنج سال یادگیری برای فهمیدن آنچه در لایه‌های زیرین نرم‌افزار جریان دارد.',
    'c1.tags': '<li>دانشگاه علوم و فنون مازندران</li><li>مهندسی سخت‌افزار</li>',

    // 2017
    'y2': '۱۳۹۶',
    'c2.ghost': '۱۳۹۶',
    'c2.kicker': 'فصل ۰۲ · ۱۳۹۶',
    'c2.h2': 'اردیبهشت: پایان دانشگاه.<br>شهریور: اولین تجربه کاری.',
    'c2.p': 'به‌عنوان توسعه‌دهنده اندروید به پاراتک پیوستم و کارم را با جاوا شروع کردم. تنها توسعه‌دهنده موبایل آنجا بودم و اپلیکیشن‌ها را از طراحی رابط کاربری تا انتشار پیش می‌بردم؛ دو سال بعد، فلاتر مسیر اصلی کارم شد.',
    'c2.tags': '<li>پاراتک</li><li>جاوا</li><li>اندروید</li>',

    // 2018
    'y3': '۱۳۹۷',
    'c3.ghost': '۱۳۹۷',
    'c3.kicker': 'فصل ۰۳ · ۱۳۹۷',
    'c3.h2': 'هم‌آموز منتشر شد.',
    'c3.p': 'یک اپلیکیشن خودآموز در حوزه آموزش و مسائل مالی؛ منتشرشده برای اندروید و iOS.',
    'c3.links': L(
      'https://hamamooz.com/android/Hamamoozv3.apk',
      'اندروید'
    ) + L(
      'https://anardoni.com/ios/app/xeJrXlAlW',
      'iOS'
    ),
    'c3.app': 'هم‌آموز',

    // 2021
    'y4': '۱۴۰۰',
    'c4.ghost': '۱۴۰۰',
    'c4.kicker': 'فصل ۰۴ · ۱۴۰۰',
    'c4.h2': 'هبیتومیک.',
    'c4.p': 'یک برنامه‌ریز روزانه شخصی برای ساختن عادت‌ها و نظم دادن به روزها؛ منتشرشده در گوگل پلی و اپ استور.',
    'c4.links': L(
      'https://play.google.com/store/apps/details?id=com.habitomic.android',
      'اندروید'
    ) + L(
      'https://apps.apple.com/ca/app/habitomic/id1609261995',
      'iOS'
    ),

    'mock.today': 'امروز',
    'mock.day': 'روز من',

    // 2022 — Bank
    'y5': '۱۴۰۱',
    'c5.ghost': '۱۴۰۱',
    'c5.kicker': 'فصل ۰۵ · ۱۴۰۱',
    'c5.h2': 'بعد، نوبت بانک بود.',
    'c5.p': 'اردیبهشت به توسعه و نوآوری شهر پیوستم؛ اول به‌عنوان توسعه‌دهنده فلاتر و بعد سرپرست تیم. آنجا روی «همراه شهر پلاس»، اپلیکیشن همراه‌بانک شهر، سامانه بک‌آفیس آن و چند اپلیکیشن ERP کار کردیم.',
    'c5.links': L(
      'https://cafebazaar.ir/app/com.citydi.hplus',
      'اندروید'
    ) + L(
      'https://app.appleapps.ir/id/1062990/',
      'iOS'
    ) + '<span class="private mono">بک‌آفیس: داخلی</span>',
    'c5.app': 'همراه شهر',

    // 2022 — Web
    'y6': '۱۴۰۱',
    'c6.ghost': 'وب',
    'c6.kicker': 'فصل ۰۶ · ۱۴۰۱',
    'c6.h2': 'این بار، فلاتر در مرورگر.',
    'c6.p': 'همان سال، روی صفحه‌ای متفاوت: iClassifier، یک اپلیکیشن تحت وب برای طبقه‌بندی گاوها. از اینجا فلاتر وب هم بخشی از مسیرم شد.',
    'c6.links': L(
      'https://app.iclassifier.ca/',
      'وب'
    ),

    // 2023
    'y7': '۱۴۰۲',
    'c7.ghost': '۱۴۰۲',
    'c7.kicker': 'فصل ۰۷ · ۱۴۰۲',
    'c7.h2': 'حساب وکالتی؛ و یک تیم تازه.',
    'c7.p': 'فروردین، روی سامانه حساب وکالتی بانک شهر کار کردم. چند ماه بعد، در مرداد، به‌عنوان سرپرست تیم فلاتر به هلدینگ نگاه پیوستم؛ برای ساخت یک کیف پول دیجیتال با پرداخت اعتباری و یک اپلیکیشن تأمین مالی زنجیره تأمین (SCF).',
    'c7.tags': '<li>حساب وکالتی بانک شهر</li><li>هلدینگ نگاه</li><li>فلاتر وب</li>',

    // 2024
    'y8': '۱۴۰۳',
    'c8.ghost': '۱۴۰۳',
    'c8.kicker': 'فصل ۰۸ · ۱۴۰۳ ← امروز',
    'c8.h2': 'داتین.',
    'c8.p': 'اردیبهشت ۱۴۰۳ به‌عنوان مهندس نرم‌افزار فلاتر به داتین پیوستم. آنجا روی Flutter Mobile Runner، بخش فرانت‌اند پلتفرم تولید اپلیکیشن، و اپلیکیشن‌های مالی و ERP کار می‌کنم؛ جایی که مسیرم تا امروز در آن ادامه دارد.',
    'c8.tags': '<li class="live">اکنون</li><li>داتین</li><li>فلاتر</li>',
    'coin': 'اکنون',

    // Outro
    'y9': 'اکنون',
    'outro.kicker': 'تا اینجا',
    'outro.years': 'سال تجربه',
    'outro.companies': 'شرکت',
    'outro.products': 'محصول',
    'outro.lede': 'ساختن اپلیکیشن‌هایی که چیزی بیشتر از معمول باشند. هنوز ادامه دارد.',

    'hint': 'اسکرول',

    // Stack
    'stack.title': '<span class="mono">۰۲</span>مهارت‌ها',

    'skills': [
      'فلاتر',
      'دارت',
      'معماری تمیز (Clean Architecture)',
      'الگوی BLoC و flutter_bloc',
      'تزریق وابستگی (DI)',
      'Provider',
      'برنامه‌نویسی شیءگرا (OOP)',
      'فلاتر وب',
      'RESTful API',
      'جاوا',
      'توسعه Native اندروید',
      'توسعه تست‌محور (TDD)',
      'معماری نرم‌افزار (SOLID، طراحی ماژولار)',
      'Firebase'
    ],

    'tools': 'ابزارهای روزمره: <span>Android Studio</span> <span>VS Code</span> <span>Git</span>',

    // Contact
    'contact.kicker': '۰۳ · تماس',
    'contact.h2': 'فصل بعدی؟<br>برایم بنویس.',

    'cvcard.pro': '<span class="mono">pdf · a4</span><b>رزومه رسمی</b><small>ساده، متنی و سریع برای مرور</small><i aria-hidden="true">↓</i>',
    'cvcard.fancy': '<span class="mono">pdf · a4</span><b>رزومه طراحی‌شده</b><small>رنگ، آیکون و تصویر</small><i aria-hidden="true">↓</i>',

    'linkedin': 'لینکدین <i>↗</i>',
    'github': 'گیت‌هاب <i>↗</i>',

    'foot.name': '© <span class="yr"></span> پدرام محمدعلی‌پور',
    'foot.top': 'بازگشت به ابتدا ↑'
  };

  const lang = document.documentElement.lang === 'fa' ? 'fa' : 'en';

  try {
    localStorage.setItem('lang', lang);
  } catch (e) { }

  window.LANG = lang;

  if (lang !== 'fa') return;

  document.title = FA.title;

  document
    .querySelector('meta[name="description"]')
    ?.setAttribute('content', FA.description);

  document.querySelectorAll('[data-i18n]').forEach(el => {
    const v = FA[el.dataset.i18n];

    if (typeof v === 'string') {
      el.innerHTML = v;
    }
  });

  document.querySelectorAll('[data-i18n-attr]').forEach(el => {
    el.dataset.i18nAttr.split(';').forEach(pair => {
      const [attr, key] = pair.split(':');

      if (FA[key]) {
        el.setAttribute(attr, FA[key]);
      }
    });
  });

  document.querySelectorAll('[data-i18n-href]').forEach(el => {
    const v = FA[el.dataset.i18nHref];

    if (v) {
      el.setAttribute('href', v);
    }
  });

  document.querySelectorAll('[data-i18n-year]').forEach(el => {
    const v = FA[el.dataset.i18nYear];

    if (v) {
      el.dataset.year = v;
    }
  });

  document.querySelectorAll('[data-i18n-list]').forEach(list => {
    const items = FA[list.dataset.i18nList] || [];

    [...list.children].forEach((li, i) => {
      const span = li.querySelector('span');

      if (span && items[i]) {
        span.textContent = items[i];
      }
    });
  });

  const hudNow = document.querySelector('.hud-now');

  if (hudNow) {
    hudNow.textContent = FA.y0;
  }

  const sw = document.querySelector('.lang-switch');

  if (sw) {
    sw.lang = 'en';
    sw.hreflang = 'en';
  }
})();