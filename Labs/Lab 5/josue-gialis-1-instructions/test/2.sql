/*
    2. How many suppliers in every region 
    have more balance in their account than
    the average account balance of their own region?
*/


SELECT 
    r_name, 
    COUNT(s_suppkey)
FROM 
    supplier,
    nation, 
    region
WHERE
    r_regionkey = 0
    AND
    s_nationkey = n_nationkey
    AND
    n_regionkey = r_regionkey
    AND 
    s_acctbal > (SELECT AVG(s_acctbal)
                FROM supplier, nation, region
                WHERE   s_nationkey = n_nationkey
                        AND
                        n_regionkey = r_regionkey
                        AND
                        r_regionkey = 0)
UNION 

SELECT 
    r_name, 
    COUNT(s_suppkey)
FROM 
    supplier,
    nation, 
    region
WHERE
    r_regionkey = 1
    AND
    s_nationkey = n_nationkey
    AND
    n_regionkey = r_regionkey
    AND 
    s_acctbal > (SELECT AVG(s_acctbal)
                FROM supplier, nation, region
                WHERE   s_nationkey = n_nationkey
                        AND
                        n_regionkey = r_regionkey
                        AND
                        r_regionkey = 1)
                        
UNION 

SELECT 
    r_name, 
    COUNT(s_suppkey)
FROM 
    supplier,
    nation, 
    region
WHERE
    r_regionkey = 2
    AND
    s_nationkey = n_nationkey
    AND
    n_regionkey = r_regionkey
    AND 
    s_acctbal > (SELECT AVG(s_acctbal)
                FROM supplier, nation, region
                WHERE   s_nationkey = n_nationkey
                        AND
                        n_regionkey = r_regionkey
                        AND
                        r_regionkey = 2)

UNION 

SELECT 
    r_name, 
    COUNT(s_suppkey)
FROM 
    supplier,
    nation, 
    region
WHERE
    r_regionkey = 3
    AND
    s_nationkey = n_nationkey
    AND
    n_regionkey = r_regionkey
    AND 
    s_acctbal > (SELECT AVG(s_acctbal)
                FROM supplier, nation, region
                WHERE   s_nationkey = n_nationkey
                        AND
                        n_regionkey = r_regionkey
                        AND
                        r_regionkey = 3)

UNION 

SELECT 
    r_name, 
    COUNT(s_suppkey)
FROM 
    supplier,
    nation, 
    region
WHERE
    r_regionkey = 4
    AND
    s_nationkey = n_nationkey
    AND
    n_regionkey = r_regionkey
    AND 
    s_acctbal > (SELECT AVG(s_acctbal)
                FROM supplier, nation, region
                WHERE   s_nationkey = n_nationkey
                        AND
                        n_regionkey = r_regionkey
                        AND
                        r_regionkey = 4)
