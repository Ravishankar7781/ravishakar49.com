-- Zero to Data Analyst · Week 1 · orders table (40 orders, August 2026)
-- Works in MySQL 8 and MariaDB. Open MySQL Workbench, paste this whole file, run it (lightning icon).
-- The city column is case-sensitive on purpose (utf8mb4_bin), like most databases,
-- so 'Mumbai' and 'mumbai' count as two different values.

CREATE DATABASE IF NOT EXISTS zero_to_analyst;
USE zero_to_analyst;

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  order_id      INT PRIMARY KEY,         -- ID: one per order, never repeats
  customer_id   INT NOT NULL,            -- ID: one per customer (two Priya Sharmas = 17 and 58)
  customer_name VARCHAR(60) NOT NULL,    -- text
  city          VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,  -- text, typed by hand (messy!)
  order_date    DATE NOT NULL,           -- date
  category      VARCHAR(30) NOT NULL,    -- text
  amount        DECIMAL(10,2) NOT NULL   -- number (rupees), so SQL can add it up
);

INSERT INTO orders (order_id, customer_id, customer_name, city, order_date, category, amount) VALUES
(1001, 17, 'Priya Sharma', 'Mumbai', '2026-08-03', 'Electronics', 1299.00),
(1002, 42, 'Rahul Verma', 'Delhi', '2026-08-05', 'Books', 499.00),
(1003, 58, 'Priya Sharma', 'Pune', '2026-08-09', 'Clothing', 2150.00),
(1004, 17, 'Priya Sharma', 'mumbai', '2026-08-12', 'Home', 799.00),
(1005, 23, 'Ananya Iyer', 'Chennai', '2026-08-12', 'Home', 299.00),
(1006, 31, 'Arjun Reddy', 'Hyderabad', '2026-08-12', 'Home', 349.00),
(1007, 36, 'Sneha Patil', 'Mumbai', '2026-08-13', 'Electronics', 999.00),
(1008, 45, 'Karan Mehta', 'Delhi', '2026-08-13', 'Books', 2150.00),
(1009, 49, 'Fatima Khan', 'Bengaluru', '2026-08-16', 'Electronics', 499.00),
(1010, 52, 'Rohan Das', 'Kolkata', '2026-08-16', 'Clothing', 1199.00),
(1011, 61, 'Meera Nair', 'Bengaluru', '2026-08-17', 'Books', 3499.00),
(1012, 64, 'Vikram Singh', 'MUMBAI', '2026-08-17', 'Beauty', 3499.00),
(1013, 70, 'Divya Rao', 'Hyderabad', '2026-08-18', 'Home', 349.00),
(1014, 17, 'Priya Sharma', 'Mumbai', '2026-08-20', 'Beauty', 449.00),
(1015, 58, 'Priya Sharma', 'Pune', '2026-08-20', 'Beauty', 1199.00),
(1016, 42, 'Rahul Verma', 'Delhi', '2026-08-20', 'Books', 1199.00),
(1017, 36, 'Sneha Patil', 'Mumbai', '2026-08-21', 'Clothing', 299.00),
(1018, 64, 'Vikram Singh', ' Mumbai', '2026-08-21', 'Books', 299.00),
(1019, 23, 'Ananya Iyer', 'Chennai', '2026-08-22', 'Electronics', 649.00),
(1020, 31, 'Arjun Reddy', 'Hyderabad', '2026-08-23', 'Groceries', 1199.00),
(1021, 49, 'Fatima Khan', 'Bengaluru', '2026-08-23', 'Clothing', 899.00),
(1022, 61, 'Meera Nair', 'Bengaluru', '2026-08-23', 'Groceries', 999.00),
(1023, 70, 'Divya Rao', 'Hyderabad', '2026-08-23', 'Beauty', 349.00),
(1024, 45, 'Karan Mehta', 'Delhi', '2026-08-24', 'Home', 1799.00),
(1025, 52, 'Rohan Das', 'Kolkata', '2026-08-24', 'Beauty', 199.00),
(1026, 17, 'Priya Sharma', 'Mumbai', '2026-08-24', 'Groceries', 3499.00),
(1027, 36, 'Sneha Patil', 'Mumbai', '2026-08-25', 'Clothing', 799.00),
(1028, 64, 'Vikram Singh', 'mumbai', '2026-08-26', 'Books', 1499.00),
(1029, 58, 'Priya Sharma', 'Pune', '2026-08-27', 'Books', 1299.00),
(1030, 23, 'Ananya Iyer', 'Chennai', '2026-08-29', 'Books', 449.00),
(1031, 42, 'Rahul Verma', 'Delhi', '2026-08-29', 'Electronics', 349.00),
(1032, 49, 'Fatima Khan', 'Bengaluru', '2026-08-29', 'Books', 1299.00),
(1033, 31, 'Arjun Reddy', 'Hyderabad', '2026-08-30', 'Clothing', 349.00),
(1034, 61, 'Meera Nair', 'Bengaluru', '2026-08-30', 'Electronics', 1299.00),
(1035, 70, 'Divya Rao', 'Hyderabad', '2026-08-30', 'Electronics', 599.00),
(1036, 36, 'Sneha Patil', 'Mumbai', '2026-08-30', 'Clothing', 999.00),
(1037, 64, 'Vikram Singh', 'Mumbai', '2026-08-31', 'Electronics', 349.00),
(1038, 17, 'Priya Sharma', 'Mumbai', '2026-08-31', 'Electronics', 1199.00),
(1039, 52, 'Rohan Das', 'Kolkata', '2026-08-31', 'Groceries', 1799.00),
(1040, 45, 'Karan Mehta', 'Delhi', '2026-08-31', 'Clothing', 199.00);

-- Check it worked: you should see 40.
SELECT COUNT(*) AS total_rows FROM orders;
