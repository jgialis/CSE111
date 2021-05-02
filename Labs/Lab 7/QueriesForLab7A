
-- SELECT MAX(maxPart) FROM 
-- (SELECT SUM(2 * p_size) AS maxPart
-- FROM lineitem, customer, orders, nation n1, nation n2, supplier, part
-- WHERE l_suppkey = 3
-- AND c_custkey = o_custkey AND
-- l_orderkey = o_orderkey AND
-- n1.n_nationkey = c_nationkey AND
-- s_nationkey = n2.n_nationkey AND
-- s_suppkey = l_suppkey AND
-- l_partkey = p_partkey
-- GROUP BY n1.n_name
-- ORDER BY COUNT(l_orderkey) DESC
-- LIMIT 2)



-- SELECT MAX(maxPart) FROM 
-- (SELECT n1.n_name, COUNT(l_orderkey) ,SUM(2 * p_size) AS maxPart
-- FROM lineitem, customer, orders, nation n1, nation n2, supplier, part
-- WHERE l_suppkey = 100
-- AND c_custkey = o_custkey AND
-- l_orderkey = o_orderkey AND
-- n1.n_nationkey = c_nationkey AND
-- s_nationkey = n2.n_nationkey AND
-- s_suppkey = l_suppkey AND
-- l_partkey = p_partkey
-- GROUP BY n1.n_name
-- ORDER BY COUNT(l_orderkey) DESC)




-- SELECT MAX(maxPart) FROM 
-- (SELECT n1.n_name, COUNT(l_orderkey) ,SUM(2 * p_size) AS maxPart
-- FROM lineitem, customer, orders, nation n1, nation n2, supplier, part
-- WHERE l_suppkey = 100
-- AND c_custkey = o_custkey AND
-- l_orderkey = o_orderkey AND
-- n1.n_nationkey = c_nationkey AND
-- s_nationkey = n2.n_nationkey AND
-- s_suppkey = l_suppkey AND
-- l_partkey = p_partkey
-- GROUP BY n1.n_name
-- ORDER BY COUNT(l_orderkey) DESC);







SELECT n1.n_name AS nName, COUNT(l_orderkey)
FROM lineitem, customer, orders, nation n1, nation n2, supplier, part
WHERE l_suppkey = 100
AND c_custkey = o_custkey AND
l_orderkey = o_orderkey AND
n1.n_nationkey = c_nationkey AND
s_nationkey = n2.n_nationkey AND
s_suppkey = l_suppkey AND
l_partkey = p_partkey
GROUP BY n1.n_name
ORDER BY COUNT(l_orderkey) DESC
LIMIT 4