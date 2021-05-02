/*
    6.  How many parts produced by every supplier 
    in AMERICA are ordered at each priority?  
    
    Print the supplier name, the order priority
    and the number of orders.
*/
--USnKey 24--

SELECT s_name, o_orderpriority, COUNT(o_orderkey) AS numOrder
FROM supplier, orders, lineitem, nation, part
WHERE
    l_orderkey = o_orderkey
    AND
    l_suppkey = s_suppkey
    AND
    p_partkey = l_partkey
    AND
    s_nationkey = n_nationkey
    AND
    n_regionkey = 1
    GROUP BY s_name, o_orderpriority;


  


