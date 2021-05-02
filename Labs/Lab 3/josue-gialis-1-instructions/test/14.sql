/*
    14. Find how many 1-URGENT priority 
    orders have been posted by customers 
    from France between 1994 and 1996, combined.
*/

SELECT SUM(total_sum) FROM (

SELECT COUNT(o_orderpriority) AS total_sum
FROM orders, customer, nation
WHERE 
o_orderpriority = '1-URGENT'
AND
c_custkey = o_custkey
AND
n_nationkey = c_nationkey
AND
o_orderdate LIKE '1994-%%-%%'
AND 
n_nationkey = 6

UNION

SELECT COUNT(o_orderpriority) AS total_sum
FROM orders, customer, nation
WHERE 
o_orderpriority = '1-URGENT'
AND
c_custkey = o_custkey
AND
n_nationkey = c_nationkey
AND
o_orderdate LIKE '1995-%%-%%'
AND 
n_nationkey = 6

UNION

SELECT COUNT(o_orderpriority) AS total_sum
FROM orders, customer, nation
WHERE 
o_orderpriority = '1-URGENT'
AND
c_custkey = o_custkey
AND
n_nationkey = c_nationkey
AND
o_orderdate LIKE '1996-%%-%%'
AND 
n_nationkey = 6

)