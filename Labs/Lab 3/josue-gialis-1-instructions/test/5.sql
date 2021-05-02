/*
    5. What is the minimum, maximum, average, and 
    total account balance among the customers in 
    eachmarket segment? Sort the results in decreasing 
    order of the total account balance.
 */

 SELECT 
        c_mktsegment AS market_segment,
        MIN(c_acctbal) AS min_balance,
        MAX(c_acctbal) AS max_balance,
        AVG(c_acctbal) AS avg_balance,
        SUM(c_acctbal) AS sum_balance
FROM customer
GROUP BY c_mktsegment
ORDER BY sum_balance desc;
