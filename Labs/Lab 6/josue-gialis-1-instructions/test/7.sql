/*
    7. Find how many suppliers have less than 30 distinct 
    orders from customers in GERMANY and FRANCE together.
*/

SELECT
    COUNT(DISTINCT l_suppkey)
FROM
    (
        SELECT 
            l_suppkey, 
            COUNT(DISTINCT o_orderkey) AS secondCol
        FROM
            (((orders INNER JOIN lineitem ON o_orderkey = l_orderkey) 
            INNER JOIN customer ON o_custkey = c_custkey) 
            INNER JOIN nation ON c_nationkey = n_nationkey)
        WHERE
            n_name = 'GERMANY' OR
            n_name = 'FRANCE'
        GROUP BY l_suppkey) SQ
WHERE 
    30 > SQ.secondCol;