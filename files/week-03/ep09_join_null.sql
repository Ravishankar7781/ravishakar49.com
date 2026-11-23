-- Zero to Data Analyst · Week 3 · Ep 09 · JOINs and NULL
-- Open MySQL Workbench, click your connection, then paste these into the Query tab.
-- Run a line: click in it and press Ctrl + Enter (Cmd + Return on a Mac), or click the lightning icon.

USE shop;                         -- work inside the shop database from Ep 02

-- Missed Ep 08? This makes the spends table for you. (Already have it? These two lines do nothing new.)
CREATE TABLE IF NOT EXISTS spends (item VARCHAR(40), category VARCHAR(20), amount INT);
-- Only run this INSERT if your spends table is empty:
-- INSERT INTO spends VALUES ('room rent', 'rent', 600), ('groceries', 'food', 100), ('bus pass', 'travel', 80), ('takeaway', 'food', 30), ('gym', 'gym', 25), ('meal deal', 'food', 5);

-- A second table: my budget for each category (in pounds). No gym on purpose.
CREATE TABLE IF NOT EXISTS budgets (category VARCHAR(20), budget INT);
INSERT INTO budgets VALUES ('rent', 600), ('food', 120), ('travel', 100);
-- Ran the INSERT twice by mistake? Start fresh with:  TRUNCATE TABLE budgets;  then run the INSERT once.

SELECT * FROM budgets;            -- 3 rows: rent, food, travel

-- JOIN: put each thing I spent on next to its budget.
-- ON is the rule: match the rows where the category is the same.
SELECT item, amount, budget
FROM spends
JOIN budgets ON spends.category = budgets.category;          -- 5 rows. The gym is missing: it has no budget.

-- LEFT JOIN: keep every row from spends (the left table), even with no match.
SELECT item, amount, budget
FROM spends
LEFT JOIN budgets ON spends.category = budgets.category;     -- 6 rows. Gym is back, and its budget is NULL.
-- NULL means no value. Not zero. Nothing.

-- Break it on purpose: = NULL gives no error, just an empty result. NULL can't equal anything.
SELECT item, amount, budget
FROM spends
LEFT JOIN budgets ON spends.category = budgets.category
WHERE budget = NULL;                                          -- 0 rows

-- For NULL, use IS NULL.
SELECT item, amount, budget
FROM spends
LEFT JOIN budgets ON spends.category = budgets.category
WHERE budget IS NULL;                                         -- gym, 25, NULL

-- Your turn: add gym to budgets with 30 pounds, run the LEFT JOIN again,
-- then comment how many NULLs you see on the reel.
-- (The answer is at the bottom of the Ep 09 step sheet.)
