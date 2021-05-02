/*
    12. What is the average account balance 
    for the suppliers in every country?
*/

SELECT DISTINCT 
    n_name, 
    avg(s_acctbal) AS avg_acctbal
FROM 
    supplier, 
    nation
WHERE 
    s_nationkey = n_nationkey
GROUP BY 
    n_name;