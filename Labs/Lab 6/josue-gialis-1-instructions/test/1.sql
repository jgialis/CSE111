/*
    1. Find the total quantity (l quantity) of line items 
    shipped per month (l shipdate) in 1997. Hint: check 
    function strftime to extract the month/year from a date.
*/


SELECT strftime('%m','1997-01-01'), SUM(l_quantity)
FROM lineitem
WHERE l_shipdate LIKE '1997-01-%%'

UNION

SELECT strftime('%m','1997-02-01'), SUM(l_quantity)
FROM lineitem
WHERE l_shipdate LIKE '1997-02-%%'

UNION

SELECT strftime('%m','1997-03-01'), SUM(l_quantity)
FROM lineitem
WHERE l_shipdate LIKE '1997-03-%%'

UNION

SELECT strftime('%m','1997-04-01'), SUM(l_quantity)
FROM lineitem
WHERE l_shipdate LIKE '1997-04-%%'


UNION

SELECT strftime('%m','1997-05-01'), SUM(l_quantity)
FROM lineitem
WHERE l_shipdate LIKE '1997-05-%%'


UNION

SELECT strftime('%m','1997-06-01'), SUM(l_quantity)
FROM lineitem
WHERE l_shipdate LIKE '1997-06-%%'


UNION

SELECT strftime('%m','1997-07-01'), SUM(l_quantity)
FROM lineitem
WHERE l_shipdate LIKE '1997-07-%%'



UNION

SELECT strftime('%m','1997-08-01'), SUM(l_quantity)
FROM lineitem
WHERE l_shipdate LIKE '1997-08-%%'


UNION

SELECT strftime('%m','1997-09-01'), SUM(l_quantity)
FROM lineitem
WHERE l_shipdate LIKE '1997-09-%%'


UNION

SELECT strftime('%m','1997-10-01'), SUM(l_quantity)
FROM lineitem
WHERE l_shipdate LIKE '1997-10-%%'

UNION

SELECT strftime('%m','1997-11-01'), SUM(l_quantity)
FROM lineitem
WHERE l_shipdate LIKE '1997-11-%%'


UNION

SELECT strftime('%m','1997-12-01'), SUM(l_quantity)
FROM lineitem
WHERE l_shipdate LIKE '1997-12-%%';


