/*
    14. List the total price of orders between 
    any two regions, i.e., the suppliers are 
    from one region and the customers are from another region.
*/

SELECT  r1.r_name, r2.r_name, o_totalprice
FROM region r1, region r2, orders, customer, nation, supplier
WHERE
    o_custkey = c_custkey
    AND
    c_nationkey = n_nationkey
    AND
    r1.r_regionkey = n_nationkey
    AND
    s_nationkey = n_nationkey
    GROUP BY r1.r_name, r2.r_name

    UNION
SELECT  r1.r_name, r2.r_name, o_totalprice
FROM region r1, region r2, orders, customer, nation, supplier
WHERE
    o_custkey = c_custkey
    AND
    c_nationkey = n_nationkey
    AND
    r2.r_regionkey = n_nationkey
    AND
    s_nationkey = n_nationkey
   GROUP BY r1.r_name, r2.r_name;

    
  
   
  
   
    
    
  




