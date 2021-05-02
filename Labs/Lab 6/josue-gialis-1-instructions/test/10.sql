/*
    10. Find the region where customers spend the largest amount of 
    money (l extendedprice) buying items from suppliers in the same region.
*/

SELECT 
    r_name
FROM   
    (
        SELECT 
            r_name, 
            MAX(maxl) 
        FROM
            (
                SELECT 
                    r_name,
                    SUM(l_extendedprice) AS maxl
                FROM
                    region,
                    nation,
                    customer,
                    supplier,
                    lineitem
                WHERE
                    r_regionkey = n_regionkey AND
                    s_suppkey = l_suppkey AND
                    n_nationkey = s_nationkey AND
                    n_nationkey = c_nationkey
            GROUP BY r_name
            )
    )
