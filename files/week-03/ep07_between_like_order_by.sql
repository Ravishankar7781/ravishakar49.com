-- Zero to Data Analyst · Week 3 · Ep 07 · BETWEEN, LIKE, ORDER BY
-- Open MySQL Workbench, click your connection, then paste these into the Query tab.
-- Run a line: click in it and press Ctrl + Enter (Cmd + Return on a Mac), or click the lightning icon.

USE shop;                         -- work inside the shop database from Ep 02

-- Missed Ep 03? These two lines make the orders table and its 3 orders.
-- Already have them? They do nothing: IF NOT EXISTS and IGNORE skip what's already there.
CREATE TABLE IF NOT EXISTS orders (order_id INT PRIMARY KEY, city VARCHAR(40), amount DECIMAL(10,2));
INSERT IGNORE INTO orders VALUES (1001, 'london', 12.99), (1002, 'leeds', 4.50), (1003, 'hatfield', 21.50);

SELECT * FROM orders;             -- look at the whole table first: all 3 orders

-- Step 1 · BETWEEN: a shorter way to write a range
-- Last time: WHERE amount > 10 AND amount < 20
SELECT * FROM orders WHERE amount BETWEEN 10 AND 20;             -- 1 row: London, 12.99
-- BETWEEN also counts 10 and 20 themselves, so an order of exactly 20 would stay in.

-- Step 2 · LIKE: search with a pattern (like typing the first letters in your phone contacts)
-- % means "anything can go here".
SELECT * FROM orders WHERE city LIKE 'L%';      -- starts with L: London and Leeds
SELECT * FROM orders WHERE city LIKE '%field';  -- ends with field: Hatfield

-- Step 3 · ORDER BY: sort the rows (like price, low to high)
SELECT * FROM orders ORDER BY amount;           -- small to big: 4.50, 12.99, 21.50
SELECT * FROM orders ORDER BY amount DESC;      -- big to small: 21.50, 12.99, 4.50

-- Break it on purpose: LIKE without the %.
-- No error, but 0 rows. Without %, LIKE looks for a city called just L, and there isn't one.
SELECT * FROM orders WHERE city LIKE 'L';

-- So with LIKE, don't forget the %.

-- Your turn: find the cities that start with L, sorted from the biggest amount.
-- Use LIKE and ORDER BY together, then comment the city that comes first on the reel.
-- (The answer is at the bottom of the Ep 07 step sheet.)
