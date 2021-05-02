/*
    8. Find the number of distinct orders completed in 
    1994 by the suppliers in every country. An order
    status of F stands for complete. Print only those 
    countries for which the number of orders is larger
    than 300.
*/


SELECT n_name, COUNT(DISTINCT o_orderkey)
FROM orders, nation, supplier, lineitem
WHERE
    o_orderdate LIKE '1994-%%-%%'
    AND
    s_nationkey = n_nationkey
    AND
    o_orderstatus = 'F'
    AND
    s_suppkey = l_suppkey
    AND
    l_orderkey = o_orderkey
    GROUP BY n_name
    HAVING COUNT(DISTINCT o_orderkey) > 300;
