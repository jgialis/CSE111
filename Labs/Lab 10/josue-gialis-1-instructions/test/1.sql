-- 1. Create a trigger t1 that for every new order 
-- entry automatically fills the o_orderdate 
-- attribute with the date 2020-12-01.

-- Insert into orders all the orders from November 
-- 1995, paying close attention on how the 
-- o_orderkey attribute is set. 

-- Write a query that returns the number of orders from 2020. 
-- Put all the three SQL statements in file test/1.sql.

CREATE TRIGGER t1 AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    UPDATE orders SET o_orderdate = '2020-12-01' WHERE o_orderdate LIKE '1995-11-%%';
END;

UPDATE orders SET o_orderdate = '2020-12-01' WHERE o_orderdate LIKE '1995-11-%%';


SELECT COUNT(DISTINCT o_orderkey)
FROM orders
WHERE o_orderdate LIKE '2020-%%-%%';

