/*
    3. How many orders are made by customers in each country in ASIA
*/

SELECT n_name, COUNT(o_orderkey)
FROM customer, orders, region, nation
WHERE
    o_custkey = c_custkey
    AND
    r_regionkey = n_regionkey
    AND
    r_regionkey = 2
    AND
    n_nationkey = c_nationkey
    GROUP BY n_name;