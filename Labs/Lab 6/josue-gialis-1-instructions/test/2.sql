/*
    2. Find the number of customers that had at 
    most two orders in August 1996 (o orderdate).
*/

SELECT 
    SUM(countCust) 
FROM (
    SELECT 
        COUNT(DISTINCT c_custkey) AS countCust
    FROM 
        customer, 
        orders
    WHERE
        o_custkey = c_custkey AND
        o_orderdate LIKE '1996-08-%%'
        GROUP BY c_custkey
        HAVING COUNT(o_orderkey) <= 2
      )

