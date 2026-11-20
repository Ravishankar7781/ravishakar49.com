-- Zero to Data Analyst · Week 3 · Ep 08 · COUNT, SUM, AVG, GROUP BY and HAVING
-- Open MySQL Workbench, click your connection, then paste these into the Query tab.
-- Run a line: click in it and press Ctrl + Enter (Cmd + Return on a Mac), or click the lightning icon.

USE shop;                         -- work inside the shop database from Ep 02

-- Missed Ep 03? These two lines make the orders table and its first 3 orders.
-- Already have them? They do nothing: IF NOT EXISTS and IGNORE skip what's already there.
CREATE TABLE IF NOT EXISTS orders (order_id INT PRIMARY KEY, city VARCHAR(40), amount DECIMAL(10,2));
INSERT IGNORE INTO orders VALUES (1001, 'london', 12.99), (1002, 'leeds', 4.50), (1003, 'hatfield', 21.50);

-- Step 1 · three more orders. Three is too small for today.
-- Already added Bristol (1004) in Ep 03? IGNORE just skips it, no error.
INSERT IGNORE INTO orders VALUES (1004, 'bristol', 15), (1005, 'london', 8), (1006, 'leeds', 10.50);
SELECT * FROM orders;             -- 6 orders. London and Leeds now have 2 each.

-- Step 2 · COUNT, SUM, AVG: turn rows into answers
SELECT COUNT(*) FROM orders;                  -- 6: how many rows
SELECT SUM(amount) FROM orders;               -- 72.49: every amount added together
SELECT AVG(amount) FROM orders;               -- 12.081667: the total divided by 6
SELECT ROUND(AVG(amount), 2) FROM orders;     -- 12.08: ROUND from Ep 04 keeps 2 numbers after the point

-- Step 3 · GROUP BY: one answer for each city (like a bank app splitting spending into food, travel...)
SELECT city, SUM(amount) FROM orders GROUP BY city;
-- london 20.99, leeds 15.00, hatfield 21.50, bristol 15.00 (your rows may come out in a different order)
-- SQL puts the orders for each city in a pile, then adds up each pile.

-- Break it on purpose: WHERE can't count a pile.
-- Error Code: 1111. Invalid use of group function
-- WHERE checks rows before the piles are made. Take the -- off the next line and run it to see.
-- SELECT city, COUNT(*) FROM orders WHERE COUNT(*) > 1 GROUP BY city;

-- For piles, use HAVING. It goes after GROUP BY.
SELECT city, COUNT(*) FROM orders GROUP BY city HAVING COUNT(*) > 1;   -- london 2, leeds 2

-- So remember: WHERE checks rows, HAVING checks groups.

-- Your turn: find the average amount for each city (AVG and GROUP BY),
-- then comment the city with the highest average on the reel.
-- (The answer is at the bottom of the Ep 08 step sheet.)
