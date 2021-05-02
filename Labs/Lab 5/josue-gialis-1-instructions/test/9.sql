/*
    9. Count the number of supplied parts that have
    total value (ps_supplycost*ps_availqty) in the top
    3% values across all the supplied parts and are 
    supplied by suppliers from CANADA. Hint: Use the LIMIT
    keyword.
*/



SELECT COUNT(ps_suppkey) 
FROM 
    supplier, 
    nation, 
    partsupp

WHERE 
        s_suppkey = ps_suppkey AND
        s_nationkey = n_nationkey AND
        n_name = 'CANADA' AND
ps_supplycost * ps_availqty IN 
                            (
                                SELECT 
                                    ps_supplycost * ps_availqty 
                                FROM 
                                    partsupp
                                ORDER BY 
                                    ps_supplycost * ps_availqty 
                                DESC LIMIT (SELECT 
                                                COUNT(ps_suppkey) * 0.03  
                                            FROM 
                                                partsupp
                                        )
                            );