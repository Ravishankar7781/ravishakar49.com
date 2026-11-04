-- Zero to Data Analyst · Week 1 · Ep 02 · your first database
-- Open MySQL Workbench, click Local instance, then paste these three lines into the Query tab.
-- Run a line: click in it and press Ctrl + Enter (Cmd + Return on a Mac), or click the lightning icon.

CREATE DATABASE shop;   -- makes an empty database called shop. The ; is SQL's full stop.

SHOW DATABASES;         -- lists every database. shop is in the list, next to MySQL's own four.

USE shop;               -- tells SQL to work inside shop. Everything you make next goes in here.

-- Ran CREATE DATABASE shop twice and got "database exists"? That's fine: shop is already made.
-- On Friday (Ep 03) we make our first table inside shop.
