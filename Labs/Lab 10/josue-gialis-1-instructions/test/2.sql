-- 2. Create a trigger t2 that sets a warning Negative balance!!! 
-- in the comment attribute of the customer table every time c acctbal 
-- is updated to a negative value from a positive one. Write a SQL statement 
-- that sets the balance to -100 for all the customers in EUROPE. Write a 
-- query that returns the number of customers with negative balance from FRANCE.
--  Put all the SQL statements in file test/2.sql.

-- Trigger

CREATE TRIGGER t2 
AFTER UPDATE ON customer
FOR EACH ROW
WHEN (NEW.c_acctbal < 0)
BEGIN
    UPDATE customer SET c_comment = 'Negative balance!!!' WHERE NEW.c_custkey = c_custkey;
END;

-- View
DROP VIEW V1;
CREATE VIEW V1(n_nationkey) AS 
SELECT n_nationkey
FROM nation, region
WHERE
    n_regionkey = r_regionkey AND
    r_name = 'EUROPE';

--Update & Query
UPDATE customer SET c_acctbal = -100 WHERE c_nationkey IN (SELECT n_nationkey FROM V1);
SELECT COUNT(c_acctbal)
FROM customer, nation
WHERE c_nationkey = n_nationkey AND 
      n_name = 'FRANCE' AND 
      c_acctbal < 0;

