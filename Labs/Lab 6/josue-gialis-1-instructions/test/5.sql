/*
    5. Find how many distinct suppliers supply 
    the least expensive part (p retailprice).
*/

SELECT 
    COUNT(DISTINCT ps_suppkey)
FROM
    partsupp,
    part
WHERE
    ps_partkey = p_partkey AND
    p_retailprice = (
                    SELECT 
                        MIN(p_retailprice) 
                    FROM 
                        part
                    )