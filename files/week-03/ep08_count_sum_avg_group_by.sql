-- Zero to Data Analyst · Week 3 · Ep 08 · COUNT, SUM, AVG, GROUP BY and HAVING
-- Open MySQL Workbench, click your connection, then paste these into the Query tab.
-- Run a line: click in it and press Ctrl + Enter (Cmd + Return on a Mac), or click the lightning icon.

USE shop;                         -- work inside the shop database from Ep 02

-- A new table: your expenses this month, in rupees.
-- IF NOT EXISTS and IGNORE make these lines safe to run twice.
CREATE TABLE IF NOT EXISTS expenses (expense_id INT PRIMARY KEY, category VARCHAR(30), amount INT);
INSERT IGNORE INTO expenses VALUES
  (1, 'food', 120), (2, 'travel', 60), (3, 'food', 80),
  (4, 'books', 300), (5, 'travel', 70), (6, 'food', 150);

SELECT * FROM expenses;           -- 6 rows: food, travel and books

-- Step 1 · COUNT, SUM, AVG: turn rows into answers
SELECT COUNT(*) FROM expenses;    -- 6: how many rows
SELECT SUM(amount) FROM expenses; -- 780: everything added together
SELECT AVG(amount) FROM expenses; -- 130: the total divided by 6

-- Step 2 · GROUP BY: one total for each category, like your bank app
SELECT category, SUM(amount) FROM expenses GROUP BY category;
-- food 350, travel 130, books 300 (your rows may come out in a different order)
-- SQL makes a pile for each category, then adds up each pile.

-- Break it on purpose: WHERE can't count a pile.
-- Error Code: 1111. Invalid use of group function
-- WHERE checks rows before the piles are made. Take the -- off the next line and run it to see.
-- SELECT category, COUNT(*) FROM expenses WHERE COUNT(*) > 1 GROUP BY category;

-- For piles, use HAVING. It goes after GROUP BY.
SELECT category, COUNT(*) FROM expenses GROUP BY category HAVING COUNT(*) > 1;   -- food 3, travel 2

-- So remember: WHERE checks rows, HAVING checks groups.

-- Your turn: find the average amount for each category (AVG and GROUP BY),
-- then comment the category with the highest average on the reel.
-- (The answer is at the bottom of the Ep 08 step sheet.)
