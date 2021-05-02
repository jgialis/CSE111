/*
    13. Find the nation(s) with the most developed industry, i.e., selling 
    items totaling the largest amount of money (l extendedprice) in 1996 (l shipdate).
*/

SELECT 
    n_name
FROM 
    lineitem, 
    orders, 
    supplier, 
    nation
WHERE
    l_orderkey = o_orderkey AND
    l_suppkey = s_suppkey AND
    s_nationkey = n_nationkey
    GROUP BY 
        n_name
    ORDER BY 
        SUM(l_extendedprice) desc
    LIMIT 1;


