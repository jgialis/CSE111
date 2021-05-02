-- /*
--     12. Clause 1: What is the total supply cost for parts 
--     Conditions:
--     A) less expensive than $1000 (p_retailprice) 
--     B) shipped in 1996 (l shipdate) 
    
--     Clause 2: By suppliers who
--     Conditions:
--     A) did not supply any item with an 
--     extended price less than 2000 
--     B) in 1995
-- */


-- -- Total supply cost for parts (Clause 1 no conditions)
-- SELECT SUM(ps_supplycost)
-- FROM partsupp;

-- -- Total supply cost for parts where p_retailprice < 1000 
-- -- (Clause 1 with condition A)
-- SELECT SUM(ps_supplycost)
-- FROM partsupp, part
-- WHERE 
--     p_partkey = ps_partkey AND
--     p_retailprice < 1000;


-- -- Total supply cost for parts where 
-- -- p_retailprice < 1000 and l_shipdate is 1996.
-- -- (Clause 1 with condition A and B)
-- SELECT *
-- FROM partsupp, part
-- WHERE EXISTS (
--                 SELECT *
--                 FROM lineitem
--                 WHERE 
--                     l_partkey = ps_partkey AND
--                     l_suppkey = ps_suppkey AND
--                     l_shipdate LIKE '1996-%%-%%' 
--              ) 
--         AND 
--         p_partkey = ps_partkey AND
--         p_retailprice < 1000
--         LIMIT 5;
        


-- -- Clause 2 with no conditions   
-- SELECT SUM(ps_supplycost)
-- FROM partsupp;


-- -- Clause 2 with condition A AND B applied. 
-- SELECT *
-- FROM partsupp
-- WHERE EXISTS (
--                     SELECT *
--                     FROM lineitem
--                     WHERE
--                         l_partkey = ps_partkey AND
--                         l_suppkey = ps_suppkey AND
--                         l_shipdate LIKE '1995-%%-%%' AND
--                         l_extendedprice < 2000 
--                  )
--                  LIMIT 5;


-- SELECT *
-- FROM partsupp, part
-- WHERE EXISTS (
--                 SELECT *
--                 FROM lineitem
--                 WHERE 
--                     l_partkey = ps_partkey AND
--                     l_suppkey = ps_suppkey AND
--                     l_shipdate LIKE '1996-%%-%%' 
--              ) 
--         AND 
--         p_partkey = ps_partkey AND
--         p_retailprice < 1000
--         LIMIT 5;







-- -- Attempting to combine both solutions

-- SELECT SUM(SQ1.ps_supplycost)
-- FROM
-- (
--     SELECT *
-- FROM partsupp
-- WHERE EXISTS (
--                     SELECT *
--                     FROM lineitem
--                     WHERE
--                         l_partkey = ps_partkey AND
--                         l_suppkey = ps_suppkey AND
--                         l_shipdate LIKE '1995-%%-%%' AND
--                         l_extendedprice < 2000 
--                  )
-- ) SQ1,

-- (
--     SELECT *
-- FROM partsupp, part
-- WHERE EXISTS (
--                 SELECT *
--                 FROM lineitem
--                 WHERE 
--                     l_partkey = ps_partkey AND
--                     l_suppkey = ps_suppkey AND
--                     l_shipdate LIKE '1996-%%-%%' 
--              ) 
--         AND 
--         p_partkey = ps_partkey AND
--         p_retailprice < 1000
-- ) SQ2

-- WHERE 
--     SQ1.ps_partkey = SQ2.ps_partkey AND
--     SQ1.ps_suppkey = SQ2.ps_suppkey ;






-- -- HOW TO FIND DUPLICATES IN COLUMN
-- -- SELECT 
-- --     col, 
-- --     COUNT(col)
-- -- FROM
-- --     table_name
-- -- GROUP BY col
-- -- HAVING COUNT(col) > 1;