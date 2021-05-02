/*
    3. For the line items ordered in 
    May 1995 (o_orderdate), find the 
    largest discount that is less than the
    average discount among all the orders.
*/

SELECT MAX(l_discount) AS max_discount
FROM lineitem, orders
WHERE
    l_discount < (SELECT AVG(l_discount) 
                  FROM lineitem)
    AND
    l_orderkey = o_orderkey
    AND
    o_orderdate LIKE '1995-05-%%';


