/*
    6. Find the supplier-customer pair(s) with the most expensive 
    (o_totalprice) completed (F in o_orderstatus) order(s).
*/

SELECT s_name, c_name
FROM lineitem, orders, supplier, customer
WHERE 
    o_orderkey = l_orderkey AND
    l_suppkey = s_suppkey AND 
    o_orderstatus = 'F' AND
    o_custkey = c_custkey AND
    o_totalprice <= (SELECT MAX(o_totalprice) FROM orders)
    ORDER BY o_totalprice DESC
    limit 7;
