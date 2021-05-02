/*
    3. Find how many parts are supplied by 
    more than one supplier from CANADA.
*/
SELECT SUM(totalSum) FROM (

    SELECT COUNT(DISTINCT ps_partkey) AS totalSum
    FROM partsupp, supplier
    WHERE
    ps_suppkey = s_suppkey AND 
    s_nationkey = 3
    GROUP BY ps_partkey
    HAVING COUNT(DISTINCT ps_suppkey) > 1
)







    













    -- Parts from suppliers in Canada.
-- SELECT *
-- FROM part, partsupp, supplier
-- WHERE
--     ps_partkey = p_partkey AND 
--     ps_suppkey = s_suppkey AND
--     s_nationkey = 3;