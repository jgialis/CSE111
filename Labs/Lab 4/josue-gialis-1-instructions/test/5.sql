/*
    5. Find the number of orders made by customers from PERU in 1996.
*/

SELECT COUNT(o_orderkey) AS orders_from_Peru_1996
FROM customer, orders
WHERE
    o_orderdate LIKE '1996-%%-%%'
    AND
    o_custkey = c_custkey
    AND
    c_nationkey = 17;