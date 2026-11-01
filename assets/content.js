/* AnalytixAI site content. This is the one file to edit each week:
   - a week's resources go live by adding files to WEEKS[n].files (and uploading them to /files/week-n/)
   - approved learner projects go into SHOWCASE
   Weeks unlock by date on their own; nothing else needs changing. */
window.SITE = {
  seasonStart: Date.UTC(2026, 10, 2, 0, 0, 0),          // Mon 2 Nov 2026, 00:00 UK time (GMT)
  epOpensH: [0, 61.5, 109.5],                           // Ep 1 opens with its week, Ep 2 Wed 13:30, Ep 3 Fri 13:30 UK (hours after Mon 00:00)
  week1Opens: Date.UTC(2026, 10, 1, 21, 0, 0),          // Week 1 opened early: Sun 1 Nov 2026, 21:00 UK time (weeks 2-12 keep their Monday dates)
  instagram: 'https://www.instagram.com/analytixai_/',
  instagramDM: 'https://ig.me/m/analytixai_',
  linkedin: 'https://www.linkedin.com/in/kurma-ravishankar',
  github: 'https://github.com/Ravishankar7781',
  submitForm: ''                                          // optional: a Google Form link for showcase entries
};

/* Modules in learning order (public on the roadmap). */
window.MODULES = ['Data Foundations', 'SQL', 'MS Excel', 'Statistics for Analysts', 'Data Visualisation', 'Python', 'Applied Statistics', 'Portfolio, Storytelling & Job Hunt'];

/* Twelve weeks. A week's title and episodes are stored encoded (same as the roadmap) and only decoded
   once that week unlocks, so locked weeks can't be read from the page source.
   files: [{name, href, type, note, ep}]  (ep = which episode of the week the file belongs to: 1, 2 or 3; it shows once that episode is out) */
window.WEEKS = [
  { n: 1,  mods: [1, 2], files: [
      { ep: 1, name: 'Week1_Find_All_Five.pdf', href: 'files/week-01/Week1_Find_All_Five.pdf', type: 'PDF', note: 'Ep 01 worksheet: find row, column, ID, data type and messy data, with answers' },
      { ep: 1, name: 'week1_orders.csv', href: 'files/week-01/week1_orders.csv', type: 'CSV', note: '40 orders from August 2026. Opens in Excel or Google Sheets' },
      { ep: 1, name: 'week1_orders.sql', href: 'files/week-01/week1_orders.sql', type: 'SQL', note: 'Builds the same orders table in MySQL 8 or MariaDB (run it in MySQL Workbench)' },
      { ep: 1, name: 'Week1_all_files.zip', href: 'files/week-01/Week1_all_files.zip', type: 'ZIP', note: 'Everything above in one download', all: true }
    ] },
  { n: 2,  mods: [2],    files: [] },
  { n: 3,  mods: [2],    files: [] },
  { n: 4,  mods: [2],    project: 1, files: [] },
  { n: 5,  mods: [3],    files: [] },
  { n: 6,  mods: [3],    project: 2, files: [] },
  { n: 7,  mods: [4],    files: [] },
  { n: 8,  mods: [5],    files: [] },
  { n: 9,  mods: [5],    project: 3, files: [] },
  { n: 10, mods: [6],    files: [] },
  { n: 11, mods: [6, 7], project: 4, files: [] },
  { n: 12, mods: [8],    project: 5, files: [] }
];
window.WEEK_ENC = ["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"];

/* Free packs that are open to everyone right now (from earlier reels). */
window.PACKS = [
  {
    id: 'pack-01', keyword: 'PACK1', title: 'SQL Practice Pack 01', question: 'Who are our customers?',
    blurb: 'Two tables, one story. Recreate the reel, then answer five questions a manager would really ask: monthly growth, the best city, repeat customers, top-10 ties and customers who never bought.',
    tags: ['SQL', 'GROUP BY', 'JOINs'], rows: '1,240 customers · 1,885 orders',
    files: [
      { name: 'AnalytixAI_SQL_Practice_Pack_01.pdf', href: 'files/pack-01/AnalytixAI_SQL_Practice_Pack_01.pdf', type: 'PDF', note: '9-page guide with questions and answers' },
      { name: 'customers.csv', href: 'files/pack-01/customers.csv', type: 'CSV', note: 'customer_id, name, city' },
      { name: 'orders.csv', href: 'files/pack-01/orders.csv', type: 'CSV', note: 'order_id, customer_id, order_date, amount' },
      { name: 'sales_db.sql', href: 'files/pack-01/sales_db.sql', type: 'SQL', note: 'Builds both tables in MySQL 8 or MariaDB (run it in MySQL Workbench)' },
      { name: 'Pack_01_all_files.zip', href: 'files/pack-01/Pack_01_all_files.zip', type: 'ZIP', note: 'Everything above in one download', all: true }
    ]
  },
  {
    id: 'pack-02', keyword: 'PACK2', title: 'SQL Practice Pack 02', question: 'How much did we really earn?',
    blurb: 'One orders table, four kinds of order. Use WHERE to find pending orders, the biggest orders, what July really earned, where the rest of August went, and why a colleague’s number is bigger than yours.',
    tags: ['SQL', 'WHERE', 'Filtering'], rows: '1,240 customers · 2,250 orders',
    files: [
      { name: 'AnalytixAI_SQL_Practice_Pack_02.pdf', href: 'files/pack-02/AnalytixAI_SQL_Practice_Pack_02.pdf', type: 'PDF', note: '9-page guide with questions and answers' },
      { name: 'customers.csv', href: 'files/pack-02/customers.csv', type: 'CSV', note: 'customer_id, name, city' },
      { name: 'orders.csv', href: 'files/pack-02/orders.csv', type: 'CSV', note: 'order_id, customer_id, order_date, amount, status' },
      { name: 'sales_db_02.sql', href: 'files/pack-02/sales_db_02.sql', type: 'SQL', note: 'Builds both tables in MySQL 8 or MariaDB (run it in MySQL Workbench)' },
      { name: 'Pack_02_all_files.zip', href: 'files/pack-02/Pack_02_all_files.zip', type: 'ZIP', note: 'Everything above in one download', all: true }
    ]
  }
];

/* Learner showcase. Add approved entries here (newest first):
   { name, project, week, tools: [], insight, link, linkedin } */
window.SHOWCASE = [];
