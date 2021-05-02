/*
    12. Find the number of orders having status F
     for each customer region and display them in descending
    order. Print the region name and the number of status F orders.
*/


SELECT r_name, COUNT(o_orderstatus)
FROM orders, region, customer, nation
WHERE
    o_orderstatus = 'F'
    AND
    c_nationkey = n_nationkey
    AND
    n_regionkey = r_regionkey 
    AND
    o_custkey = c_custkey
    GROUP BY r_name;
   
