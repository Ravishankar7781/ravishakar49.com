-- Zero to Data Analyst · Week 4 · Ep 10 · CASE WHEN and CTEs
-- Open MySQL Workbench, click your connection, then paste these into the Query tab.
-- Run a line: click in it and press Ctrl + Enter (Cmd + Return on a Mac), or click the lightning icon.

USE shop;                         -- the shop database from Ep 02

-- Missed Ep 08? This makes the spends table for you. (Already have it? This line does nothing new.)
CREATE TABLE IF NOT EXISTS spends (item VARCHAR(40), category VARCHAR(20), amount INT);
-- Only run this INSERT if your spends table is empty:
-- INSERT INTO spends VALUES ('room rent', 'rent', 600), ('groceries', 'food', 100), ('bus pass', 'travel', 80), ('takeaway', 'food', 30), ('gym', 'gym', 25), ('meal deal', 'food', 5);

-- CASE WHEN: SQL's if and else. Label every item big or small.
SELECT item, amount,
  CASE WHEN amount >= 100 THEN 'big' ELSE 'small' END AS size
FROM spends;                      -- room rent big, groceries big, everything else small
-- Always close it with END. AS size gives the new column its name.

-- A CTE: give a query a name, then use it like a little table.
-- Inside the brackets is the GROUP BY from Ep 08.
WITH totals AS (
  SELECT category, SUM(amount) AS spent
  FROM spends
  GROUP BY category
)
SELECT * FROM totals
WHERE spent > 100;                -- rent 600, food 135

-- Break it on purpose: use totals on its own.
SELECT * FROM totals;             -- Error Code: 1146. Table 'shop.totals' doesn't exist
-- A CTE only lives inside the one query it belongs to. Once that query is done, it's gone.

-- Your turn: change the CASE WHEN so 30 pounds or more is big,
-- then comment how many bigs you get on the reel.
-- (The answer is at the bottom of the Ep 10 step sheet.)
