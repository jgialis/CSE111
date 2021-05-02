/*
    6. Based on the available quantity of items, who
    is the manufacturer p_mfgr of the most popular item
    (the more popular an item is, the less available it 
    is in ps_availqty) from Supplier#000000053?
*/

SELECT p_mfgr
FROM part, partsupp
WHERE 
    p_partkey = ps_partkey AND
    ps_suppkey = 53 AND
    ps_availqty = (
                    SELECT MIN(ps_availqty) 
                    FROM partsupp 
                    WHERE ps_suppkey = 53
                  );