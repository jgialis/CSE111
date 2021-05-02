/*
    10. Find the total price 
    of orders made by customers 
    from EUROPE in 1996.
*/

SELECT  SUM(o_totalprice)
FROM customer, nation, region, orders
WHERE
    c_nationkey = n_nationkey
    AND 
    r_regionkey = n_regionkey
    AND 
    r_regionkey = 3
    AND
    o_orderdate LIKE '1996-%%-%%'
    AND
    o_custkey = c_custkey;






    









--     SELECT c_name, n_name, r_name, o_orderdate
-- FROM customer, nation, region, orders
-- WHERE
--     c_nationkey = n_nationkey
--     AND 
--     n_regionkey = r_regionkey
--     AND
--     r_regionkey = 3
--     AND 
--     o_orderdate LIKE '1995-%%-%%';

   

    
