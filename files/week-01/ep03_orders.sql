-- Zero to Data Analyst · Week 1 · Ep 03 · your first table
-- Open MySQL Workbench, click your connection, then paste these into the Query tab.
-- Run a line: click in it and press Ctrl + Enter (Cmd + Return on a Mac), or click the lightning icon.

USE shop;                     -- work inside the shop database you made in Ep 02

-- Step 1 · make the table
CREATE TABLE orders (
  order_id INT PRIMARY KEY,   -- whole numbers. PRIMARY KEY: every order gets a different ID
  city VARCHAR(40),           -- text, up to 40 letters
  amount DECIMAL(10,2)        -- money: 2 numbers after the point, so 12.99 stays 12.99. DEC(10,2) works too
);                            -- a comma after every column, but not after the last one
-- It says 0 row(s) affected. That's correct: the table is ready, just empty.
-- Click Schemas on the left, press refresh, and you'll see orders inside shop.

-- Step 2 · fill it. Each bracket is one order: ID, then city, then amount.
-- Words go inside single quotes, numbers don't.
INSERT INTO orders VALUES
(1001, 'london', 12.99),
(1002, 'leeds', 4.50),
(1003, 'hatfield', 21.50);   -- 3 row(s) affected

-- Step 3 · see it. * means show every column.
SELECT * FROM orders;

-- Break it on purpose: 1001 is already taken, so this gives Error 1062 (Duplicate entry).
-- Take the -- off the start of the next line and run it to see the error yourself.
-- INSERT INTO orders VALUES (1001, 'london', 11.00);

-- Your turn: add order 1004, Bristol, 15 pounds, then run SELECT again. Have you got 4 rows?
-- The answer is at the bottom of Ep03_Your_First_Table.pdf.
