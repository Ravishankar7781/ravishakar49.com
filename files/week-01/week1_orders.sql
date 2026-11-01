-- Zero to Data Analyst · Week 1 · orders table (40 orders, August 2026, amounts in pounds)
-- Works in MySQL 8 and MariaDB. Open MySQL Workbench, paste this whole file, run it (lightning icon).
-- The city column is case-sensitive on purpose (utf8mb4_bin), like most databases,
-- so 'London' and 'london' count as two different values.

CREATE DATABASE IF NOT EXISTS zero_to_analyst;
USE zero_to_analyst;

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  order_id      INT PRIMARY KEY,         -- ID: one per order, never repeats
  customer_id   INT NOT NULL,            -- ID: one per customer (two Ravi Kumars = 17 and 58)
  customer_name VARCHAR(60) NOT NULL,    -- text
  city          VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,  -- text, typed by hand (messy!)
  order_date    DATE NOT NULL,           -- date
  category      VARCHAR(30) NOT NULL,    -- text
  amount        DECIMAL(10,2) NOT NULL   -- number (pounds), so SQL can add it up
);

INSERT INTO orders (order_id, customer_id, customer_name, city, order_date, category, amount) VALUES
(1001, 17, 'Ravi Kumar', 'London', '2026-08-03', 'Electronics', 12.99),
(1002, 42, 'Priya Shah', 'Leeds', '2026-08-05', 'Books', 4.50),
(1003, 58, 'Ravi Kumar', 'Leicester', '2026-08-09', 'Clothing', 21.50),
(1004, 17, 'Ravi Kumar', 'london', '2026-08-12', 'Home', 7.99),
(1005, 23, 'Aisha Khan', 'Bristol', '2026-08-14', 'Beauty', 15.00),
(1006, 31, 'Tom Hughes', 'Manchester', '2026-08-14', 'Groceries', 3.99),
(1007, 36, 'Sophie Clarke', 'London', '2026-08-14', 'Electronics', 14.50),
(1008, 45, 'Arjun Mehta', 'Birmingham', '2026-08-15', 'Electronics', 15.00),
(1009, 49, 'Emily Ward', 'Glasgow', '2026-08-15', 'Groceries', 29.99),
(1010, 52, 'Daniel Price', 'Cardiff', '2026-08-18', 'Groceries', 12.99),
(1011, 61, 'Fatima Ali', 'LONDON', '2026-08-18', 'Electronics', 18.99),
(1012, 64, 'Oliver Bennett', 'London', '2026-08-18', 'Books', 7.99),
(1013, 70, 'Neha Patel', 'Leeds', '2026-08-19', 'Electronics', 14.50),
(1014, 17, 'Ravi Kumar', 'London', '2026-08-19', 'Clothing', 21.50),
(1015, 58, 'Ravi Kumar', 'Leicester', '2026-08-21', 'Books', 39.99),
(1016, 42, 'Priya Shah', 'Leeds', '2026-08-21', 'Beauty', 21.50),
(1017, 36, 'Sophie Clarke', 'London', '2026-08-21', 'Electronics', 15.00),
(1018, 64, 'Oliver Bennett', ' London', '2026-08-22', 'Books', 18.99),
(1019, 23, 'Aisha Khan', 'Bristol', '2026-08-22', 'Home', 39.99),
(1020, 31, 'Tom Hughes', 'Manchester', '2026-08-23', 'Beauty', 39.99),
(1021, 49, 'Emily Ward', 'Glasgow', '2026-08-23', 'Home', 7.99),
(1022, 61, 'Fatima Ali', 'London', '2026-08-24', 'Groceries', 4.50),
(1023, 70, 'Neha Patel', 'Leeds', '2026-08-24', 'Clothing', 4.50),
(1024, 45, 'Arjun Mehta', 'Birmingham', '2026-08-24', 'Books', 9.99),
(1025, 52, 'Daniel Price', 'Cardiff', '2026-08-24', 'Electronics', 34.99),
(1026, 17, 'Ravi Kumar', 'London', '2026-08-25', 'Home', 29.99),
(1027, 36, 'Sophie Clarke', 'london', '2026-08-25', 'Clothing', 49.99),
(1028, 64, 'Oliver Bennett', 'London', '2026-08-26', 'Clothing', 12.99),
(1029, 58, 'Ravi Kumar', 'Leicester', '2026-08-28', 'Groceries', 4.50),
(1030, 23, 'Aisha Khan', 'Bristol', '2026-08-29', 'Beauty', 29.99),
(1031, 42, 'Priya Shah', 'Leeds', '2026-08-30', 'Home', 14.50),
(1032, 49, 'Emily Ward', 'Glasgow', '2026-08-30', 'Electronics', 21.50),
(1033, 31, 'Tom Hughes', 'Manchester', '2026-08-30', 'Beauty', 24.99),
(1034, 61, 'Fatima Ali', 'London', '2026-08-30', 'Clothing', 9.99),
(1035, 70, 'Neha Patel', 'Leeds', '2026-08-30', 'Home', 7.99),
(1036, 36, 'Sophie Clarke', 'London', '2026-08-31', 'Home', 49.99),
(1037, 64, 'Oliver Bennett', 'London', '2026-08-31', 'Books', 6.99),
(1038, 17, 'Ravi Kumar', 'London', '2026-08-31', 'Books', 4.50),
(1039, 52, 'Daniel Price', 'Cardiff', '2026-08-31', 'Electronics', 14.50),
(1040, 45, 'Arjun Mehta', 'Birmingham', '2026-08-31', 'Books', 4.50);

-- Check it worked: you should see 40.
SELECT COUNT(*) AS total_rows FROM orders;
