/* AnalytixAI site behaviour: week unlocking by date, resource lists, showcase, copy-link buttons. */
(function () {
  const S = window.SITE, W = window.WEEKS || [], P = window.PACKS || [], SZ = window.SIZES || {};
  const DAY = 864e5, WEEK = 7 * DAY;
  const $ = (q, el = document) => el.querySelector(q), $$ = (q, el = document) => [...el.querySelectorAll(q)];
  const esc = s => String(s).replace(/[&<>"']/g, c => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' })[c]);

  const ICON = {
    lock: '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.4" stroke-linecap="round"><rect x="5" y="11" width="14" height="9" rx="2"/><path d="M8 11V8a4 4 0 0 1 8 0v3"/></svg>',
    dl: '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.6" stroke-linecap="round" stroke-linejoin="round"><path d="M12 4v11m0 0l-4.5-4.5M12 15l4.5-4.5M5 20h14"/></svg>',
    link: '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.4" stroke-linecap="round"><path d="M10 14a4 4 0 0 0 5.7 0l3-3a4 4 0 0 0-5.7-5.7l-1 1"/><path d="M14 10a4 4 0 0 0-5.7 0l-3 3a4 4 0 0 0 5.7 5.7l1-1"/></svg>',
    arrow: '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.6" stroke-linecap="round" stroke-linejoin="round"><path d="M5 12h14m-5-5l5 5-5 5"/></svg>'
  };

  /* ---- dates ---- */
  const now = () => Date.now();
  const unlocked = () => { const t = now() - S.seasonStart; const u = t < 0 ? 0 : Math.min(12, Math.floor(t / WEEK) + 1);
    const early = Object.keys(S.weekEarly || {}).reduce((m, n) => now() >= S.weekEarly[n] ? Math.max(m, +n) : m, 0);   // any week can open early (SITE.weekEarly)
    return Math.max(u, S.week1Opens && now() >= S.week1Opens ? 1 : 0, early); };   // week 1 can open early (SITE.week1Opens)
  const weekDate = n => new Date(S.seasonStart + (n - 1) * WEEK);
  const fmt = d => d.toLocaleDateString('en-GB', { weekday: 'short', day: 'numeric', month: 'short', timeZone: 'Europe/London' }).replace(',', '');
  const daysTo = d => Math.max(0, Math.ceil((d - now()) / DAY));
  const toGo = d => d === 0 ? 'Opens today' : d === 1 ? '1 day to go' : d + ' days to go';
  // episodes inside a week open one at a time: Ep 1 with the week, Ep 2 on Wednesday, Ep 3 on Friday (SITE.epOpensH = hours after Monday 00:00)
  const EP_H = S.epOpensH || [0, 61.5, 109.5];
  const epDate = (n, k) => new Date(S.seasonStart + (n - 1) * WEEK + EP_H[k - 1] * 3600e3);
  const epEarly = (n, k) => (S.epEarly || {})[n + '-' + k] || Infinity;   // an episode can open early (SITE.epEarly)
  const epOpen = (n, k) => n <= unlocked() && (k === 1 || now() >= Math.min(epDate(n, k).getTime(), epEarly(n, k)));
  const epNo = (w, i) => 'Ep ' + String((w.n - 1) * 3 + i + 1).padStart(2, '0');
  const epList = (w, d) => `<ol class="eps">${d.e.map((x, i) => epOpen(w.n, i + 1) ? `<li><b>${epNo(w, i)}</b> ${esc(x)}</li>` :
      `<li class="soon">${ICON.lock}<span>${epNo(w, i)} drops ${fmt(epDate(w.n, i + 1))}</span></li>`).join('')}</ol>`;
  const openFiles = w => w.files.filter(f => epOpen(w.n, f.ep || 1));
  const KEY = 'zda2026';
  function dec(s) { const b = Uint8Array.from(atob(s), c => c.charCodeAt(0)); for (let k = 0; k < b.length; k++) b[k] ^= KEY.charCodeAt(k % KEY.length); return JSON.parse(new TextDecoder().decode(b)); }
  const info = w => (w.n <= unlocked() && window.WEEK_ENC) ? dec(window.WEEK_ENC[w.n - 1]) : null;
  const modChips = w => `<span class="mods">${w.mods.map(m => `<span class="mod" style="--mc:var(--m${m})">${esc(window.MODULES[m - 1])}</span>`).join('')}</span>`;
  const projTag = w => w.project ? `<span class="chip gold">${w.project === 5 ? 'Capstone' : 'Project ' + w.project}</span>` : '';

  /* ---- toast + copy ---- */
  let toastEl;
  function toast(msg) {
    if (!toastEl) { toastEl = document.createElement('div'); toastEl.className = 'toast'; toastEl.setAttribute('role', 'status'); document.body.appendChild(toastEl); }
    toastEl.textContent = msg; toastEl.classList.add('on'); clearTimeout(toastEl._t); toastEl._t = setTimeout(() => toastEl.classList.remove('on'), 1800);
  }
  function copy(text, btn) {
    const done = () => { toast('Link copied'); if (btn) { btn.classList.add('copied'); setTimeout(() => btn.classList.remove('copied'), 1400); } };
    if (navigator.clipboard && navigator.clipboard.writeText) navigator.clipboard.writeText(text).then(done, () => fallback(text, done)); else fallback(text, done);
  }
  function fallback(text, done) { const t = document.createElement('textarea'); t.value = text; t.style.position = 'fixed'; t.style.opacity = '0'; document.body.appendChild(t); t.select(); try { document.execCommand('copy'); done(); } catch (e) { toast(text); } t.remove(); }
  const linkTo = hash => location.href.split('#')[0] + '#' + hash;
  document.addEventListener('click', e => { const b = e.target.closest('[data-copy]'); if (b) { e.preventDefault(); copy(linkTo(b.dataset.copy), b); } });

  /* ---- file rows ---- */
  const fileRow = f => `<li class="file${f.all ? ' all' : ''}"><span class="ft ${esc(f.type)}">${esc(f.type)}</span>
      <span style="min-width:0"><span class="nm">${esc(f.name)}</span><span class="nt" style="display:block">${esc(f.note || '')}</span></span>
      <span class="act"><span class="sz">${esc(SZ[f.href] || '')}</span><a class="dl" href="${esc(f.href)}" download>${ICON.dl}Download</a></span></li>`;

  /* ---- resources: week cards ---- */
  function renderWeeks(el) {
    const u = unlocked();
    el.innerHTML = W.map(w => {
      const open = w.n <= u, d = info(w), date = fmt(weekDate(w.n)), mc = `var(--m${w.mods[w.mods.length - 1]})`;
      if (!open) return `<article class="card wk locked" id="week-${w.n}">
          <div class="top"><b>WEEK ${String(w.n).padStart(2, '0')}</b><span>Unlocks ${date}</span></div>
          <div class="body">${modChips(w)}<h3>${w.n === u + 1 ? 'Next up' : 'Locked'}</h3>
            <p class="lockline">${ICON.lock}Episodes, dataset and files open on ${date}.</p>
            <div class="foot">${projTag(w)}<span class="muted" style="font-size:14px">${w.n === u + 1 ? toGo(daysTo(weekDate(w.n))) : ''}</span></div></div></article>`;
      const fl = openFiles(w), eps = [...new Set(fl.map(f => f.ep || 1))].sort((x, y) => x - y);   // files stacked under their episode
      const files = fl.length ? eps.map(k => `<div class="epfiles"><h4><b>${epNo(w, k - 1)}</b>${esc(d.e[k - 1])}</h4>
            <ul class="files">${fl.filter(f => (f.ep || 1) === k).map(fileRow).join('')}</ul></div>`).join('') :
        `<p class="lockline">${ICON.dl}Files for this week land here as each episode drops.</p>`;
      return `<article class="card wk${w.n === u ? ' now' : ''}" id="week-${w.n}" style="--mc:${mc}">
          <div class="top"><b>WEEK ${String(w.n).padStart(2, '0')}</b><span>${w.n === u ? 'This week' : 'Open since ' + date}</span></div>
          <div class="body">${modChips(w)}<h3>${esc(d.t)}</h3>
            ${epList(w, d)}${files}
            <div class="foot">${projTag(w)}<button class="btn sm" data-copy="week-${w.n}">${ICON.link}Copy link</button></div></div></article>`;
    }).join('');
  }

  /* ---- resources: open packs ---- */
  function renderPacks(el) {
    el.innerHTML = P.map(p => `<article class="card pack" id="${p.id}">
        <div class="intro"><span class="eyebrow">Open now · free</span><h3>${esc(p.title)}</h3><p class="q">${esc(p.question)}</p>
          <p>${esc(p.blurb)}</p><div class="chips">${p.tags.map(t => `<span class="chip">${esc(t)}</span>`).join('')}</div>
          <p class="rows">${esc(p.rows)} · synthetic data made for AnalytixAI, free to use</p>
          <div class="row"><button class="btn sm" data-copy="${p.id}">${ICON.link}Copy link</button></div></div>
        <div class="list"><ul class="files">${p.files.map(fileRow).join('')}</ul></div></article>`).join('');
  }

  /* ---- home: season status ---- */
  function renderStatus() {
    const u = unlocked();
    $$('[data-season]').forEach(el => {
      if (u === 0) { const d = daysTo(weekDate(1)); el.innerHTML = `<small>Season 1</small>Week 1 unlocks ${d === 0 ? 'today' : d === 1 ? 'tomorrow' : 'in ' + d + ' days'}`; }
      else if (u < 12 || now() < weekDate(12).getTime() + WEEK) el.innerHTML = `<small>Live now</small>Week ${u} of 12 is open`;
      else el.innerHTML = `<small>Season 1</small>All 12 weeks are open`;
    });
    $$('[data-week-now]').forEach(el => {
      if (u === 0) {
        el.innerHTML = `<article class="card wk" style="--mc:var(--m1)"><div class="top"><b>BEFORE WEEK 1</b><span>Season starts ${fmt(weekDate(1))}</span></div>
          <div class="body">${modChips(W[0])}<h3>Warm up with the free SQL packs</h3>
          <p class="muted">Week 1 unlocks on ${fmt(weekDate(1))}. Until then, two practice packs from the reels are open: real-looking sales data, questions a manager would ask, and answers.</p>
          <div class="foot"><a class="btn sm gold" href="resources.html#pack-01">Open the packs ${ICON.arrow}</a><a class="btn sm" href="roadmap.html">See all 12 weeks</a></div></div></article>`;
      } else {
        const w = W[u - 1], d = info(w);
        el.innerHTML = `<article class="card wk now" style="--mc:var(--m${w.mods[w.mods.length - 1]})"><div class="top"><b>WEEK ${String(u).padStart(2, '0')}</b><span>This week</span></div>
          <div class="body">${modChips(w)}<h3>${esc(d.t)}</h3>${epList(w, d)}
          <div class="foot"><a class="btn sm gold" href="resources.html#week-${u}">Get this week's files ${ICON.arrow}</a>${projTag(w)}</div></div></article>`;
      }
    });
    $$('[data-season-chip]').forEach(el => { if (u > 0) el.textContent = u < 12 ? `Week ${u} of 12 is open` : 'All 12 weeks are open'; });
    $$('[data-week-link]').forEach(a => { const u2 = unlocked(); a.href = u2 ? `resources.html#week-${u2}` : 'resources.html#pack-01'; });
  }

  /* ---- series projects (projects page) ---- */
  function renderSeriesProjects(el) {
    const u = unlocked();
    el.innerHTML = W.filter(w => w.project).map(w => {
      const open = w.n <= u, d = info(w), date = fmt(weekDate(w.n)), label = w.project === 5 ? 'Capstone' : 'Project ' + w.project;
      return `<article class="card proj" style="--pc:${['var(--mint)', 'var(--sky)', 'var(--peach)', 'var(--butter)', 'var(--sage)'][w.project - 1]}">
        <div class="cover"><span class="chip">${label} · Week ${w.n}</span><div class="big sm">${open ? esc(d.e[2]) : '<span class="blurred" aria-hidden="true">Project title hidden</span>'}<small>${open ? esc(d.s) : 'Unlocks ' + date}</small></div></div>
        <div class="body">${modChips(w)}<p class="muted">${open ? 'Build it with me this week. The dataset, starter files and a finished example are on the resources page.' : 'The brief, dataset and starter files open on ' + date + '.'}</p>
        <div class="foot">${open ? `<a class="btn sm gold" href="resources.html#week-${w.n}">Start building ${ICON.arrow}</a>` : `<span class="lockline muted">${ICON.lock} Locked</span>`}</div></div></article>`;
    }).join('');
  }

  /* ---- showcase ---- */
  function renderShowcase(el) {
    const L = window.SHOWCASE || [];
    if (!L.length) {
      el.innerHTML = `<div class="card empty"><span class="eyebrow">No projects yet</span><h3>The first spot is yours.</h3>
        <p class="muted">Finish any week's challenge or project, send it in, and it appears here with your name and a link to your work. Week 1 opens on ${fmt(weekDate(1))}.</p>
        <div class="row"><a class="btn gold" href="#submit">How to submit ${ICON.arrow}</a></div></div>`;
      return;
    }
    el.innerHTML = `<div class="grid g3">${L.map(s => `<article class="card show"><span class="eyebrow">Week ${esc(s.week)}</span><h3 style="font-size:22px">${esc(s.project)}</h3>
      <p class="muted">${esc(s.insight)}</p><div class="tools">${(s.tools || []).map(t => `<span>${esc(t)}</span>`).join('')}</div>
      <p style="font-weight:800">${esc(s.name)}</p><div class="row">${s.link ? `<a class="btn sm" href="${esc(s.link)}" target="_blank" rel="noopener">See the project</a>` : ''}${s.linkedin ? `<a class="btn sm" href="${esc(s.linkedin)}" target="_blank" rel="noopener">LinkedIn</a>` : ''}</div></article>`).join('')}</div>`;
  }

  /* ---- boot ---- */
  function boot() {
    const wl = $('#week-list'); if (wl) renderWeeks(wl);
    const pk = $('#pack-list'); if (pk) renderPacks(pk);
    const sp = $('#series-projects'); if (sp) renderSeriesProjects(sp);
    const sc = $('#showcase-list'); if (sc) renderShowcase(sc);
    renderStatus();
    $$('[data-date]').forEach(el => el.textContent = fmt(weekDate(+el.dataset.date)));
    if (S.submitForm) $$('[data-form]').forEach(a => { a.href = S.submitForm; a.hidden = false; });
    if (location.hash) { const t = document.getElementById(location.hash.slice(1)); if (t) setTimeout(() => t.scrollIntoView({ block: 'start' }), 60); }
  }
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', boot); else boot();
})();
