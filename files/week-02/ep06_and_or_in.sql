-- Zero to Data Analyst · Week 2 · Ep 06 · AND, OR, IN: two or more rules at once
-- Open MySQL Workbench, click your connection, then paste these into the Query tab.
-- Run a line: click in it and press Ctrl + Enter (Cmd + Return on a Mac), or click the lightning icon.

USE shop;                         -- work inside the shop database from Ep 02

-- Missed Ep 03? These two lines make the orders table and its 3 orders.
-- Already have them? They do nothing: IF NOT EXISTS and IGNORE skip what's already there.
CREATE TABLE IF NOT EXISTS orders (order_id INT PRIMARY KEY, city VARCHAR(40), amount DECIMAL(10,2));
INSERT IGNORE INTO orders VALUES (1001, 'london', 12.99), (1002, 'leeds', 4.50), (1003, 'hatfield', 21.50);

SELECT * FROM orders;             -- look at the whole table first: all 3 orders

-- Step 1 · AND: both rules must be true (like hall ticket AND ID card)
-- Orders above 10 pounds, but below 20 pounds.
SELECT * FROM orders WHERE amount > 10 AND amount < 20;          -- 1 row: London, 12.99

-- London 12.99: above 10? yes. below 20? yes. Keep it.
-- Hatfield 21.50: above 20, so it's out. Leeds 4.50: not above 10, so it's out too.

-- Step 2 · OR: any one rule is enough (like paying by cash OR card)
SELECT * FROM orders WHERE city = 'Leeds' OR city = 'Hatfield';  -- 2 rows: Leeds and Hatfield

-- Step 3 · IN: the shortcut for many ORs on the same column
SELECT * FROM orders WHERE city IN ('Leeds', 'Hatfield');        -- the same 2 rows, less typing

-- Break it on purpose: city is missing after OR.
-- No error, but only Leeds comes back. 'Hatfield' on its own isn't a rule, so SQL treats it as a no.
-- (Workbench may show a small yellow warning. That's this mistake.)
SELECT * FROM orders WHERE city = 'Leeds' OR 'Hatfield';

-- So with OR, write the column every time. Or just use IN.

-- Your turn: find the orders from Leeds or London that are above 10 pounds.
-- Use IN and AND together, then comment the order number you get on the reel.
-- (The answer is at the bottom of the Ep 06 step sheet.)
