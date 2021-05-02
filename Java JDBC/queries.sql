-- Shows number of orders by supplier
-- SELECT l_suppkey, COUNT(l_orderkey)
-- FROM lineitem
-- GROUP BY l_suppkey;


-- THAT GOOD GOOD :)
SELECT n_name, COUNT(l_suppkey)
FROM lineitem, customer, orders, nation
WHERE l_suppkey = 9
AND c_custkey = o_custkey AND
l_orderkey = o_orderkey AND
n_nationkey = c_nationkey
GROUP BY n_name
ORDER BY COUNT(l_orderkey) DESC
LIMIT 2;




-- SELECT n1.n_name, s_name
-- FROM lineitem, customer, orders, nation n1, nation n2, supplier
-- WHERE l_suppkey = 1
-- AND c_custkey = o_custkey AND
-- l_orderkey = o_orderkey AND
-- n1.n_nationkey = c_nationkey AND
-- s_nationkey = n2.n_nationkey AND
-- s_suppkey = l_suppkey
-- GROUP BY n1.n_name
-- ORDER BY COUNT(l_orderkey) DESC
-- LIMIT 9;
