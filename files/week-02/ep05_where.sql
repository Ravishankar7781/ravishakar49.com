-- Zero to Data Analyst · Week 2 · Ep 05 · WHERE: pick the rows you want
-- Open MySQL Workbench, click your connection, then paste these into the Query tab.
-- Run a line: click in it and press Ctrl + Enter (Cmd + Return on a Mac), or click the lightning icon.

USE shop;                         -- work inside the shop database from Ep 02

-- Missed Ep 03? These two lines make the orders table and its 3 orders.
-- Already have them? They do nothing: IF NOT EXISTS and IGNORE skip what's already there.
CREATE TABLE IF NOT EXISTS orders (order_id INT PRIMARY KEY, city VARCHAR(40), amount DECIMAL(10,2));
INSERT IGNORE INTO orders VALUES (1001, 'london', 12.99), (1002, 'leeds', 4.50), (1003, 'hatfield', 21.50);

SELECT * FROM orders;             -- look at the whole table first: all 3 orders

-- SELECT picks the columns. WHERE picks the rows.

-- Step 1 · WHERE with text: only the orders from Leeds
-- Leeds is a word, so it goes inside single quotes.
-- ('Leeds' and 'leeds' find the same row in MySQL, so capital letters don't matter here.)
SELECT * FROM orders WHERE city = 'Leeds';          -- 1 row: order 1002, 4.50

-- SQL checked every row, one by one: is the city Leeds? If yes, keep the row. If not, throw it out.

-- Step 2 · WHERE with numbers: orders above 10 pounds. Numbers don't need quotes.
-- Forgot which sign? The crocodile's mouth always opens to the bigger side.
SELECT * FROM orders WHERE amount > 10;             -- 2 rows: 12.99 and 21.50. The 4.50 order is gone.

-- Break it on purpose: no quotes around leeds.
-- Error Code: 1054. Unknown column 'leeds' in 'where clause'
-- Without quotes, SQL thinks leeds is a column name. Take the -- off the next line and run it to see.
-- SELECT * FROM orders WHERE city = leeds;

-- So remember: words go inside quotes, numbers don't.

-- Your turn: find the orders that are below 10 pounds, then comment the city you get on the reel.
-- (The answer is at the bottom of the Ep 05 step sheet.)
