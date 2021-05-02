/*
    14. For any two regions, nd the gross discounted revenue (l extendedprice*(1-l discount)) derived
    from line items in which parts are shipped from a supplier in the rst region to a customer in the
    second region in 1995 and 1996. List the supplier region, the customer region, the year (l shipdate),
    and the revenue from shipments that took place in that year. Order the answers by supplier region,
    customer region, and year.
*/

SELECT 
    r1.r_name, 
    r2.r_name, 
    SUBSTR(l_shipdate,1,4), 
    SUM(l_extendedprice*(1-l_discount)) 
FROM
    nation n2,
    region r2,
    supplier,
    nation n1,
    region r1,
    lineitem,
    orders,
    customer
WHERE
    l_orderkey = o_orderkey AND
    o_custkey = c_custkey AND
    c_nationkey = n2.n_nationkey AND
    n2.n_regionkey = r2.r_regionkey AND
    l_suppkey = s_suppkey AND
    s_nationkey = n1.n_nationkey AND
    n1.n_regionkey = r1.r_regionkey AND
    substr(l_shipdate,1,4) IN ('1995','1996') 
GROUP BY r1.r_name, r2.r_name, substr(l_shipdate,1,4) 
ORDER BY r1.r_name, r2.r_name, substr(l_shipdate,1,4);





   
