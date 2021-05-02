-- 3. Create a trigger t3 that resets the comment to Positive balance 
-- if the balance goes back positive from negative. Write a SQL statement 
-- that sets the balance to 100 for all the customers in ROMANIA. Write a 
-- query that returns the number of customers with negative balance from EUROPE. 
-- Put all the SQL statements in file test/3.sql. (3 points)

-- Trigger

CREATE TRIGGER t3
AFTER UPDATE ON customer
FOR EACH ROW
WHEN (NEW.c_acctbal > 0)
BEGIN
    UPDATE customer SET c_comment = 'Positive balance' WHERE NEW.c_custkey = c_custkey;
END;

--Update & Query
UPDATE customer 
SET c_acctbal = 100
WHERE c_nationkey IN (
                        SELECT n_nationkey 
                        FROM nation 
                        WHERE n_name = 'ROMANIA'
                     );
SELECT COUNT(c_acctbal) AS tot
FROM customer, nation, region
WHERE c_acctbal < 0 AND
      r_name = 'EUROPE' AND 
      n_regionkey = r_regionkey AND 
      c_nationkey = n_nationkey;