-- SELECT w_nationkey
-- FROM warehouse;


-- SELECT n1.n_name, COUNT(l_orderkey) ,SUM(2 * p_size) AS maxPart
-- FROM lineitem, customer, orders, nation n1, nation n2, supplier, part
-- WHERE l_suppkey = 17
-- AND c_custkey = o_custkey AND
-- l_orderkey = o_orderkey AND
-- n1.n_nationkey = c_nationkey AND
-- s_nationkey = n2.n_nationkey AND
-- s_suppkey = l_suppkey AND
-- l_partkey = p_partkey
-- GROUP BY n1.n_name
-- ORDER BY COUNT(l_orderkey) DESC
-- LIMIT 5;


SELECT n_name, COUNT(w_warehousekey), SUM(w_capacity)
FROM warehouse, nation
WHERE n_nationkey = w_nationkey
GROUP BY n_name
ORDER BY COUNT(w_warehousekey) DESC, SUM(w_capacity) DESC;


SELECT n_name, COUNT(w_warehousekey), SUM(w_capacity)
FROM warehouse, nation
WHERE n_nationkey = w_nationkey
GROUP BY n_name
ORDER BY COUNT(w_warehousekey) DESC;


SELECT s_name, n_name, w_name
FROM warehouse, nation, supplier
WHERE 
    s_nationkey = n_nationkey AND
    s_suppkey = w_suppkey AND
    w_name LIKE '%JAPAN%';




SELECT w_name, w_capacity
FROM warehouse, nation
WHERE n_regionkey IN 
                    (
                        SELECT r_regionkey
                        FROM region
                        WHERE r_name = 'ASIA'
                    ) AND
w_nationkey = n_nationkey AND
w_capacity > 2000 
ORDER BY w_capacity DESC;


SELECT SUM(w_capacity)
FROM warehouse, nation wN, nation sN, supplier
WHERE 
w_nationkey = wN.n_nationkey AND
s_nationkey = sN.n_nationkey AND
w_suppkey = s_suppkey AND
s_nationkey = 24;



SELECT wR.r_name, SUM(w_capacity)
FROM warehouse, nation wN, nation sN, supplier, region sR, region wR
WHERE 
w_nationkey = wN.n_nationkey AND
s_nationkey = sN.n_nationkey AND
wN.n_regionkey = wR.r_regionkey AND
sN.n_regionkey = sR.r_regionkey AND
w_suppkey = s_suppkey AND
s_nationkey = 24 
GROUP BY wR.r_name;


SELECT wR.r_name, SUM(w_capacity)
FROM warehouse, nation wN, nation sN, supplier, region sR, region wR
WHERE 
w_nationkey = wN.n_nationkey AND
s_nationkey = sN.n_nationkey AND
wN.n_regionkey = wR.r_regionkey AND
sN.n_regionkey = sR.r_regionkey AND
w_suppkey = s_suppkey AND
sN.n_name = 'UNITED STATES' 
GROUP BY wR.r_name;




