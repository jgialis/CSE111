/*
    9. How many different order clerks did 
    the suppliers in CANADA work with?
*/

SELECT COUNT(DISTINCT o_clerk)
FROM orders, lineitem, supplier
WHERE 
    l_orderkey = o_orderkey
    AND
    l_suppkey = s_suppkey
    AND
    s_nationkey = 3;
    








  



 
