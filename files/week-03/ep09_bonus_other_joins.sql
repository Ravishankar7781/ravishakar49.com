-- Zero to Data Analyst · Week 3 · Ep 09 bonus · The other JOINs
-- Open MySQL Workbench, click your connection, then paste these into the Query tab.
-- Run a line: click in it and press Ctrl + Enter (Cmd + Return on a Mac), or click the lightning icon.

USE shop;                         -- the shop database, with spends (Ep 08) and budgets (Ep 09)

-- Missed Ep 08 or Ep 09? These make the tables for you. (Already have them? They do nothing new.)
CREATE TABLE IF NOT EXISTS spends (item VARCHAR(40), category VARCHAR(20), amount INT);
CREATE TABLE IF NOT EXISTS budgets (category VARCHAR(20), budget INT);
-- Only if they're empty:
-- INSERT INTO spends VALUES ('room rent', 'rent', 600), ('groceries', 'food', 100), ('bus pass', 'travel', 80), ('takeaway', 'food', 30), ('gym', 'gym', 25), ('meal deal', 'food', 5);
-- INSERT INTO budgets VALUES ('rent', 600), ('food', 120), ('travel', 100);
-- (Did the Ep 09 your-turn and added gym? Remove it so the results match:  DELETE FROM budgets WHERE category = 'gym';)

-- One more budget that nobody spent on.
INSERT INTO budgets VALUES ('phone', 20);

-- RIGHT JOIN: keep every row from budgets (the right table), even with no match.
SELECT item, amount, budgets.category, budget
FROM spends
RIGHT JOIN budgets ON spends.category = budgets.category;    -- phone shows up with NULL item and amount

-- FULL OUTER JOIN: everything from both tables. MySQL doesn't have it, so: LEFT JOIN, UNION, RIGHT JOIN.
SELECT item, amount, budgets.category, budget
FROM spends LEFT JOIN budgets ON spends.category = budgets.category
UNION
SELECT item, amount, budgets.category, budget
FROM spends RIGHT JOIN budgets ON spends.category = budgets.category;   -- 7 rows: gym with no budget, phone with no spends

-- Break it on purpose: forget the ON.
SELECT item, budgets.category
FROM spends
JOIN budgets;                     -- 24 rows: every spend paired with every budget (6 x 4)
-- That's a CROSS JOIN by accident. Written on purpose it looks like this:
SELECT COUNT(*) FROM spends CROSS JOIN budgets;    -- 24

-- SELF JOIN: a table joined to itself. You give it two nicknames (s and m).
CREATE TABLE IF NOT EXISTS staff (name VARCHAR(20), manager VARCHAR(20));
INSERT INTO staff VALUES ('Asha', NULL), ('Ben', 'Asha'), ('Chloe', 'Asha'), ('Dev', 'Ben');
SELECT s.name, m.name AS manager_name
FROM staff s
JOIN staff m ON s.manager = m.name;                 -- Ben -> Asha, Chloe -> Asha, Dev -> Ben

-- Your turn: which JOIN finds the budgets nobody spent on? Comment it on the reel.
-- (The answer is at the bottom of the JOIN cheat sheet.)
