-- 5. Create a trigger t5 that removes all the tuples from partsupp
-- and lineitem corresponding to a part being deleted. 


-- Delete all the parts supplied by suppliers from FRANCE or GERMANY.


-- Write a query that returns the number of parts supplied by every
-- supplier in EUROPE grouped by their country in increasing order.
-- Put all the SQL statements in file test/5.sql. (3 points)


CREATE TRIGGER t5 
AFTER DELETE ON part
FOR EACH ROW
BEGIN

DELETE FROM partsupp WHERE OLD.p_partkey = ps_partkey;
DELETE FROM lineitem WHERE OLD.p_partkey = l_partkey;

    
END;


DELETE FROM part WHERE p_partkey IN 
                                    (
                                        SELECT ps_partkey
                                        FROM partsupp, supplier
                                        WHERE ps_suppkey = s_suppkey AND
                                        s_nationkey = 6 
                                        UNION
                                        SELECT ps_partkey
                                        FROM partsupp, supplier
                                        WHERE ps_suppkey = s_suppkey AND
                                        s_nationkey = 7
                                    );

SELECT n_name, COUNT(ps_partkey) 
FROM nation, region, partsupp, supplier
WHERE
    n_regionkey = r_regionkey AND
    s_nationkey = n_nationkey AND
    ps_suppkey  = s_suppkey AND 
    r_name = 'EUROPE' AND
    r_regionkey = 3
    GROUP BY n_name
    ORDER BY n_name ASC;




