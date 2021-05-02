/*
    7.  How many orders do customers in every country 
    in EUROPE have in each status?  Print the country
    name, the order status, and the count.
    6 7 19 22 23
*/

SELECT n_name, o_orderstatus, COUNT(o_orderkey)
FROM orders, nation, customer
WHERE
    n_nationkey = 6
    AND
    c_custkey = o_custkey
    AND
    c_nationkey = n_nationkey
    GROUP BY o_orderstatus

    UNION

    SELECT n_name, o_orderstatus, COUNT(o_orderkey)
FROM orders, nation, customer
WHERE
    n_nationkey = 7
    AND
    c_custkey = o_custkey
    AND
    c_nationkey = n_nationkey
    GROUP BY o_orderstatus

    UNION
    SELECT n_name, o_orderstatus, COUNT(o_orderkey)
FROM orders, nation, customer
WHERE
    n_nationkey = 19
    AND
    c_custkey = o_custkey
    AND
    c_nationkey = n_nationkey
    GROUP BY o_orderstatus

    UNION

    SELECT n_name, o_orderstatus, COUNT(o_orderkey)
FROM orders, nation, customer
WHERE
    n_nationkey = 22
    AND
    c_custkey = o_custkey
    AND
    c_nationkey = n_nationkey
    GROUP BY o_orderstatus


    UNION

    SELECT n_name, o_orderstatus, COUNT(o_orderkey)
FROM orders, nation, customer
WHERE
    n_nationkey = 23
    AND
    c_custkey = o_custkey
    AND
    c_nationkey = n_nationkey
    GROUP BY o_orderstatus;





