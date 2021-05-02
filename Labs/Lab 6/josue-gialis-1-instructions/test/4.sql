/*
    4. Find how many suppliers from CANADA 
    supply at least 4 different parts.
*/

    
SELECT 
    SUM(TOTAL_SUM) 
FROM 
    (
        SELECT COUNT(DISTINCT ps_suppkey) AS TOTAL_SUM
    FROM 
        supplier,
        partsupp,
        part
    WHERE
        ps_suppkey = s_suppkey AND
        p_partkey = ps_partkey AND
        s_nationkey = 3
    GROUP BY ps_suppkey
    HAVING COUNT(p_partkey) >= 4
    )