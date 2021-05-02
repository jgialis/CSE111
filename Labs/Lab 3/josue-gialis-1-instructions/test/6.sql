/*
    6. What are the countries of 
    customers who ordered items 
    between March 10-12, 1995?
*/

SELECT n_name
FROM customer, orders, nation
WHERE
    o_orderdate = '1995-03-10'
    AND
    c_custkey = o_custkey
    AND
    c_nationkey = n_nationkey
UNION 
SELECT  n_name
FROM customer, orders, nation
WHERE
    o_orderdate = '1995-03-11'
    AND
    c_custkey = o_custkey
    AND
    c_nationkey = n_nationkey
UNION 
SELECT  n_name
FROM customer, orders, nation
WHERE
    o_orderdate = '1995-03-12'
    AND
    c_custkey = o_custkey
    AND
    c_nationkey = n_nationkey;



