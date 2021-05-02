/*
    13. How many items are supplied 
    by suppliers in ASIA for orders 
    made by customers in ARGENTINA?
*/






SELECT COUNT(l_orderkey)
FROM lineitem, customer, supplier, nation, orders
WHERE
    l_orderkey = o_orderkey
    AND
    o_custkey = c_custkey
    AND
    s_nationkey = n_nationkey
    AND
    n_regionkey = 2
    AND
    c_nationkey = 1
    AND
    s_suppkey = l_suppkey;

