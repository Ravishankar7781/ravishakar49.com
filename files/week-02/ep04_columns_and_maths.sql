-- Zero to Data Analyst · Week 2 · Ep 04 · pick columns and do maths
-- Open MySQL Workbench, click your connection, then paste these into the Query tab.
-- Run a line: click in it and press Ctrl + Enter (Cmd + Return on a Mac), or click the lightning icon.

USE shop;                         -- work inside the shop database from Ep 02

-- Missed Ep 03? These two lines make the orders table and its 3 orders.
-- Already have them? They do nothing: IF NOT EXISTS and IGNORE skip what's already there.
CREATE TABLE IF NOT EXISTS orders (order_id INT PRIMARY KEY, city VARCHAR(40), amount DECIMAL(10,2));
INSERT IGNORE INTO orders VALUES (1001, 'london', 12.99), (1002, 'leeds', 4.50), (1003, 'hatfield', 21.50);
-- (Added 1004 in Ep 03's your turn? You'll just see a 4th row in every result. That's fine.)

-- Step 1 · pick only the columns you need: write their names instead of the star
-- A comma between the names, none after the last one.
SELECT city, amount FROM orders;

-- Step 2 · maths. Delivery costs 2 pounds on every order, so add 2.
-- SQL adds 2 to every row at once. Your table doesn't change: SQL just shows you the answer.
SELECT order_id, amount + 2 FROM orders;                     -- 12.99 becomes 14.99

-- AS gives the new column a proper name (like a nickname)
SELECT order_id, amount + 2 AS total FROM orders;

-- Diwali sale: 10% off. Something that costs 100, you pay 90, so times 0.9.
-- Between two numbers, * means multiply. (Right after SELECT, * means all columns.)
SELECT order_id, amount * 0.9 AS sale_price FROM orders;     -- 11.691: three numbers after the decimal point

-- Money has two numbers after the decimal point, so ROUND it. The 2 means keep 2.
SELECT order_id, ROUND(amount * 0.9, 2) AS sale_price FROM orders;   -- 11.69

-- The four signs: + add, - take away, * multiply, / divide

-- Break it on purpose: no comma between city and amount.
-- No error, but the column is called amount and it's full of cities:
-- SQL took amount as a nickname for city. Take the -- off the next line and run it to see.
-- SELECT city amount FROM orders;

-- Error "Unknown column 'amout'"? You spelled it wrong. Fix the spelling and run it again.

-- Your turn: say 1 pound = 125 rupees. Show every order in rupees, and call the column rupees.
-- Then comment the rupee price of order 1003 on the reel. The answer is at the bottom of Ep04_Pick_Columns_and_Do_Maths.pdf.
