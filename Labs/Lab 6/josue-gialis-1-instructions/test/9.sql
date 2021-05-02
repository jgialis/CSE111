-- -- /*
-- --     9. Find the parts (p_name) ordered by customers from AMERICA 
-- --     that are supplied by exactly 4 distinct suppliers from ASIA.
-- -- */ 

SELECT  
    p_name
FROM 
    nation, 
    region, 
    supplier, 
    partsupp, 
    part
WHERE  
    n_nationkey = s_nationkey AND
    n_regionkey = r_regionkey AND
    ps_suppkey = s_suppkey AND
    ps_partkey = p_partkey AND
    r_name = 'ASIA' AND
    p_name IN (
                SELECT 
                    p_name
                FROM 
                    part, 
                    customer, 
                    lineitem, 
                    orders, 
                    nation, 
                    region
                WHERE
                    p_partkey = l_partkey AND
                    l_orderkey = o_orderkey AND
                    o_custkey = c_custkey AND
                    c_nationkey = n_nationkey AND
                    n_regionkey = r_regionkey AND
                    r_name = 'AMERICA'
              )
GROUP BY p_name
HAVING COUNT(DISTINCT s_suppkey) = 4;



