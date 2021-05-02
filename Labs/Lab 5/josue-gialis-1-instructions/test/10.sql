/*
    10. How many customers from every region have never placed 
    an order and have more than the average account balance?
*/

-- Customers in every region, with higher acc balance than average

SELECT r_name, COUNT(c_custkey)
FROM customer, nation, region
WHERE NOT EXISTS 
            (
                SELECT *
                FROM orders
                WHERE c_custkey = o_custkey
            ) AND
    c_nationkey = n_nationkey AND
    n_regionkey = r_regionkey AND
    c_acctbal > (SELECT 
                    AVG(c_acctbal) 
                FROM 
                    customer, 
                    nation, 
                    region 
                WHERE 
                    c_nationkey = n_nationkey AND
                    n_regionkey = r_regionkey 
                )
    GROUP BY r_name;