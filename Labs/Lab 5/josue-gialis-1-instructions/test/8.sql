/*
    8. Count the number of distinct suppliers that 
    supply parts whom type contains MEDIUM POLISHED and
    have size equal to any of 3, 23, 36, and 49.
*/

SELECT 
    COUNT(DISTINCT ps_suppkey)
FROM 
    part, 
    partsupp
WHERE
    ps_partkey = p_partkey AND
    p_type LIKE '%MEDIUM POLISHED%' AND
    p_size IN (3, 23, 36, 49)





    

    