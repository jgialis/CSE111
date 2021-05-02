/*
    7. For every order priority, count the
    number of parts ordered in 1996 and received 
    later (l_receiptdate) than the commit date (l_commitdate). 
    List the results in descending priority order.
*/

-- SELECT o_orderpriority, COUNT(o_orderkey)
-- FROM orders
-- WHERE EXISTS 
--             (
--                 SELECT *
--                 FROM lineitem
--                 WHERE
--                     l_orderkey = o_orderkey AND
--                     l_receiptdate > l_commitdate
--             )
--             AND
--             o_orderdate LIKE '1996-%%-%%'
-- GROUP BY o_orderpriority
-- ORDER BY o_orderpriority DESC;


SELECT o_orderpriority, COUNT(l_quantity)
FROM orders, lineitem
WHERE
    o_orderdate LIKE '1996-%%-%%'
    AND
    l_orderkey = o_orderkey
    AND
    l_receiptdate > l_commitdate
GROUP BY o_orderpriority
ORDER BY o_orderpriority DESC;

