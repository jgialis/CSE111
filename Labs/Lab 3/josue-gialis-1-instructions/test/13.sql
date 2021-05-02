/*
    13. Find the average account balance of all the 
    customers from AFRICA in the MACHINERY market segment.
*/



SELECT AVG(c_acctbal) AS average_acc_bal_machinery
FROM customer, nation
WHERE 
    c_mktsegment = 'MACHINERY'
    AND
    n_regionkey = 0
    AND
    c_nationkey = n_nationkey;
    

