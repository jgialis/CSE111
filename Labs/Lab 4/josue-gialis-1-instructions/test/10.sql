/*
    10. Find the average discount for 
    every part having PROMO in its type.
*/


SELECT 
    p_type,
    avg(l_discount)
FROM 
    part,
    lineitem
WHERE 
    p_type LIKE 'PROMO %%%%%%%%%%%%%%%%%%%%'
    AND
    l_partkey = p_partkey
    GROUP BY
    p_type;