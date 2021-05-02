-- /*
--     7. What is the receipt date and total number of 
--     ordered items per receipt date by Customer#000000106?
-- */
SELECT l_receiptdate, COUNT(l_quantity)
FROM orders, customer, lineitem
WHERE
    c_custkey = o_custkey
    AND
    l_orderkey = o_orderkey
    AND
    c_name = 'Customer#000000106'
    GROUP BY l_receiptdate;



    



