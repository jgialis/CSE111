/* 
    1.How many customers are not from EUROPE or AFRICA?
*/

SELECT 
    COUNT(c_custkey)
FROM
    customer, region, nation
WHERE
    c_nationkey = n_nationkey
    AND
    n_regionkey = r_regionkey
    AND
    r_regionkey <> 3
    AND
    r_regionkey <> 0;