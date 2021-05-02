-- 4. Create triggers that update the attribute o orderpriority to 
-- HIGH every time a new lineitem tuple is added to or deleted from 
-- that order. 
-- 
-- Delete all the line items corresponding to orders from 
-- November 1996.
-- 
--  Write a query that returns the number of HIGH priority
--  orders in November of 1996. Put all the SQL statements 
--  in file test/4.sql. (3 points)

CREATE TRIGGER t4_1
AFTER INSERT ON lineitem
FOR EACH ROW
BEGIN
    UPDATE orders SET o_orderpriority = 'HIGH' WHERE NEW.l_orderkey = o_orderkey;
END;

CREATE TRIGGER t4_2
AFTER DELETE ON lineitem
FOR EACH ROW
BEGIN
    UPDATE orders SET o_orderpriority = 'HIGH' WHERE OLD.l_orderkey = o_orderkey;
END;

DELETE FROM lineitem WHERE l_orderkey IN 
                                        (
                                            SELECT o_orderkey
                                            FROM orders
                                            WHERE o_orderdate LIKE '1996-11-%%'
                                        );

SELECT COUNT(o_orderpriority)
FROM orders
WHERE o_orderpriority = 'HIGH' AND
    o_orderdate LIKE '1996-11-%%';