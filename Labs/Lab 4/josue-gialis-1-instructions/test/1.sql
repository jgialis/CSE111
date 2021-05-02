/*
   1.Find the total price paid on orders by every
    customer from RUSSIA in 1996. Print the 
    customer name and the total price.
*/

-- Rnkey 22

SELECT 
    c_name, 
    SUM(o_totalprice)
FROM 
    orders, 
    customer
WHERE
    c_nationkey = 22
    AND
    o_custkey = c_custkey
    AND
    o_orderdate LIKE '1996-%%-%%'
    GROUP BY c_name;
