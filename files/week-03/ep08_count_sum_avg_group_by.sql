-- Zero to Data Analyst · Week 3 · Ep 08 · COUNT, SUM, AVG, GROUP BY and HAVING
-- Open MySQL Workbench, click your connection, then paste these into the Query tab.
-- Run a line: click in it and press Ctrl + Enter (Cmd + Return on a Mac), or click the lightning icon.

USE shop;                         -- work inside the shop database from Ep 02

-- A new table: what I spent this month. What I bought, which category, and how much (in rupees).
-- IF NOT EXISTS: if you run this file twice, it doesn't make the table again.
CREATE TABLE IF NOT EXISTS spends (item VARCHAR(40), category VARCHAR(20), amount INT);
INSERT INTO spends VALUES
  ('biryani', 'food', 250), ('auto', 'travel', 80), ('pizza', 'food', 350),
  ('metro', 'travel', 40), ('movie', 'fun', 440), ('chai', 'food', 40);
-- Ran the INSERT twice by mistake? Start fresh with:  TRUNCATE TABLE spends;  then run the INSERT once.

SELECT * FROM spends;             -- 6 things

-- Three answers at once: how many, the total, the average
SELECT COUNT(*), SUM(amount), AVG(amount) FROM spends;      -- 6, 1200, 200

-- GROUP BY: where did the money go? One pile for each category, then add up each pile.
SELECT category, SUM(amount) FROM spends GROUP BY category;  -- food 640, fun 440, travel 120 (order may differ)

-- Break it on purpose: WHERE checks rows, not piles.
-- Error Code: 1111. Invalid use of group function
-- Take the -- off the next line and run it to see.
-- SELECT category, SUM(amount) FROM spends WHERE SUM(amount) > 200 GROUP BY category;

-- For piles, use HAVING. It goes after GROUP BY.
SELECT category, SUM(amount) FROM spends GROUP BY category HAVING SUM(amount) > 200;   -- food and fun

-- Your turn: count how many things were bought in each category,
-- then comment the category with the most on the reel.
-- (The answer is at the bottom of the Ep 08 step sheet.)
