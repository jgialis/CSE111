SELECT 
    n_name
FROM   
    (
        SELECT 
            n_name, MAX(totalPrice)
        FROM
            (
                SELECT 
                    n_name, 
                    SUM(o_totalprice) AS totalPrice
                FROM
                    nation,
                    customer,
                    orders
                WHERE
                    c_nationkey = n_nationkey AND
                    c_custkey = o_custkey
                    GROUP BY n_name
            ) SQ
    )
    
    