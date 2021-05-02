/*
    8. Find how many distinct customers have at least one 
    order supplied exclusively by suppliers from ASIA.
*/ 

SELECT 
    COUNT(DISTINCT c_custkey) 
FROM
    customer,
    orders
WHERE
    o_custkey = c_custkey AND
    NOT o_orderkey IN 
                    (
                        SELECT 
                            DISTINCT o_orderkey
                        FROM
                            nation,
                            region,
                            supplier,
                            lineitem,
                            orders
                        WHERE
                            n_regionkey = r_regionkey AND
                            s_nationkey = n_nationkey AND
                            s_suppkey = l_suppkey AND
                            l_orderkey = o_orderkey AND
                            r_name <> 'ASIA'
                    )


    



    


