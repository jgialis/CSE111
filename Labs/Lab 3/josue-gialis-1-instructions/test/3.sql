/*
    3. Find all the items with the return flag set to
    R on the receipt date of May 30, 1992.
*/

SELECT *
FROM lineitem
WHERE
         l_returnflag = 'R' 
            AND
        l_receiptdate = '1992-05-30'; 
