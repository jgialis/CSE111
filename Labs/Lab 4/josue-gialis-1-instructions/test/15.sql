/*
    15.  How many distinct orders are between
    customers and suppliers with negative account balance?
*/

SELECT COUNT(DISTINCT o_orderkey)
FROM customer, supplier, orders, lineitem
WHERE
    o_custkey = c_custkey
    AND
    l_suppkey = s_suppkey
    AND
    l_orderkey = o_orderkey
    AND
    s_acctbal < 0
    AND 
    c_acctbal < 0;